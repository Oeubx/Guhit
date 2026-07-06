import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class UploadTagsGenerationCall {
  static Future<ApiCallResponse> call({
    String? apiKey = 'YOUR_GEMINI_API_KEY',
    String? base64value = '',
    String? instructionPrompt =
        'Identify the uploaded image.Reply using ONLY the applicable category label(s) from the options below:CharacterLandscapeStill LifeAbstractAnime Style RealismCartoonFantasySci-fiMinimalistPortraitFull bodyClose upMonochromeYou may return multiple applicable labels if they fit.CRITICAL FORMATTING INSTRUCTION:Your entire response must be a single string containing a JSON array list of strings, exactly like this example:[\"label1\", \"label2\", \"label3\"]Do NOT wrap the response in markdown code blocks (such as ```json).Do NOT include explanations, introduction text, punctuation outside the bracket format, or any extra text.',
  }) async {
    final ffApiRequestBody = '''
{
  "contents": [
    {
      "parts": [
        {
          "text": "${escapeStringForJson(instructionPrompt)}"
        },
        {
          "inlineData": {
            "mimeType": "image/jpeg",
            "data": "${escapeStringForJson(base64value)}"
          }
        }
      ]
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'uploadTagsGeneration',
      apiUrl:
          'https://generativelanguage.googleapis.com/v1/models/gemini-2.5-flash:generateContent?key=${apiKey}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
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

  static String? apiResponse(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.candidates[0].content.parts[0].text''',
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
