// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:meta/meta.dart';
import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'add_contact_location_mutation.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class RootMutation$RootMutation$UserContactLocation with EquatableMixin {
  RootMutation$RootMutation$UserContactLocation();

  factory RootMutation$RootMutation$UserContactLocation.fromJson(
          Map<String, dynamic> json) =>
      _$RootMutation$RootMutation$UserContactLocationFromJson(json);

  String id;

  String date;

  @override
  List<Object> get props => [id, date];
  Map<String, dynamic> toJson() =>
      _$RootMutation$RootMutation$UserContactLocationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RootMutation$RootMutation with EquatableMixin {
  RootMutation$RootMutation();

  factory RootMutation$RootMutation.fromJson(Map<String, dynamic> json) =>
      _$RootMutation$RootMutationFromJson(json);

  RootMutation$RootMutation$UserContactLocation addUserContactLocation;

  @override
  List<Object> get props => [addUserContactLocation];
  Map<String, dynamic> toJson() => _$RootMutation$RootMutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RootMutation$UserContactLocationInput with EquatableMixin {
  RootMutation$UserContactLocationInput(
      {@required this.mobile, @required this.location});

  factory RootMutation$UserContactLocationInput.fromJson(
          Map<String, dynamic> json) =>
      _$RootMutation$UserContactLocationInputFromJson(json);

  String mobile;

  String location;

  @override
  List<Object> get props => [mobile, location];
  Map<String, dynamic> toJson() =>
      _$RootMutation$UserContactLocationInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RootMutationArguments extends JsonSerializable with EquatableMixin {
  RootMutationArguments({@required this.userContactLocationInput});

  factory RootMutationArguments.fromJson(Map<String, dynamic> json) =>
      _$RootMutationArgumentsFromJson(json);

  final RootMutation$UserContactLocationInput userContactLocationInput;

  @override
  List<Object> get props => [userContactLocationInput];
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
              variable: VariableNode(
                  name: NameNode(value: 'userContactLocationInput')),
              type: NamedTypeNode(
                  name: NameNode(value: 'UserContactLocationInput'),
                  isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'addUserContactLocation'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'userContactLocationInput'),
                    value: VariableNode(
                        name: NameNode(value: 'userContactLocationInput')))
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
