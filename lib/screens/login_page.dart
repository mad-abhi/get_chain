import 'package:flutter/material.dart';
import 'package:get_chain/components/my_button.dart';
import 'package:get_chain/components/my_text_field.dart';
import 'package:get_chain/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  void signIn() async {
    final authservice = Provider.of<AuthService>(context, listen: false);
    try {
      await authservice.signInWithEmailPassword(
        emailController.text,
        passwordController.text,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              Icon(
                Icons.message_rounded,
                size: 80.0,
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                'Great to see you again',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              MyTextField(
                controller: emailController,
                hindText: 'Email',
                obscureText: false,
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                controller: passwordController,
                hindText: 'Password',
                obscureText: true,
              ),
              const SizedBox(
                height: 25,
              ),
              MyButton(onTap: signIn, text: 'Sign In'),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Not Registered? '),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Register Now',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
