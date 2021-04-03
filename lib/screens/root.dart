import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_web_app/api/api.dart';
import 'package:flutter_web_app/common/router/routes.dart';

class Root extends StatefulWidget {
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      if (ModalRoute.of(context).isCurrent) {
        var page = apiClient.options.headers.containsKey('Authorization')
            ? Routes.dashboard
            : Routes.login;
        Navigator.of(context).pushNamedAndRemoveUntil(page, (_) => false);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
