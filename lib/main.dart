import 'package:flutter/material.dart';
import 'package:userathu_appwrite/home.dart';
import 'package:userathu_appwrite/login.dart';
import 'package:userathu_appwrite/sign.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignPage(),
    );
  }
}
