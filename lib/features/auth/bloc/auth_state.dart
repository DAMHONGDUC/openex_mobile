part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class UninitAuthState extends AuthState {}

class AuthenticatedState extends AuthState {}

class UnauthenticatedState extends AuthState {}

class AuthError extends AuthState {
  final String? message;
  final Map<String, String>? errors;

  AuthError(this.message, [Map<String, List<String>>? errs])
      : errors = errs?.map(
          (key, value) => MapEntry(key, value.first),
        );
}
