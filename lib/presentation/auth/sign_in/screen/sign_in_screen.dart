import 'package:flutter/material.dart';
import 'package:urban_explorer/presentation/auth/sign_in/widget/custom_primary_button.dart';
import 'package:urban_explorer/presentation/auth/sign_in/widget/custom_text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Image.asset('assets/images/sign_in_image.png', width: 250),
              const SizedBox(height: 20),
              const Text(
                'Please sign in to your account.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 30),
              CustomTextField(
                label: 'Email',
                controller: emailController,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                label: 'Password',
                controller: passwordController,
                isPassword: true,
              ),
              const SizedBox(height: 50),
              CustomPrimaryButton(
                label: 'Sign in',
                onPressed: signIn,
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account?'),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Sign up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void signIn() {
    print(emailController.text);
    print(passwordController.text);
  }
}
