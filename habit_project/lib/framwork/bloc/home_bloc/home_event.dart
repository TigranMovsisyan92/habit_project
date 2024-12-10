import 'package:habit_project/models/habit_model.dart';

class HomeEvent {}

class GetAllHabitsEvents extends HomeEvent {}

class AddNewHabitEvent extends HomeEvent {
  HabitModel habit;

  AddNewHabitEvent({
    required this.habit,
  });
}

class UpdateHabitEvent extends HomeEvent {
  HabitModel habit;

  UpdateHabitEvent({
    required this.habit,
  });
}

class DeleteHabitEvent extends HomeEvent {
  int id;

  DeleteHabitEvent({
    required this.id,
  });
}