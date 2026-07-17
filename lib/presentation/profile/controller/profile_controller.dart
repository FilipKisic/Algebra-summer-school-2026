import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:urban_explorer/di.dart';
import 'package:urban_explorer/domain/model/result.dart';
import 'package:urban_explorer/presentation/profile/controller/state/profile_state.dart';

class ProfileController extends Notifier<ProfileState>{

  @override
  ProfileState build() => InitialState();

  User get currentUser => FirebaseAuth.instance.currentUser!;

  void signOut() async {
    state = LoadingState();

    final result = await ref.read(signOutUseCaseProvider).execute();

    switch (result) {
      case Ok<void>(): state = SuccessState();
      case Error<void>(): state = ErrorState(result.exception);
    }
  }
}