// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_results_query.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RootQuery$RootQuery$Result _$RootQuery$RootQuery$ResultFromJson(
    Map<String, dynamic> json) {
  return RootQuery$RootQuery$Result()
    ..id = json['id'] as String
    ..is_high_risk = json['is_high_risk'] as bool
    ..date = json['date'] as String;
}

Map<String, dynamic> _$RootQuery$RootQuery$ResultToJson(
        RootQuery$RootQuery$Result instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_high_risk': instance.is_high_risk,
      'date': instance.date,
    };

RootQuery$RootQuery _$RootQuery$RootQueryFromJson(Map<String, dynamic> json) {
  return RootQuery$RootQuery()
    ..getResultsForUser = (json['getResultsForUser'] as List)
        ?.map((e) => e == null
            ? null
            : RootQuery$RootQuery$Result.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$RootQuery$RootQueryToJson(
        RootQuery$RootQuery instance) =>
    <String, dynamic>{
      'getResultsForUser':
          instance.getResultsForUser?.map((e) => e?.toJson())?.toList(),
    };
