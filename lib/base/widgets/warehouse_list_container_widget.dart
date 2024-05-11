import 'package:flutter/material.dart';
import 'package:ygyr/base/colors/app_color.dart';
import 'package:ygyr/base/ui_helper/ui_helper.dart';
import 'package:ygyr/base/widgets/text/base_label_text_widget.dart';
import 'package:ygyr/model/warehouse_model.dart';

class WarehouseListContainerWidget extends StatelessWidget {
  final double? imageHeight;
  final double? imageWidth;
  final WarehouseDetail? data;
  const WarehouseListContainerWidget({
    super.key,
    this.imageHeight,
    this.imageWidth,
    this.data,
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
                    data?.url ?? '',
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
              BaseLabelTextWidget(
                text: data?.label ?? '',
                fontSize: 15,
              ),
              UiHelper.getVerticalSpacing(spacing: Spacing.large),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BaseLabelTextWidget(
                    text: data?.date ?? '1',
                    fontSize: 15,
                  ),
                  const SizedBox(width: 40),
                  BaseLabelTextWidget(text: data?.quantity.toString() ?? '1'),
                ],
              ),
              UiHelper.getVerticalSpacing(spacing: Spacing.large),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BaseLabelTextWidget(
                    text: data?.description?.first ?? '',
                    fontSize: 15,
                  ),
                  BaseLabelTextWidget(
                    text: data?.description?.last ?? '',
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
