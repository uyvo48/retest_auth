import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retest_auth/bloc/auth_bloc.dart';
import 'package:retest_auth/bloc/auth_event.dart';
import 'package:retest_auth/bloc/auth_state.dart';
import 'package:retest_auth/view/home_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(labelText: "email"),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(labelText: "password"),
          ),
          BlocConsumer<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthLoading) {
                return CircularProgressIndicator();
              }
              return ElevatedButton(
                onPressed: () {
                  context.read<AuthBloc>().add(
                    AuthLogin(emailController.text, passwordController.text),
                  );
                },
                child: Text('Dang nhap'),
              );
            },
            listener: (BuildContext context, AuthState state) {
              if (state is AuthSuccess) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              } else if (state is AuthFailure) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('${state.messes}')));
              }
            },
          ),
        ],
      ),
    );
  }
}
