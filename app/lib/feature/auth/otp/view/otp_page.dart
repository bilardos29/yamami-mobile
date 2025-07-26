import 'dart:async';

import 'package:app/component/custom_text_button.dart';
import 'package:app/component/main_button.dart';
import 'package:app/component/otp_input_text.dart';
import 'package:app/feature/auth/otp/controller/otp_controller.dart';
import 'package:app/feature/home/view/home_page.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {

  String otp = '';
  Timer? _timer;
  int _remainingSeconds = 180; // 3 menit

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  String get formattedTime {
    final minutes = (_remainingSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (_remainingSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ctrl = context.read<OTPController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Masukkan kode OTP',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.all(32),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          wordSpacing: 2,
                        ),
                        children: [
                          const TextSpan(text: 'Masukkan kode verifikasi yang kami kirimkan ke email '),
                          TextSpan(
                            text: 'ap***@mail.com',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const TextSpan(text: ' untuk memvalidasi akun Anda.'),
                        ],
                      ),
                    ),
                  ),
                  OtpInputText(
                    onCompleted: (otpCode) {
                      otp = otpCode;
                      ctrl.verifyOTP(otpCode, onErr: (err){}, onSuccess: (){
                        backToMainPage(context, HomePage());
                      });
                    },
                  ),
                  SizedBox(height: 30),
                  MainButton(text: 'Simpan', onPressed: () {
                    ctrl.verifyOTP(otp, onErr: (err){}, onSuccess: (){
                      backToMainPage(context, HomePage());
                    });
                  }),
                  SizedBox(height: 32),
                  Text(formattedTime),
                  SizedBox(height: 32),
                  CustomTextButton(text: 'Kirim Ulang', disable: !(_remainingSeconds == 0), onClick: () {

                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
