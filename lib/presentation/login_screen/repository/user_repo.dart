import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loginform/presentation/login_screen/api/endpoint.dart';
import 'package:loginform/presentation/login_screen/models/error_data.dart';

import '../models/user_data.dart';
import '../models/user_request.dart';
import 'package:http/http.dart';

abstract class UserRepo {
  Future<dynamic> login(UserRequest req);
}

class UserRepoImpl implements UserRepo {
  late Dio _dio;

  UserRepoImpl() {
    _dio = Dio(
        BaseOptions(
          baseUrl: Endpoint.baseURL,
          responseType: ResponseType.json,
        )
    );
  }

  @override
  Future<dynamic> login(UserRequest req) async {
    try {
      final response = await _dio.get(
        Endpoint.loginURL
      );

      final authModel = AuthModel.fromJson(response.data);
      final users = authModel.data;

      // check if user is not found
      for(var user in users) {
        if (user.attributes.email == req.email && user.attributes.password == req.password) {
          return user;
        }
      }

      return ErrorResponse(message: 'User not found');
    }
    on DioError catch (e) {
      return ErrorResponse(message: e.response?.data);
    }
  }
}

final userRepoProvider = Provider<UserRepoImpl>((ref) {
  return UserRepoImpl();
});
