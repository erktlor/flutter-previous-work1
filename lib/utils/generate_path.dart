generatePath(String route, Map<String, String> params) {
  var routeParams =
      params.entries.map((entry) => '${entry.key}=${entry.value}').join('&');

  return '$route?$routeParams';
}
