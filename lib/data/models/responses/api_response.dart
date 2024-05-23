class ApiResponse<T> {
  bool success = true;
  String message = '';
  int? count;
  dynamic next;
  dynamic previous;
  int? statusCode;
  T? data;

  ApiResponse({
    this.success = true,
    this.message = '',
    this.count,
    this.statusCode,
    this.data,
    this.next,
    this.previous,
  });

  ApiResponse.fromJson(Map<String, dynamic> json) {
    success = json['isSuccess'] ?? true;
    message = json['message'];
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isSuccess'] = success;
    data['message'] = message;
    data['count'] = count;
    data['next'] = next;
    data['previous'] = previous;
    return data;
  }

  ApiResponse copyWith({
    bool? success,
    String? message,
    int? count,
    dynamic next,
    dynamic previous,
    int? statusCode,
    T? data,
  }) {
    return ApiResponse(
      success: success ?? this.success,
      message: message ?? this.message,
      count: count ?? this.count,
      next: next ?? this.next,
      previous: previous ?? this.previous,
      statusCode: statusCode ?? this.statusCode,
      data: data ?? this.data,
    );
  }
}
