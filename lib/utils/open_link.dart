import 'package:url_launcher/url_launcher.dart';

openLink(String link) async {
  if (await canLaunch(link)) {
    await launch(link);
  } else {
    print('Cannot open: $link}');
  }
}
