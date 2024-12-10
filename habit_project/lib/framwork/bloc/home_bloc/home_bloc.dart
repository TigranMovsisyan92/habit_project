import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_project/framwork/bloc/home_bloc/home_event.dart';
import 'package:habit_project/framwork/bloc/home_bloc/home_state.dart';
import 'package:habit_project/framwork/service/tables/habits_table.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<GetAllHabitsEvents>(_loadHabits);
    on<AddNewHabitEvent>(_addNewHabit);
    on<UpdateHabitEvent>(_updateHabit);
    on<DeleteHabitEvent>(_deleteHabit);
  }
  final HabitsTable _habitsTable = HabitsTable();

  Future<void> _loadHabits(GetAllHabitsEvents event, Emitter<HomeState> emit) async {
    await _habitsTable.getHabits().then((value) {
      emit(state.copyWith(habits: value));
    });
  }

  Future<void> _addNewHabit(AddNewHabitEvent event, Emitter<HomeState> emit) async {
    await _habitsTable.insertHabit(event.habit);
  }

  Future<void> _updateHabit(UpdateHabitEvent event, Emitter<HomeState> emit) async {
    await _habitsTable.updateHabit(event.habit);
  }

  Future<void> _deleteHabit(DeleteHabitEvent event, Emitter<HomeState> emit) async {
    await _habitsTable.deleteHabit(event.id);
  }
}