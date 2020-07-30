// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:meta/meta.dart';
import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'token_query.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class RootQuery$RootQuery$AuthData with EquatableMixin {
  RootQuery$RootQuery$AuthData();

  factory RootQuery$RootQuery$AuthData.fromJson(Map<String, dynamic> json) =>
      _$RootQuery$RootQuery$AuthDataFromJson(json);

  String userId;

  String token;

  String tokenExpiration;

  @override
  List<Object> get props => [userId, token, tokenExpiration];
  Map<String, dynamic> toJson() => _$RootQuery$RootQuery$AuthDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RootQuery$RootQuery with EquatableMixin {
  RootQuery$RootQuery();

  factory RootQuery$RootQuery.fromJson(Map<String, dynamic> json) =>
      _$RootQuery$RootQueryFromJson(json);

  RootQuery$RootQuery$AuthData getToken;

  @override
  List<Object> get props => [getToken];
  Map<String, dynamic> toJson() => _$RootQuery$RootQueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RootQueryArguments extends JsonSerializable with EquatableMixin {
  RootQueryArguments({@required this.mobile});

  factory RootQueryArguments.fromJson(Map<String, dynamic> json) =>
      _$RootQueryArgumentsFromJson(json);

  final String mobile;

  @override
  List<Object> get props => [mobile];
  Map<String, dynamic> toJson() => _$RootQueryArgumentsToJson(this);
}

class RootQueryQuery
    extends GraphQLQuery<RootQuery$RootQuery, RootQueryArguments> {
  RootQueryQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'RootQuery'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'mobile')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'getToken'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'mobile'),
                    value: VariableNode(name: NameNode(value: 'mobile')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'userId'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'token'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'tokenExpiration'),
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
  final RootQueryArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  RootQuery$RootQuery parse(Map<String, dynamic> json) =>
      RootQuery$RootQuery.fromJson(json);
}
