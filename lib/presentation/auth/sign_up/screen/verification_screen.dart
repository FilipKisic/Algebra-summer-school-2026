import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:urban_explorer/di.dart';
import 'package:urban_explorer/presentation/style/colors.dart';

class VerificationScreen extends ConsumerWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Email Verification'),
        centerTitle: true,
        leading: IconButton(onPressed: () => Navigator.of(context).pop(),icon: Icon(Icons.arrow_back)),
        elevation: 10,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Image.asset('assets/images/verification.png'),
              const SizedBox(height: 20),
              Text(
                'Please check your inbox and verify your email address.',
                style: TextStyle(fontWeight: .w600, fontSize: 18),
                textAlign: .center,
              ),
              Spacer(),
              Row(
                mainAxisAlignment: .center,
                children: [
                  Text(
                    'Didn\'t receive an email?',
                    style: TextStyle(fontWeight: .w600, fontSize: 18),
                  ),
                  TextButton(
                    onPressed: () {
                      ref.read(signUpControllerProvider.notifier).resendEmail();
                    },
                    child: Text(
                      'Resend',
                      style: TextStyle(
                        fontWeight: .w600,
                        fontSize: 18,
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
    );
  }
}
