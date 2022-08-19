class ResponseLogin {
  int? errorCode;
  String? errMessage;
  DataLogin? data;

  ResponseLogin({this.errorCode, this.errMessage, this.data});

  ResponseLogin.fromJson(Map<String, dynamic> json) {
    errorCode = json['errorCode'];
    errMessage = json['errMessage'];
    data = json['data'] != null ? DataLogin.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['errorCode'] = errorCode;
    data['errMessage'] = errMessage;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataLogin {
  String? email;
  int? roleId;
  String? fullName;
  String? avatar;
  String? externalid;
  String? phone;
  bool? isActive;
  int? id;
  String? accessToken;

  DataLogin(
      {this.email,
      this.roleId,
      this.fullName,
      this.avatar,
      this.externalid,
      this.phone,
      this.isActive,
      this.id,
      this.accessToken});

  DataLogin.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    roleId = json['roleId'];
    fullName = json['fullName'];
    avatar = json['avatar'];
    externalid = json['externalid'];
    phone = json['phone'];
    isActive = json['isActive'];
    id = json['id'];
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['roleId'] = roleId;
    data['fullName'] = fullName;
    data['avatar'] = avatar;
    data['externalid'] = externalid;
    data['phone'] = phone;
    data['isActive'] = isActive;
    data['id'] = id;
    data['accessToken'] = accessToken;
    return data;
  }
}
