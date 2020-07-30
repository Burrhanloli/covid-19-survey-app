import 'package:auto_route/auto_route.dart';
import 'package:covid19_survey_app/blocs/graphql/token_cubit.dart';
import 'package:covid19_survey_app/presentation/core/router.gr.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _codeController = TextEditingController();

  Future<void> loginUser(String phone, BuildContext context) async {
    _auth.verifyPhoneNumber(
        phoneNumber: '+91$phone',
        timeout: const Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async =>
            onVerificationCompleted(credential, context),
        verificationFailed: (AuthException exception) {
          FlushbarHelper.createError(
                  message: "No user with that number",
                  duration: const Duration(seconds: 2))
              .show(context);
        },
        codeSent: (String verificationId, [int forceResendingToken]) async =>
            showOtpDialog(context, verificationId),
        codeAutoRetrievalTimeout: null);
  }

  Future onVerificationCompleted(
      AuthCredential credential, BuildContext context) async {
    final AuthResult result = await _auth.signInWithCredential(credential);
    final FirebaseUser user = result.user;

    if (user != null) {
      ExtendedNavigator.of(context).popAndPush(Routes.homePage);
    } else {
      FlushbarHelper.createError(
              message: "Invalid Mobile no",
              duration: const Duration(seconds: 2))
          .show(context);
    }
  }

  Future showOtpDialog(BuildContext context, String verificationId) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: const Text("Please enter the OTP"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: _codeController,
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: () async => submitOtp(verificationId, context),
                child: const Text("Confirm"),
              )
            ],
          );
        });
  }

  Future submitOtp(String verificationId, BuildContext context) async {
    FocusManager.instance.primaryFocus.unfocus();
    try {
      final code = _codeController.text.trim();
      final AuthCredential credential = PhoneAuthProvider.getCredential(
          verificationId: verificationId, smsCode: code);
      final AuthResult result = await _auth.signInWithCredential(credential);
      final FirebaseUser user = result.user;
      if (user != null) {
        context.bloc<TokenCubit>().runQueryWithValues(user.phoneNumber);
        ExtendedNavigator.of(context).pop();
        ExtendedNavigator.of(context).popAndPush(Routes.homePage);
      } else {
        FlushbarHelper.createError(
                message: "Invalid Otp", duration: const Duration(seconds: 2))
            .show(context);
      }
      _codeController.clear();
    } on PlatformException catch (e) {
      if (e.code == "ERROR_INVALID_VERIFICATION_CODE") {
        FlushbarHelper.createError(
                message: "Invalid OTP", duration: const Duration(seconds: 2))
            .show(context);
      }
    }
  }

  Future<bool> isLoggedIn() async {
    if (await _auth.currentUser() != null) {
      return true;
    }
    return false;
  }

  Future<void> signOut() => Future.wait([
        _auth.signOut(),
      ]);
}
