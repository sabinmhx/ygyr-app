class WarehouseModel {
  List<WarehouseDetail>? data;

  WarehouseModel({this.data});

  WarehouseModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null
        ? null
        : (json["data"] as List)
            .map((e) => WarehouseDetail.fromJson(e))
            .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["data"] = data;
    return data;
  }
}

class WarehouseDetail {
  String? label;
  String? date;
  int? quantity;
  List<String>? description;
  String? url;

  WarehouseDetail(
      {this.label, this.date, this.quantity, this.description, this.url});

  WarehouseDetail.fromJson(Map<String, dynamic> json) {
    label = json["label"];
    date = json["date"];
    quantity = json["quantity"];
    description = json["description"] == null
        ? null
        : List<String>.from(json["description"]);
    url = json["url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["label"] = label;
    data["date"] = date;
    data["quantity"] = quantity;
    if (description != null) {
      data["description"] = description;
    }
    data["url"] = url;
    return data;
  }
}
