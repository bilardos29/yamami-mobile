class StoreModel {
  String? id;
  String? code;
  String? name;
  String? contactName;
  String? slug;
  String? address;
  double? longitude;
  double? latitude;
  String? postalCode;
  String? phoneNumber;
  String? email;
  String? logo;
  String? status;
  Province? province;
  District? district;
  City? city;

  StoreModel(
      {this.id,
        this.code,
        this.name,
        this.contactName,
        this.slug,
        this.address,
        this.longitude,
        this.latitude,
        this.postalCode,
        this.phoneNumber,
        this.email,
        this.logo,
        this.status,
        this.province,
        this.district,
        this.city});

  StoreModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    contactName = json['contact_name'];
    slug = json['slug'];
    address = json['address'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    postalCode = json['postal_code'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    logo = json['logo'];
    status = json['status'];
    province = json['province'] != null
        ? Province.fromJson(json['province'])
        : null;
    district = json['district'] != null
        ? District.fromJson(json['district'])
        : null;
    city = json['city'] != null ? City.fromJson(json['city']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['contact_name'] = contactName;
    data['slug'] = slug;
    data['address'] = address;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['postal_code'] = postalCode;
    data['phone_number'] = phoneNumber;
    data['email'] = email;
    data['logo'] = logo;
    data['status'] = status;
    if (province != null) {
      data['province'] = province!.toJson();
    }
    if (district != null) {
      data['district'] = district!.toJson();
    }
    if (city != null) {
      data['city'] = city!.toJson();
    }
    return data;
  }
}

class ShortStoreModel {
  String? id;
  String? name;

  ShortStoreModel(
      {this.id,
        this.name,});

  ShortStoreModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Province {
  String? id;
  String? name;

  Province({this.id, this.name});

  Province.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class District {
  String? id;
  String? name;

  District({this.id, this.name});

  District.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class City {
  String? id;
  String? name;

  City({this.id, this.name});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}