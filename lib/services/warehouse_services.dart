import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:ygyr/model/warehouse_model.dart';

class WarehouseServices {
  Future<WarehouseModel?> getWarehouseDetails() async {
    try {
      final jsonString = await rootBundle.loadString('assets/warehouse.json');
      return WarehouseModel.fromJson(json.decode(jsonString));
    } catch (e) {
      log('Error fetching activity data: $e');
      return null;
    }
  }
}
