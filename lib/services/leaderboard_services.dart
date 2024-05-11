import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:ygyr/base/utils/endpoint.dart';
import 'package:ygyr/model/leaderboard_model.dart';

class LeaderboardServices {
  Future<LeaderboardModel?> getLeaderBoard() async {
    try {
      final response =
          await http.get(Uri.parse('${Endpoint.baseUrl}leaderboard'));

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return LeaderboardModel.fromJson(jsonResponse);
      } else {
        log('Failed to load leaderboard: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      log('Error fetching leaderboard data: $e');
      return null;
    }
  }

  Future<LeaderboardModel?> getLeaderBoardAssets() async {
    try {
      final jsonString = await rootBundle.loadString('assets/leaderboard.json');
      return LeaderboardModel.fromJson(json.decode(jsonString));
    } catch (e) {
      log('Error fetching activity data: $e');
      return null;
    }
  }
}
