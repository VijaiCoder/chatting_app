import 'package:flutter/material.dart';
import 'package:minimal_chatapp/pages/login_page.dart';
import 'package:minimal_chatapp/pages/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;
  void tooglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: tooglePages,);
    } else {
      return RegisterPage(onTap:tooglePages);
    }
  }
}
