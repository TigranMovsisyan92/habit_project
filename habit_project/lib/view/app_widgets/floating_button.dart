import 'package:flutter/material.dart';
import 'package:habit_project/constants/app_colors.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          margin: const EdgeInsets.only(bottom: 80, right: 25),
          height: 56,
          width: 56,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.appColor,
          ),
          child: const Icon(Icons.add, size: 40, color: Colors.white,),
        ),
      ),
    );
  }
}