import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:urban_explorer/di.dart';
import 'package:urban_explorer/presentation/app_router.dart';
import 'package:urban_explorer/presentation/common/widget/custom_primary_button.dart';
import 'package:urban_explorer/presentation/profile/controller/state/profile_state.dart';
import 'package:urban_explorer/presentation/style/colors.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileControllerProvider);
    ref.listen(profileControllerProvider, (_, currentState) {
      if (currentState is SuccessState) {
        Navigator.of(context).pushNamedAndRemoveUntil(AppRouter.signIn, (route) => false);
      }

      if (currentState is ErrorState) {
        final errorMessage = currentState.exception.toString();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      }
    });

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
                          cacheHeight: 150,
                          cacheWidth: 150,
                          fit: .cover,
                          loadingBuilder: (context, child, progress) {
                            if (progress == null) return child;
                            return Shimmer(
                              duration: const Duration(seconds: 2),
                              interval: const Duration(seconds: 3),
                              child: Container(
                                width: 150,
                                height: 150,
                                color: Colors.white54,
                              ),
                            );
                          },
                          errorBuilder: (context, _, _) => Container(
                            width: 150,
                            height: 150,
                            color: Colors.white54,
                            child: Icon(
                              Icons.error_rounded,
                              color: AppColors.secondary,
                              size: 32,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Bob Ross Sr.',
                      style: TextStyle(fontSize: 30, fontWeight: .w600),
                    ),
                    Text(
                      ref.read(profileControllerProvider.notifier).currentUser.email!,
                      style: TextStyle(fontSize: 16, fontWeight: .w600),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              CustomPrimaryButton(
                label: 'Sign out',
                onPressed: () => ref.read(profileControllerProvider.notifier).signOut(),
                isLoading: state is LoadingState,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
