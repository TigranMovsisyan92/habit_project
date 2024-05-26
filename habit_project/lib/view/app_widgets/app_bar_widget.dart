// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_project/constants/app_images.dart';
import 'package:habit_project/core/extensions/widget_extensions.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    this.showLeading = false,
    required this.title,
    required this.onTap,
  });

  final bool showLeading;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            color: Colors.transparent,
            child: Icon(
              Icons.arrow_back_ios_new,
              color: showLeading ? null : Colors.transparent,
            ),
          ),
        ),
        Column(
          children: [
            Text(
              title,
              style: GoogleFonts.ubuntu(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              width: 100,
              child: Image.asset(AppImages.vector),
            ),
          ],
        ),
        const Icon(
          Icons.abc,
          color: Colors.transparent,
        ),
      ],
    ).paddingOnly(top: 10, left: 20, right: 20);
  }
}
