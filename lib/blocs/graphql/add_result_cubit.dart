import 'package:covid19_survey_app/blocs/graphql/bloc/mutation_cubit.dart';
import 'package:covid19_survey_app/graphql/add_result/add_result_mutation.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AddResultCubit extends MutationCubit<RootMutation$RootMutation> {
  AddResultCubit({@required GraphQLClient client}) : super(client: client);
  @override
  RootMutation$RootMutation parseData(Map<String, dynamic> data) {
    return RootMutation$RootMutation.fromJson(data);
  }

  Future<void> runQueryWithValues(String quizId) async {
    final MutationOptions mutationOptions = MutationOptions(
        documentNode: RootMutationMutation().document,
        variables: RootMutationArguments(quizId: quizId).toJson());
    await runQuery(mutationOptions);
  }
}
