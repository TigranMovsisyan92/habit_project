import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_project/framwork/bloc/home_bloc/home_bloc.dart';
import 'package:habit_project/framwork/bloc/home_bloc/home_event.dart';
import 'package:habit_project/framwork/bloc/home_bloc/home_state.dart';
import 'package:habit_project/models/habit_model.dart';
import 'package:habit_project/translations/locale_keys.g.dart';
import 'package:habit_project/view/app_widgets/app_bar_widget.dart';
import 'package:habit_project/view/app_widgets/floating_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<HomeBloc>();
    _bloc.add(GetAllHabitsEvents());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).padding.top,
                ),
                AppBarWidget(
                  title: LocaleKeys.habits.tr(),
                  onTap: () {},
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: state.habits?.length ?? 0,
                  itemBuilder: (context, index) {
                    final habit = state.habits?[index];
                    return Container(
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.only(bottom: 20),
                      color: Colors.amber,
                      child: Column(
                        children: [
                          Text('Name:  ${habit?.name}'),
                          Text('Motivation:  ${habit?.motivation}'),
                          Text('Comment:  ${habit?.coment}'),
                          Text('Emoji:  ${habit?.emoji}'),
                          SizedBox(
                            height: 25,
                            width: double.maxFinite,
                            child: ListView.builder(
                              itemCount: habit?.components?.length ?? 0,
                              itemBuilder: (context, index) {
                                final component = habit?.components?[index];
                                return Container(
                                  margin: const EdgeInsets.only(bottom: 15),
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: component?.clicks == 2 ? Colors.green : Colors.red,
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              ElevatedButton(onPressed: (){}, child: const Text('Edit'),),
                              ElevatedButton(onPressed: (){
                                _bloc.add(DeleteHabitEvent(id: habit!.id!));
                                _bloc.add(GetAllHabitsEvents());
                              }, child: const Text('Delete'),),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                )),
              ],
            ),
            FloatingButton(onTap: () {
              HabitModel habit = HabitModel(
                name: 'Exercise',
                motivation: 'Stay healthy',
                type: 'Daily',
                coment: 'Morning workout',
                startDate: DateTime.now(),
                emoji: '🏃‍♂️',
                emojiName: 'running',
                notifications: ['08:00', '18:00'],
                components: [
                  HabitComponents(clicks: 1, date: '2024-06-13'),
                  HabitComponents(clicks: 2, date: '2024-06-14'),
                  HabitComponents(clicks: 1, date: '2024-06-14'),
                  HabitComponents(clicks: 2, date: '2024-06-14'),
                  HabitComponents(clicks: 1, date: '2024-06-14'),
                  HabitComponents(clicks: 2, date: '2024-06-14'),
                  HabitComponents(clicks: 1, date: '2024-06-14'),
                  HabitComponents(clicks: 2, date: '2024-06-14'),
                ],
              );
              _bloc.add(AddNewHabitEvent(habit: habit));
              _bloc.add(GetAllHabitsEvents());
            }),
          ],
        );
      },
    );
  }
}
