class ImageUploadResponseModel {
  Data? data;

  ImageUploadResponseModel({this.data});

  ImageUploadResponseModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["data"] = data;
    return data;
  }
}

class Data {
  String? url;
  String? label;
  List<String>? description;

  Data({this.url, this.label, this.description});

  Data.fromJson(Map<String, dynamic> json) {
    url = json["url"];
    label = json["label"];
    description = json["description"] == null
        ? null
        : List<String>.from(json["description"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["url"] = url;
    data["label"] = label;
    if (description != null) {
      data["description"] = description;
    }
    return data;
  }
}
