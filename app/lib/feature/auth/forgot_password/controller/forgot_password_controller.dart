import 'dart:convert';

import 'package:app/config/api.dart';
import 'package:app/config/response.dart';
import 'package:app/feature/auth/forgot_password/model/forgot_password_request.dart';
import 'package:flutter/cupertino.dart';

class ForgotPasswordController extends ChangeNotifier with Api {
  void forgotPassword(
    String email, {
    ValueChanged<String>? onErr,
    ValueChanged<String>? onSuccess,
  }) async {
    if (email.isEmpty) {
      onErr!('Email tidak boleh kosong');
    } else {
      try {
        final request = ForgotPasswordRequest(email: email);
        final result = await post(ApiPath.forgotPassword, body: request.toJson());
        final response = Response.fromJson(jsonDecode(result.body));
        if (result.statusCode == 200) {
          onSuccess!(response.data['reset_password_token']);
        } else {
          onErr!(response.message ?? '');
        }
      } catch (e) {
        onErr!(e.toString());
      }
    }
  }
}
