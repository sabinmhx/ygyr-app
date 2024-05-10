import 'package:flutter/material.dart';
import 'package:ygyr/base/widgets/button/base_back_button_widget.dart';
import 'package:ygyr/base/widgets/text/base_heading_text_widget.dart';

class BaseAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Function() onPressed;
  final String title;

  const BaseAppBarWidget({
    super.key,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      automaticallyImplyLeading: false,
      leading: BaseBackButtonWidget(
        onPressed: onPressed,
      ),
      centerTitle: true,
      title: BaseHeadingTextWidget(
        text: title,
        fontSize: 20,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
