import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_project/core/extensions/widget_extensions.dart';
import 'package:habit_project/models/plan_model.dart';

class PlanWidget extends StatelessWidget {
  const PlanWidget({super.key, required this.plan, this.color,});

  final PlanModel? plan;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color,
      ),
      child: Row(
        children: [
          Text(plan?.emoji ?? '', style: const TextStyle(
            fontSize: 48
          ),).paddingLTRB(10, 12, 10, 12),
          Text(plan?.name ?? '', style: GoogleFonts.ubuntu(
            fontSize: 18,
            fontWeight: FontWeight.w700
          ),).paddingOnly(left: 10),
          const Spacer(),
          // PopupMenuButton(itemBuilder: (context) {
          
          // },)
        ],
      ),
    );
  }
}