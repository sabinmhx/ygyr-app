import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ygyr/base/widgets/button/base_primary_text_button_widget.dart';
import 'package:ygyr/base/widgets/dialog_box/base_show_dialog_utils.dart';
import 'package:ygyr/base/widgets/text/base_heading_text_widget.dart';
import 'package:ygyr/base/widgets/text/base_label_text_widget.dart';
import 'package:ygyr/model/image_upload_response.dart';

class BlurredImageView extends StatelessWidget {
  final ImageUploadResponseModel? imageUploadResponseModel;

  const BlurredImageView({super.key, required this.imageUploadResponseModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                    child: Image.network(
                      imageUploadResponseModel?.data?.url ??
                          'https://th.bing.com/th/id/R.62325205054ee42cbd441c7036a7e3ec?rik=RHdJrVUP%2b%2b8klA&pid=ImgRaw&r=0',
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        );
                      },
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
                            color: Colors.black,
                            size: 32,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BaseHeadingTextWidget(
                      text: imageUploadResponseModel?.data?.label ?? 'Label',
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    const SizedBox(height: 8),
                    const BaseHeadingTextWidget(
                      text: 'How to recycle?',
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    const SizedBox(height: 40),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: List.generate(
                        2,
                        (index) => BaseLabelTextWidget(
                          text: imageUploadResponseModel
                                  ?.data?.description?.first ??
                              'Row Data 1',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 80),
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
                              onPositivePressed: () {
                                Navigator.pop(context);
                              },
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
          ),
        ],
      ),
    );
  }
}
