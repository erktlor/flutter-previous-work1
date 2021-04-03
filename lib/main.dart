import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_app/common/router/routes.dart';
import 'package:flutter_web_app/store/app/app.selectors.dart';
import 'package:flutter_web_app/store/notifications/notifications.actions.dart';
import 'package:flutter_web_app/store/store.dart';
import 'package:flutter_web_app/utils/is_web_platform.dart';
import 'package:flutter_web_app/utils/my_http_overrides.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:redux/redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:redux_remote_devtools/redux_remote_devtools.dart';
import 'package:redux_saga/redux_saga.dart';

import 'api/api.dart';

final navigatorKey = GlobalKey<NavigatorState>();
Store<ApplicationState> store;
String oneSignalUserId;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // To allow http images
  HttpOverrides.global = new MyHttpOverrides();

  // Print version
  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  String version = packageInfo.version;
  String buildNumber = packageInfo.buildNumber;

  print('Version: ' + version + '+' + buildNumber);

  // Load env file
  await DotEnv().load(kDebugMode ? 'env/.debug.env' : 'env/.release.env');

  final isWeb = isWebPlatform();

  // Setup push notifications for native platforms
  if (!isWeb) {
    await OneSignal.shared.setAppId(DotEnv().env['ONE_SIGNAL_APP_ID']);

    OneSignal.shared.setSubscriptionObserver((changes) {
      oneSignalUserId = changes.to.userId;
    });

    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      final data = result.notification.additionalData;

      store.dispatch(ProcessNotificationOpenedAction(
          type: data["type"], payload: data["payload"]));
    });
  }

  // Api
  Api.configure();

  // Start
  final remoteDevToolsUrl = DotEnv().env['REMOTE_DEV_TOOLS_URL'];

  if (remoteDevToolsUrl != null && isWeb) {
    await startWithDevTools(remoteDevToolsUrl);
  } else {
    startWithoutDevTools();
  }
}

Future<void> startWithDevTools(String remoteDevToolsUrl) async {
  var remoteDevTools = RemoteDevToolsMiddleware(remoteDevToolsUrl);
  final sagaMiddleware = createSagaMiddleware();

  store = DevToolsStore<ApplicationState>(rootReducer,
      middleware: [applyMiddleware(sagaMiddleware), remoteDevTools],
      initialState: ApplicationState.initialState());

  sagaMiddleware.setStore(store);
  sagaMiddleware.run(rootSaga);

  remoteDevTools.store = store;
  await remoteDevTools.connect();

  runApp(StoreProvider(
    store: store,
    child: MyApp(),
  ));
}

void startWithoutDevTools() {
  final sagaMiddleware = createSagaMiddleware();

  store = Store<ApplicationState>(rootReducer,
      middleware: [applyMiddleware(sagaMiddleware)],
      initialState: ApplicationState.initialState());

  sagaMiddleware.setStore(store);
  sagaMiddleware.run(rootSaga);

  runApp(StoreProvider(
    store: store,
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static FluroRouter router;

  _MyAppState() {
    router = FluroRouter();
    Routes.configureRoutes(router);
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
        converter: _MyAppStateProps.fromStore,
        distinct: true,
        builder: (context, props) {
          return OverlaySupport(
            child: KeyboardDismissOnTap(
              child: MaterialApp(
                navigatorKey: navigatorKey,
                title: props.title,
                onGenerateRoute: router.generator,
              ),
            ),
          );
        });
  }
}

class _MyAppStateProps extends Equatable {
  final String title;

  _MyAppStateProps({@required this.title});

  static _MyAppStateProps fromStore(Store<ApplicationState> store) {
    return _MyAppStateProps(title: appTitleSelector(store.state));
  }

  @override
  List<Object> get props => [title];
}
