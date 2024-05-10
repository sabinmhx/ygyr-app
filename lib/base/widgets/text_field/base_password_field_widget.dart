import 'package:flutter/material.dart';
import 'package:ygyr/base/widgets/text_field/base_text_field_widget.dart';

/// A stateful widget representing a password field.
class BasePasswordFieldWidget extends StatefulWidget {
  /// Controls the text being edited.
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?) validator;

  /// Constructor for the PasswordField widget.
  ///
  /// [controller]: Controls the text being edited in the password field.
  const BasePasswordFieldWidget({
    super.key,
    required this.controller,
    required this.labelText,
    required this.validator,
  });

  @override
  State<BasePasswordFieldWidget> createState() => _PasswordFieldWidgetState();
}

class _PasswordFieldWidgetState extends State<BasePasswordFieldWidget> {
  /// Flag to control whether the text is obscured or not.
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return BaseTextFieldWidget(
      controller: widget.controller,
      labelText: widget.labelText,
      validator: widget.validator,
      obscureText: isObscureText,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            isObscureText = !isObscureText;
          });
        },
        icon: Icon((isObscureText) ? Icons.visibility_off : Icons.visibility),
      ),
    );
  }
}
