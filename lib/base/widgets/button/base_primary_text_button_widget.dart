import 'package:flutter/material.dart';
import 'package:ygyr/base/colors/app_color.dart';
import 'package:ygyr/base/ui_helper/ui_helper.dart';
import 'package:ygyr/base/widgets/text/base_label_text_widget.dart';

class BasePrimaryButtonWidget extends StatelessWidget {
  /// A callback function to be executed when the button is pressed.
  final void Function()? onPressed;

  /// Label Text of button
  final String buttonLabel;

  /// Color of the button, default is the secondary color of the app.
  final Color? buttonColor;

  /// Color of the text in the button, default is secondary button text color.
  final Color buttonLabelColor;

  /// Optional padding for the button.
  final EdgeInsetsGeometry? padding;

  /// Optional margin for the button.
  final EdgeInsetsGeometry? margin;

  /// Optional parameter for width of the button.
  final double? buttonWidth;

  /// Flag to keep track of response
  final bool? isLoading;

  /// Creates a secondary button widget.
  ///
  /// The [onPressed] parameter is required to define the action when the button is pressed.
  ///
  /// The [buttonLabel] parameter is required to specify the text displayed on the button.
  ///
  /// The [buttonColor] parameter sets the background color of the button. Default is the secondary button color of the app.
  ///
  /// The [buttonLabelColor] parameter sets the color of the text in the button. Default is secondary button text color.
  ///
  /// The [margin] parameter specifies the margin around the button. Default margin for the button is 5 on all sides.
  ///
  /// The [padding] parameter specifies the padding around the button. Default padding for the button is 10 on all sides.
  ///
  /// The [buttonWidth] parameter specified the width of the button if necessary.
  const BasePrimaryButtonWidget({
    super.key,
    this.isLoading = false,
    this.onPressed,
    required this.buttonLabel,
    this.padding,
    this.margin,
    this.buttonWidth,
    this.buttonColor = AppColor.primaryColor,
    this.buttonLabelColor = AppColor.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(UiHelper.getRadius()),
      onTap: (!(isLoading!)) ? onPressed : null,
      child: Container(
        width: 125,
        padding: padding ??
            UiHelper.getSymmetricPadding(
              horizontal: Spacing.small,
              vertical: Spacing.small,
            ),
        margin: margin ??
            UiHelper.getSymmetricPadding(
              horizontal: Spacing.xSmall,
              vertical: Spacing.xSmall,
            ),
        decoration: const BoxDecoration(
          color: AppColor.primaryColor,
          boxShadow: [
            BoxShadow(
              color: AppColor.iconButtonColor,
              spreadRadius: 1,
              blurRadius: 1,
            ),
          ],
        ),
        child: (!(isLoading ?? false))
            ? BaseLabelTextWidget(
                text: buttonLabel,
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
      ),
    );
  }
}
