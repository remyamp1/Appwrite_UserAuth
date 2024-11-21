import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 177, 216, 247),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 202, 229, 250),
          title: Text(
            "HomeScreen",
          ),
          actions: [Icon(Icons.logout)],
        ),
        body: Center(
          child: Text(
            "Home",
            style: TextStyle(fontSize: 25, color: Colors.black),
          ),
        ));
  }
}
