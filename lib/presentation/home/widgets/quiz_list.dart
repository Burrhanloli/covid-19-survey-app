import 'package:auto_route/auto_route.dart';
import 'package:covid19_survey_app/blocs/graphql/bloc/graphql_state.dart';
import 'package:covid19_survey_app/blocs/graphql/get_all_quiz_cubit.dart';
import 'package:covid19_survey_app/blocs/graphql/graphql_utils.dart';
import 'package:covid19_survey_app/graphql/get_all_quiz/get_all_quiz_query.dart';
import 'package:covid19_survey_app/presentation/core/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizList extends StatelessWidget {
  const QuizList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    return BlocProvider<GetAllQuizCubit>(
      create: (context) => GetAllQuizCubit(client: getClient())..runQuery(),
      child: BlocBuilder<GetAllQuizCubit, GraphqlState>(
        builder: (context, state) {
          Widget child = const Center(
            child: CircularProgressIndicator(),
          );
          if (state is GraphqlError) {
            child = Center(
              child: Text(state.result.exception.graphqlErrors.toString()),
            );
          }
          if (state is GraphqlLoaded<RootQuery$RootQuery>) {
            final List<RootQuery$RootQuery$Quiz> quizes = state.data.getAllQuiz;
            if (quizes.isEmpty) {
              child = const Center(
                child: Text("No Quiz avialaible"),
              );
            } else {
              child = Container(
                height: maxHeight * 0.7,
                child: ListView.builder(
                  itemCount: quizes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      key: ValueKey(quizes[index].id),
                      onTap: () => ExtendedNavigator.of(context).push(
                          Routes.quizPage,
                          arguments: QuizPageArguments(quiz: quizes[index])),
                      title: Text(quizes[0].text),
                    );
                  },
                ),
              );
            }
          }
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: child,
          );
        },
      ),
    );
  }
}
