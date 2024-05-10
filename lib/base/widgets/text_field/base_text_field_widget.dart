import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ygyr/base/colors/app_color.dart';
import 'package:ygyr/base/ui_helper/ui_helper.dart';

class BaseTextFieldWidget extends StatelessWidget {
  /// Controls the text being edited.
  final TextEditingController controller;

  /// Text that suggests what sort of input the field accepts.
  final String? hintText;

  /// Determines whether the text field should automatically have focus.
  final bool autoFocus;

  /// An icon that appears before the [prefix] or [prefixText] and
  /// before the editable part of the text field, within the decoration's container.
  final Widget? prefixIcon;

  /// An icon that appears after the editable part of the text field
  /// and after the [suffix] or [suffixText], within the decoration's container.
  final Widget? suffixIcon;

  /// Specifies the keyboard type for the text input field.
  final TextInputType? keyboardType;

  /// Determines whether the text entered should be obscured.
  final bool obscureText;

  /// A function that validates the input text.
  final String? Function(String?)? validator;

  /// Controls the auto-validation behavior of the text field.
  final AutovalidateMode? autovalidateMode;

  /// A callback function that is called whenever the text changes.
  final void Function(String)? onChanged;

  /// If true, the decoration's container is filled with [fillColor].
  final bool? filled;

  /// The base fill color of the decoration's container.
  final Color? fillColor;

  /// Optional padding for the content.
  final EdgeInsetsGeometry? contentPadding;

  /// Optional size for the hint text inside textfield.
  final double? hintTextSize;

  /// Optional parameter to hold a text above textfield if necessary.
  final String? textfieldLabel;

  /// Optional parameter to limit the number of characters entered.
  final bool? setMaxLengthInputFormatter;

  /// Optional parameter to restrict entering anything other than a number.
  final bool? isANumber;

  /// Optional parameter to hold a label text.
  final String? labelText;

  /// Optional parameter to restrict editing in the text field.
  final bool? readOnly;

  /// Creates a TextFormField widget with customizable properties.
  ///
  /// Required field: [controller]
  ///
  /// [autoFocus] and [obscureText] are set to false by default.
  ///
  /// [keyboardType] is set to [TextInputType.text], [filled] is set to true,
  ///
  /// [fillColor] is set to white, and [autovalidateMode] is set to [AutovalidateMode.onUserInteraction] by default.
  ///
  /// [contentPadding] is set to  [EdgeInsets.symmetric(horizontal: 10, vertical: 2)] by default.
  ///
  /// Optional parameter [textFieldLabel] is set to null by default.
  const BaseTextFieldWidget({
    super.key,
    required this.controller,
    this.autoFocus = false,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.onChanged,
    this.hintTextSize,
    this.textfieldLabel,
    this.filled = true,
    this.fillColor = Colors.white,
    this.contentPadding,
    this.setMaxLengthInputFormatter = false,
    this.isANumber = false,
    this.labelText,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (textfieldLabel != null)
          Padding(
            padding: UiHelper.getOnlyPadding(top: Spacing.medium),
            child: Text(textfieldLabel ?? ''),
          ),
        Padding(
          padding: const EdgeInsets.fromLTRB(2, 20, 2, 2),
          child: TextFormField(
            autofocus: autoFocus,
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              labelText: labelText,
              contentPadding: contentPadding ?? UiHelper.getHorizontalPadding(),
              hintText: hintText,
              hintStyle: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: hintTextSize,
              ),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              focusColor: Colors.black,
              filled: filled,
              fillColor: fillColor,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColor.textFieldBorderColor,
                ),
                borderRadius: BorderRadius.all(Radius.circular(
                    UiHelper.getRadius(radius: Spacing.xxlLarge))),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(
                    UiHelper.getRadius(radius: Spacing.xxlLarge))),
                borderSide: BorderSide(color: AppColor.errorColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppColor.textFieldBorderColor),
                borderRadius: BorderRadius.all(Radius.circular(
                    UiHelper.getRadius(radius: Spacing.xxlLarge))),
              ),
              border: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppColor.textFieldBorderColor),
                borderRadius: BorderRadius.all(Radius.circular(
                    UiHelper.getRadius(radius: Spacing.xxlLarge))),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(
                    UiHelper.getRadius(radius: Spacing.xxlLarge))),
                borderSide: BorderSide(color: AppColor.errorColor),
              ),
            ),
            obscureText: obscureText,
            inputFormatters: [
              FilteringTextInputFormatter.deny(
                RegExp(r'[^\x00-\x7F]'),
              ),
              if (setMaxLengthInputFormatter!)
                LengthLimitingTextInputFormatter(25),
              if (isANumber!) FilteringTextInputFormatter.digitsOnly,
            ],
            validator: validator,
            autovalidateMode: autovalidateMode,
            readOnly: readOnly!,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
