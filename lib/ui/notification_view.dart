import 'package:flutter/material.dart';
import 'package:ygyr/base/layout/app.dart';
import 'package:ygyr/base/widgets/base_app_bar_widget.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBarWidget(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const App(),
            ),
          );
        },
        title: 'Notification',
      ),
    );
  }
}
