// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_response_mutation.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RootMutation$RootMutation$ResponseAnswer
    _$RootMutation$RootMutation$ResponseAnswerFromJson(
        Map<String, dynamic> json) {
  return RootMutation$RootMutation$ResponseAnswer()
    ..id = json['id'] as String
    ..date = json['date'] as String;
}

Map<String, dynamic> _$RootMutation$RootMutation$ResponseAnswerToJson(
        RootMutation$RootMutation$ResponseAnswer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
    };

RootMutation$RootMutation _$RootMutation$RootMutationFromJson(
    Map<String, dynamic> json) {
  return RootMutation$RootMutation()
    ..submitResponse = json['submitResponse'] == null
        ? null
        : RootMutation$RootMutation$ResponseAnswer.fromJson(
            json['submitResponse'] as Map<String, dynamic>);
}

Map<String, dynamic> _$RootMutation$RootMutationToJson(
        RootMutation$RootMutation instance) =>
    <String, dynamic>{
      'submitResponse': instance.submitResponse?.toJson(),
    };

RootMutation$ResponseAnswerInput _$RootMutation$ResponseAnswerInputFromJson(
    Map<String, dynamic> json) {
  return RootMutation$ResponseAnswerInput(
    quizId: json['quizId'] as String,
    question: json['question'] as String,
    selectedAnswers:
        (json['selectedAnswers'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$RootMutation$ResponseAnswerInputToJson(
        RootMutation$ResponseAnswerInput instance) =>
    <String, dynamic>{
      'quizId': instance.quizId,
      'question': instance.question,
      'selectedAnswers': instance.selectedAnswers,
    };

RootMutationArguments _$RootMutationArgumentsFromJson(
    Map<String, dynamic> json) {
  return RootMutationArguments(
    responseAnswerInput: json['responseAnswerInput'] == null
        ? null
        : RootMutation$ResponseAnswerInput.fromJson(
            json['responseAnswerInput'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RootMutationArgumentsToJson(
        RootMutationArguments instance) =>
    <String, dynamic>{
      'responseAnswerInput': instance.responseAnswerInput?.toJson(),
    };
