import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_project/core/extensions/widget_extensions.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(image),
          Text(
            title,
            style: GoogleFonts.ubuntu(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ).paddingSymetric(v: 10),
          Text(
            description,
            textAlign: TextAlign.center,
            style: GoogleFonts.ubuntu(
              letterSpacing: 1,
              fontSize: 16,
            ),
          ).paddingSymetric(h: 35),
        ],
      ),
    );
  }
}
