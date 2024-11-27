part of 'auth_bloc.dart';
abstract class AuthEvent {}

class InitEvent extends AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  final String email, password;
  AuthLoginEvent({required this.email, required this.password});  
}

class AuthLogoutEvent extends AuthEvent {}