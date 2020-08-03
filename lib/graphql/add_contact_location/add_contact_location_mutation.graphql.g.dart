// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_contact_location_mutation.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RootMutation$RootMutation$UserContactLocation
    _$RootMutation$RootMutation$UserContactLocationFromJson(
        Map<String, dynamic> json) {
  return RootMutation$RootMutation$UserContactLocation()
    ..id = json['id'] as String
    ..date = json['date'] as String;
}

Map<String, dynamic> _$RootMutation$RootMutation$UserContactLocationToJson(
        RootMutation$RootMutation$UserContactLocation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
    };

RootMutation$RootMutation _$RootMutation$RootMutationFromJson(
    Map<String, dynamic> json) {
  return RootMutation$RootMutation()
    ..addUserContactLocation = json['addUserContactLocation'] == null
        ? null
        : RootMutation$RootMutation$UserContactLocation.fromJson(
            json['addUserContactLocation'] as Map<String, dynamic>);
}

Map<String, dynamic> _$RootMutation$RootMutationToJson(
        RootMutation$RootMutation instance) =>
    <String, dynamic>{
      'addUserContactLocation': instance.addUserContactLocation?.toJson(),
    };

RootMutation$UserContactLocationInput
    _$RootMutation$UserContactLocationInputFromJson(Map<String, dynamic> json) {
  return RootMutation$UserContactLocationInput(
    mobile: json['mobile'] as String,
    location: json['location'] as String,
  );
}

Map<String, dynamic> _$RootMutation$UserContactLocationInputToJson(
        RootMutation$UserContactLocationInput instance) =>
    <String, dynamic>{
      'mobile': instance.mobile,
      'location': instance.location,
    };

RootMutationArguments _$RootMutationArgumentsFromJson(
    Map<String, dynamic> json) {
  return RootMutationArguments(
    userContactLocationInput: json['userContactLocationInput'] == null
        ? null
        : RootMutation$UserContactLocationInput.fromJson(
            json['userContactLocationInput'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RootMutationArgumentsToJson(
        RootMutationArguments instance) =>
    <String, dynamic>{
      'userContactLocationInput': instance.userContactLocationInput?.toJson(),
    };
