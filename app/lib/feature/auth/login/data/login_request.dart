enum LoginType { email, phoneNumber}

class LoginRequest {
  String? type;
  String? email;
  String? phoneNumber;
  String? password;

  LoginRequest({
    this.type,
    this.email,
    this.phoneNumber,
    this.password,
  });

  LoginRequest.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if(type == 'email') data['email'] = email;
    if(type == 'phone_number') data['phone_number'] = phoneNumber;
    data['password'] = password;
    return data;
  }
}
