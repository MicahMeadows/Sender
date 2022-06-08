class ApiException implements Exception {
  final String message;
  final String code;
  final String details;

  ApiException(this.message, this.code, this.details);

  @override
  String toString() {
    return '''ApiException {message: $message, code: $code, details: $details}''';
  }
}

class FetchDataException extends ApiException {
  FetchDataException(String message, String code)
      : super(message, code, "Error while retrieving data");
}

class BadRequestException extends ApiException {
  BadRequestException(String message, String code)
      : super(message, code, "Invalid request");
}

class NotFoundException extends ApiException {
  NotFoundException(String message, String code)
      : super(message, code, "Not Found");
}

class UnauthorizedException extends ApiException {
  UnauthorizedException(String message, String code)
      : super(message, code, "Unauthorized");
}

class InvalidInputException extends ApiException {
  InvalidInputException(String message, String code)
      : super(message, code, "Invalid input");
}
