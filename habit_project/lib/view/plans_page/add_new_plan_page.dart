import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_project/constants/app_colors.dart';
import 'package:habit_project/core/extensions/widget_extensions.dart';
import 'package:habit_project/framwork/bloc/plan_bloc/plan_bloc.dart';
import 'package:habit_project/framwork/bloc/plan_bloc/plan_event.dart';
import 'package:habit_project/framwork/bloc/plan_bloc/plan_state.dart';
import 'package:habit_project/models/plan_model.dart';
import 'package:habit_project/translations/locale_keys.g.dart';
import 'package:habit_project/view/app_widgets/app_bar_widget.dart';
import 'package:habit_project/view/app_widgets/app_button.dart';
import 'package:habit_project/view/app_widgets/text_field_widget.dart';
import 'package:habit_project/view/plans_page/components/emoji_picker_widget.dart';

class AddNewPlanPage extends StatefulWidget {
  const AddNewPlanPage({super.key});

  @override
  State<AddNewPlanPage> createState() => _AddNewPlanPageState();
}

class _AddNewPlanPageState extends State<AddNewPlanPage> {
  final TextEditingController _controller = TextEditingController();
  late PlanBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<PlanBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PlanBloc, PlanState>(
        bloc: _bloc,
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top,
              ),
              AppBarWidget(
                title: LocaleKeys.newPlan.tr(),
                showLeading: true,
                onTap: () {
                  context.pop();
                },
              ),
              TextFieldWidget(
                controller: _controller,
                showSuffix: true,
                hintText: 'Plan',
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.text,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(15),
                ],
              ).paddingLTRB(20, 25, 20, 0),
              EmojiPickerWidget(
                isExpanded: state.isExpanded,
                emoji: state.selectedEmoji,
                onPressed: (_) {
                  _bloc.add(OpenOrCloseEmojiEvent());
                },
                onEmojiSelected: (_, emoji) {
                  _bloc.add(SelectEmojiEvent(emoji: emoji));
                },
              ),
              const Spacer(),
              AppButton(
                onTap: () {
                  _bloc.add(AddNewPlanEvent(plan: PlanModel(
                    name: _controller.text,
                    emoji: state.selectedEmoji?.emoji,
                  )));
                  _bloc.add(LoadPlansEvent());
                  context.pop();
                },
                title: LocaleKeys.createPlan.tr(),
                color: AppColors.appColor,
                titleColor: Colors.white,
              ).paddingLTRB(20, 0, 20, 30),
            ],
          );
        },
      ),
    );
  }
}
