import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_videos/src/model/user.dart';

import '../../repository/fetch_repo.dart';

part 'fetch_event.dart';
part 'fetch_state.dart';

class FetchBloc extends Bloc<FetchEvent, FetchState> {
  FetchBloc() : super(FetchInitial()) {
    final RepositoryFetchData _repo_fetch = RepositoryFetchData();
    on<FetchEvent>((event, emit) async {
      List<User> users = await _repo_fetch.FetchUsers();
      print("${users}");
      emit(FetchSuccess(users));
    });
  }
}
