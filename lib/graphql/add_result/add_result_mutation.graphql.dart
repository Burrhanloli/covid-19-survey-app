// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:meta/meta.dart';
import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'add_result_mutation.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class RootMutation$RootMutation$Result with EquatableMixin {
  RootMutation$RootMutation$Result();

  factory RootMutation$RootMutation$Result.fromJson(
          Map<String, dynamic> json) =>
      _$RootMutation$RootMutation$ResultFromJson(json);

  String id;

  bool is_high_risk;

  String date;

  @override
  List<Object> get props => [id, is_high_risk, date];
  Map<String, dynamic> toJson() =>
      _$RootMutation$RootMutation$ResultToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RootMutation$RootMutation with EquatableMixin {
  RootMutation$RootMutation();

  factory RootMutation$RootMutation.fromJson(Map<String, dynamic> json) =>
      _$RootMutation$RootMutationFromJson(json);

  RootMutation$RootMutation$Result addResult;

  @override
  List<Object> get props => [addResult];
  Map<String, dynamic> toJson() => _$RootMutation$RootMutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RootMutationArguments extends JsonSerializable with EquatableMixin {
  RootMutationArguments({@required this.quizId});

  factory RootMutationArguments.fromJson(Map<String, dynamic> json) =>
      _$RootMutationArgumentsFromJson(json);

  final String quizId;

  @override
  List<Object> get props => [quizId];
  Map<String, dynamic> toJson() => _$RootMutationArgumentsToJson(this);
}

class RootMutationMutation
    extends GraphQLQuery<RootMutation$RootMutation, RootMutationArguments> {
  RootMutationMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'RootMutation'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'quizId')),
              type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'addResult'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'quizId'),
                    value: VariableNode(name: NameNode(value: 'quizId')))
              ],
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
  final String operationName = 'RootMutation';

  @override
  final RootMutationArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  RootMutation$RootMutation parse(Map<String, dynamic> json) =>
      RootMutation$RootMutation.fromJson(json);
}
