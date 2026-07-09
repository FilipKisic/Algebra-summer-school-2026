import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:urban_explorer/di.dart';
import 'package:urban_explorer/presentation/auth/sign_in/controller/state/sign_in_state.dart';
import 'package:urban_explorer/presentation/auth/sign_in/widget/custom_primary_button.dart';
import 'package:urban_explorer/presentation/auth/sign_in/widget/custom_text_field.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(signInControllerProvider);

    ref.listen(signInControllerProvider, (previous, currentState) {
      if (currentState is ErrorState) {
        final errorMessage = currentState.exception.toString();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      }
      if (currentState is SuccessState) {
        // push to the next screen
        print('SUCCESS!!!');
      }
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
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
                  validator: validateEmail,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  label: 'Password',
                  controller: passwordController,
                  isPassword: true,
                  validator: validatePassword,
                ),
                const SizedBox(height: 50),
                CustomPrimaryButton(
                  label: 'Sign in',
                  onPressed: signIn,
                  isLoading: state is LoadingState,
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
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String? validateEmail(final String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some value';
    }

    if (!RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(value)) {
      return 'Please enter valid email address.';
    }

    return null;
  }

  String? validatePassword(final String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some value';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters long.';
    }

    return null;
  }

  void signIn() {
    if (_formKey.currentState!.validate()) {
      ref.read(signInControllerProvider.notifier).signIn(emailController.text, passwordController.text);
    }
  }
}
