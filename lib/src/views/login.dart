import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_videos/src/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter_videos/src/views/home.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  AuthBloc? _authBloc;
  final TextEditingController email =
      TextEditingController(text: "eve.holt@reqres.in");
  final TextEditingController password =
      TextEditingController(text: "cityslicka");
  @override
  void initState() {
    super.initState();
    _authBloc = BlocProvider.of<AuthBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 170, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Center(
                child: Text(
              "Login Screen",
              style: TextStyle(
                  fontSize: 50,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            )),
            const SizedBox(height: 40.4),
            CustomTextField(
              controller: email,
              obscure: false,
            ),
            const SizedBox(height: 20.4),
            CustomTextField(
              controller: email,
              obscure: true,
            ),
            const SizedBox(height: 20.4),
            BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthLoading) {
                  const Center(
                      child: CircularProgressIndicator(
                    color: Colors.blue,
                  ));
                } else if (state is AuthSuccessful) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const HomePage();
                  }));
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                    'Welcome',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 30),
                  )));
                } else if (state is AuthError) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                    'Error',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 30),
                  )));
                }
              },
              child: CustomButton(
                onPressed: () {
                  _authBloc!.add(
                      LoginEvent(email: email.text, password: password.text));
                },
                text: "Login",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
