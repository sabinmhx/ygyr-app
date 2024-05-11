import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:ygyr/model/leaderboard_model.dart';

class LeaderboardServices {
  Future<LeaderboardModel?> getLeaderBoard() async {
    try {
      final jsonString = await rootBundle.loadString('assets/leaderboard.json');
      return LeaderboardModel.fromJson(json.decode(jsonString));
    } catch (e) {
      log('Error fetching activity data: $e');
      return null;
    }
  }
}
