import 'package:app/component/main_button.dart';
import 'package:flutter/material.dart';

backToMainPage(BuildContext ctx, Widget page) {
  Navigator.pushAndRemoveUntil(
    ctx,
    MaterialPageRoute(builder: (context) => page),
    (route) => false,
  );
}

nextPage(BuildContext ctx, Widget page) {
  Navigator.push(ctx, MaterialPageRoute(builder: (context) => page));
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
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  );

  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

Widget emptyState(
  VoidCallback onMulaiBelanja, {
  String? title,
  String? detail,
}) => Expanded(
  child: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'asset/images/img_empty_state.png',
          width: 180,
          height: 180,
        ),
        SizedBox(height: 16),
        Text(
          'Belum Ada $title',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        SizedBox(height: 10),
        Text('Tidak ada $detail untuk saat ini.'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 20),
          child: MainButton(text: 'Mulai Belanja', onPressed: onMulaiBelanja),
        ),
      ],
    ),
  ),
);

Widget buildIconWithBadge({
  required String image,
  required VoidCallback? onTap,
}) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      GestureDetector(
        onTap: onTap,
        child: Image.asset(
          'asset/icons/$image',
          width: 28,
          height: 28,
          color: Colors.brown,
        ),
      ),
      Positioned(
        right: -2,
        top: -2,
        child: Container(
          width: 10,
          height: 10,
          decoration: const BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
          ),
        ),
      ),
    ],
  );
}

Widget dividerLine({double padding = 24}) => Padding(
  padding: EdgeInsets.symmetric(horizontal: padding),
  child: const Divider(height: 0.5, color: Colors.black12),
);

Widget appText(String txt) => Text(
  txt,
  style: TextStyle(
    fontSize: 16,
    color: Colors.black87,
    fontWeight: FontWeight.bold,
  ),
);
