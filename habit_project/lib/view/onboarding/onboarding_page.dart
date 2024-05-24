import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_project/constants/app_colors.dart';
import 'package:habit_project/constants/app_images.dart';
import 'package:habit_project/constants/constants.dart';
import 'package:habit_project/core/extensions/context_extensions.dart';
import 'package:habit_project/core/extensions/widget_extensions.dart';
import 'package:habit_project/theme/theme.dart';
import 'package:habit_project/theme/theme_provider.dart';
import 'package:habit_project/translations/locale_keys.g.dart';
import 'package:habit_project/view/app_widgets/app_button.dart';
import 'package:habit_project/view/onboarding/components/onboarding.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller = PageController();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          if (index == 0)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Provider.of<ThemeProvider>(context).themeData == lightMode
                    ? GestureDetector(
                        onTap: () {
                          Provider.of<ThemeProvider>(context, listen: false)
                              .toggleTheme();
                        },
                        child: const Icon(Icons.dark_mode_sharp),
                      )
                    : GestureDetector(
                        onTap: () {
                          Provider.of<ThemeProvider>(context, listen: false)
                              .toggleTheme();
                        },
                        child: const Icon(
                          Icons.light_mode_sharp,
                          color: Colors.yellow,
                        ),
                      ),
                PopupMenuButton(
                  icon: Icon(
                    Icons.language_sharp,
                    color: theme.colorScheme.primary,
                  ),
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        onTap: () {
                          context.setLocale(const Locale('en', 'US'));
                        },
                        child: Row(
                          children: [
                            Image.asset(
                              AppImages.us,
                              height: 30,
                            ),
                            Text(LocaleKeys.english.tr()),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        onTap: () {
                          context.setLocale(const Locale('ru', 'RU'));
                        },
                        child: Row(
                          children: [
                            Image.asset(
                              AppImages.ru,
                              height: 30,
                            ),
                            Text(LocaleKeys.russian.tr()),
                          ],
                        ),
                      ),
                    ];
                  },
                ),
              ],
            ).paddingLTRB(20, 15, 20, 10),
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (value) {
                setState(() {
                  index = value;
                });
              },
              children:
                  List.generate(AppImages.onboardingImages.length, (index) {
                return Onboarding(
                  image: AppImages.onboardingImages[index],
                  title: AppConstants.onboardingScreensTitle[index].tr(),
                  description:
                      AppConstants.onboardingScreensDescription[index].tr(),
                );
              }),
            ),
          ),
          AppButton(
            onTap: () {
              if (index == 5) {
                context.go('/mainPage');
              } else {
                _controller.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.linear,
                );
              }
            },
            color: index == 5 ? null : Colors.transparent,
            titleColor: index == 5 ? Colors.white : null,
            gradientColors: const [
              AppColors.appColor,
              AppColors.appColor2,
            ],
            title:
                index == 5 ? LocaleKeys.getStarted.tr() : LocaleKeys.next.tr(),
            borderColor: index == 5 ? null : theme.colorScheme.primary,
          ).paddingLTRB(20, 0, 20, 14),
          SmoothPageIndicator(
            controller: _controller,
            count: AppImages.onboardingImages.length,
            effect: WormEffect(
              spacing: 20.0,
              dotHeight: 8,
              dotWidth: 8,
              paintStyle: PaintingStyle.fill,
              dotColor: AppColors.secondary,
              activeDotColor: theme.colorScheme.primary,
            ),
          ).paddingOnly(bottom: 20),
        ],
      ),
    );
  }
}
