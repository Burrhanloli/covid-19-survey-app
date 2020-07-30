import 'package:bloc/bloc.dart';
import 'package:covid19_survey_app/services/auth/firebas_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuthService firebaseAuthService;
  AuthCubit(this.firebaseAuthService) : super(AuthInitial());

  Future<void> authCheckRequested() async {
    if (await firebaseAuthService.isLoggedIn()) {
      emit(Authenticated());
    } else {
      emit(Unauthenticated());
    }
  }

  Future<void> login(String phone, BuildContext context) async {
    await firebaseAuthService.loginUser(phone, context);
  }

  Future<void> signOut() async {
    await firebaseAuthService.signOut();
    emit(Unauthenticated());
  }
}
