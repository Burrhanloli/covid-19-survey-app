// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:meta/meta.dart';
import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'submit_response_mutation.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class RootMutation$RootMutation$ResponseAnswer with EquatableMixin {
  RootMutation$RootMutation$ResponseAnswer();

  factory RootMutation$RootMutation$ResponseAnswer.fromJson(
          Map<String, dynamic> json) =>
      _$RootMutation$RootMutation$ResponseAnswerFromJson(json);

  String id;

  String date;

  @override
  List<Object> get props => [id, date];
  Map<String, dynamic> toJson() =>
      _$RootMutation$RootMutation$ResponseAnswerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RootMutation$RootMutation with EquatableMixin {
  RootMutation$RootMutation();

  factory RootMutation$RootMutation.fromJson(Map<String, dynamic> json) =>
      _$RootMutation$RootMutationFromJson(json);

  RootMutation$RootMutation$ResponseAnswer submitResponse;

  @override
  List<Object> get props => [submitResponse];
  Map<String, dynamic> toJson() => _$RootMutation$RootMutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RootMutation$ResponseAnswerInput with EquatableMixin {
  RootMutation$ResponseAnswerInput(
      {@required this.quizId, @required this.question, this.selectedAnswers});

  factory RootMutation$ResponseAnswerInput.fromJson(
          Map<String, dynamic> json) =>
      _$RootMutation$ResponseAnswerInputFromJson(json);

  String quizId;

  String question;

  List<String> selectedAnswers;

  @override
  List<Object> get props => [quizId, question, selectedAnswers];
  Map<String, dynamic> toJson() =>
      _$RootMutation$ResponseAnswerInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RootMutationArguments extends JsonSerializable with EquatableMixin {
  RootMutationArguments({@required this.responseAnswerInput});

  factory RootMutationArguments.fromJson(Map<String, dynamic> json) =>
      _$RootMutationArgumentsFromJson(json);

  final RootMutation$ResponseAnswerInput responseAnswerInput;

  @override
  List<Object> get props => [responseAnswerInput];
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
              variable:
                  VariableNode(name: NameNode(value: 'responseAnswerInput')),
              type: NamedTypeNode(
                  name: NameNode(value: 'ResponseAnswerInput'),
                  isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'submitResponse'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'responseAnswerInput'),
                    value: VariableNode(
                        name: NameNode(value: 'responseAnswerInput')))
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
