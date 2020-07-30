import 'package:covid19_survey_app/blocs/graphql/bloc/mutation_cubit.dart';
import 'package:covid19_survey_app/graphql/submit_response/submit_response_mutation.graphql.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class SubmitResponseCubit extends MutationCubit<RootMutation$RootMutation> {
  SubmitResponseCubit({@required GraphQLClient client}) : super(client: client);
  @override
  RootMutation$RootMutation parseData(Map<String, dynamic> data) {
    return RootMutation$RootMutation.fromJson(data);
  }

  Future<void> runQueryWithValues(
      String question, String quizId, List<String> answers) async {
    final MutationOptions mutationOptions = MutationOptions(
      documentNode: RootMutationMutation().document,
      variables: RootMutationArguments(
        responseAnswerInput: RootMutation$ResponseAnswerInput(
            question: question, quizId: quizId, selectedAnswers: answers),
      ).toJson(),
    );
    await runQuery(mutationOptions);
  }
}
