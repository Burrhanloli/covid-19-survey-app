import 'package:auto_route/auto_route.dart';
import 'package:covid19_survey_app/blocs/auth/auth_cubit.dart';
import 'package:covid19_survey_app/blocs/graphql/add_result_cubit.dart';
import 'package:covid19_survey_app/blocs/graphql/graphql_utils.dart';
import 'package:covid19_survey_app/blocs/graphql/submit_response_cubit.dart';
import 'package:covid19_survey_app/blocs/graphql/token_cubit.dart';
import 'package:covid19_survey_app/presentation/core/router.gr.dart';
import 'package:covid19_survey_app/presentation/login/login_page.dart';
import 'package:covid19_survey_app/services/auth/firebas_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
            create: (context) =>
                AuthCubit(FirebaseAuthService())..authCheckRequested()),
        BlocProvider<TokenCubit>(
            create: (context) => TokenCubit(client: getClient())),
        BlocProvider<SubmitResponseCubit>(
            create: (BuildContext context) =>
                SubmitResponseCubit(client: getClient())),
        BlocProvider<AddResultCubit>(
            create: (BuildContext context) =>
                AddResultCubit(client: getClient())),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          builder: ExtendedNavigator(router: Router()),
          themeMode: ThemeMode.system,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          home: LoginPage()),
    );
  }
}
