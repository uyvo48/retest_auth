import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retest_auth/bloc/auth_bloc.dart';
import 'package:retest_auth/bloc/auth_state.dart';
import 'package:retest_auth/view/login_screen.dart';

import '../bloc/auth_event.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('data'),
          BlocConsumer<AuthBloc, AuthState>(
            builder: (context, state) {
              return FloatingActionButton(
                onPressed: () {
                  context.read<AuthBloc>().add(AuthLogOut());
                },
                child: Icon(Icons.logout),
              );
            },
            listener: (BuildContext context, Object? state) {
              if (state is LogOutState) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
