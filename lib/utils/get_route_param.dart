import 'package:flutter/widgets.dart';

String getRouteParam(BuildContext context, String paramName) {
  final name = ModalRoute.of(context).settings.name;
  final questionMarkIdx = name.indexOf('?');

  if (questionMarkIdx == -1) {
    return null;
  }

  final paramsStr = name.substring(questionMarkIdx + 1);
  final List<String> paramsList = paramsStr.split('&');

  final requiredParam = paramsList.firstWhere((element) {
    final splitParam = element.split('=');

    return splitParam[0] == paramName;
  }, orElse: () => null);

  if (requiredParam == null) {
    return null;
  }

  return requiredParam.split('=')[1];
}
