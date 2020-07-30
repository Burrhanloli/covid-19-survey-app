import 'package:auto_route/auto_route_annotations.dart';
import 'package:covid19_survey_app/presentation/answer/answer_page.dart';
import 'package:covid19_survey_app/presentation/home/home_page.dart';
import 'package:covid19_survey_app/presentation/login/login_page.dart';
import 'package:covid19_survey_app/presentation/quiz/quiz_page.dart';
import 'package:covid19_survey_app/presentation/result/result_page.dart';
import 'package:covid19_survey_app/presentation/splash/splash_page.dart';

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: LoginPage),
    MaterialRoute(page: HomePage),
    MaterialRoute(page: QuizPage),
    MaterialRoute(page: AnswerPage),
    MaterialRoute(page: ResultPage),
  ],
)
class $Router {}
