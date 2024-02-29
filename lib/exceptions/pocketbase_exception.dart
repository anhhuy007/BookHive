import 'package:equatable/equatable.dart';

class PocketBaseException extends Equatable implements Exception {
  final String message;
  final int code;
  final dynamic data;

  PocketBaseException(
      {required this.message, required this.code, required this.data});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  factory PocketBaseException.fromJson(Map<String, dynamic> json) {
    return PocketBaseException(
      code: json['code'],
      message: json['message'],
      data: json['data']
    );
  }
}