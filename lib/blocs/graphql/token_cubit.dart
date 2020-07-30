import 'package:covid19_survey_app/blocs/graphql/bloc/graphql_state.dart';
import 'package:covid19_survey_app/graphql/token/token_query.graphql.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc/query_cubit.dart';

class TokenCubit extends QueryCubit<RootQuery$RootQuery> {
  TokenCubit({@required GraphQLClient client, WatchQueryOptions options})
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

  Future<void> runQueryWithValues(String mobile) async {
    final QueryOptions queryOptions = QueryOptions(
      documentNode: RootQueryQuery().document,
      variables: RootQueryArguments(
        mobile: mobile,
      ).toJson(),
    );
    await _runQueryWithOptions(queryOptions);
  }

  Future<void> _runQueryWithOptions(QueryOptions options) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final QueryResult result = await client.query(options);
    if (result.source == QueryResultSource.Cache) {
      return;
    }
    if (result.loading && result.data == null) {
      emit(GraphqlLoading<RootQuery$RootQuery>(result: result));
    }

    if (!result.loading && result.data != null) {
      final RootQuery$RootQuery data =
          parseData(result.data as Map<String, dynamic>);
      await prefs.setString('token', data.getToken.token);
      emit(GraphqlLoaded<RootQuery$RootQuery>(data: data, result: result));
    }

    if (result.hasException) {
      emit(GraphqlError<RootQuery$RootQuery>(
          error: result.exception, result: result));
    }
  }
}
