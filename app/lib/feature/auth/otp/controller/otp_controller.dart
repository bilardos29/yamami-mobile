import 'dart:convert';

import 'package:app/config/api.dart';
import 'package:app/config/response.dart';
import 'package:app/feature/auth/otp/model/otp_request_model.dart';
import 'package:flutter/cupertino.dart';

class OTPController extends ChangeNotifier with Api {

  String _otpToken = '';

  void requestOTP(
      String phone, {
        ValueChanged<String>? onErr,
        VoidCallback? onSuccess,
      }) async {
    if (phone.isEmpty) {
      onErr!('Phone Number tidak boleh kosong');
    } else {
      try {
        final request = OTPRequest(phoneNumber: phone);
        final result = await post(ApiPath.requestOtp, body: request.toJson());
        final response = Response.fromJson(jsonDecode(result.body));
        if (result.statusCode == 200) {
          _otpToken = response.data['otp_token'];
          notifyListeners();
          onSuccess!();
        } else {
          onErr!(response.message ?? '');
        }
      } catch (e) {
        onErr!(e.toString());
      }
    }
  }

  void verifyOTP(
      String otp, {
        ValueChanged<String>? onErr,
        VoidCallback? onSuccess,
      }) async {
    if (otp.isEmpty) {
      onErr!('OTP tidak boleh kosong');
    } else if (otp.length != 6) {
      onErr!('OTP harus 6 angka');
    } else {
      try {
        final request = OTPVerify(token:_otpToken, otp: otp);
        final result = await post(ApiPath.verifyOtp, body: request.toJson());
        final response = Response.fromJson(jsonDecode(result.body));
        if (result.statusCode == 200) {
          onSuccess!();
        } else {
          onErr!(response.message ?? '');
        }
      } catch (e) {
        onErr!(e.toString());
      }
    }
  }
}