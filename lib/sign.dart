import 'package:flutter/material.dart';
import 'package:userathu_appwrite/appwrite_Service.dart';
import 'package:userathu_appwrite/login.dart';

class SignPage extends StatefulWidget {
  const SignPage({super.key});

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  late AppwriteService _appwriteService;
  TextEditingController nameController = TextEditingController();
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
              "SignUp",
              style: TextStyle(fontSize: 35, color: Colors.black),
            ),
            SizedBox(
              height: 60,
            ),
            SizedBox(
                height: 50,
                width: 320,
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), label: Text("Name")),
                )),
            SizedBox(
              height: 20,
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
                    if (nameController.text.isNotEmpty &&
                        emailController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty) {
                      try {
                        await _appwriteService.registerUser(
                          emailController.text,
                          nameController.text,
                          passwordController.text,
                        );
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                        nameController.clear();
                        passwordController.clear();
                        emailController.clear();
                      } catch (e) {
                        print("error adding user:$e");
                      }
                    }
                  },
                  child: Text("Sign Up")),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Already have an account?"),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: Text("Login"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
