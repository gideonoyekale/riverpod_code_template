class ApiFailure implements Exception {
  ApiFailure(
    this.message,
  );

  final String message;

  factory ApiFailure.fromHttpErrorMap(Map<String, dynamic> json) => ApiFailure(
        json["error"]["message"],
      );

  @override
  String toString() => message;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ApiFailure && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
