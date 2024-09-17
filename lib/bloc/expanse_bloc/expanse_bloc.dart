import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imtixon_6/data/model/expanse.dart';
import 'package:imtixon_6/services/expanse_local_services.dart';

part 'expanse_event.dart';
part 'expanse_state.dart';

class ExpanseBloc extends Bloc<ExpanseEvent, ExpanseState> {
  final ExpanseLocalServices expanseLocalServices;

  ExpanseBloc({required this.expanseLocalServices})
      : super(ExpanseInitialState()) {
    on<LoadExpanseEvent>(
      (event, emit) async {
        emit(ExpanseLoadingState());
        try {
          final expanse = expanseLocalServices.getExpanse();
          emit(ExpanseLoadedState(expanse as List<ExpanseModel>));
        } catch (e) {
          emit(ExpanseErrorState(errorMessage: e.toString()));
        }
      },
    );

    on<ExpanseAddEvent>((event, emit) async {
      await expanseLocalServices.insertExpanse(ExpanseModel(
        category: event.category,
        comment: event.comment,
        dateTime: event.dateTime,
      ));
      add(LoadExpanseEvent());
    });

    on<ExpanseUpdateEvent>((event, emit) async {
      await expanseLocalServices.updateTodo(event.expanseModel);
      add(LoadExpanseEvent());
    });

    on<ExpanseDeleteEvent>((event, emit) async {
      await expanseLocalServices.deleteTodo(event.id);
      add(LoadExpanseEvent());
    });
  }
}
