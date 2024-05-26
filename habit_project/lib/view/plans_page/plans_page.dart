import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_project/framwork/bloc/plan_bloc/plan_bloc.dart';
import 'package:habit_project/framwork/bloc/plan_bloc/plan_event.dart';
import 'package:habit_project/framwork/bloc/plan_bloc/plan_state.dart';
import 'package:habit_project/theme/theme.dart';
import 'package:habit_project/theme/theme_provider.dart';
import 'package:habit_project/translations/locale_keys.g.dart';
import 'package:habit_project/view/app_widgets/app_bar_widget.dart';
import 'package:habit_project/view/app_widgets/floating_button.dart';
import 'package:habit_project/view/plans_page/components/plan_widget.dart';
import 'package:provider/provider.dart';

class PlansPage extends StatefulWidget {
  const PlansPage({super.key});

  @override
  State<PlansPage> createState() => _PlansPageState();
}

class _PlansPageState extends State<PlansPage> {
  late PlanBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<PlanBloc>();
    _bloc.add(LoadPlansEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<PlanBloc, PlanState>(
          bloc: _bloc,
          builder: (context, state) {
            return Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).padding.top,
                ),
                AppBarWidget(
                  title: LocaleKeys.plans.tr(),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.plans?.length ?? 0,
                    itemBuilder: (context, index) {
                      final plan = state.plans?[index];
                      return PlanWidget(
                        plan: plan,
                        color: Provider.of<ThemeProvider>(context).themeData == lightMode ? Colors.white : Colors.grey.shade400,
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
        FloatingButton(onTap: () {
          context.pushNamed('/addNewPlan');
        }),
      ],
    );
  }
}
