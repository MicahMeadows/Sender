import 'package:sender/common/app_exception.dart';

class FetchDataException extends AppException {
  FetchDataException(String message)
      : super(message: message, prefix: 'Error During Communication: ');
}

class BadRequestException extends AppException {
  BadRequestException(String message)
      : super(message: message, prefix: 'Invalid request: ');
}

class UnauthorizedException extends AppException {
  UnauthorizedException(String message)
      : super(message: message, prefix: 'Unauthorized: ');
}

class InvalidInputException extends AppException {
  InvalidInputException(String message)
      : super(message: message, prefix: 'Invalid input: ');
}
