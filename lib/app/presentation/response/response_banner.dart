class ResponseBanner {
  int? errCode;
  String? errMessage;
  List<Data>? data;

  ResponseBanner({this.errCode, this.errMessage, this.data});

  ResponseBanner.fromJson(Map<String, dynamic> json) {
    errCode = json['errCode'];
    errMessage = json['errMessage'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['errCode'] = errCode;
    data['errMessage'] = errMessage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? url;
  String? publicIdImage;
  String? name;
  bool? status;
  String? description;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.url,
      this.publicIdImage,
      this.name,
      this.status,
      this.description,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    publicIdImage = json['public_id_image'];
    name = json['name'];
    status = json['status'];
    description = json['description'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['url'] = url;
    data['public_id_image'] = publicIdImage;
    data['name'] = name;
    data['status'] = status;
    data['description'] = description;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
