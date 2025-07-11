import 'package:app/feature/auth/login/view/login_page.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    navigateWithDelay(context, const LoginPage(), seconds: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.onPrimaryContainer,
      child: Center(
        child: Image.asset('asset/images/logo.png', width: 135, height: 135),
      ),
    );
  }
}
