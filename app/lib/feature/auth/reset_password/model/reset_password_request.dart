class ResetPasswordRequest {
  String? password;
  String? confirmationPassword;

  ResetPasswordRequest({this.password, this.confirmationPassword});

  ResetPasswordRequest.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    confirmationPassword = json['confirmation_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['password'] = password;
    data['confirmation_password'] = confirmationPassword;
    return data;
  }
}
