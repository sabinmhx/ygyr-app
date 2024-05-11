import 'package:flutter/material.dart';
import 'package:ygyr/base/colors/app_color.dart';
import 'package:ygyr/base/widgets/text/base_label_text_widget.dart';

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
      color: AppColor.primaryColor,
      child: (!(isLoading ?? false))
          ? BaseLabelTextWidget(
              text: text,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            )
          : const Center(
              child: SizedBox(
                height: 16,
                width: 16,
                child: CircularProgressIndicator(
                  color: AppColor.primaryColor,
                  strokeWidth: 2,
                ),
              ),
            ),
    );
  }
}
