import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:openex_mobile/data/models/user_model.dart';
import 'package:openex_mobile/data/repository/auth_repository.dart';
import 'package:openex_mobile/utils/log/log.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc(AuthState initialState, this._authRepository) : super(initialState) {
    on<AuthStartedEvent>(_onAuthStart);
    on<LoggedInEvent>(_onLoggedIn);
    on<LoggedOutEvent>(_onLoggedOut);
  }

  _onAuthStart(AuthStartedEvent event, Emitter<AuthState> emit) async {
    Log.d("Auth Bloc AuthStartedEvent");

    // get token form local storage => check => emit Auth ot UnAuth

    emit(UnauthenticatedState());
  }

  _onLoggedIn(LoggedInEvent event, Emitter<AuthState> emit) async {
    Log.d("Auth Bloc LoggedInEvent: ${event.user.id}");

    // get the token form event => emit Auth ot UnAuth
  }

  _onLoggedOut(LoggedOutEvent event, Emitter<AuthState> emit) async {
    Log.d("Auth Bloc LoggedOutEvent");

    // clear token => email UnAuth
  }
}
