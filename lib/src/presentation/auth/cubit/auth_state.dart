part of 'auth_cubit.dart';

enum AuthMode { login, register }

final class AuthState extends Equatable {
  final Email email;

  final Password password;
  final AuthMode mode;
  final FormzSubmissionStatus status;
  final bool isValid;
  final String? errorMessage;

  const AuthState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.mode = AuthMode.login,
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.errorMessage,
  });

  @override
  List<Object?> get props =>
      [email, password, mode, status, isValid, errorMessage];

  AuthState copyWith({
    Email? email,
    Password? password,
    AuthMode? mode,
    FormzSubmissionStatus? status,
    bool? isValid,
    String? errorMessage,
  }) {
    return AuthState(
      email: email ?? this.email,
      password: password ?? this.password,
      mode: mode ?? this.mode,
      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
