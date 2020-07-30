import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

@immutable
abstract class GraphqlState<T> {
  final T data;

  const GraphqlState({@required this.data});
}

class GraphqlInitial<T> extends GraphqlState<T> {}

class GraphqlLoading<T> extends GraphqlState<T> {
  final QueryResult result;

  const GraphqlLoading({
    @required this.result,
  }) : super(data: null);
}

class GraphqlError<T> extends GraphqlState<T> {
  final OperationException error;
  final QueryResult result;

  const GraphqlError({@required this.error, @required this.result})
      : super(data: null);
}

class GraphqlLoaded<T> extends GraphqlState<T> {
  final QueryResult result;

  const GraphqlLoaded({@required T data, @required this.result})
      : super(data: data);
}

class GraphqlRefetch<T> extends GraphqlState<T> {
  final QueryResult result;

  const GraphqlRefetch({@required T data, @required this.result})
      : super(data: data);
}

class GraphqlFetchMore<T> extends GraphqlState<T> {
  final QueryResult result;

  const GraphqlFetchMore({@required T data, @required this.result})
      : super(data: data);
}
