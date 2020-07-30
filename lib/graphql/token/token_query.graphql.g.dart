// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_query.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RootQuery$RootQuery$AuthData _$RootQuery$RootQuery$AuthDataFromJson(
    Map<String, dynamic> json) {
  return RootQuery$RootQuery$AuthData()
    ..userId = json['userId'] as String
    ..token = json['token'] as String
    ..tokenExpiration = json['tokenExpiration'] as String;
}

Map<String, dynamic> _$RootQuery$RootQuery$AuthDataToJson(
        RootQuery$RootQuery$AuthData instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'token': instance.token,
      'tokenExpiration': instance.tokenExpiration,
    };

RootQuery$RootQuery _$RootQuery$RootQueryFromJson(Map<String, dynamic> json) {
  return RootQuery$RootQuery()
    ..getToken = json['getToken'] == null
        ? null
        : RootQuery$RootQuery$AuthData.fromJson(
            json['getToken'] as Map<String, dynamic>);
}

Map<String, dynamic> _$RootQuery$RootQueryToJson(
        RootQuery$RootQuery instance) =>
    <String, dynamic>{
      'getToken': instance.getToken?.toJson(),
    };

RootQueryArguments _$RootQueryArgumentsFromJson(Map<String, dynamic> json) {
  return RootQueryArguments(
    mobile: json['mobile'] as String,
  );
}

Map<String, dynamic> _$RootQueryArgumentsToJson(RootQueryArguments instance) =>
    <String, dynamic>{
      'mobile': instance.mobile,
    };
