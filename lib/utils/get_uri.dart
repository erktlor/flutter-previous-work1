import 'package:flutter_dotenv/flutter_dotenv.dart';

getUrl(String path) {
  return DotEnv().env['BASE_URL'] + path;
}
