import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/auth_cubit.dart';
import 'auth_form.dart';

class AuthPage extends StatelessWidget {
  static const String screenName = '/Auth';

  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SafeArea(
          child: BlocProvider(
            create: (_) => AuthCubit(),
            child: const AuthForm(),
          ),
        ),
      ),
    );
  }

  static Page<void> page() => const MaterialPage<void>(
        child: AuthPage(),
        name: screenName,
      );
}
