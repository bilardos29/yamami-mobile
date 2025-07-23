class UserModel {
  String? token;
  String? expiredAt;
  String? id;
  String? code;
  String? firstname;
  String? lastname;
  String? phoneNumber;
  String? email;
  String? gender;
  String? dob;
  String? profilePicture;
  String? totalPoint;
  String? totalRedeem;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  UserModel({
    this.token,
    this.expiredAt,
    this.id,
    this.code,
    this.firstname,
    this.lastname,
    this.phoneNumber,
    this.email,
    this.gender,
    this.dob,
    this.profilePicture,
    this.totalPoint,
    this.totalRedeem,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    expiredAt = json['expiredAt'];
    id = json['id'];
    code = json['code'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    gender = json['gender'];
    dob = json['dob'];
    profilePicture = json['profile_picture'];
    totalPoint = json['total_point'];
    totalRedeem = json['total_redeem'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['expiredAt'] = expiredAt;
    data['id'] = id;
    data['code'] = code;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['phone_number'] = phoneNumber;
    data['email'] = email;
    data['gender'] = gender;
    data['dob'] = dob;
    data['profile_picture'] = profilePicture;
    data['total_point'] = totalPoint;
    data['total_redeem'] = totalRedeem;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}
