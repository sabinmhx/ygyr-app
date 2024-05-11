import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:ygyr/model/activity_model.dart';

class ActivityServices {
  Future<ActivityModel?> getActivity() async {
    try {
      final jsonString = await rootBundle.loadString('assets/activity.json');
      return ActivityModel.fromJson(json.decode(jsonString));
    } catch (e) {
      log('Error fetching activity data: $e');
      return null;
    }
  }
}
