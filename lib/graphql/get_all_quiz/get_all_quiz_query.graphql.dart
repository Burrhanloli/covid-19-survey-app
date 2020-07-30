// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:meta/meta.dart';
import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'get_all_quiz_query.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class RootQuery$RootQuery$Quiz$Question$Answer with EquatableMixin {
  RootQuery$RootQuery$Quiz$Question$Answer();

  factory RootQuery$RootQuery$Quiz$Question$Answer.fromJson(
          Map<String, dynamic> json) =>
      _$RootQuery$RootQuery$Quiz$Question$AnswerFromJson(json);

  String id;

  String text;

  @override
  List<Object> get props => [id, text];
  Map<String, dynamic> toJson() =>
      _$RootQuery$RootQuery$Quiz$Question$AnswerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RootQuery$RootQuery$Quiz$Question with EquatableMixin {
  RootQuery$RootQuery$Quiz$Question();

  factory RootQuery$RootQuery$Quiz$Question.fromJson(
          Map<String, dynamic> json) =>
      _$RootQuery$RootQuery$Quiz$QuestionFromJson(json);

  String id;

  String text;

  String question_type;

  List<RootQuery$RootQuery$Quiz$Question$Answer> answers;

  @override
  List<Object> get props => [id, text, question_type, answers];
  Map<String, dynamic> toJson() =>
      _$RootQuery$RootQuery$Quiz$QuestionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RootQuery$RootQuery$Quiz with EquatableMixin {
  RootQuery$RootQuery$Quiz();

  factory RootQuery$RootQuery$Quiz.fromJson(Map<String, dynamic> json) =>
      _$RootQuery$RootQuery$QuizFromJson(json);

  String id;

  String text;

  List<RootQuery$RootQuery$Quiz$Question> questions;

  @override
  List<Object> get props => [id, text, questions];
  Map<String, dynamic> toJson() => _$RootQuery$RootQuery$QuizToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RootQuery$RootQuery with EquatableMixin {
  RootQuery$RootQuery();

  factory RootQuery$RootQuery.fromJson(Map<String, dynamic> json) =>
      _$RootQuery$RootQueryFromJson(json);

  List<RootQuery$RootQuery$Quiz> getAllQuiz;

  @override
  List<Object> get props => [getAllQuiz];
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
              name: NameNode(value: 'getAllQuiz'),
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
                    name: NameNode(value: 'text'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'questions'),
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
                          name: NameNode(value: 'text'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'question_type'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'answers'),
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
                                name: NameNode(value: 'text'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null)
                          ]))
                    ]))
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
