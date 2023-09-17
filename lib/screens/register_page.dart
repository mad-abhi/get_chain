import 'package:flutter/material.dart';
import 'package:get_chain/components/my_button.dart';
import 'package:get_chain/services/auth/auth_service.dart';
import 'package:provider/provider.dart';
import '../components/my_text_field.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  void signUp() async {
    if (passwordController.text != confirmpasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Passwords Dont match'),
        ),
      );
      return;
    }
    //get auth service
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.signUpWithEmailPassword(
          emailController.text, passwordController.text);
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
                'Lets get you registered Up',
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
                height: 10,
              ),
              MyTextField(
                controller: confirmpasswordController,
                hindText: 'Confirm Password',
                obscureText: true,
              ),
              const SizedBox(
                height: 25,
              ),
              MyButton(onTap: signUp, text: 'Sign Up'),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already Registered? '),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Login Now',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
