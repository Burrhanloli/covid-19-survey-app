import 'dart:io';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

String get host {
  if (Platform.isAndroid) {
    return '10.0.2.2';
  } else {
    return 'localhost';
  }
}

GraphQLClient getClient() {
  final Link link = HttpLink(uri: 'http://$host:4000/graphql');
  final AuthLink _authLink = AuthLink(
    getToken: () async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String token = prefs.getString('token') ?? "";
      return "Bearer $token";
    },
  );

  final Link _link = _authLink.concat(link);

  return GraphQLClient(
    cache: NormalizedInMemoryCache(
      dataIdFromObject: typenameDataIdFromObject,
    ),
    link: _link,
  );
}

final OptimisticCache cache = OptimisticCache(
  dataIdFromObject: typenameDataIdFromObject,
);

// String uuidFromObject(Object object) {
//   if (object is Map<String, Object>) {
//     final String typeName = object['__typename'] as String;
//     final String id = object['id'].toString();
//     if (typeName != null && id != null) {
//       return <String>[typeName, id].join('/');
//     }
//   }
//   return null;
// }

// final OptimisticCache cache = OptimisticCache(
//   dataIdFromObject: uuidFromObject,
// );
