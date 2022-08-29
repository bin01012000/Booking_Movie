class SignUpResponse {
  int? errCode;
  String? errMessage;
  int? result;

  SignUpResponse({this.errCode, this.errMessage, this.result});

  SignUpResponse.fromJson(Map<String, dynamic> json) {
    errCode = json['errCode'];
    errMessage = json['errMessage'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['errCode'] = errCode;
    data['errMessage'] = errMessage;
    data['result'] = result;
    return data;
  }
}
