// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

import 'package:habit_project/models/plan_model.dart';

class PlanEvent {}

class OpenOrCloseEmojiEvent extends PlanEvent {}

class SelectEmojiEvent extends PlanEvent {
  final Emoji emoji;

  SelectEmojiEvent({
    required this.emoji,
  });
}

class LoadPlansEvent extends PlanEvent {}

class AddNewPlanEvent extends PlanEvent {
  final PlanModel plan;

  AddNewPlanEvent({
    required this.plan,
  });
}

class UpdatePlanEvent extends PlanEvent {
  final PlanModel plan;
  
  UpdatePlanEvent({
    required this.plan,
  });
}

class DeletePlanEvent extends PlanEvent {
  final int id;
  
  DeletePlanEvent({
    required this.id,
  });
}
