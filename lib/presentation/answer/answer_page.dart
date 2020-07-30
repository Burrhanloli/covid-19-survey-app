import 'package:auto_route/auto_route.dart';
import 'package:covid19_survey_app/blocs/graphql/add_result_cubit.dart';
import 'package:covid19_survey_app/blocs/graphql/submit_response_cubit.dart';
import 'package:covid19_survey_app/graphql/get_all_quiz/get_all_quiz_query.dart';
import 'package:covid19_survey_app/presentation/core/router.gr.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class AnswerPage extends StatelessWidget {
  final RootQuery$RootQuery$Quiz quiz;
  AnswerPage({@required this.quiz}) : assert(quiz != null);
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final List<RootQuery$RootQuery$Quiz$Question> questions = quiz.questions;
    final maxHeight = MediaQuery.of(context).size.height;
    Map<String, String> idMap = {};
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          controller: _pageController,
          itemCount: questions.length,
          itemBuilder: (context, index) {
            idMap = {
              for (var answer in questions[index].answers)
                answer.text: answer.id
            };
            List<String> selectedAnswers = [];
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: maxHeight * 0.1),
                  Text(questions[index].text,
                      style: TextStyle(
                          fontSize: 24,
                          color: Theme.of(context).primaryColorDark)),
                  SizedBox(height: maxHeight * 0.1),
                  if (questions[index].question_type == "CHECKLIST")
                    CheckboxGroup(
                      labels: questions[index]
                          .answers
                          .map((question) => question.text)
                          .toList(),
                      itemBuilder: (Checkbox cb, Text txt, int i) {
                        return Row(
                          key: ValueKey(questions[index].answers[i]),
                          children: <Widget>[
                            cb,
                            txt,
                          ],
                        );
                      },
                      onSelected: (selected) {
                        selectedAnswers = [];
                        selected.forEach((element) {
                          final id = idMap[element];
                          selectedAnswers.add(id);
                        });
                      },
                    ),
                  if (questions[index].question_type == "RADIO")
                    RadioButtonGroup(
                      labels: questions[index]
                          .answers
                          .map((question) => question.text)
                          .toList(),
                      itemBuilder: (Radio cb, Text txt, int i) {
                        return Row(
                          key: ValueKey(questions[index].answers[i]),
                          children: <Widget>[
                            cb,
                            txt,
                          ],
                        );
                      },
                      onSelected: (selected) {
                        selectedAnswers = [];
                        final id = idMap[selected];
                        selectedAnswers.add(id);
                      },
                    ),
                  SizedBox(height: maxHeight * 0.1),
                  Container(
                    width: double.infinity,
                    child: FlatButton(
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(16),
                      onPressed: () async {
                        if (index == questions.length - 1) {
                          await submitQuiz(
                              selectedAnswers, context, questions, index);
                        }
                        await submitResponse(
                            selectedAnswers, context, questions, index);
                      },
                      color: Theme.of(context).primaryColor,
                      child: const Text("Next"),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Future submitResponse(List<String> selectedAnswers, BuildContext context,
      List<RootQuery$RootQuery$Quiz$Question> questions, int index) async {
    if (selectedAnswers.isEmpty) {
      FlushbarHelper.createError(message: "Please select an answer")
          .show(context);
    } else {
      await context
          .bloc<SubmitResponseCubit>()
          .runQueryWithValues(questions[index].id, quiz.id, selectedAnswers);
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  Future submitQuiz(List<String> selectedAnswers, BuildContext context,
      List<RootQuery$RootQuery$Quiz$Question> questions, int index) async {
    if (selectedAnswers.isEmpty) {
      FlushbarHelper.createError(message: "Please select an answer")
          .show(context);
    } else {
      await context
          .bloc<SubmitResponseCubit>()
          .runQueryWithValues(questions[index].id, quiz.id, selectedAnswers);
      await context.bloc<AddResultCubit>().runQueryWithValues(quiz.id);
      ExtendedNavigator.of(context).popAndPush(Routes.resultPage);
    }
  }
}
