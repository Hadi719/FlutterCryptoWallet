import 'package:flutter/gestures.dart' show TapGestureRecognizer;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'
    show BlocBuilder, BlocListener, BlocSelector, ReadContext;
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:formz/formz.dart';

import '../cubit/auth_cubit.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        // if (state.status.isFailure) {
        //   HelperScaffoldSnackBar(context).show(
        //     state.errorMessage ?? 'Authentication Failure',
        //   );
        // }
      },
      child: const Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                /// Todo: Add Logo.
                FlutterLogo(size: 120),
                SizedBox(height: 16),
                _GoogleLoginButton(),
                SizedBox(height: 16),
                _EmailInput(),
                SizedBox(height: 8),
                _PasswordInput(),
                SizedBox(height: 8),
                _LoginOrRegisterButton(),
                SizedBox(height: 4),
                _LoginOrRegisterMode(),
              ],
            ),
          ),
          _ErrorMessageBanner(),
        ],
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextFormField(
          key: const Key('authForm_emailInput_textFormField'),
          onChanged: (email) => context.read<AuthCubit>().emailChanged(email),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'email',
            helperText: '',
            errorText:
                state.email.displayError != null ? 'invalid email' : null,
            border: const OutlineInputBorder(),
          ),
        );
      },
    );
  }
}

class _ErrorMessageBanner extends StatelessWidget {
  const _ErrorMessageBanner();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Visibility(
          visible: state.status == FormzSubmissionStatus.failure,
          child: MaterialBanner(
            backgroundColor: Theme.of(context).colorScheme.error,
            content:
                SelectableText(state.errorMessage ?? 'Not sure what happened'),
            actions: [
              TextButton(
                onPressed: () {
                  context.read<AuthCubit>().deleteError();
                },
                child: const Text(
                  'dismiss',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
            contentTextStyle: const TextStyle(color: Colors.white),
            padding: const EdgeInsets.all(10),
          ),
        );
      },
    );
  }
}

class _GoogleLoginButton extends StatelessWidget {
  const _GoogleLoginButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: state.status.isInProgress
              ? Container(
                  color: Colors.grey[200],
                  height: 50,
                  width: double.infinity,
                )
              : SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: SignInButton(
                    Buttons.Google,
                    onPressed: () => context.read<AuthCubit>().authWithGoogle(),
                  ),
                ),
        );
      },
    );
  }
}

class _LoginOrRegisterButton extends StatelessWidget {
  const _LoginOrRegisterButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return ElevatedButton(
          key: const Key('authForm_continue_elevatedButton'),
          onPressed: state.status.isInProgress
              ? null
              : state.isValid
                  ? () => context.read<AuthCubit>().authWithCredentials()
                  : null,
          child: state.status.isInProgress
              ? const CircularProgressIndicator.adaptive()
              : state.mode == AuthMode.login
                  ? const Text('Login')
                  : const Text('Register'),
        );
      },
    );
  }
}

class _LoginOrRegisterMode extends StatelessWidget {
  const _LoginOrRegisterMode();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AuthCubit, AuthState, AuthMode>(
        selector: (state) => state.mode,
        builder: (context, state) {
          return RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyLarge,
              children: [
                TextSpan(
                  text: state == AuthMode.login
                      ? "Don't have an account? "
                      : 'You have an account? ',
                ),
                TextSpan(
                  text: state == AuthMode.login
                      ? 'Register now'
                      : 'Click to login',
                  style: const TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      context.read<AuthCubit>().authModeChanged(
                            state == AuthMode.login
                                ? AuthMode.register
                                : AuthMode.login,
                          );
                    },
                ),
              ],
            ),
          );
        });
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextFormField(
          key: const Key('authForm_passwordInput_textFormField'),
          onChanged: (password) =>
              context.read<AuthCubit>().passwordChanged(password),
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'password',
            helperText: '',
            errorText:
                state.password.displayError != null ? 'invalid password' : null,
            border: const OutlineInputBorder(),
          ),
        );
      },
    );
  }
}
