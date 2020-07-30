import 'package:covid19_survey_app/blocs/graphql/bloc/graphql_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

abstract class MutationCubit<T> extends Cubit<GraphqlState<T>> {
  GraphQLClient client;
  MutationCubit({@required this.client})
      : assert(client != null),
        super(GraphqlInitial<T>());

  bool get isLoading => state is GraphqlLoading;

  bool get isRefetching => state is GraphqlRefetch;

  T parseData(Map<String, dynamic> data);

  bool get hasData =>
      state is GraphqlLoaded<T> ||
      state is GraphqlFetchMore<T> ||
      state is GraphqlRefetch<T>;

  bool get hasError => state is GraphqlError<T>;

  String get getError => hasError
      ? parseOperationException((state as GraphqlError<T>).error)
      : null;

  Future<void> runQuery(MutationOptions options) async {
    final QueryResult result = await client.mutate(options);
    if (result.source == QueryResultSource.Cache) {
      return;
    }
    if (result.loading && result.data == null) {
      emit(GraphqlLoading<T>(result: result));
    }

    if (!result.loading && result.data != null) {
      emit(GraphqlLoaded<T>(
          data: parseData(result.data as Map<String, dynamic>),
          result: result));
    }

    if (result.hasException) {
      emit(GraphqlError<T>(error: result.exception, result: result));
    }
  }

  String parseOperationException(OperationException error) {
    if (error.clientException != null) {
      final exception = error.clientException;

      if (exception is NetworkException) {
        return 'Failed to connect to ${exception.uri}';
      } else {
        return exception.toString();
      }
    }

    if (error.graphqlErrors != null && error.graphqlErrors.isNotEmpty) {
      final errors = error.graphqlErrors;

      return errors.first.message;
    }

    return 'Unknown error';
  }
}
