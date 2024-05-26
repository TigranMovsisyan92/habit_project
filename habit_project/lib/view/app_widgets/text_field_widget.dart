import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:habit_project/constants/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    this.onChanged,
    this.textInputAction,
    this.textInputType,
    this.hintText,
    this.suffixOnTap,
    this.showSuffix = false,
    this.inputFormatters,
  });

  final TextEditingController controller;
  final Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final String? hintText;
  final VoidCallback? suffixOnTap;
  final bool showSuffix;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.additionalLightGrey3,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.additionalLightGrey3,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.appColor,
          ),
        ),
        hintText: hintText,
        suffixIcon: showSuffix ? GestureDetector(
          onTap: suffixOnTap,
          child: Container(
            margin: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.additionalLightGrey4,
            ),
            child: const Icon(Icons.close, color: Colors.white, size: 18,),
          ),
        ) : const SizedBox(),
      ),
    );
  }
}
