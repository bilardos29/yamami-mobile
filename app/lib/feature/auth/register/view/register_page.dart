import 'package:app/component/agreement_text.dart';
import 'package:app/component/custom_text_button.dart';
import 'package:app/component/custom_text_field.dart';
import 'package:app/component/main_button.dart';
import 'package:app/feature/auth/login/view/login_page.dart';
import 'package:app/feature/auth/otp/view/otp_page.dart';
import 'package:app/feature/auth/register/controller/register_controller.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nama = TextEditingController();
  final TextEditingController _notelp = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _repass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ctrl = context.read<RegisterController>();
    return Scaffold(
      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          height: 64,
          color: Colors.white,
          margin: const EdgeInsets.only(bottom: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Sudah memiliki akun'),
              CustomTextButton(
                text: ' Masuk di sini',
                onClick: () {
                  backToMainPage(context, LoginPage());
                },
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Daftar',
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
                      'Selamat datang di Yamama Baking App',
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 14,
                      ),
                    ),
                  ),

                  SizedBox(height: 24),
                  CustomTextField(label: 'Nama', controller: _nama),
                  SizedBox(height: 24),
                  CustomTextField(label: 'No Telp', controller: _notelp),
                  SizedBox(height: 24),
                  CustomTextField(label: 'Email', controller: _email),
                  SizedBox(height: 24),
                  CustomTextField(
                    label: 'Kata Sandi',
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
                  AgreementText(onTermsTap: () {}, onPrivacyTap: () {}),
                  SizedBox(height: 30),
                  MainButton(
                    text: 'Daftar',
                    onPressed: () {
                      ctrl.register(
                        _nama.text,
                        _notelp.text,
                        _email.text,
                        _pass.text,
                        _repass.text,
                        onErr: (err) {
                          showAppSnackBar(context, message: err);
                        },
                        onSuccess: (val) {
                          showAppSnackBar(context, message: val);
                          nextPage(context, OtpPage());
                        },
                      );
                    },
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
