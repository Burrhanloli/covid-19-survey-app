import 'package:auto_route/auto_route.dart';
import 'package:covid19_survey_app/blocs/graphql/get_results_cubit.dart';
import 'package:covid19_survey_app/blocs/graphql/graphql_utils.dart';
import 'package:covid19_survey_app/graphql/get_all_quiz/get_all_quiz_query.dart';
import 'package:covid19_survey_app/presentation/core/core.dart';
import 'package:covid19_survey_app/presentation/core/router.gr.dart';
import 'package:covid19_survey_app/presentation/quiz/widgets/results_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizPage extends StatelessWidget {
  final RootQuery$RootQuery$Quiz quiz;
  const QuizPage({@required this.quiz}) : assert(quiz != null);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetResultsCubit>(
      create: (context) => GetResultsCubit(client: getClient())..runQuery(),
      child: Scaffold(
        appBar: buildAppBar(title: quiz.text, context: context),
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async => context.bloc<GetResultsCubit>().refetch(),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("Previous Results"),
                  const ResultsList(),
                  const SizedBox(height:20),
                  Container(
                    width: double.infinity,
                    child: FlatButton(
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(16),
                      onPressed: () => ExtendedNavigator.of(context).push(
                          Routes.answerPage,
                          arguments: AnswerPageArguments(quiz: quiz)),
                      color: Theme.of(context).primaryColor,
                      child: const Text("Start Survey"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
