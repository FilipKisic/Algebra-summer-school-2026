import 'package:flutter/material.dart';
import 'package:urban_explorer/presentation/common/widget/custom_primary_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                'My profile',
                style: TextStyle(fontSize: 40, fontWeight: .bold),
              ),
              const SizedBox(height: 60),
              Center(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            offset: Offset(0, 5),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          'https://images.pexels.com/photos/16155640/pexels-photo-16155640.jpeg',
                          width: 150,
                          height: 150,
                          fit: .cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Bob Ross Sr.',
                      style: TextStyle(fontSize: 30, fontWeight: .w600),
                    ),
                    Text(
                      'placeholder@mail.com',
                      style: TextStyle(fontSize: 16, fontWeight: .w600),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              CustomPrimaryButton(
                label: 'Sign out',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
