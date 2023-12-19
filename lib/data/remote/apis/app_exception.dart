class AppException implements Exception {
  final _message;
  final _prefix;
  final _exceptionType;

  AppException([this._message, this._prefix, this._exceptionType]);

  ExceptionType getTypeOfException() => _exceptionType;
  String getErrorMessage() => _message;

  String toString() {
    return "$_prefix$_message";
  }
}

class SomethingWentWrong extends AppException {
  SomethingWentWrong([String? message])
      : super(message, "Error During Communication: ",ExceptionType.SOMETHING_WENT_WRONG);
}

class OperationExceptionApp extends AppException {
  OperationExceptionApp([String? message])
      : super(message, "Error During Communication: ",ExceptionType.OPERATION_EXCEPTION);
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ",ExceptionType.FETCH_DATA_EXCEPTION);
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ",ExceptionType.BAD_REQUEST_EXCEPTION);
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised Request: ",ExceptionType.UNAUTHORISED_EXCEPTION);
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ",ExceptionType.INVALID_INPUT_EXCEPTION);
}

enum ExceptionType { SOMETHING_WENT_WRONG, OPERATION_EXCEPTION, FETCH_DATA_EXCEPTION, BAD_REQUEST_EXCEPTION, UNAUTHORISED_EXCEPTION, INVALID_INPUT_EXCEPTION }
