import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class QrTigerCall {
  static Future<ApiCallResponse> call({
    String? qrtigerId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'qr tiger',
      apiUrl: 'https://www.qrtiger.com/data/${qrtigerId}?data',
      callType: ApiCallType.GET,
      headers: {
        'content-type': 'application/json',
        'accept': 'application/json',
        'Authorization': 'Bearer d3beaa10-73ef-11ee-bfe8-1bd9524c38d3',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? unqiueCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.totalUniqueScan''',
      ));
}

class GetListCall {
  static Future<ApiCallResponse> call({
    int? id,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'get list',
      apiUrl:
          'https://pifcxlqwffdrqcwggoqb.supabase.co/rest/v1/lists?id=eq.${id}',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBpZmN4bHF3ZmZkcnFjd2dnb3FiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzMyNjY2NTYsImV4cCI6MTk4ODg0MjY1Nn0.lha9G8j7lPLVGv0IU1sAT4SzrJb0I87LfhhvQV8Tc2Q',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBpZmN4bHF3ZmZkcnFjd2dnb3FiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzMyNjY2NTYsImV4cCI6MTk4ODg0MjY1Nn0.lha9G8j7lPLVGv0IU1sAT4SzrJb0I87LfhhvQV8Tc2Q',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<int>? select(dynamic response) => (getJsonField(
        response,
        r'''$[:].selection''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class GetValidSubsCall {
  static Future<ApiCallResponse> call({
    String? brand = '',
    int? limit,
    int? offset,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'get Valid subs',
      apiUrl:
          'https://pifcxlqwffdrqcwggoqb.supabase.co/rest/v1/validSubs?brand_name=eq.${brand}&limit=${limit}&offset=${offset}&order=id.asc',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBpZmN4bHF3ZmZkcnFjd2dnb3FiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzMyNjY2NTYsImV4cCI6MTk4ODg0MjY1Nn0.lha9G8j7lPLVGv0IU1sAT4SzrJb0I87LfhhvQV8Tc2Q',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBpZmN4bHF3ZmZkcnFjd2dnb3FiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzMyNjY2NTYsImV4cCI6MTk4ODg0MjY1Nn0.lha9G8j7lPLVGv0IU1sAT4SzrJb0I87LfhhvQV8Tc2Q',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? video(dynamic response) => (getJsonField(
        response,
        r'''$[:].media_link''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$[:].submitter_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? ids(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? slug(dynamic response) => (getJsonField(
        response,
        r'''$[:].slugDone''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? tagId(dynamic response) => getJsonField(
        response,
        r'''$[:].tagId''',
        true,
      ) as List?;
  static List? tag(dynamic response) => getJsonField(
        response,
        r'''$[:].tag''',
        true,
      ) as List?;
}

class GetTagCall {
  static Future<ApiCallResponse> call({
    String? brand = '',
    int? limit,
    int? offset,
    int? tagid,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'get tag',
      apiUrl:
          'https://pifcxlqwffdrqcwggoqb.supabase.co/rest/v1/validSubs?brand_name=eq.${brand}&limit=${limit}&offset=${offset}&order=id.asc&tag=eq.${tagid}',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBpZmN4bHF3ZmZkcnFjd2dnb3FiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzMyNjY2NTYsImV4cCI6MTk4ODg0MjY1Nn0.lha9G8j7lPLVGv0IU1sAT4SzrJb0I87LfhhvQV8Tc2Q',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBpZmN4bHF3ZmZkcnFjd2dnb3FiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzMyNjY2NTYsImV4cCI6MTk4ODg0MjY1Nn0.lha9G8j7lPLVGv0IU1sAT4SzrJb0I87LfhhvQV8Tc2Q',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? video(dynamic response) => (getJsonField(
        response,
        r'''$[:].media_link''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$[:].submitter_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? ids(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? slug(dynamic response) => (getJsonField(
        response,
        r'''$[:].slugDone''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetTagzzzCall {
  static Future<ApiCallResponse> call({
    String? brand = '',
    int? limit,
    int? offset,
    int? tagid,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'get tagzzz',
      apiUrl:
          'https://pifcxlqwffdrqcwggoqb.supabase.co/rest/v1/validSubs?brand_name=eq.${brand}&limit=${limit}&offset=${offset}&order=id.asc&tagId=cs.{${tagid}}',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBpZmN4bHF3ZmZkcnFjd2dnb3FiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzMyNjY2NTYsImV4cCI6MTk4ODg0MjY1Nn0.lha9G8j7lPLVGv0IU1sAT4SzrJb0I87LfhhvQV8Tc2Q',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBpZmN4bHF3ZmZkcnFjd2dnb3FiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzMyNjY2NTYsImV4cCI6MTk4ODg0MjY1Nn0.lha9G8j7lPLVGv0IU1sAT4SzrJb0I87LfhhvQV8Tc2Q',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? video(dynamic response) => (getJsonField(
        response,
        r'''$[:].media_link''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$[:].submitter_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? ids(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? slug(dynamic response) => (getJsonField(
        response,
        r'''$[:].slugDone''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? tagId(dynamic response) => getJsonField(
        response,
        r'''$[:].tagId''',
        true,
      ) as List?;
  static List? clubrugby(dynamic response) => getJsonField(
        response,
        r'''$[:].club_rugby''',
        true,
      ) as List?;
  static List? instagram(dynamic response) => getJsonField(
        response,
        r'''$[:].instagram''',
        true,
      ) as List?;
}

class GetToBeDeterminedSubsCall {
  static Future<ApiCallResponse> call({
    String? brand = '',
    int? limit,
    int? offset,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'get to be determined subs',
      apiUrl:
          'https://pifcxlqwffdrqcwggoqb.supabase.co/rest/v1/newSubs?brand_name=eq.${brand}&limit=${limit}&offset=${offset}&order=id.asc',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBpZmN4bHF3ZmZkcnFjd2dnb3FiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzMyNjY2NTYsImV4cCI6MTk4ODg0MjY1Nn0.lha9G8j7lPLVGv0IU1sAT4SzrJb0I87LfhhvQV8Tc2Q',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBpZmN4bHF3ZmZkcnFjd2dnb3FiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzMyNjY2NTYsImV4cCI6MTk4ODg0MjY1Nn0.lha9G8j7lPLVGv0IU1sAT4SzrJb0I87LfhhvQV8Tc2Q',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? video(dynamic response) => (getJsonField(
        response,
        r'''$[:].media_link''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$[:].submitter_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? ids(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? slug(dynamic response) => (getJsonField(
        response,
        r'''$[:].flow_done''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? clubrugby(dynamic response) => getJsonField(
        response,
        r'''$[:].club_rugby''',
        true,
      ) as List?;
  static List? instagram(dynamic response) => getJsonField(
        response,
        r'''$[:].instagram''',
        true,
      ) as List?;
}

class GetRejectedSubsCall {
  static Future<ApiCallResponse> call({
    String? brand = '',
    int? limit,
    int? offset,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'get Rejected Subs',
      apiUrl:
          'https://pifcxlqwffdrqcwggoqb.supabase.co/rest/v1/rejectedSubs?brand_name=eq.${brand}&limit=${limit}&offset=${offset}&order=id.desc',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBpZmN4bHF3ZmZkcnFjd2dnb3FiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzMyNjY2NTYsImV4cCI6MTk4ODg0MjY1Nn0.lha9G8j7lPLVGv0IU1sAT4SzrJb0I87LfhhvQV8Tc2Q',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBpZmN4bHF3ZmZkcnFjd2dnb3FiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzMyNjY2NTYsImV4cCI6MTk4ODg0MjY1Nn0.lha9G8j7lPLVGv0IU1sAT4SzrJb0I87LfhhvQV8Tc2Q',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? video(dynamic response) => (getJsonField(
        response,
        r'''$[:].media_link''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$[:].submitter_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? ids(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class GetUserFileCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'get user file',
      apiUrl:
          'https://pifcxlqwffdrqcwggoqb.supabase.co/rest/v1/users?id=eq.${id}',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBpZmN4bHF3ZmZkcnFjd2dnb3FiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzMyNjY2NTYsImV4cCI6MTk4ODg0MjY1Nn0.lha9G8j7lPLVGv0IU1sAT4SzrJb0I87LfhhvQV8Tc2Q',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBpZmN4bHF3ZmZkcnFjd2dnb3FiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzMyNjY2NTYsImV4cCI6MTk4ODg0MjY1Nn0.lha9G8j7lPLVGv0IU1sAT4SzrJb0I87LfhhvQV8Tc2Q',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$[:].submitter_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? ids(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static bool? upto(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$[:].up_to_date''',
      ));
}

class GetMatchForIdBeforeErasingCall {
  static Future<ApiCallResponse> call({
    int? id,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'get match for id before erasing',
      apiUrl:
          'https://pifcxlqwffdrqcwggoqb.supabase.co/rest/v1/integrations?or=(vid1.eq.${id},vid2.eq.${id},vid3.eq.${id},vid4.eq.${id},vid5.eq.${id})',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBpZmN4bHF3ZmZkcnFjd2dnb3FiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzMyNjY2NTYsImV4cCI6MTk4ODg0MjY1Nn0.lha9G8j7lPLVGv0IU1sAT4SzrJb0I87LfhhvQV8Tc2Q',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBpZmN4bHF3ZmZkcnFjd2dnb3FiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzMyNjY2NTYsImV4cCI6MTk4ODg0MjY1Nn0.lha9G8j7lPLVGv0IU1sAT4SzrJb0I87LfhhvQV8Tc2Q',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<int>? select(dynamic response) => (getJsonField(
        response,
        r'''$[:].selection''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? uuids(dynamic response) => (getJsonField(
        response,
        r'''$[:].uuid''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? names(dynamic response) => (getJsonField(
        response,
        r'''$[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class PostToMuxThroughFastgenCall {
  static Future<ApiCallResponse> call({
    String? link = '',
  }) async {
    final ffApiRequestBody = '''
{
  "link": "${link}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'post to mux through fastgen',
      apiUrl: 'https://tryinit.fastgenapp.com/muxupload',
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

  static String? muxId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.mux''',
      ));
  static dynamic assetId(dynamic response) => getJsonField(
        response,
        r'''$.asset''',
      );
}

class RejectSubCall {
  static Future<ApiCallResponse> call({
    int? id,
  }) async {
    final ffApiRequestBody = '''
{
  "id": ${id}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Reject sub',
      apiUrl: 'https://tryinit.fastgenapp.com/rejectSub',
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
}

class SendNotificaitonOfNewUserCall {
  static Future<ApiCallResponse> call({
    String? companyName = '',
    String? name = '',
    String? surname = '',
    String? email = '',
    String? phone = '',
    String? siteUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "company_name": "${companyName}",
  "name": "${name}",
  "surname": "${surname}",
  "email": "${email}",
  "phone": "${phone}",
  "site_url": "${siteUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Send notificaiton of new user',
      apiUrl: 'https://tryinit.fastgenapp.com/usercreated',
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
}

class MuxGetViewsCall {
  static Future<ApiCallResponse> call({
    String? time = 'timeframe[]=30:days',
    String? assetId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'mux get views',
      apiUrl:
          'https://api.mux.com/data/v1/metrics/views/breakdown?group_by=asset_id&filters=asset_id:${assetId}',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Basic YWViN2Q5MGMtMTcyNi00ZWQzLThjMTItMDQ3MDdhOTU5MzNlOm91TDIxTlJqUnVYU3JqUzZPNzF5SWZYYXh4U2NxNDdaQ25icVBDUVlNVFVxOGNWQVVDUUxJTzV1d1VIRFhsZDhFbUNKelRkam8yaA==',
        'Access-Control-Allow-Origin': '*',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? views(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].views''',
      ));
  static int? watchTime(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].total_watch_time''',
      ));
  static int? playTime(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data[:].total_playing_time''',
      ));
  static String? assetId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].field''',
      ));
}

class MUXDeleteCall {
  static Future<ApiCallResponse> call({
    String? assetId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "asset_id": "${assetId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'MUX Delete',
      apiUrl: 'https://tryinit.fastgenapp.com/muxdel',
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
}

class PlaceIdRequestCall {
  static Future<ApiCallResponse> call({
    String? lat = '40.714224,-73.961452',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'placeIdRequest',
      apiUrl:
          'https://maps.googleapis.com/maps/api/geocode/json?latlng=${lat}&key=AIzaSyAHf1wQ4iSLbWeiadjOWPFEiHODsGZcsTQ',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? placeId(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].place_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class PlaceIdRequestCopyCall {
  static Future<ApiCallResponse> call({
    String? lat = '40.714224,-73.961452',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'placeIdRequest Copy',
      apiUrl:
          'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=${lat}&key=AIzaSyAHf1wQ4iSLbWeiadjOWPFEiHODsGZcsTQ',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.predictions[:].structured_formatting.main_text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? loca(dynamic response) => (getJsonField(
        response,
        r'''$.predictions[:].structured_formatting.secondary_text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? placeId(dynamic response) => (getJsonField(
        response,
        r'''$.predictions[:].place_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetDashboardDataCall {
  static Future<ApiCallResponse> call({
    int? activeId,
    String? levelId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "p_target_client_id": ${activeId},
  "p_column_type": "${escapeStringForJson(levelId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get dashboard Data',
      apiUrl:
          'https://pifcxlqwffdrqcwggoqb.supabase.co/rest/v1/rpc/api_get_client_metrics',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBpZmN4bHF3ZmZkcnFjd2dnb3FiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzMyNjY2NTYsImV4cCI6MTk4ODg0MjY1Nn0.lha9G8j7lPLVGv0IU1sAT4SzrJb0I87LfhhvQV8Tc2Q',
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

  static double? moyfeedbackgeneral(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$[:].moy_feedback_general''',
      ));
  static double? moyfeedback1(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$[:].moy_feedback_1''',
      ));
  static double? moyfeedback2(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$[:].moy_feedback_2''',
      ));
  static double? moyfeedback3(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$[:].moy_feedback_3''',
      ));
  static double? moyfeedback4(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$[:].moy_feedback_4''',
      ));
  static int? countpromoteurs(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].count_promoteurs''',
      ));
  static int? countindifferent(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$[:].count_indifferent''',
      ));
  static int? countdettracteurs(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$[:].count_dettracteurs''',
      ));
  static int? countnps(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].count_nps''',
      ));
  static int? countvideodone(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].count_video_done''',
      ));
  static int? countvideonotdone(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$[:].count_video_not_done''',
      ));
  static int? countreviewdone(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].count_review_done''',
      ));
  static int? countreviewnotdone(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$[:].count_review_not_done''',
      ));
  static int? countfeedbackanswer(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$[:].count_feedback_answer''',
      ));
  static int? countfeedbacknotanswered(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$[:].count_feedback_not_answered''',
      ));
  static double? avgnpsscore(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$[:].avg_nps_score''',
      ));
  static double? repartpromot(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$[:].repart_promot''',
      ));
  static double? repartindif(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$[:].repart_indif''',
      ));
  static double? repartdetrac(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$[:].repart_detrac''',
      ));
  static double? npsscore(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$[:].nps_score''',
      ));
  static int? raisonconnu(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].raison_connu''',
      ));
  static int? totalpromoters(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].total_promoters''',
      ));
  static int? totalindifferent(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$[:].total_indifferent''',
      ));
  static int? totaldetractors(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].total_detractors''',
      ));
  static int? raison1count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].raison1_count''',
      ));
  static int? raison2count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].raison2_count''',
      ));
  static int? raison3count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].raison3_count''',
      ));
  static int? raison4count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].raison4_count''',
      ));
  static int? raison5count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].raison5_count''',
      ));
  static int? promotraison1count(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$[:].promot_raison1_count''',
      ));
  static int? promotraison2count(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$[:].promot_raison2_count''',
      ));
  static int? promotraison3count(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$[:].promot_raison3_count''',
      ));
  static int? promotraison4count(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$[:].promot_raison4_count''',
      ));
  static int? promotraison5count(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$[:].promot_raison5_count''',
      ));
  static int? detracraison1count(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$[:].detrac_raison1_count''',
      ));
  static int? detracraison2count(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$[:].detrac_raison2_count''',
      ));
  static int? detracraison3count(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$[:].detrac_raison3_count''',
      ));
  static int? detracraison4count(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$[:].detrac_raison4_count''',
      ));
  static int? detracraison5count(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$[:].detrac_raison5_count''',
      ));
  static int? passiveraison1count(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$[:].passive_raison1_count''',
      ));
  static int? passiveraison2count(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$[:].passive_raison2_count''',
      ));
  static int? passiveraison3count(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$[:].passive_raison3_count''',
      ));
  static int? passiveraison4count(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$[:].passive_raison4_count''',
      ));
  static int? passiveraison5count(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$[:].passive_raison5_count''',
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
