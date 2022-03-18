class AppException {
  final String message;
  final String prefix;

  const AppException({
    required this.message,
    required this.prefix,
  });

  @override
  String toString() {
    return "$prefix$message";
  }
}
