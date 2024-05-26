import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_project/framwork/bloc/plan_bloc/plan_event.dart';
import 'package:habit_project/framwork/bloc/plan_bloc/plan_state.dart';
import 'package:habit_project/framwork/service/tables/plans_table.dart';
// import 'package:habit_project/models/plan_model.dart';

class PlanBloc extends Bloc<PlanEvent, PlanState> {
  PlanBloc() : super(const PlanState()) {
    on<OpenOrCloseEmojiEvent>(_openOrCloseEmoji);
    on<SelectEmojiEvent>(_selectEmoji);
    on<LoadPlansEvent>(_loadPlans);
    on<AddNewPlanEvent>(_addNewPlan);
    on<UpdatePlanEvent>(_updatePlan);
    on<DeletePlanEvent>(_deletePlan);
  }
  final PlansTable _plansTable = PlansTable();
  // List<PlanModel> _plans = [];

  void _openOrCloseEmoji(OpenOrCloseEmojiEvent event, Emitter<PlanState> emit) {
    emit(state.copyWith(isExpanded: !state.isExpanded));
  }

  void _selectEmoji(SelectEmojiEvent event, Emitter<PlanState> emit) {
    emit(state.copyWith(selectedEmoji: event.emoji));
  }

  Future<void> _loadPlans(LoadPlansEvent event, Emitter<PlanState> emit) async {
    await _plansTable.getPlans().then((plans) {
      emit(state.copyWith(plans: plans));
    });
  }

  Future<void> _addNewPlan(AddNewPlanEvent event, Emitter<PlanState> emit) async {
    await _plansTable.insertPlans(event.plan);
  }

  Future<void> _updatePlan(UpdatePlanEvent event, Emitter<PlanState> emit) async {
    await _plansTable.updatePlan(event.plan);
  }

  Future<void> _deletePlan(DeletePlanEvent event, Emitter<PlanState> emit) async {
    await _plansTable.deletePlan(event.id);
  }
}