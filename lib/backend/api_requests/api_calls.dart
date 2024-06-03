import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class LoginCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "$email",
  "password": "$password"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl: 'https://co2-backend-production.up.railway.app/api/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class RegisterCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
    String? name = '',
    String? institution = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "$email",
  "password": "$password",
  "firstname": "$name",
  "institution": "$institution"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Register',
      apiUrl: 'https://co2-backend-production.up.railway.app/api/register',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class RegisterAdminCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
    String? firstName = '',
    String? institution = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "$email",
  "password": "$password",
  "name": "$firstName",
  "institution": "$institution"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Register Admin',
      apiUrl:
          'https://co2-backend-production.up.railway.app/api/register/admin',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class CreateInstitutionCall {
  static Future<ApiCallResponse> call({
    String? name = '',
    String? address = '',
    String? city = '',
    String? postalCode = '',
  }) async {
    final ffApiRequestBody = '''
{
  "name": "$name",
  "address": "$address",
  "city": "$city",
  "postalCode": "$postalCode"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Institution',
      apiUrl: 'https://co2-backend-production.up.railway.app/api/institution',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateSensorCall {
  static Future<ApiCallResponse> call({
    String? serialNum = '',
    String? institutionName = '',
    String? roomName = '',
    String? authToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "serialNum": "$serialNum",
  "institutionName": "$institutionName",
  "roomName": "$roomName"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Sensor',
      apiUrl: 'https://co2-backend-production.up.railway.app/api/sensor',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
