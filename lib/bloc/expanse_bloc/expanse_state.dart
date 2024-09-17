part of 'expanse_bloc.dart';

abstract class ExpanseState {}

class ExpanseInitialState extends ExpanseState {}

class ExpanseLoadingState extends ExpanseState {}

class ExpanseLoadedState extends ExpanseState {
  final List<ExpanseModel> expanseModel;

  ExpanseLoadedState(this.expanseModel);
}

class ExpanseErrorState extends ExpanseState {
  String errorMessage;
  ExpanseErrorState({required this.errorMessage});
}
