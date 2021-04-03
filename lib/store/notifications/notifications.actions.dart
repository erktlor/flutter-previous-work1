import 'package:flutter/foundation.dart';

class ProcessNotificationOpenedAction {
  final String type;
  final Map<dynamic, dynamic> payload;

  ProcessNotificationOpenedAction(
      {@required this.type, @required this.payload});
}
