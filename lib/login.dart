import 'package:flutter/material.dart';
import 'package:userathu_appwrite/appwrite_Service.dart';
import 'package:userathu_appwrite/home.dart';
import 'package:userathu_appwrite/sign.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late AppwriteService _appwriteService;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _appwriteService = AppwriteService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 202, 229, 250),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Text(
              "Login",
              style: TextStyle(fontSize: 35, color: Colors.black),
            ),
            SizedBox(
              height: 60,
            ),
            SizedBox(
                height: 50,
                width: 320,
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), label: Text("Email")),
                )),
            SizedBox(
              height: 20,
            ),
            SizedBox(
                height: 50,
                width: 320,
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), label: Text("Password")),
                )),
            SizedBox(
              height: 80,
            ),
            SizedBox(
              height: 40,
              width: 300,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      backgroundColor:
                          const Color.fromARGB(255, 181, 220, 252)),
                  onPressed: () async {
                    if (emailController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty) {
                      try {
                        await _appwriteService.loginUser(
                            emailController.text, passwordController.text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                        emailController.clear();
                        passwordController.clear();
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(e.toString())));
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please fill in all fields')));
                    }
                  },
                  child: Text("Login")),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Dont have an account?"),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignPage()));
                      },
                      child: Text("Sign Up"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
