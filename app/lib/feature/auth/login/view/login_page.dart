import 'package:app/component/custom_text_button.dart';
import 'package:app/component/custom_text_field.dart';
import 'package:app/component/main_button.dart';
import 'package:app/feature/auth/forgot_password/view/forgot_password_page.dart';
import 'package:app/feature/auth/register/view/register_page.dart';
import 'package:app/feature/home/view/home_page.dart';
import 'package:app/utils/asset_path.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        height: 64,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Belum punya akun?'),
            CustomTextButton(text: ' Daftar di sini', onClick: () {
              nextPage(context, RegisterPage());
            }),
          ],
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
                  Image.asset(AssetPath.Logo, width: 88, height: 88),
                  SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Masuk',
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
                  CustomTextField(label: 'No Telp/Email', controller: _email),
                  SizedBox(height: 24),
                  CustomTextField(
                    label: 'Kata Sandi',
                    controller: _pass,
                    isPassword: true,
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Ingat Saya'),
                      CustomTextButton(
                        text: 'Lupa kata sandi?',
                        onClick: () {
                          nextPage(context, ForgotPasswordPage());
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  MainButton(text: 'Masuk', onPressed: () {
                    backToMainPage(context, HomePage());
                  }),
                  SizedBox(height: 20),
                  CustomTextButton(text: 'Lewati', onClick: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
