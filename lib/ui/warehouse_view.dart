import 'package:flutter/material.dart';
import 'package:ygyr/base/ui_helper/ui_helper.dart';
import 'package:ygyr/base/widgets/base_list_view_container_widget.dart';
import 'package:ygyr/ui/warehouse_detail_view.dart';

class WarehouseView extends StatelessWidget {
  const WarehouseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: UiHelper.getSymmetricPadding(
          horizontal: Spacing.small,
          vertical: Spacing.small,
        ),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WarehouseDetailView(),
                  ),
                );
              },
              child: const BaseListViewContainerWidget(
                isHome: false,
                imagePath: 'assets/images/logo.png',
                imageHeight: 100,
                imageWidth: 100,
              ),
            );
          },
        ),
      ),
    );
  }
}
