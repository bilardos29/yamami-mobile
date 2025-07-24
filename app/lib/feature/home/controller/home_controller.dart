import 'dart:convert';

import 'package:app/config/api.dart';
import 'package:app/feature/profile/data/user_model.dart';
import 'package:app/utils/local_storage.dart';
import 'package:app/utils/local_storage_key.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier with Api {

  bool newNotif = false;
  bool newCart = false;

  Future<UserModel> getUser() async {
    final userData = LocalStorage.getString(LocalStorageKey.user);
    if(userData.isNotEmpty) {
      final user = UserModel.fromJson(json.decode(userData));
      return user;
    }
    return UserModel();
  }
}