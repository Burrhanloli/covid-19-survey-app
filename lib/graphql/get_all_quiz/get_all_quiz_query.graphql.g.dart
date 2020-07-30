// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_quiz_query.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RootQuery$RootQuery$Quiz$Question$Answer
    _$RootQuery$RootQuery$Quiz$Question$AnswerFromJson(
        Map<String, dynamic> json) {
  return RootQuery$RootQuery$Quiz$Question$Answer()
    ..id = json['id'] as String
    ..text = json['text'] as String;
}

Map<String, dynamic> _$RootQuery$RootQuery$Quiz$Question$AnswerToJson(
        RootQuery$RootQuery$Quiz$Question$Answer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
    };

RootQuery$RootQuery$Quiz$Question _$RootQuery$RootQuery$Quiz$QuestionFromJson(
    Map<String, dynamic> json) {
  return RootQuery$RootQuery$Quiz$Question()
    ..id = json['id'] as String
    ..text = json['text'] as String
    ..question_type = json['question_type'] as String
    ..answers = (json['answers'] as List)
        ?.map((e) => e == null
            ? null
            : RootQuery$RootQuery$Quiz$Question$Answer.fromJson(
                e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$RootQuery$RootQuery$Quiz$QuestionToJson(
        RootQuery$RootQuery$Quiz$Question instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'question_type': instance.question_type,
      'answers': instance.answers?.map((e) => e?.toJson())?.toList(),
    };

RootQuery$RootQuery$Quiz _$RootQuery$RootQuery$QuizFromJson(
    Map<String, dynamic> json) {
  return RootQuery$RootQuery$Quiz()
    ..id = json['id'] as String
    ..text = json['text'] as String
    ..questions = (json['questions'] as List)
        ?.map((e) => e == null
            ? null
            : RootQuery$RootQuery$Quiz$Question.fromJson(
                e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$RootQuery$RootQuery$QuizToJson(
        RootQuery$RootQuery$Quiz instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'questions': instance.questions?.map((e) => e?.toJson())?.toList(),
    };

RootQuery$RootQuery _$RootQuery$RootQueryFromJson(Map<String, dynamic> json) {
  return RootQuery$RootQuery()
    ..getAllQuiz = (json['getAllQuiz'] as List)
        ?.map((e) => e == null
            ? null
            : RootQuery$RootQuery$Quiz.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$RootQuery$RootQueryToJson(
        RootQuery$RootQuery instance) =>
    <String, dynamic>{
      'getAllQuiz': instance.getAllQuiz?.map((e) => e?.toJson())?.toList(),
    };
