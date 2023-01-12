// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'package:student_management_system_app/constants/static_user.dart';
import 'package:student_management_system_app/data/remote/model/auth_model.dart';
import 'package:student_management_system_app/data/remote/service/auth_service.dart';
import 'package:student_management_system_app/ui/dashboard/dashboard_page.dart';
import '../components/my_button.dart';
import '../components/my_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> signUserIn(BuildContext context) async {
    var email = userNameController.text;

    var passwordInBytes = utf8.encode(passwordController.text);
    var digest = sha256.convert(passwordInBytes);
    var password = digest.toString();

    Map<String, String> login = {"Email": email, "Password": password};

    AuthModel? authModel = await AuthService.service.login(login);

    if (authModel != null) {
      StaticUser.userId = authModel.user!.userId ?? 0;
      StaticUser.firstName = authModel.user!.firstName ?? "";
      StaticUser.lastName = authModel.user!.lastName ?? "";
      StaticUser.email = authModel.user!.email ?? "";
      StaticUser.photoPath = authModel.user!.photoPath ?? "";
      StaticUser.userType = authModel.user!.userType ?? "";

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const DashboardPage(),
          ));
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("kullanıcı adı veya şifre yanlış, tekrar deneyin"),
        ),
      );
    }

    print("HAKAN DINDIS $password");
    print(authModel.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 50),
                Image.network(
                  "https://upload.wikimedia.org/wikipedia/tr/5/5f/Ankara_Üniversitesi_logosu.png",
                  height: 200,
                  width: 200,
                ),
                SizedBox(height: 50),
                Text("     https://github.com/canoztas\nSTUDENT MANAGEMENT SYSTEM",
                    style: TextStyle(color: Colors.grey[700], fontSize: 16)),
                SizedBox(height: 25),
                MyTextField(controller: userNameController, hintText: "User name", obscureText: false),
                SizedBox(height: 10),
                MyTextField(controller: passwordController, hintText: "Password", obscureText: true),
                SizedBox(height: 50),
                MyButton(onTap: () {
                  signUserIn(context);
                }),
                SizedBox(height: 50),
                Divider()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
