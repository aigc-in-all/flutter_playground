part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationStatusChanged extends AuthenticationEvent {
  final AuthenticationState state;

  const AuthenticationStatusChanged(this.state);

  @override
  List<Object> get props => [state];
}

class AuthenticationLogoutRequested extends AuthenticationEvent {}
