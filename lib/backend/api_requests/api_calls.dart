import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class OMDbCall {
  static Future<ApiCallResponse> call({
    String? name = '',
    String? key,
  }) async {
    key ??= FFDevEnvironmentValues().APIKey;

    return ApiManager.instance.makeApiCall(
      callName: 'OMDb',
      apiUrl: 'https://www.omdbapi.com/',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        't': name,
        'apikey': key,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? plotSummary(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.Plot''',
      ));
  static String? movieTitle(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.Title''',
      ));
  static String? moviePoster(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.Poster''',
      ));
  static String? response(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.Response''',
      ));
}

class GemeniAPICall {
  static Future<ApiCallResponse> call({
    String? message = 'No prompt provided',
  }) async {
    final ffApiRequestBody = '''
{
  "prompt": "${escapeStringForJson(message)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'gemeniAPI',
      apiUrl: 'https://myai-sbhzsx45sq-uc.a.run.app',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? response(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response_text''',
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

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
