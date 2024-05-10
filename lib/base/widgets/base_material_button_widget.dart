import 'package:flutter/material.dart';
import 'package:ygyr/base/ui_helper/ui_helper.dart';

class BaseMaterialButtonWidget extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final bool? isLoading;
  const BaseMaterialButtonWidget({
    super.key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(15)),
      onPressed: (!(isLoading!)) ? onPressed : null,
      minWidth: double.maxFinite,
      color: const Color.fromARGB(255, 38, 38, 38),
      child: Padding(
        padding: UiHelper.getSymmetricPadding(
            horizontal: Spacing.small, vertical: Spacing.small),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
