// ignore_for_file: constant_identifier_names, non_constant_identifier_names, unreachable_switch_case

import 'package:bookingapp/core/error_handle/api_error_model.dart';
import 'package:dio/dio.dart';

class ErrorHandler implements Exception {
  late ApiErrorModel apiErrorModel;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      apiErrorModel = _handleDioError(error);
    } else if (error is String) {
      apiErrorModel = ApiErrorModel(message: error);
    } else {
      apiErrorModel = getRequestErrorType(ResponseErrorType.DEFAULT);
    }
  }

  ApiErrorModel _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return getRequestErrorType(ResponseErrorType.CONNECT_TIMEOUT);
      case DioExceptionType.sendTimeout:
        return getRequestErrorType(ResponseErrorType.SEND_TIMEOUT);
      case DioExceptionType.receiveTimeout:
        return getRequestErrorType(ResponseErrorType.RECEIVE_TIMEOUT);
      case DioExceptionType.badResponse:
        return error.response != null
            ? ApiErrorModel.fromJson(error.response!.data)
            : getRequestErrorType(ResponseErrorType.BAD_RESPONSE);
      case DioExceptionType.unknown:
        return error.response != null
            ? ApiErrorModel.fromJson(error.response!.data)
            : getRequestErrorType(ResponseErrorType.UNKNOWN);
      case DioExceptionType.cancel:
        return getRequestErrorType(ResponseErrorType.CANCEL);
      case DioExceptionType.connectionError:
        return getRequestErrorType(ResponseErrorType.NO_INTERNET_CONNECTION);
      case DioExceptionType.badCertificate:
        return getRequestErrorType(ResponseErrorType.BAD_CERTIFICATE);
    }
  }

  static ApiErrorModel getRequestErrorType(ResponseErrorType errorTypr) {
    switch (errorTypr) {
      case ResponseErrorType.NO_CONTENT:
        return ApiErrorModel(
          code: ResponseErrorCode.NO_CONTENT,
          message: ResponseErrorMessage.NO_CONTENT,
        );
      case ResponseErrorType.BAD_REQUEST:
        return ApiErrorModel(
          code: ResponseErrorCode.BAD_REQUEST,
          message: ResponseErrorMessage.BAD_REQUEST,
        );
      case ResponseErrorType.FORBIDDEN:
        return ApiErrorModel(
          code: ResponseErrorCode.FORBIDDEN,
          message: ResponseErrorMessage.FORBIDDEN,
        );
      case ResponseErrorType.UNAUTHORISED:
        return ApiErrorModel(
          code: ResponseErrorCode.UNAUTHORISED,
          message: ResponseErrorMessage.UNAUTHORISED,
        );
      case ResponseErrorType.NOT_FOUND:
        return ApiErrorModel(
          code: ResponseErrorCode.NOT_FOUND,
          message: ResponseErrorMessage.NOT_FOUND,
        );
      case ResponseErrorType.INTERNAL_SERVER_ERROR:
        return ApiErrorModel(
          code: ResponseErrorCode.INTERNAL_SERVER_ERROR,
          message: ResponseErrorMessage.INTERNAL_SERVER_ERROR,
        );
      case ResponseErrorType.CONNECT_TIMEOUT:
        return ApiErrorModel(
          code: ResponseErrorCode.CONNECT_TIMEOUT,
          message: ResponseErrorMessage.CONNECT_TIMEOUT,
        );
      case ResponseErrorType.CANCEL:
        return ApiErrorModel(
          code: ResponseErrorCode.CANCEL,
          message: ResponseErrorMessage.CANCEL,
        );
      case ResponseErrorType.RECEIVE_TIMEOUT:
        return ApiErrorModel(
          code: ResponseErrorCode.RECEIVE_TIMEOUT,
          message: ResponseErrorMessage.RECEIVE_TIMEOUT,
        );
      case ResponseErrorType.SEND_TIMEOUT:
        return ApiErrorModel(
          code: ResponseErrorCode.SEND_TIMEOUT,
          message: ResponseErrorMessage.SEND_TIMEOUT,
        );
      case ResponseErrorType.CACHE_ERROR:
        return ApiErrorModel(
          code: ResponseErrorCode.CACHE_ERROR,
          message: ResponseErrorMessage.CACHE_ERROR,
        );
      case ResponseErrorType.NO_INTERNET_CONNECTION:
        return ApiErrorModel(
          code: ResponseErrorCode.NO_INTERNET_CONNECTION,
          message: ResponseErrorMessage.NO_INTERNET_CONNECTION,
        );
      case ResponseErrorType.BAD_RESPONSE:
        return ApiErrorModel(
          code: ResponseErrorCode.BAD_RESPONSE,
          message: ResponseErrorMessage.BAD_RESPONSE,
        );
      case ResponseErrorType.UNKNOWN:
        return ApiErrorModel(
          code: ResponseErrorCode.UNKNOWN,
          message: ResponseErrorMessage.UNKNOWN,
        );
      case ResponseErrorType.BAD_CERTIFICATE:
        return ApiErrorModel(
          code: ResponseErrorCode.BAD_CERTIFICATE,
          message: ResponseErrorMessage.BAD_CERTIFICATE,
        );
      case ResponseErrorType.DEFAULT:
        return ApiErrorModel(
          code: ResponseErrorCode.DEFAULT,
          message: ResponseErrorMessage.DEFAULT,
        );
    }
  }
}

enum ResponseErrorType {
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  BAD_RESPONSE,
  UNKNOWN,
  BAD_CERTIFICATE,
  DEFAULT,
}

class ResponseErrorCode {
  static const int SUCCESS = 200;
  static const int NO_CONTENT = 201;
  static const int BAD_REQUEST = 400;
  static const int UNAUTHORISED = 401;
  static const int FORBIDDEN = 403;
  static const int NOT_FOUND = 404;
  static const int INTERNAL_SERVER_ERROR = 500;
  static const int API_LOGIC_ERROR = 422;

  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECEIVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int BAD_RESPONSE = -7;
  static const int UNKNOWN = -8;
  static const int BAD_CERTIFICATE = -9;
  static const int DEFAULT = -10;
}

class ResponseErrorMessage {
  static const String NO_CONTENT = ApiErrorsMeesageConsts.noContent;
  static const String BAD_REQUEST = ApiErrorsMeesageConsts.badRequestError;
  static const String UNAUTHORISED = ApiErrorsMeesageConsts.unauthorizedError;
  static const String FORBIDDEN = ApiErrorsMeesageConsts.forbiddenError;
  static const String INTERNAL_SERVER_ERROR =
      ApiErrorsMeesageConsts.internalServerError;
  static const String NOT_FOUND = ApiErrorsMeesageConsts.notFoundError;

  static const String CONNECT_TIMEOUT = ApiErrorsMeesageConsts.timeoutError;
  static const String CANCEL = ApiErrorsMeesageConsts.defaultError;
  static const String RECEIVE_TIMEOUT = ApiErrorsMeesageConsts.timeoutError;
  static const String SEND_TIMEOUT = ApiErrorsMeesageConsts.timeoutError;
  static const String CACHE_ERROR = ApiErrorsMeesageConsts.cacheError;
  static const String NO_INTERNET_CONNECTION =
      ApiErrorsMeesageConsts.noInternetError;
  static const String BAD_RESPONSE = ApiErrorsMeesageConsts.badResponse;
  static const String UNKNOWN = ApiErrorsMeesageConsts.unknownError;
  static const String DEFAULT = ApiErrorsMeesageConsts.defaultError;
  static const String BAD_CERTIFICATE = ApiErrorsMeesageConsts.badCertificate;
}

class ApiErrorsMeesageConsts {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String badResponse = "badResponse";
  static const String badCertificate = "badCertificate";
  static const String ok = "Ok";
}
