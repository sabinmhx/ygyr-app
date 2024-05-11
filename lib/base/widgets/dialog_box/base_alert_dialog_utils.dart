import 'package:flutter/material.dart';

class BaseAlertDialogWidget extends StatelessWidget {
  /// The widget to be displayed as the title of the dialog.
  final Widget? title;

  /// The widget to be displayed as the content of the dialog.
  final Widget? content;

  /// The list of widgets to be displayed as actions (buttons) in the dialog.
  final List<Widget>? actions;

  /// Creates a customizable alert dialog widget with a title, content, and actions.
  ///
  /// [title], [content], and [actions] are optional parameters.
  const BaseAlertDialogWidget({
    super.key,
    this.title,
    this.content,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title,
      content: content,
      actions: actions,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      backgroundColor: Colors.grey,
    );
  }
}
