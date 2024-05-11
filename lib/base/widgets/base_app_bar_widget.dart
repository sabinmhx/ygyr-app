import 'package:flutter/material.dart';
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
      automaticallyImplyLeading: false,
      leading: InkWell(
        onTap: onPressed,
        child: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.black,
        ),
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
