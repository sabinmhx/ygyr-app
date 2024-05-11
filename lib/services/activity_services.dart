import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:ygyr/model/activity_model.dart';

class ActivityServices {
  Future<List<Data>> getActivity() async {
    try {
      final response = await rootBundle.loadString("assets/activity.json");
      final Map<String, dynamic> data = jsonDecode(response);
      final List<dynamic> dataList = data['data'];
      final List<Data> activities =
          dataList.map((json) => Data.fromJson(json)).toList();
      return activities;
    } catch (e) {
      log('Error fetching activity data: $e');
      return [];
    }
  }
}
