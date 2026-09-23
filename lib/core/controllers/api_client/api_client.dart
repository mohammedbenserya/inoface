import 'package:http/http.dart' as http;
import '../../usecases/constants.dart';
import '../../error/exceptions.dart';
import '../../usecases/enums.dart';
import 'package:get/get.dart';
import 'dart:convert';



class ApiClient extends GetxService {
  static ApiClient instance = Get.find();

  Map<String, String> _headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };


  void updateHeader(Map<String, String> headers) => _headers = headers;

  Future<http.Response> getData({
    required String url,
    Map<String, String>? headers,
  }) async {
    try {
      return await http.get(
        Uri.parse(url),
        headers: headers ?? _headers,
      );
    } catch(e) {
      logger.e(e);
      throw ServerException(
        state: RequestState.error,
        message: '$e',
      );
    }
  }

  Future<http.Response> putData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
  }) async {
    try {
      return await http.put(
        Uri.parse(url), headers: headers ?? _headers,
        body: data != null ? jsonEncode(data) : null,
      );
    } catch(e) {
      logger.e(e);
      throw ServerException(
        state: RequestState.error,
        message: '$e',
      );
    }
  }

  Future<http.Response> postData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
  }) async {
    try {
      return await http.post(
        Uri.parse(url), headers: headers ?? _headers,
        body: data != null ? jsonEncode(data) : null,
      );
    } catch(e) {
      logger.e(e);
      throw ServerException(
        state: RequestState.error,
        message: '$e',
      );
    }
  }

  Future<http.Response> deleteData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
  }) async {
    try {
      return await http.delete(
        Uri.parse(url),
        headers: headers ?? _headers,
        body: data != null ? jsonEncode(data) : null,
      );
    } catch(e) {
      logger.e(e);
      throw ServerException(
        state: RequestState.error,
        message: '$e',
      );
    }
  }

}