import 'package:covid19_survey_app/blocs/graphql/bloc/query_cubit.dart';
import 'package:covid19_survey_app/graphql/get_results/get_results_query.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GetResultsCubit extends QueryCubit<RootQuery$RootQuery> {
  GetResultsCubit({@required GraphQLClient client, WatchQueryOptions options})
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
