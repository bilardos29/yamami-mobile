import 'dart:convert';

import 'package:app/config/api.dart';
import 'package:app/config/response.dart';
import 'package:app/feature/auth/login/data/login_request.dart';
import 'package:app/feature/profile/data/user_model.dart';
import 'package:app/utils/local_storage.dart';
import 'package:app/utils/local_storage_key.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier with Api {
  UserModel? _user;

  UserModel? get user => _user;

  Future<void> login(String user, String pwd, bool isRememberMe, Function onClick, {ValueChanged<String>? onErr}) async {
    String inputType = detectInputType(user);
    if(user.isEmpty){
      onErr!('No Telp/Email tidak boleh kosong');
    } else if(pwd.isEmpty) {
      onErr!('Password tidak boleh kosong');
    } else if(inputType.isEmpty) {
      onErr!('No Telp/Email tidak sesuai');
    } else {
      try {
        final request = LoginRequest(
          type: inputType,
          email: user,
          password: pwd,
        );
        print('request ${request.toJson()}');
        final result = await post(ApiPath.login, body: request.toJson());
        print('test ${result.body}');
        final response = Response.fromJson(jsonDecode(result.body));
        if (result.statusCode == 200) {
          final loginData = UserModel.fromJson(response.data);
          LocalStorage.setString(LocalStorageKey.token, loginData.token!);
          LocalStorage.setString(LocalStorageKey.rememberMe, '$isRememberMe');
          onClick();
        } else {
          onErr!(response.message ?? '');
        }
      } catch (e) {
        onErr!(e.toString());
      }
    }
  }

  void lewatiFunc(Function onClick) {
    onClick();
  }
}
