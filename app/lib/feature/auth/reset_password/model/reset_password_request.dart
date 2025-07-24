class ResetPasswordRequest {
  String? resetToken;
  String? password;
  String? confirmationPassword;

  ResetPasswordRequest({this.resetToken, this.password, this.confirmationPassword});

  ResetPasswordRequest.fromJson(Map<String, dynamic> json) {
    resetToken = json['reset_password_token'];
    password = json['password'];
    confirmationPassword = json['confirmation_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['reset_password_token'] = resetToken;
    data['password'] = password;
    data['confirmation_password'] = confirmationPassword;
    return data;
  }
}
