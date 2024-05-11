import 'package:flutter/material.dart';
import 'package:ygyr/base/ui_helper/ui_helper.dart';
import 'package:ygyr/base/widgets/warehouse_list_container_widget.dart';
import 'package:ygyr/model/warehouse_model.dart';
import 'package:ygyr/services/warehouse_services.dart';
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
        child: _buildWarehouseList(),
      ),
    );
  }

  Widget _buildWarehouseList() {
    return FutureBuilder<WarehouseModel?>(
      future: WarehouseServices().getWarehouseDetails(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final warehouseModel = snapshot.data;
          if (warehouseModel != null && warehouseModel.data != null) {
            return ListView.builder(
              itemCount: warehouseModel.data!.length,
              itemBuilder: (context, index) {
                final data = warehouseModel.data![index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WarehouseDetailView(
                            warehouseDetail: data,
                          ),
                        ),
                      );
                    },
                    child: WarehouseListContainerWidget(
                      data: data,
                      imageHeight: 100,
                      imageWidth: 100,
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('No warehouse data available.'));
          }
        }
      },
    );
  }
}
