import 'package:covid19_survey_app/blocs/graphql/bloc/mutation_cubit.dart';
import 'package:covid19_survey_app/graphql/add_contact_location/add_contact_location_mutation.graphql.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AddContactLocationCubit extends MutationCubit<RootMutation$RootMutation> {
  AddContactLocationCubit({@required GraphQLClient client})
      : super(client: client);
  @override
  RootMutation$RootMutation parseData(Map<String, dynamic> data) {
    return RootMutation$RootMutation.fromJson(data);
  }

  Future<void> runQueryWithValues(String mobile, String location) async {
    final MutationOptions mutationOptions = MutationOptions(
        documentNode: RootMutationMutation().document,
        variables: RootMutationArguments(
                userContactLocationInput: RootMutation$UserContactLocationInput(
                    mobile: mobile, location: location))
            .toJson());
    await runQuery(mutationOptions);
  }
}
