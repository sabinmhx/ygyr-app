import 'package:flutter/material.dart';
import 'package:ygyr/base/widgets/dialog_box/base_alert_dialog_utils.dart';
import 'package:ygyr/base/widgets/text/base_label_text_widget.dart';

class BaseShowDialogUtils {
  /// Shows a descriptive dialog with a message and an optional title and positive button text.
  ///
  /// Requires [context] and [message] parameters, and optionally takes
  /// [title] and [positiveButtonText].
  static Future<void> showDescriptiveDialog(
    BuildContext context, {
    String? title,
    required String message,
    String? positiveButtonText,
  }) {
    return showDialog(
        context: context,
        builder: (builderContext) {
          return BaseAlertDialogWidget(
            title: BaseLabelTextWidget(text: title ?? ''),
            content: BaseLabelTextWidget(text: message),
            actions: [
              if (positiveButtonText != null)
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: BaseLabelTextWidget(text: positiveButtonText),
                ),
            ],
          );
        });
  }

  /// Shows a confirmation dialog with a message and required positive and negative button texts.
  ///
  /// Requires [context], [message], [positiveButtonText], and [negativeButtonText] parameters.
  /// Optionally takes [title], [onPositivePressed], and [onNegativePressed] callbacks.
  static Future<void> showConfirmationDialog(
    BuildContext context, {
    String? title,
    required String message,
    required String? positiveButtonText,
    required String? negativeButtonText,
    Function()? onPositivePressed,
    Function()? onNegativePressed,
  }) {
    return showDialog(
        context: context,
        builder: (builderContext) {
          return BaseAlertDialogWidget(
            title: BaseLabelTextWidget(text: title ?? ''),
            content: BaseLabelTextWidget(text: message),
            actions: [
              if (negativeButtonText != null)
                TextButton(
                  onPressed: onNegativePressed,
                  child: BaseLabelTextWidget(text: negativeButtonText),
                ),
              if (positiveButtonText != null)
                TextButton(
                  onPressed: onPositivePressed,
                  child: BaseLabelTextWidget(text: positiveButtonText),
                ),
            ],
          );
        });
  }
}
