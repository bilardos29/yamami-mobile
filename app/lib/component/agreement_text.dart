import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AgreementText extends StatelessWidget {
  final void Function()? onTermsTap;
  final void Function()? onPrivacyTap;

  const AgreementText({
    Key? key,
    this.onTermsTap,
    this.onPrivacyTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final linkStyle = TextStyle(
      color: Theme.of(context).colorScheme.primary,
      decoration: TextDecoration.underline,
    );

    return RichText(
      text: TextSpan(
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          wordSpacing: 2,

        ),
        children: [
          const TextSpan(text: 'Dengan membuat akun, Anda menyetujui '),
          TextSpan(
            text: 'Syarat dan Ketentuan',
            style: linkStyle,
            recognizer: TapGestureRecognizer()..onTap = onTermsTap,
          ),
          const TextSpan(text: ' kami dan telah membaca serta mengakui '),
          TextSpan(
            text: 'Kebijakan Privasi',
            style: linkStyle,
            recognizer: TapGestureRecognizer()..onTap = onPrivacyTap,
          ),
          const TextSpan(text: '.'),
        ],
      ),
    );
  }
}