// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:equatable/equatable.dart';

import 'package:habit_project/models/plan_model.dart';

class PlanState extends Equatable {
  final bool isExpanded;
  final Emoji? selectedEmoji;
  final List<PlanModel>? plans;

  const PlanState({
    this.isExpanded = false,
    this.selectedEmoji,
    this.plans,
  });

  @override
  List<Object?> get props => [isExpanded, selectedEmoji, plans];


  PlanState copyWith({
    bool? isExpanded,
    Emoji? selectedEmoji,
    List<PlanModel>? plans,
  }) {
    return PlanState(
      isExpanded: isExpanded ?? this.isExpanded,
      selectedEmoji: selectedEmoji ?? this.selectedEmoji,
      plans: plans ?? this.plans,
    );
  }
}
