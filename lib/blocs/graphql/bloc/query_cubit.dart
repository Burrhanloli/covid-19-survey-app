import 'package:bloc/bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:meta/meta.dart';
import 'package:graphql/internal.dart';
import 'package:covid19_survey_app/blocs/graphql/bloc/graphql_state.dart';

abstract class QueryCubit<T> extends Cubit<GraphqlState<T>> {
  GraphQLClient client;
  ObservableQuery result;
  WatchQueryOptions options;
  QueryCubit({@required this.client, @required this.options})
      : assert(client != null),
        assert(options != null),
        super(GraphqlInitial<T>()) {
    result = client.watchQuery(options);

    result.stream.listen((QueryResult result) {
      if (state is GraphqlRefetch && result.source == QueryResultSource.Cache) {
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
    });
  }

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

  Future<void> runQuery() async {
    result.fetchResults();
  }

  Future<void> refetch() async => result.refetch();

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
