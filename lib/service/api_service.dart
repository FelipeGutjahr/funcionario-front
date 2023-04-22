import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  get(endpoint, {params}) async {
    return await _dio.get(endpoint, queryParameters: params);
  }

  delete(endpoint, int id) async {
    return await _dio.delete(endpoint, queryParameters: {'id': id});
  }

  post(endpoint, json) async {
    return await _dio.post(endpoint, data: json);
  }
}
