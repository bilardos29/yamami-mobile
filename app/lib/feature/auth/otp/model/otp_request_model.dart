class OTPRequest {
  String? phoneNumber;

  OTPRequest({this.phoneNumber});

  OTPRequest.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone_number'] = phoneNumber;
    return data;
  }
}

class OTPVerify {
  String? token;
  String? otp;

  OTPVerify({this.token, this.otp});

  OTPVerify.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['otp'] = otp;
    return data;
  }
}
