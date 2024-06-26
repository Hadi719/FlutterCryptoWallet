import 'dart:async' show Future, StreamSubscription, unawaited;

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart' show Bloc, Emitter;
import 'package:equatable/equatable.dart';

import '../../../service_locator.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  late final StreamSubscription<User> _userSubscription;

  AppBloc()
      : super(
          serviceLocator<AuthenticationRepository>().currentUser.isNotEmpty
              ? AppState.authenticated(
                  serviceLocator<AuthenticationRepository>().currentUser)
              : const AppState.unauthenticated(),
        ) {
    on<_AppUserChanged>(_onUserChanged);
    on<AppLogoutRequested>(_onLogoutRequested);
    _userSubscription = serviceLocator<AuthenticationRepository>().user.listen(
          (user) => add(_AppUserChanged(user)),
        );
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }

  void _onLogoutRequested(AppLogoutRequested event, Emitter<AppState> emit) {
    unawaited(serviceLocator<AuthenticationRepository>().logOut());
  }

  void _onUserChanged(_AppUserChanged event, Emitter<AppState> emit) {
    emit(
      event.user.isNotEmpty
          ? AppState.authenticated(event.user)
          : const AppState.unauthenticated(),
    );
  }
}
