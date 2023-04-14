import 'package:dio/dio.dart';
import 'package:leavemanagementadmin/Interceptor/diointerceptor.dart';
import 'package:leavemanagementadmin/constant/apiendpoint.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class API {
  final Dio _dio = Dio();

  API() {
    _dio.options.baseUrl = baseUrl;
    _dio.interceptors.add(DioInterceptor());
    _dio.interceptors.add(PrettyDioLogger());
  }

  Dio get sendRequest => _dio;
}
