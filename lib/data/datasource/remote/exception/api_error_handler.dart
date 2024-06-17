import 'package:dio/dio.dart';
import 'package:keswaty/data/models/base/error_response.dart';




class ApiErrorHandler {
  static dynamic getMessage(error) {
    dynamic errorDescription ;

    if (error is Exception) {
      try {
        if (error is DioException) {

          switch (error.type)
          {
            case DioExceptionType.cancel:
              errorDescription = "Request to API server was cancelled";
              break;
            case DioExceptionType.connectionTimeout:
              errorDescription = "Connection timeout with API server";
              break;
            case DioExceptionType.unknown:
              errorDescription =
              "Connection to API server failed due to internet connection";
              break;
            case DioExceptionType.receiveTimeout:
              errorDescription =
              "Receive timeout in connection with API server";
              break;
            case DioExceptionType.badResponse:
              switch (error.response!.statusCode)
              {
                case 404:
                case 500:
                case 503:
                  errorDescription = error.response!.statusMessage;
                  break;
                default:
                  // print("---------  api error 36");
                  //
                  ErrorResponse errorResponse =error.response!.data.toString().isNotEmpty?
                  ErrorResponse.fromJson(error.response!.data):  ErrorResponse(errors: []);
                  if (errorResponse.errors != null && errorResponse.errors!.isNotEmpty) {
                    errorDescription = errorResponse;
                  } else {
                    errorDescription =
                    "Failed to load data - status code: ${error.response!.statusCode}";
                  }
              }
              break;
            case DioExceptionType.sendTimeout:
              errorDescription = "Send timeout with server";
              break;
            case DioExceptionType.badCertificate:
               errorDescription = "badCertificate";
              break;
            case DioExceptionType.connectionError:
               errorDescription = "connectionError";
              break;
          }
        }
        else {
          errorDescription = "Unexpected error occured";
        }
      } on FormatException catch (e) {
        errorDescription = e.toString();
      }
    }
    else {
      errorDescription = "is not a subtype of exception";
    }
    return errorDescription;
  }
}
