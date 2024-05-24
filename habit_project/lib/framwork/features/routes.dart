// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_project/view/main_page/main_page.dart';
import 'package:habit_project/view/onboarding/onboarding_page.dart';

class AppNavigationRoutes {
  final BuildContext context;

  AppNavigationRoutes({
    required this.context,
  });

  final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const OnboardingPage();
        },
      ),
      GoRoute(
        path: '/mainPage',
        builder: (BuildContext context, GoRouterState state) {
          return const MainPage();
        },
      ),
    ],
  );
}
