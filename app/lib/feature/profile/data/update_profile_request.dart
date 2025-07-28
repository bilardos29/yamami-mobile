class UpdateProfileRequest {
  String? profilePicture;
  String? firstname;
  String? lastname;
  String? email;
  String? gender;
  String? dob;
  String? phoneNumber;

  UpdateProfileRequest(
      {this.profilePicture,
        this.firstname,
        this.lastname,
        this.email,
        this.gender,
        this.dob,
        this.phoneNumber});

  UpdateProfileRequest.fromJson(Map<String, dynamic> json) {
    profilePicture = json['profile_picture'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    gender = json['gender'];
    dob = json['dob'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['profile_picture'] = profilePicture;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['email'] = email;
    data['gender'] = gender;
    data['dob'] = dob;
    data['phone_number'] = phoneNumber;
    return data;
  }
}