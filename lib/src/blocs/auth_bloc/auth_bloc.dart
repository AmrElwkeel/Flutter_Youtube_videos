import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_videos/src/repository/reop_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo _authRepo;
  AuthBloc(this._authRepo) : super(AuthLoading()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      final result = await _authRepo.login(event.email, event.password);
      if (result != "user not found") {
        emit(AuthSuccessful());
      }
      if (result == "user not found") {
        emit(AuthError("Missing password OR  user not found"));
      }
    });
  }
}
