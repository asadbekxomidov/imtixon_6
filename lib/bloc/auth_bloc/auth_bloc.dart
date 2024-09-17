import 'package:imtixon_6/bloc/auth_bloc/auth_event.dart';
import 'package:imtixon_6/bloc/auth_bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    on<AuthEvent>(_onRegister as EventHandler<AuthEvent, AuthState>);
    on<AuthEvent>(_onLogin as EventHandler<AuthEvent, AuthState>);
  }

  Future<void> _onRegister(AuthRegisterEvent event, Emitter emit) async {
    try {
      emit(AuthLoadingState());
      add(event);
    } catch (e) {
      emit(AuthErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> _onLogin(AuthLoginEvent event, Emitter emit) async {
    try {
      emit(AuthLoadingState());
    } catch (e) {
      emit(AuthErrorState(errorMessage: e.toString()));
    }
  }
}
