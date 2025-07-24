import 'package:app/component/custom_text_field.dart';
import 'package:app/component/main_button.dart';
import 'package:app/feature/auth/forgot_password/controller/forgot_password_controller.dart';
import 'package:app/feature/auth/login/view/login_page.dart';
import 'package:app/feature/auth/otp/view/otp_reset_page.dart';
import 'package:app/feature/auth/reset_password/controller/reset_password_controller.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {

    ForgotPasswordController ctrl = context.read<ForgotPasswordController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lupa Kata Sandi',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                  SizedBox(height: 50),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Masukkan email anda untuk merubah kata sandi',
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  CustomTextField(label: 'Email', controller: _email),
                  SizedBox(height: 40),
                  MainButton(
                    text: 'Kirim',
                    onPressed: () {
                      ctrl.forgotPassword(_email.text, onErr: (err) {
                        showAppSnackBar(context, message: err);
                      }, onSuccess: (val){
                        context.read<ResetPasswordController>().resetToken = val;
                        nextPage(context, OtpResetPage());
                      });

                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
