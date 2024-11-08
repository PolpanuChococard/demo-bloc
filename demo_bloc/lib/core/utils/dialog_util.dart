import 'package:demo_bloc/core/utils/navigator_util.dart';
import 'package:flutter/material.dart';

class DialogUtil {
  static Future<bool> showConfirmDialog({
    required BuildContext context,
    required String title,
    String? content,
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
  }) async {
    return await showDialog<bool>(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: content != null ? Text(content) : null,
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    NavigatorUtil.pop(false);
                  },
                  child: Text(cancelText),
                ),
                TextButton(
                  onPressed: () {
                    NavigatorUtil.pop(true);
                  },
                  child: Text(confirmText),
                ),
              ],
            );
          },
        ) ??
        false;
  }
}
