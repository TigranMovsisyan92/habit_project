import 'package:flutter/material.dart';
import 'package:habit_project/constants/app_colors.dart';
import 'package:habit_project/core/extensions/context_extensions.dart';
import 'package:habit_project/view/home_page/home_page.dart';
import 'package:habit_project/view/plans_page/plans_page.dart';
import 'package:habit_project/view/settings_page/settings_page.dart';
import 'package:habit_project/view/statistic_page/statistic_page.dart';
import 'package:habit_project/view/stoies_page/stories_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PersistentTabController _controller = PersistentTabController(initialIndex: 2);
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        backgroundColor: theme.colorScheme.background,
        items: _navBarsItems(),
        screens: const [
          PlansPage(),
          StatisticPage(),
          HomePage(),
          StoriesPage(),
          SettingsPage(),
        ],
        decoration: const NavBarDecoration(
          colorBehindNavBar: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(22),
            topRight: Radius.circular(22),
          ),
        ),
        navBarStyle: NavBarStyle.style15,
      ),
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        activeColorPrimary: AppColors.appColor,
        inactiveColorPrimary: AppColors.additionalGrey2,
        icon: const Icon(Icons.grid_view_outlined, size: 35,),
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: AppColors.appColor,
        inactiveColorPrimary: AppColors.additionalGrey2,
        icon: const Icon(Icons.equalizer, size: 35,),
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: AppColors.appColor,
        activeColorSecondary: Colors.white,
        inactiveColorPrimary: AppColors.additionalGrey2,
        inactiveColorSecondary: AppColors.additionalGrey2,
        icon: const Icon(Icons.home_outlined, size: 35,),
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: AppColors.appColor,
        inactiveColorPrimary: AppColors.additionalGrey2,
        icon: const Icon(Icons.menu_book, size: 35,),
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: AppColors.appColor,
        inactiveColorPrimary: AppColors.additionalGrey2,
        icon: const Icon(Icons.settings_suggest_outlined, size: 35,),
      ),
    ];
  }
}
