import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ygyr/base/ui_helper/ui_helper.dart';
import 'package:ygyr/base/widgets/base_app_bar_widget.dart';
import 'package:ygyr/base/widgets/button/base_primary_text_button_widget.dart';
import 'package:ygyr/base/widgets/text/base_heading_text_widget.dart';
import 'package:ygyr/base/widgets/text/base_label_text_widget.dart';
import 'package:ygyr/model/warehouse_model.dart';

class WarehouseDetailView extends StatelessWidget {
  final WarehouseDetail? warehouseDetail;
  const WarehouseDetailView({
    super.key,
    this.warehouseDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBarWidget(
        onPressed: () {
          Navigator.pop(context);
        },
        title: 'Warehouse Details',
      ),
      body: Padding(
        padding: UiHelper.getSymmetricPadding(
          horizontal: Spacing.xMedium,
          vertical: Spacing.xMedium,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: _topContainer(),
            ),
            UiHelper.getVerticalSpacing(),
            Flexible(
              flex: 2,
              child: _bottomContainer(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _topContainer() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                warehouseDetail?.url ?? '',
                fit: BoxFit.contain,
              ),
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 0.75,
                  sigmaY: 0.75,
                  tileMode: TileMode.clamp,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.5),
                ),
                child: BaseLabelTextWidget(
                  text: warehouseDetail?.label ?? '',
                  fontSize: 18,
                ),
              ),
            ),
            Positioned(
              bottom: constraints.maxHeight * 0.05,
              left: constraints.maxWidth * 0.05,
              child: BasePrimaryButtonWidget(
                onPressed: () {},
                buttonLabel: 'Contact',
              ),
            ),
            Positioned(
              bottom: constraints.maxHeight * 0.05,
              right: constraints.maxWidth * 0.05,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.5),
                ),
                child: BaseLabelTextWidget(
                  text: warehouseDetail?.quantity.toString() ?? '10',
                  fontSize: 18,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _bottomContainer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.black),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          const BaseHeadingTextWidget(
            text: 'How to recycle?',
            fontSize: 25,
          ),
          UiHelper.getHorizontalSpacing(spacing: Spacing.large),
          BaseLabelTextWidget(text: warehouseDetail?.description?.first ?? ''),
          BaseLabelTextWidget(text: warehouseDetail?.description?.last ?? ''),
        ],
      ),
    );
  }
}
