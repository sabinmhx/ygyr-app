import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ygyr/base/ui_helper/ui_helper.dart';
import 'package:ygyr/base/widgets/button/base_primary_icon_button_widget.dart';
import 'package:ygyr/base/widgets/button/base_primary_text_button_widget.dart';
import 'package:ygyr/base/widgets/dialog_box/base_show_dialog_utils.dart';
import 'package:ygyr/base/widgets/text/base_heading_text_widget.dart';
import 'package:ygyr/base/widgets/text/base_label_text_widget.dart';
import 'package:ygyr/base/widgets/toast.dart';
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
                      imageUploadResponseModel?.data?.url ?? '',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child:
                              BaseLabelTextWidget(text: 'Error Building Image'),
                        );
                      },
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
                        BaseIconButtonWidget(
                          icon: Icons.close,
                          onPressed: () => Navigator.pop(context),
                          iconSize: 40,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BaseHeadingTextWidget(
                    text: imageUploadResponseModel?.data?.label ?? 'Label',
                    fontSize: 20,
                  ),
                  const SizedBox(height: 8),
                  const BaseHeadingTextWidget(
                    text: 'How to recycle?',
                    fontSize: 20,
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5.0,
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: imageUploadResponseModel
                                ?.data?.description?.length ??
                            0,
                        itemBuilder: (context, index) {
                          final description =
                              imageUploadResponseModel?.data?.description;
                          final itemText =
                              description != null && index < description.length
                                  ? description[index]
                                  : 'Row Data $index';

                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 1),
                            child: Row(
                              children: [
                                const BaseHeadingTextWidget(
                                  text: '\u2022',
                                  fontSize: 18,
                                ),
                                UiHelper.getHorizontalSpacing(
                                    spacing: Spacing.xSmall),
                                Expanded(
                                  child: BaseLabelTextWidget(
                                    text: itemText,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BasePrimaryButtonWidget(
                          onPressed: () {
                            Toast.show(
                                context, 'Recorded for recycle successfully');
                          },
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
                                Toast.show(context, 'Donated successfully');
                                Navigator.pop(context);
                              },
                            );
                          },
                          buttonLabel: 'Donate',
                        ),
                      ],
                    ),
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
