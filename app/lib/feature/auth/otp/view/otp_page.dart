import 'package:app/component/custom_text_button.dart';
import 'package:app/component/main_button.dart';
import 'package:app/component/otp_input_text.dart';
import 'package:app/feature/home/view/home_page.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
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
                      print('Kode OTP: $otpCode');
                      // lanjutkan ke verifikasi, API, dll.
                    },
                  ),
                  SizedBox(height: 30),
                  MainButton(text: 'Simpan', onPressed: () {
                    backToMainPage(context, HomePage());
                  }),
                  SizedBox(height: 32),
                  Text('10:00'),
                  SizedBox(height: 32),
                  CustomTextButton(text: 'Kirim Ulang', onClick: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
