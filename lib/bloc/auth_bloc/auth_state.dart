import 'package:imtixon_6/data/model/user_model.dart';

abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthLoadedState extends AuthState {
  final UserModel userModel;
  AuthLoadedState({required this.userModel});
}

class AuthErrorState extends AuthState {
  String errorMessage;
  AuthErrorState({required this.errorMessage});
}
