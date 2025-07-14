import 'package:app/feature/auth/reset_password/view/reset_password_page.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';

class OtpResetPage extends StatefulWidget {
  const OtpResetPage({super.key});

  @override
  State<OtpResetPage> createState() => _OtpResetPageState();
}

class _OtpResetPageState extends State<OtpResetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appText('Masukkan kode OTP'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'asset/images/img_otp.png',
                width: 160,
                height: 126,
              ),
            ),
            const SizedBox(height: 24),
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  wordSpacing: 2,
                ),
                children: [
                  const TextSpan(text: 'Kami telah mengirimkan link untuk mengubah kata sandi ke alamat email'),
                  TextSpan(
                    text: ' ap.....@gmail.com',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFB68900), // Warna tombol "Oke"
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  backToMainPage(context, ResetPasswordPage());
                },
                child: const Text(
                  'Oke',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}