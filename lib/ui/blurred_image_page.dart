import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ygyr/base/widgets/button/base_primary_text_button_widget.dart';
import 'package:ygyr/base/widgets/dialog_box/base_show_dialog_utils.dart';
import 'package:ygyr/base/widgets/text/base_heading_text_widget.dart';
import 'package:ygyr/base/widgets/text/base_label_text_widget.dart';

class BlurredImageView extends StatelessWidget {
  final File imageFile;

  const BlurredImageView({super.key, required this.imageFile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Image.file(
                imageFile,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 32,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const BaseHeadingTextWidget(
                    text: 'How to recycle',
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  const SizedBox(height: 8),
                  const BaseLabelTextWidget(
                    text:
                        'Here are some details about recycling. You can add a long description here that will be scrollable independently of the image.',
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BasePrimaryButtonWidget(
                        onPressed: () {},
                        buttonLabel: 'Recycle',
                      ),
                      BasePrimaryButtonWidget(
                        onPressed: () {
                          BaseShowDialogUtils.showConfirmationDialog(
                            context,
                            message: 'Are you sure you want to donate?',
                            positiveButtonText: 'Yes',
                            negativeButtonText: 'No',
                            onNegativePressed: () {
                              Navigator.pop(context);
                            },
                            onPositivePressed: () {},
                          );
                        },
                        buttonLabel: 'Donate',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
