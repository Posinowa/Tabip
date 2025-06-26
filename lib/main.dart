import 'package:flutter/material.dart';
import 'pages/login_page.dart'; // login_page.dart doğru yerdeyse bu import yeterli

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bitki Sanatı',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
        textTheme: Typography.blackCupertino, // sade görünüm için
      ),
      home: const LoginPage(),
    );
  }
}
