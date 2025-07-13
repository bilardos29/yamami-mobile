import 'package:app/component/main_button.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';

class ProfileChangePasswordPage extends StatefulWidget {
  @override
  _ProfileChangePasswordPageState createState() =>
      _ProfileChangePasswordPageState();
}

class _ProfileChangePasswordPageState extends State<ProfileChangePasswordPage> {
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isCurrentPasswordObscured = true;
  bool _isNewPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: appText('Edit Kata Sandi'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          children: [
            editPass(
              ctrl: _currentPasswordController,
              isObscured: _isCurrentPasswordObscured,
              onChanged: () {
                setState(() {
                  _isCurrentPasswordObscured = !_isCurrentPasswordObscured;
                });
              },
            ),
            const SizedBox(height: 16),
            editPass(
              ctrl: _newPasswordController,
              isObscured: _isNewPasswordObscured,
              onChanged: () {
                setState(() {
                  _isNewPasswordObscured = !_isNewPasswordObscured;
                });
              },
            ),
            const SizedBox(height: 16),
            editPass(
              ctrl: _confirmPasswordController,
              isObscured: _isConfirmPasswordObscured,
              onChanged: () {
                setState(() {
                  _isConfirmPasswordObscured = !_isConfirmPasswordObscured;
                });
              },
            ),

            const SizedBox(height: 32),
            MainButton(text: 'Simpan', onPressed: () {}),
          ],
        ),
      ),
    );
  }

  Widget editPass({
    TextEditingController? ctrl,
    bool isObscured = true,
    VoidCallback? onChanged,
  }) => TextField(
    controller: ctrl,
    obscureText: isObscured,
    decoration: InputDecoration(
      hintText: 'Konfirmasi kata sandi',
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      suffixIcon: IconButton(
        icon: Icon(isObscured ? Icons.visibility_off : Icons.visibility),
        onPressed: onChanged,
      ),
    ),
  );
}
