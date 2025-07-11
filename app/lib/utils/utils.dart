import 'package:flutter/material.dart';

backToMainPage(BuildContext ctx, Widget page) {
  Navigator.pushAndRemoveUntil(
    ctx,
    MaterialPageRoute(builder: (context) => page),
        (route) => false,
  );
}

nextPage(BuildContext ctx, Widget page) {
  Navigator.push(
    ctx,
    MaterialPageRoute(
      builder: (context) => page,
    ),
  );
}

popPage(BuildContext ctx) {
  Navigator.pop(ctx);
}

navigateWithDelay(BuildContext context, Widget targetPage, {int seconds = 3}) {
  Future.delayed(Duration(seconds: seconds), () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => targetPage),
    );
  });
}

showAppSnackBar(
    BuildContext context, {
      required String message,
      Color backgroundColor = Colors.black87,
      Duration duration = const Duration(seconds: 3),
    }) {
  final snackBar = SnackBar(
    content: Text(message),
    backgroundColor: backgroundColor,
    duration: duration,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  );

  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}