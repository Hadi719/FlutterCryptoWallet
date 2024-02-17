part of 'app_bloc.dart';

final class AppState extends Equatable {
  final AppStatus status;

  final User user;

  const AppState.authenticated(User user)
      : this._(status: AppStatus.authenticated, user: user);

  const AppState.unauthenticated() : this._(status: AppStatus.unauthenticated);

  const AppState._({
    required this.status,
    this.user = User.empty,
  });

  @override
  List<Object> get props => [status, user];
}

enum AppStatus {
  authenticated,
  unauthenticated,
}
