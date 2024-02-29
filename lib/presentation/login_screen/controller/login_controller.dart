import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:either_dart/either.dart';
import 'package:loginform/presentation/login_screen/repository/auth_repo.dart';
import 'package:loginform/presentation/login_screen/repository/user_repo.dart';

import '../models/error_data.dart';
import '../models/user_request.dart';

class LoginController extends StateNotifier<AsyncValue<dynamic>> {
  LoginController({required this.ref}) : super(AsyncValue.loading());

  Ref ref;

  Future<Either<String, bool>> login(
      {required String email, required String password}) async {
    state = const AsyncValue.loading();

    UserRequest userRequest = UserRequest(email: email, password: password);
    final response = await ref.read(userRepoProvider).login(userRequest);
    if (response is ErrorResponse) {
      return Left(response.message);
    }
    else {
      ref.read(setAuthStateProvider.notifier).state = response;
      ref.read(setIsAuthenticatedProvider(true));
      ref.read(setAuthenticatedUserProvider(response));

      return const Right(true);
    }
  }
}

final userControllerProvider = StateNotifierProvider<LoginController, AsyncValue<dynamic>>((ref) {
  return LoginController(ref: ref);
});
