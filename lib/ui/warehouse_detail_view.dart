import 'package:flutter/material.dart';
import 'package:ygyr/base/ui_helper/ui_helper.dart';
import 'package:ygyr/base/widgets/base_app_bar_widget.dart';
import 'package:ygyr/base/widgets/button/base_primary_text_button_widget.dart';
import 'package:ygyr/base/widgets/text/base_label_text_widget.dart';

class WarehouseDetailView extends StatelessWidget {
  const WarehouseDetailView({super.key});

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
              child: _topContainer(),
            ),
            UiHelper.getVerticalSpacing(),
            Expanded(
              child: _bottomContainer(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _topContainer() {
    return Expanded(
      child: LayoutBuilder(
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
                child:
                    Image.asset('assets/images/logo.png', fit: BoxFit.contain),
              ),
              Positioned(
                top: constraints.maxHeight * 0.05,
                left: constraints.maxWidth * 0.37,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  color: Colors.black.withOpacity(0.5),
                  child: const BaseLabelTextWidget(
                    text: 'Classname',
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
                child: BasePrimaryButtonWidget(
                  onPressed: () {},
                  buttonLabel: 'Quantity',
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _bottomContainer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.black),
          borderRadius: BorderRadius.circular(10)),
      child: const Column(
        children: [
          Text('How to recycle?'),
        ],
      ),
    );
  }
}
