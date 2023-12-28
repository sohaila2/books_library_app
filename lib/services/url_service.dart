
import 'package:url_launcher/url_launcher.dart';

Future<void> launchSocialMediaAppIfInstalled(String url) async {
  try {
    bool launched = await launch(url, forceSafariVC: false);

    if (!launched) {
      launch(url);
    }
  } catch (e) {
    launch(url);
  }
}