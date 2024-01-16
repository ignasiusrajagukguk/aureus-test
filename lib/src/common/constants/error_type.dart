enum ErrorType {
  unauthorized,
  contentNotFound,
  serviceTimeout,
  serviceNotFound,
  socketException,
  unknownError,
}

extension ErrorTypeMessage on ErrorType {
  String? get message => valueMap[this];

  static const valueMap = {
    ErrorType.unauthorized: "unauthorized user",
    ErrorType.contentNotFound: "Content Not Found",
    ErrorType.serviceTimeout: "Connection Timeout",
    ErrorType.serviceNotFound: "Endpoint Not Found",
    ErrorType.socketException: "Failed host lookup",
    ErrorType.unknownError: "Unknown Error",
  };
}
