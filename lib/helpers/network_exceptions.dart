class NetworkException implements Exception {
  final _message;
  final _prefix;

  NetworkException([this._message, this._prefix]);

  @override
  String toString() {
	return "$_prefix $_message";
  }
}

class FetchDataException extends NetworkException {
  FetchDataException(String message) : super(message, 'Error during communication: ');
}

class BadRequestException extends NetworkException {
  BadRequestException(String message) : super(message, 'Invalid request: ');
}

class UnauthorisedException extends NetworkException {
  UnauthorisedException(String message) : super(message, 'Unauthorised: ');
}

class InvalidInputException extends NetworkException {
  InvalidInputException(String message) : super(message, 'Invalid Input: ');
}

