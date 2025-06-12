import 'package:flutter/material.dart';
import 'package:minimal_chatapp/services/auth/service_auth.dart';
import 'package:minimal_chatapp/components/my_button.dart';
import 'package:minimal_chatapp/components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  final void Function()? onTap;
  RegisterPage({super.key, required this.onTap});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void register(BuildContext context) async {
    final auth = AuthService();
    if (_passwordController.text == _confirmPasswordController.text) {
      try {
        auth.signUpWithEmailPassword(
          _emailController.text,
          _passwordController.text,
          _usernameController.text,
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(title: Text(e.toString())),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text("Password don't match")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.message,
                size: 60,
                color: Theme.of(context).colorScheme.primary,
              ),

              const SizedBox(height: 25),
              Text(
                "Let's create a account for you!",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 25),
              MyTextField(
                hintText: 'username',
                obscureText: false,
                controller: _usernameController,
              ),

              const SizedBox(height: 10),
              MyTextField(
                hintText: 'email',
                obscureText: false,
                controller: _emailController,
              ),

              const SizedBox(height: 10),
              MyTextField(
                hintText: 'password',
                obscureText: true,
                controller: _passwordController,
              ),
              const SizedBox(height: 10),
              MyTextField(
                hintText: 'confirm password',
                obscureText: true,
                controller: _confirmPasswordController,
              ),
              const SizedBox(height: 10),
              MyButton(onTap: () => register(context), text: 'Register'),

              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already Have a account? ",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      'Login now',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
