import 'package:auto_route/auto_route.dart';
import 'package:covid19_survey_app/blocs/auth/auth_cubit.dart';
import 'package:covid19_survey_app/presentation/core/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            Future.delayed(const Duration(seconds: 2),
                () => ExtendedNavigator.of(context).popAndPush(Routes.homePage));
          }
          if (state is Unauthenticated) {
            Future.delayed(const Duration(seconds: 2),
                () => ExtendedNavigator.of(context).popAndPush(Routes.loginPage));
          }
        },
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
