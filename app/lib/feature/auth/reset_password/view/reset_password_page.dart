import 'package:app/component/custom_text_field.dart';
import 'package:app/component/main_button.dart';
import 'package:app/feature/auth/login/view/login_page.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _repass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  SizedBox(height: 160),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Ubah Kata Sandi Baru',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Masukkan kata sandi baru',
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 14,
                      ),
                    ),
                  ),

                  SizedBox(height: 24),
                  CustomTextField(
                    label: 'Kata Sandi Baru',
                    controller: _pass,
                    isPassword: true,
                  ),
                  SizedBox(height: 24),
                  CustomTextField(
                    label: 'Konfirmasi Kata Sandi',
                    controller: _repass,
                    isPassword: true,
                  ),
                  SizedBox(height: 24),
                  SizedBox(height: 30),
                  MainButton(text: 'Simpan', onPressed: () {
                    backToMainPage(context, LoginPage());
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
