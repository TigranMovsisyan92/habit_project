// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:habit_project/models/habit_model.dart';

class HomeState extends Equatable {
  final List<HabitModel>? habits;
  final HabitModel? selectedHabit;

  const HomeState({
    this.habits,
    this.selectedHabit,
  });

  @override
  List<Object?> get props => [habits, selectedHabit];


  HomeState copyWith({
    List<HabitModel>? habits,
    HabitModel? selectedHabit,
  }) {
    return HomeState(
      habits: habits ?? this.habits,
      selectedHabit: selectedHabit ?? this.selectedHabit,
    );
  }
}
