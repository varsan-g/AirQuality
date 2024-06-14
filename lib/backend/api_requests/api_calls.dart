import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Sensor Group Code

class SensorGroup {
  static String getBaseUrl({
    String? authToken = '',
  }) =>
      'https://co2-backend-production.up.railway.app/api/';
  static Map<String, String> headers = {};
  static GetAllSensorDataCall getAllSensorDataCall = GetAllSensorDataCall();
  static ListAllSensorsCall listAllSensorsCall = ListAllSensorsCall();
  static GetSensorDataFromSpecificRoomNameCall
      getSensorDataFromSpecificRoomNameCall =
      GetSensorDataFromSpecificRoomNameCall();
  static DeleteSensorCall deleteSensorCall = DeleteSensorCall();
  static FilterDataByHoursCall filterDataByHoursCall = FilterDataByHoursCall();
  static FilterDataByDaysCall filterDataByDaysCall = FilterDataByDaysCall();
}

class GetAllSensorDataCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = SensorGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get All Sensor Data',
      apiUrl: '${baseUrl}sensor/data',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '$authToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? sensorObj(dynamic response) => getJsonField(
        response,
        r'''$.sensors''',
        true,
      ) as List?;
  List<String>? serials(dynamic response) => (getJsonField(
        response,
        r'''$.sensors[:].serialNum''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? institutions(dynamic response) => (getJsonField(
        response,
        r'''$.sensors[:].institutionName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? roomNames(dynamic response) => (getJsonField(
        response,
        r'''$.sensors[:].roomName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? creationTimestamps(dynamic response) => (getJsonField(
        response,
        r'''$.sensors[:].timestamp''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? temperatures(dynamic response) => getJsonField(
        response,
        r'''$.sensors[:].temperatures''',
        true,
      ) as List?;
  List? humidities(dynamic response) => getJsonField(
        response,
        r'''$.sensors[:].humidities''',
        true,
      ) as List?;
  List? co2s(dynamic response) => getJsonField(
        response,
        r'''$.sensors[:].co2''',
        true,
      ) as List?;
  List? timestamps(dynamic response) => getJsonField(
        response,
        r'''$.sensors[:].timestamps''',
        true,
      ) as List?;
}

class ListAllSensorsCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = SensorGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'List all Sensors',
      apiUrl: '${baseUrl}sensor',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '$authToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? roomName(dynamic response) => (getJsonField(
        response,
        r'''$[:].roomName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? serialNum(dynamic response) => (getJsonField(
        response,
        r'''$[:].serialNum''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetSensorDataFromSpecificRoomNameCall {
  Future<ApiCallResponse> call({
    String? roomName = '',
    String? authToken = '',
  }) async {
    final baseUrl = SensorGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Sensor Data from specific Room name',
      apiUrl: '${baseUrl}sensor/data/:$roomName',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '$authToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? sensorsObj(dynamic response) => getJsonField(
        response,
        r'''$.sensors''',
        true,
      ) as List?;
  String? serials(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.sensors[:].serialNum''',
      ));
  String? institutionName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.sensors[:].institutionName''',
      ));
  String? roomName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.sensors[:].roomName''',
      ));
  String? creationTimestamp(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.sensors[:].timestamp''',
      ));
  List<String>? temperatures(dynamic response) => (getJsonField(
        response,
        r'''$.sensors[:].temperatures''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? humidities(dynamic response) => (getJsonField(
        response,
        r'''$.sensors[:].humidities''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? timestamps(dynamic response) => (getJsonField(
        response,
        r'''$.sensors[:].timestamps''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? co2s(dynamic response) => (getJsonField(
        response,
        r'''$.sensors[:].co2''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class DeleteSensorCall {
  Future<ApiCallResponse> call({
    String? serialNum = '',
    String? authToken = '',
  }) async {
    final baseUrl = SensorGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Delete sensor',
      apiUrl: '${baseUrl}sensor/$serialNum',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': '$authToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class FilterDataByHoursCall {
  Future<ApiCallResponse> call({
    String? hours = '1',
    String? authToken = '',
  }) async {
    final baseUrl = SensorGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Filter data by hours',
      apiUrl: '${baseUrl}sensor/data/hours/$hours',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '$authToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? temperatures(dynamic response) => (getJsonField(
        response,
        r'''$.sensors[:].temperatures''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? humidities(dynamic response) => (getJsonField(
        response,
        r'''$.sensors[:].humidities''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? co2s(dynamic response) => (getJsonField(
        response,
        r'''$.sensors[:].co2''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? timestamps(dynamic response) => (getJsonField(
        response,
        r'''$.sensors[:].timestamps''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? sensorObj(dynamic response) => getJsonField(
        response,
        r'''$.sensors''',
        true,
      ) as List?;
  String? roomName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.sensors[:].roomName''',
      ));
}

class FilterDataByDaysCall {
  Future<ApiCallResponse> call({
    String? days = '1',
    String? authToken = '',
  }) async {
    final baseUrl = SensorGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Filter data by days',
      apiUrl: '${baseUrl}sensor/data/days/$days',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '$authToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Sensor Group Code

class LoginCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
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

  static String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
  static String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.name''',
      ));
  static String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.email''',
      ));
  static String? institutionName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.user.institutionName''',
      ));
  static String? isAdmin(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.isAdmin''',
      ));
  static dynamic userObj(dynamic response) => getJsonField(
        response,
        r'''$.user''',
      );
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
        'Authorization': '$authToken',
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

class UpdateFCMTokenCall {
  static Future<ApiCallResponse> call({
    String? fcmToken = '',
    String? authToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "fcmToken": "$fcmToken"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update FCM Token',
      apiUrl: 'https://co2-backend-production.up.railway.app/api/fcm',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '$authToken',
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
