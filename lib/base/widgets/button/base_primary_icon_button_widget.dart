import 'package:flutter/material.dart';
import 'package:ygyr/base/ui_helper/ui_helper.dart';

class BaseIconButtonWidget extends StatelessWidget {
  /// Callback function to be called when the button is pressed
  final void Function()? onPressed;

  /// Icon to be displayed in the button
  final IconData? icon;

  /// Border of the container
  final BoxBorder? border;

  /// Border radius of the container
  final BorderRadiusGeometry? borderRadius;

  /// Flag to check if the button is enabled.
  final bool isEnabled;

  /// Creates a custom container with an icon button.
  ///
  /// The [onPress] parameter is a callback function to be executed when the button is pressed.
  ///
  /// The [icon] parameter specifies the icon to be displayed in the button.
  ///
  /// The [border] parameter specifies the border of the container.
  ///
  /// The [borderRadius] parameter specifies the border radius of the container.
  const BaseIconButtonWidget({
    super.key,
    this.onPressed,
    required this.icon,
    this.border,
    this.borderRadius,
    this.isEnabled = true,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        // decoration: BoxDecoration(
        //   border: Border.all(color: Colors.white),
        // ),
        padding: UiHelper.getSymmetricPadding(
            vertical: Spacing.small, horizontal: Spacing.small),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}
