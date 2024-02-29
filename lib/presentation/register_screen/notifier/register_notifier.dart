import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:loginform/presentation/register_screen/models/register_model.dart';
part 'register_state.dart';

final registerNotifier = StateNotifierProvider<RegisterNotifier, RegisterState>(
    (ref) => RegisterNotifier(RegisterState(
        fullNameController: TextEditingController(),
        emailController: TextEditingController(),
        passwordController: TextEditingController(),
        passwordController1: TextEditingController(),
        registerModelObj: RegisterModel())));

/// A notifier that manages the state of a Register according to the event that is dispatched to it.
class RegisterNotifier extends StateNotifier<RegisterState> {
  RegisterNotifier(RegisterState state) : super(state);
}
