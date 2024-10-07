import 'package:flutter/material.dart';
import 'package:yourtyme_partner/constants/app_colors.dart';
import 'package:yourtyme_partner/constants/app_textstyles.dart';
import 'package:yourtyme_partner/constants/asset_path.dart';
import 'package:yourtyme_partner/core/size_config.dart';

class SelectionButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const SelectionButton(
      {super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50 * SizeConfig.heightMultiplier,
        padding:
            EdgeInsets.symmetric(horizontal: 16 * SizeConfig.widthMultiplier),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.lightGrey1,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: AppTextStyles.f16PoppinsBlackMediumW500),
            Image.asset(AssetPath.assetNavigateDown, scale: 2),
          ],
        ),
      ),
    );
  }
}
