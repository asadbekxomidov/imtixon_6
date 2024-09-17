part of 'expanse_bloc.dart';

abstract class ExpanseEvent {}

class LoadExpanseEvent extends ExpanseEvent {}

class ExpanseGetEvent extends ExpanseEvent {}

class ExpanseAddEvent extends ExpanseEvent {
  final String category;
  final String comment;
  final String dateTime;
  final String amout;

  ExpanseAddEvent(
      {required this.category, required this.comment, required this.dateTime, required this.amout});
}

class ExpanseUpdateEvent extends ExpanseEvent {
  final ExpanseModel expanseModel;

  ExpanseUpdateEvent(this.expanseModel);
}

class ExpanseDeleteEvent extends ExpanseEvent {
  final int id;

  ExpanseDeleteEvent(this.id);
}
