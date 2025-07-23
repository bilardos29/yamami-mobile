class RegisterRequest {
  String? firstname;
  String? lastname;
  String? email;
  String? phoneNumber;
  String? password;
  String? confirmationPassword;

  RegisterRequest(
      {this.firstname,
        this.lastname,
        this.email,
        this.phoneNumber,
        this.password,
        this.confirmationPassword});

  RegisterRequest.fromJson(Map<String, dynamic> json) {
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    password = json['password'];
    confirmationPassword = json['confirmation_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['password'] = this.password;
    data['confirmation_password'] = this.confirmationPassword;
    return data;
  }
}
