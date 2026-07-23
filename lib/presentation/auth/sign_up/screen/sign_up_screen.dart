import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:urban_explorer/di.dart';
import 'package:urban_explorer/presentation/app_router.dart';
import 'package:urban_explorer/presentation/auth/sign_up/controller/state/sign_up_state.dart';
import 'package:urban_explorer/presentation/auth/utils/form_validator.dart';
import 'package:urban_explorer/presentation/common/widget/custom_primary_button.dart';
import 'package:urban_explorer/presentation/auth/widget/custom_text_field.dart';
import 'package:urban_explorer/presentation/style/colors.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(signUpControllerProvider);

    ref.listen(signUpControllerProvider, (_, currentState) {
      if (currentState is ErrorState) {
        final errorMessage = currentState.exception.toString();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      }

      if (currentState is SuccessState) {
        Navigator.of(context).pushReplacementNamed(AppRouter.verification);
      }
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Sign Up', style: TextStyle(fontWeight: .w600)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Hero(
                  tag: 'sign_in_image',
                  child: Image.asset('assets/images/sign_in_image.png', width: 150),
                ),
                const SizedBox(height: 20),
                Text(
                  'Please create an account to continue',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: .w600,
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  label: 'Email',
                  controller: emailController,
                  validator: FormValidator.validateEmail,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  label: 'Password',
                  controller: passwordController,
                  validator: FormValidator.validatePassword,
                  isPassword: true,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  label: 'Confirm password',
                  controller: confirmPasswordController,
                  validator: (value) => FormValidator.validateConfirmPassword(value, passwordController.text),
                  isPassword: true,
                ),
                const SizedBox(height: 40),
                CustomPrimaryButton(
                  label: 'Sign up',
                  onPressed: signUp,
                  isLoading: state is LoadingState,
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: .center,
                  children: [
                    const Text(
                      'Already have an account?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: .w600,
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: .w600,
                          color: AppColors.secondary,
                        ),
                      ),
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

  void signUp() {
    if (formKey.currentState!.validate()) {
      ref.read(signUpControllerProvider.notifier).signUp(emailController.text, passwordController.text);
    }
  }
}
