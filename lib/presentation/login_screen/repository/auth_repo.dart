import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_data.dart';

const IS_AUTHENTICATED_KEY = 'is_authenticated';
const AUTHENTICATED_USER_EMAIL_KEY = 'authenticated_user_email';

final sharedPrefProvider = Provider((_) async {
  return await SharedPreferences.getInstance();
});

final setAuthStateProvider = StateProvider<UserData?>((ref) => null);

final setIsAuthenticatedProvider =
    StateProvider.family<void, bool>((ref, isAuth) async {
  final prefs = await ref.watch(sharedPrefProvider);
  ref.watch(setAuthStateProvider);
  prefs.setBool(IS_AUTHENTICATED_KEY, isAuth);
});

final setAuthenticatedUserProvider =
    StateProvider.family<void, UserData>((ref, userdata) async {
  final prefs = await ref.watch(sharedPrefProvider);
  ref.watch(setAuthStateProvider);
  prefs.setString(
    AUTHENTICATED_USER_EMAIL_KEY,
    json.encode(userdata),
  );
});

final getIsAuthenticatedProvider = FutureProvider<bool>((ref) async {
  final prefs = await ref.watch(sharedPrefProvider);
  ref.watch(setAuthStateProvider);
  return prefs.getBool(IS_AUTHENTICATED_KEY) ?? false;
});

final getAuthenticatedUserProvider = FutureProvider<UserData>((ref) async {
  final prefs = await ref.watch(sharedPrefProvider);
  ref.watch(setAuthStateProvider);
  dynamic user = json.decode(prefs.getString(AUTHENTICATED_USER_EMAIL_KEY) ?? '');
  return UserData.fromJson(user);
});

final resetStorage = StateProvider<dynamic>((ref) async {
  final prefs = await ref.watch(sharedPrefProvider);
  final isCleared = await prefs.clear();
  return isCleared;
});
