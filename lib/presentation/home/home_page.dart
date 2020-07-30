import 'package:auto_route/auto_route.dart';
import 'package:covid19_survey_app/blocs/auth/auth_cubit.dart';
import 'package:covid19_survey_app/blocs/graphql/bloc/graphql_state.dart';
import 'package:covid19_survey_app/blocs/graphql/token_cubit.dart';
import 'package:covid19_survey_app/presentation/core/core.dart';
import 'package:covid19_survey_app/presentation/core/router.gr.dart';

import 'package:covid19_survey_app/presentation/home/widgets/quiz_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is Unauthenticated) {
          ExtendedNavigator.of(context).popAndPush(Routes.loginPage);
        }
      },
      child: Scaffold(
        appBar: buildAppBar(
          title: "Surveys",
          context: context,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BlocBuilder<TokenCubit, GraphqlState>(
                    builder: (context, state) {
                  Widget child = const Center(
                    child: CircularProgressIndicator(),
                  );
                  if (state is GraphqlLoaded) {
                    child = const QuizList();
                  }
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: child,
                  );
                }),
                Container(
                  width: double.infinity,
                  child: FlatButton(
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(16),
                    onPressed: () => context.bloc<AuthCubit>().signOut(),
                    color: Theme.of(context).primaryColor,
                    child: const Text("Sign out"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
