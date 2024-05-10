import 'package:flutter/material.dart';

class BaseBackButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;

  const BaseBackButtonWidget({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed ?? () {},
      child: const Icon(
        Icons.arrow_back_ios_new_rounded,
        color: Colors.white,
      ),
    );
  }
}
