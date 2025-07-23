class Response {
  bool? success;
  int? code;
  String? message;
  dynamic? data;

  Response({this.success, this.code, this.message, this.data});

  Response.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['code'] = code;
    data['message'] = message;
    data['data'] = this.data;
    return data;
  }
}