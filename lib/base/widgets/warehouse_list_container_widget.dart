import 'package:flutter/material.dart';
import 'package:ygyr/base/colors/app_color.dart';
import 'package:ygyr/base/ui_helper/ui_helper.dart';
import 'package:ygyr/base/widgets/text/base_label_text_widget.dart';

class WarehouseListContainerWidget extends StatelessWidget {
  final String imagePath;
  final double? imageHeight;
  final double? imageWidth;

  const WarehouseListContainerWidget({
    super.key,
    required this.imagePath,
    this.imageHeight,
    this.imageWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      surfaceTintColor: AppColor.accentColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: Colors.grey[100],
                ),
                child: Center(
                  child: Image.asset(
                    imagePath,
                    width: imageWidth,
                    height: imageHeight,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Expanded(
              child: _warehousePageListDetail(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _warehousePageListDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BaseLabelTextWidget(
                text: 'Classname',
                fontSize: 15,
              ),
              UiHelper.getVerticalSpacing(spacing: Spacing.large),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BaseLabelTextWidget(
                    text: '2020-01-01',
                    fontSize: 15,
                  ),
                  SizedBox(width: 40),
                  BaseLabelTextWidget(text: '10'),
                ],
              ),
              UiHelper.getVerticalSpacing(spacing: Spacing.large),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BaseLabelTextWidget(
                    text: 'Data Row 1',
                    fontSize: 15,
                  ),
                  BaseLabelTextWidget(
                    text: 'Data Row 2',
                    fontSize: 15,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
