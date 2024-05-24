import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:habit_project/translations/locale_keys.g.dart';
import 'package:habit_project/view/app_widgets/app_bar_widget.dart';

class StoriesPage extends StatelessWidget {
  const StoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          AppBarWidget(
            title: LocaleKeys.stories.tr(),
            onTap: () {},
          ),
        ],
      );
  }
}
