import 'dart:convert';

import 'package:app/config/api.dart';
import 'package:app/config/response.dart';
import 'package:app/feature/auth/reset_password/model/reset_password_request.dart';
import 'package:flutter/cupertino.dart';

class ResetPasswordController extends ChangeNotifier with Api {
  void resetPassword(
    String pwd,
    String repwd, {
    ValueChanged<String>? onErr,
    ValueChanged<String>? onSuccess,
  }) async {
    if (pwd.isEmpty) {
      onErr!('Password tidak boleh kosong');
    } else if (repwd.isEmpty) {
      onErr!('Password Confirmation tidak boleh kosong');
    } else {
      onSuccess!('Berhasil Mengubah Password');
      // try {
      //   final request = ResetPasswordRequest(
      //     password: pwd,
      //     confirmationPassword: repwd,
      //   );
      //   final result = await post(
      //     ApiPath.resetPassword,
      //     body: request.toJson(),
      //   );
      //   print('test ${result.body}');
      //   final response = Response.fromJson(jsonDecode(result.body));
      //   if (result.statusCode == 200) {
      //     print('test ${response.data}');
      //     onSuccess!('Berhasil Mengubah Password');
      //   } else {
      //     onErr!(response.message ?? '');
      //   }
      // } catch (e) {
      //   onErr!(e.toString());
      // }
    }
  }
}
