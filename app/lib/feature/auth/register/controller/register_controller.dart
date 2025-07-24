import 'dart:convert';

import 'package:app/config/api.dart';
import 'package:app/config/response.dart';
import 'package:app/feature/auth/register/data/register_request.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';

class RegisterController extends ChangeNotifier with Api {
  void register(
    String name,
    String telp,
    String email,
    String pwd,
    String repwd, {
    ValueChanged<String>? onErr,
    ValueChanged<String>? onSuccess,
  }) async {
    if(name.isEmpty){
      onErr!('Nama tidak boleh kosong');
    } else if(telp.isEmpty){
      onErr!('No Telp tidak boleh kosong');
    } else if(email.isEmpty) {
      onErr!('Email tidak boleh kosong');
    } else if(pwd.isEmpty) {
      onErr!('Password tidak boleh kosong');
    } else if(repwd.isEmpty) {
      onErr!('Konfirmasi Password tidak boleh kosong');
    } else if(pwd != repwd) {
      onErr!('Password dan Konfirmasi Password tidak sesuai');
    } else {
      try {
        final name = "Agus Salim Junior";
        final names = splitName(name);
        print('pass $pwd');

        final request = RegisterRequest(
          firstname: names['firstname'],
          lastname: names['lastname'],
          phoneNumber: telp,
          email: email,
          password: pwd,
          confirmationPassword: repwd,
        );
        final result = await post(ApiPath.register, body: request.toJson());
        final response = Response.fromJson(jsonDecode(result.body));
        if (result.statusCode == 200) {
          print('test ${response.data}');
          onSuccess!('Berhasil Daftar');
        } else {
          onErr!(response.message ?? '');
        }
      } catch (e) {
        onErr!(e.toString());
      }
    }
  }
}
