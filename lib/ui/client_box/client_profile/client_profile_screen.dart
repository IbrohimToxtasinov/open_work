import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_work/bloc/auth/auth_bloc.dart';

import '../../../utils/constants.dart';

class ClientProfileScreen extends StatelessWidget {
  const ClientProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text("Profile Screen"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, workerUpdateProfile);
            },
            child: Text("Update"),
          ),
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state.authStatus == AuthStatus.unauthenticated) {
                SystemNavigator.pop();
              }
            },
            child: ElevatedButton(
              onPressed: () {
                context.read<AuthBloc>().add(LogOut());
              },
              child: Text("LogOut"),
            ),
          )
        ],
      ),
    );
  }
}
