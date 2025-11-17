import 'package:share_plus/share_plus.dart';

class ShareUtils {
  static shareLink({required String urlShare, Function? onShareSuccess}) async {
    if (urlShare.isEmpty) return;

    final result = await SharePlus.instance.share(
      ShareParams(uri: Uri.parse(urlShare)),
    );

    if (result.status == ShareResultStatus.success) {
      onShareSuccess?.call();
    }
  }
}
