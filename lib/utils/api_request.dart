import 'dart:io';

import 'package:dio/dio.dart';

class ApiRequest {
  final Dio _dio = Dio();

  Future postRequest({
    required String requestUrl,
    String? token = "",
    required Object? requestBody,
  }) async {
    final response = await _dio.postUri(
      Uri.parse(requestUrl),
      options: Options(
        headers: customHeader(token: token),
        // sendTimeout: const Duration(minutes: 5),
        // receiveTimeout: const Duration(minutes: 5),
        validateStatus: (status) => true,
      ),
      data: requestBody,
    );
    return response;
  }

  Future putRequest({
    required String requestUrl,
    String? token = "",
    required Object? requestBody,
  }) async {
    final response = await _dio.putUri(
      Uri.parse(requestUrl),
      options: Options(
        headers: customHeader(token: token),
        // sendTimeout: const Duration(minutes: 5),
        // receiveTimeout: const Duration(minutes: 5),
        validateStatus: (status) => true,
      ),
      data: requestBody,
    );
    return response;
  }

  Future patchRequest({
    required String requestUrl,
    String? token = "",
    required Object? requestBody,
  }) async {
    final response = await _dio.patchUri(
      Uri.parse(requestUrl),
      options: Options(
          headers: customHeader(token: token),
          validateStatus: (status) => true),
      data: requestBody,
    );
    return response;
  }

  Future deleteRequest({
    required String requestUrl,
    String? token = "",
    required Object? requestBody,
  }) async {
    final response = await _dio.deleteUri(
      Uri.parse(requestUrl),
      options: Options(
        headers: customHeader(token: token),
        // sendTimeout: const Duration(minutes: 5),
        // receiveTimeout: const Duration(minutes: 5),
        validateStatus: (status) => true,
      ),
      data: requestBody,
    );
    return response;
  }

  Future getRequest({required String requestUrl, String? token = ""}) async {
    final response = await _dio.get(requestUrl,
        options: Options(
          headers: customHeader(token: token),
          validateStatus: (status) => true,
          // sendTimeout: const Duration(minutes: 5),
          // receiveTimeout: const Duration(minutes: 5),
        ));

    return response;
  }

  // Future<Response> postRequestFormData({
  //   required String requestUrl,
  //   String? token = "",
  //   required List<XFile> imageList,
  // }) async {
  //   List<MultipartFile> files = [];

  //   for (var formData in imageList) {
  //     files.add(
  //       await MultipartFile.fromFile(
  //           formData.path), // Replace 'path' with the correct field name
  //     );
  //   }

  //   var formData = FormData.fromMap({'images': files});

  //   final response = await _dio.postUri(
  //     Uri.parse(requestUrl),
  //     options: Options(
  //       headers: {
  //         HttpHeaders.contentTypeHeader: 'multipart/form-data',
  //         if (token != "") HttpHeaders.authorizationHeader: "Bearer $token",
  //       },
  //       validateStatus: (status) => true,
  //     ),
  //     data: formData,
  //   );
  //   return response;
  // }

//   Future<Response> putRequestFormData({
//     required String requestUrl,
//     String? token = "",
//     required List<XFile> imageList,
//   }) async {
//     List<MultipartFile> files = [];

//     for (var formData in imageList) {
//       files.add(
//         await MultipartFile.fromFile(
//             formData.path), // Replace 'path' with the correct field name
//       );
//     }

//     var formData = FormData.fromMap({'image': files});

//     final response = await _dio.putUri(
//       Uri.parse(requestUrl),
//       options: Options(
//         headers: {
//           HttpHeaders.contentTypeHeader: 'multipart/form-data',
//           if (token != "") HttpHeaders.authorizationHeader: "Bearer $token",
//         },
//         validateStatus: (status) => true,
//       ),
//       data: formData,
//     );
//     return response;
//   }
// }
}

Map<String, String> customHeader({String? token}) {
  return {
    "Access-Control-Allow-Origin": "*",
    'Content-Type': 'application/json',
    'Accept': '*/*',
    "Access-Control-Allow-Methods": "POST, GET, OPTIONS",
    "Access-Control-Allow-Headers": "Origin, Content-Type, Accept",
    if (token != "") HttpHeaders.authorizationHeader: 'Bearer $token',
  };
}
