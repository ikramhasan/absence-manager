import 'package:absence_manager/features/core/domain/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:url_launcher/url_launcher.dart';

/// A class that launches URLs.
class AppUrlLauncher {
  AppUrlLauncher._();

  /// Launch a URL in the default browser.
  /// 
  /// Returns [Unit] if the URL was launched successfully.
  /// Returns a [Failure] if the URL could not be launched.
  static Future<Either<Failure, Unit>> launch(String url) async {
    final uri = Uri.parse(url);
    try {
      await launchUrl(uri);

      return right(unit);
    } catch (e) {
      return left(Failure(code: 500, message: 'Could not launch $url'));
    }
  }
}
