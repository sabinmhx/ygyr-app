class ActivityModel {
  List<Data>? data;

  ActivityModel({this.data});

  ActivityModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["data"] = data;
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? date;
  String? percent;

  Data({this.id, this.title, this.date, this.percent});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    date = json["date"];
    percent = json["percent"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["title"] = title;
    data["date"] = date;
    data["percent"] = percent;
    return data;
  }
}
