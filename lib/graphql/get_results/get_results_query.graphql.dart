// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:meta/meta.dart';
import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'get_results_query.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class RootQuery$RootQuery$Result with EquatableMixin {
  RootQuery$RootQuery$Result();

  factory RootQuery$RootQuery$Result.fromJson(Map<String, dynamic> json) =>
      _$RootQuery$RootQuery$ResultFromJson(json);

  String id;

  bool is_high_risk;

  String date;

  @override
  List<Object> get props => [id, is_high_risk, date];
  Map<String, dynamic> toJson() => _$RootQuery$RootQuery$ResultToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RootQuery$RootQuery with EquatableMixin {
  RootQuery$RootQuery();

  factory RootQuery$RootQuery.fromJson(Map<String, dynamic> json) =>
      _$RootQuery$RootQueryFromJson(json);

  List<RootQuery$RootQuery$Result> getResultsForUser;

  @override
  List<Object> get props => [getResultsForUser];
  Map<String, dynamic> toJson() => _$RootQuery$RootQueryToJson(this);
}

class RootQueryQuery
    extends GraphQLQuery<RootQuery$RootQuery, JsonSerializable> {
  RootQueryQuery();

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'RootQuery'),
        variableDefinitions: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'getResultsForUser'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'is_high_risk'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'date'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'RootQuery';

  @override
  List<Object> get props => [document, operationName];
  @override
  RootQuery$RootQuery parse(Map<String, dynamic> json) =>
      RootQuery$RootQuery.fromJson(json);
}
