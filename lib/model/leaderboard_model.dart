class LeaderboardModel {
  List<LeaderboardDetail>? data;

  LeaderboardModel({this.data});

  LeaderboardModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null
        ? null
        : (json["data"] as List)
            .map((e) => LeaderboardDetail.fromJson(e))
            .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["data"] = data;
    return data;
  }
}

class LeaderboardDetail {
  String? url;
  int? points;

  LeaderboardDetail({this.url, this.points});

  LeaderboardDetail.fromJson(Map<String, dynamic> json) {
    url = json["url"];
    points = json["points"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["url"] = url;
    data["points"] = points;
    return data;
  }
}
