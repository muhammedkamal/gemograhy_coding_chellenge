class HttpExceptions implements Exception {
  final String message;
  HttpExceptions({this.message = 'Unknown error occurred. '});
}
