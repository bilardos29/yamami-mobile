import 'package:app/feature/login/view/login_page.dart';
import 'package:app/feature/splash/view/splash_page.dart';
import 'package:app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Poppins", "Poppins");
    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      title: 'Yamami Baking',
      debugShowCheckedModeBanner: false,
      theme: theme.light(),
      locale: Locale('id', 'ID'),
      supportedLocales: [Locale('en', 'US'), Locale('id', 'ID')],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: LoginPage(),
    );
  }
}

