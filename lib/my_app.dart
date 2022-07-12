import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_videos/src/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter_videos/src/repository/reop_auth.dart';
import 'package:flutter_videos/src/views/login.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthBloc(AuthRepo())),
        ],
        child: const MaterialApp(
          home: Login(),
          debugShowCheckedModeBanner: false,
        ));
  }
}
