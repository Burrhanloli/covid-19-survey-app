// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../graphql/get_all_quiz/get_all_quiz_query.dart';
import '../answer/answer_page.dart';
import '../home/home_page.dart';
import '../login/login_page.dart';
import '../quiz/quiz_page.dart';
import '../result/result_page.dart';
import '../splash/splash_page.dart';

class Routes {
  static const String splashPage = '/';
  static const String loginPage = '/login-page';
  static const String homePage = '/home-page';
  static const String quizPage = '/quiz-page';
  static const String answerPage = '/answer-page';
  static const String resultPage = '/result-page';
  static const all = <String>{
    splashPage,
    loginPage,
    homePage,
    quizPage,
    answerPage,
    resultPage,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashPage, page: SplashPage),
    RouteDef(Routes.loginPage, page: LoginPage),
    RouteDef(Routes.homePage, page: HomePage),
    RouteDef(Routes.quizPage, page: QuizPage),
    RouteDef(Routes.answerPage, page: AnswerPage),
    RouteDef(Routes.resultPage, page: ResultPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SplashPage(),
        settings: data,
      );
    },
    LoginPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginPage(),
        settings: data,
      );
    },
    HomePage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomePage(),
        settings: data,
      );
    },
    QuizPage: (data) {
      var args = data.getArgs<QuizPageArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => QuizPage(quiz: args.quiz),
        settings: data,
      );
    },
    AnswerPage: (data) {
      var args = data.getArgs<AnswerPageArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => AnswerPage(quiz: args.quiz),
        settings: data,
      );
    },
    ResultPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ResultPage(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension RouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<dynamic> pushSplashPage() => push<dynamic>(Routes.splashPage);

  Future<dynamic> pushLoginPage() => push<dynamic>(Routes.loginPage);

  Future<dynamic> pushHomePage() => push<dynamic>(Routes.homePage);

  Future<dynamic> pushQuizPage({
    @required RootQuery$RootQuery$Quiz quiz,
  }) =>
      push<dynamic>(
        Routes.quizPage,
        arguments: QuizPageArguments(quiz: quiz),
      );

  Future<dynamic> pushAnswerPage({
    @required RootQuery$RootQuery$Quiz quiz,
  }) =>
      push<dynamic>(
        Routes.answerPage,
        arguments: AnswerPageArguments(quiz: quiz),
      );

  Future<dynamic> pushResultPage() => push<dynamic>(Routes.resultPage);
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// QuizPage arguments holder class
class QuizPageArguments {
  final RootQuery$RootQuery$Quiz quiz;
  QuizPageArguments({@required this.quiz});
}

/// AnswerPage arguments holder class
class AnswerPageArguments {
  final RootQuery$RootQuery$Quiz quiz;
  AnswerPageArguments({@required this.quiz});
}
