import 'dart:convert';

import 'package:app/config/api.dart';
import 'package:app/config/response.dart';
import 'package:app/feature/profile/data/update_profile_request.dart';
import 'package:app/feature/profile/data/user_model.dart';
import 'package:app/utils/local_storage.dart';
import 'package:app/utils/local_storage_key.dart';
import 'package:flutter/cupertino.dart';

class ProfileController extends ChangeNotifier with Api{
  UserModel? _user;

  UserModel? get user => _user;

  set user(UserModel? newUser) {
    _user = newUser;
    notifyListeners();
  }

  void updateUser(
    String firstname,
    String lastname,
    String gender,
    String dob, {
    ValueChanged<String>? onErr,
    ValueChanged<String>? onSuccess,
  }) async {
    if (firstname.isEmpty) {
      onErr!('Nama pertama tidak boleh kosong');
    } else if (lastname.isEmpty) {
      onErr!('Nama terakhir tidak boleh kosong');
    } else if (gender.isEmpty) {
      onErr!('Harus memilih Jenis kelamin.');
    } else if (dob.isEmpty) {
      onErr!('Tanggal lahir tidak boleh kosong');
    } else {
      try {
        final request = UpdateProfileRequest(
          profilePicture: 'belum bisa',
          firstname: firstname,
          lastname: lastname,
          phoneNumber: _user?.phoneNumber,
          email: _user?.email,
          dob: dob,
          gender: gender,
        );
        final result = await put(ApiPath.updateProfile, body: request.toJson());
        final response = Response.fromJson(jsonDecode(result.body));
        print('test ${result.body}');
        if (result.statusCode == 200) {
          final newUser = UserModel.fromJson(response.data);
          LocalStorage.setString(LocalStorageKey.user, newUser.toStringPref());
          user = newUser;
          onSuccess!('Berhasil Update');
        } else {
          onErr!(response.message ?? '');
        }
      } catch (e) {
        onErr!(e.toString());
      }
    }
  }

  void logout(Function onSuccess) {
    _user = null;
    LocalStorage.setString(LocalStorageKey.token, '');
    LocalStorage.setString(LocalStorageKey.rememberMe, 'false');
    LocalStorage.setString(LocalStorageKey.user, '');
    onSuccess();
  }
}
