import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ygyr/base/ui_helper/ui_helper.dart';
import 'package:ygyr/base/widgets/base_app_bar_widget.dart';
import 'package:ygyr/base/widgets/button/base_primary_text_button_widget.dart';

class BlurredImageView extends StatelessWidget {
  final File imageFile;

  const BlurredImageView({super.key, required this.imageFile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBarWidget(
        onPressed: () {
          Navigator.pop(context);
        },
        title: 'Image Detail Page',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                Image.file(
                  imageFile,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'How to recycle',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Here are some details about recycling.",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: UiHelper.getSymmetricPadding(
            horizontal: Spacing.large, vertical: Spacing.medium),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BasePrimaryButtonWidget(
              onPressed: () {},
              buttonLabel: 'Recycle',
            ),
            BasePrimaryButtonWidget(
              onPressed: () {},
              buttonLabel: 'Donate',
            ),
          ],
        ),
      ),
    );
  }
}
