import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:cliniq/core/errors/exceptions.dart';
import 'package:cliniq/core/models/error_model.dart';

void handleDioExceptions(DioException e) {
  final data = e.response?.data;
  log(
    "handle dio exceptions,statusCode: ${e.response?.statusCode} ,data is: ${data.toString()}",
  );
  if (data is Map<String, dynamic>) {
    throw ServerException(errModel: ErrorModel.fromJson(data));
  } else if (data is String) {
    throw ServerException(
      errModel: ErrorModel(message: data, code: e.response?.statusCode ?? 400),
    );
  }

  throw ServerException(
    errModel: ErrorModel(message: e.message ?? "Unknown error", code: 404),
  );
}
