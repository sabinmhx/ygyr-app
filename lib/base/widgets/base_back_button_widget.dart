import 'package:flutter/material.dart';

class BaseBackButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;

  const BaseBackButtonWidget({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2.0,
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(7.0),
      ),
      child: InkWell(
        onTap: onPressed ?? () {},
        child: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
