class ErrorResponse {
  ErrorResponse({
    this.data,
    required this.message,
  });

  dynamic data;
  String message;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      data: json['data'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data,
        'message': message,
      };
}

class Error {
  Error(
      {required this.status,
      required this.name,
      required this.message,
      required this.detail});

  int status;
  String name;
  String message;
  Detail detail;

  factory Error.fromJson(Map<String, dynamic> json) {
    return Error(
        status: json['status'],
        name: json['name'],
        message: json['message'],
        detail: Detail.fromJson(json['detail']));
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'name': name,
        'message': message,
        'detail': detail.toJson()
      };
}

class Detail {
  Detail();

  factory Detail.fromJson(Map<String, dynamic> json) {
    return Detail();
  }

  Map<String, dynamic> toJson() => {};
}
