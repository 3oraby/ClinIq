import 'package:dartz/dartz.dart';
import 'package:cliniq/core/errors/exceptions.dart';
import 'package:cliniq/core/models/error_model.dart';

class FakeApi {
  fakeLoading(int? sec) async {
    await Future.delayed(Duration(seconds: sec ?? 2));
  }

  Map<String, dynamic> getFakeResult() {
    return {
      "success": true,
      "message":
          "Registration successful. Please check your email for the verification code.",
      "token": null,
      "refreshToken": null,
    };
  }

  throwServerException({int? statusCode, String? message}) {
    throw ServerException(
      errModel: ErrorModel(
        code: statusCode ?? 500,
        message: message ?? "fake error",
      ),
    );
  }

  throwNormalException() {
    throw Exception("normal exception");
  }

  makeSuccessRequest<T>({int? sec}) async {
    await fakeLoading(sec);
    return Right(getFakeResult() as T);
  }

  makeServerFailureRequest<T>({
    int? sec,
    int? statusCode,
    String? message,
  }) async {
    await fakeLoading(sec);
    throwServerException(statusCode: statusCode, message: message);
  }

  makeNormalFailureRequest<T>({int? sec}) async {
    await fakeLoading(sec);
    throwNormalException();
  }
}
