// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onTap,
    this.color,
    this.borderColor,
    required this.title,
    this.gradientColors,
    this.titleColor,
  });

  final VoidCallback onTap;
  final Color? color;
  final Color? borderColor;
  final String title;
  final List<Color>? gradientColors;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 62,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color,
          gradient: gradientColors != null ? LinearGradient(colors: gradientColors!) : null,
          border: borderColor != null ? Border.all(
            color: borderColor ?? Colors.transparent,
          ) : null,
        ),
        child: Center(
          child: Text(title,
          style: GoogleFonts.ubuntu(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: titleColor,
          ),),
        ),
      ),
    );
  }
}
