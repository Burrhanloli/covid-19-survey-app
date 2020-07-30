import 'package:covid19_survey_app/blocs/graphql/bloc/query_cubit.dart';
import 'package:covid19_survey_app/graphql/get_all_quiz/get_all_quiz_query.graphql.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GetAllQuizCubit extends QueryCubit<RootQuery$RootQuery> {
  GetAllQuizCubit({@required GraphQLClient client, WatchQueryOptions options})
      : super(
          client: client,
          options: options ??
              WatchQueryOptions(
                documentNode: RootQueryQuery().document,
                variables: null,
              ),
        );
  @override
  RootQuery$RootQuery parseData(Map<String, dynamic> data) {
    return RootQuery$RootQuery.fromJson(data);
  }
}
