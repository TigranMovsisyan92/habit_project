import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_project/constants/app_colors.dart';
import 'package:habit_project/core/extensions/widget_extensions.dart';
import 'package:habit_project/translations/locale_keys.g.dart';

class EmojiPickerWidget extends StatelessWidget {
  const EmojiPickerWidget({
    super.key,
    required this.isExpanded,
    required this.onPressed,
    required this.onEmojiSelected,
    this.emoji,
  });

  final bool isExpanded;
  final Function(bool) onPressed;
  final Function(Category?, Emoji) onEmojiSelected;
  final Emoji? emoji;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.fromLTRB(10, 18, 0, 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.additionalLightGrey3,
          ),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Text(emoji?.emoji ?? '🙂', style: const TextStyle(
              fontSize: 48,
            ),),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.icon.tr(),
                  style: GoogleFonts.ubuntu(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                if (emoji != null)
                  Text(
                    emoji?.name ?? '',
                    style: GoogleFonts.ubuntu(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: AppColors.additionalLightGrey3,
                    ),
                  ),
              ],
            ).paddingOnly(left: 20),
            const Spacer(),
            ExpandIcon(
              onPressed: onPressed,
              size: 40,
              color: AppColors.appColor,
              isExpanded: isExpanded,
            ),
          ],
        ),
      ),
      secondChild: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.fromLTRB(10, 18, 0, 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.additionalLightGrey3,
          ),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(emoji?.emoji ?? '🙂', style: const TextStyle(
                  fontSize: 48,
                ),),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.icon.tr(),
                      style: GoogleFonts.ubuntu(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    if (emoji != null)
                      Text(
                        emoji?.name ?? '',
                        style: GoogleFonts.ubuntu(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: AppColors.additionalLightGrey3,
                        ),
                      ),
                  ],
                ).paddingOnly(left: 20),
                const Spacer(),
                ExpandIcon(
                  onPressed: onPressed,
                  size: 40,
                  color: AppColors.appColor,
                  isExpanded: isExpanded,
                ),
              ],
            ),
            EmojiPicker(
              onEmojiSelected: onEmojiSelected,
              config: Config(
                height: 240,
                emojiViewConfig: EmojiViewConfig(
                  columns: 7,
                  emojiSizeMax: 28 * (Platform.isIOS ? 1.20 : 1.0),
                  backgroundColor: Colors.white,
                ),
                skinToneConfig: const SkinToneConfig(
                  enabled: true,
                  dialogBackgroundColor: Colors.white,
                ),
                categoryViewConfig: const CategoryViewConfig(
                  backgroundColor: Colors.white,
                  iconColorSelected: AppColors.appColor,
                  indicatorColor: AppColors.appColor,
                ),
                bottomActionBarConfig:
                    const BottomActionBarConfig(enabled: false),
              ),
            ).paddingOnly(right: 20, top: 10),
          ],
        ),
      ),
      crossFadeState:
          isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: const Duration(milliseconds: 500),
    );
  }
}
