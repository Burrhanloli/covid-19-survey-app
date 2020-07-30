// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_result_mutation.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RootMutation$RootMutation$Result _$RootMutation$RootMutation$ResultFromJson(
    Map<String, dynamic> json) {
  return RootMutation$RootMutation$Result()
    ..id = json['id'] as String
    ..is_high_risk = json['is_high_risk'] as bool
    ..date = json['date'] as String;
}

Map<String, dynamic> _$RootMutation$RootMutation$ResultToJson(
        RootMutation$RootMutation$Result instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_high_risk': instance.is_high_risk,
      'date': instance.date,
    };

RootMutation$RootMutation _$RootMutation$RootMutationFromJson(
    Map<String, dynamic> json) {
  return RootMutation$RootMutation()
    ..addResult = json['addResult'] == null
        ? null
        : RootMutation$RootMutation$Result.fromJson(
            json['addResult'] as Map<String, dynamic>);
}

Map<String, dynamic> _$RootMutation$RootMutationToJson(
        RootMutation$RootMutation instance) =>
    <String, dynamic>{
      'addResult': instance.addResult?.toJson(),
    };

RootMutationArguments _$RootMutationArgumentsFromJson(
    Map<String, dynamic> json) {
  return RootMutationArguments(
    quizId: json['quizId'] as String,
  );
}

Map<String, dynamic> _$RootMutationArgumentsToJson(
        RootMutationArguments instance) =>
    <String, dynamic>{
      'quizId': instance.quizId,
    };
