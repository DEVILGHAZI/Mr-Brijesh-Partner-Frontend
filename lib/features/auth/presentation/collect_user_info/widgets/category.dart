import 'package:flutter/material.dart';
import 'package:yourtyme_partner/constants/app_colors.dart';
import 'package:yourtyme_partner/constants/app_textstyles.dart';
import 'package:yourtyme_partner/constants/asset_path.dart';
import 'package:yourtyme_partner/core/size_config.dart';

class CategoryCityDialog extends StatelessWidget {
  final List<String> options;
  final List<String> selectedOptions;
  final Function(String) onItemSelected;

  const CategoryCityDialog({
    required this.options,
    required this.selectedOptions,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(16 * SizeConfig.widthMultiplier),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 125 * SizeConfig.heightMultiplier),
            _buildHeader(context),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: options.map((String option) {
                    final bool isSelected = selectedOptions.contains(option);
                    return _buildItem(option, isSelected, () {
                      onItemSelected(option);
                    });
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(), // Close dialog
      child: Container(
        height: 55,
        margin: EdgeInsets.symmetric(
            vertical: 2 * SizeConfig.heightMultiplier), // Space between items
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.lightGrey1,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 19 * SizeConfig.widthMultiplier),
            Text('Select', style: AppTextStyles.f15PoppinsBlackMediumW400),
            const Spacer(),
            Image.asset(AssetPath.assetNavigateTop, scale: 2),
            SizedBox(width: 19 * SizeConfig.widthMultiplier),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(String label, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        margin: EdgeInsets.symmetric(vertical: 2 * SizeConfig.heightMultiplier),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.lightGrey1,
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 14 * SizeConfig.widthMultiplier),
              height: 19 * SizeConfig.heightMultiplier,
              width: 19 * SizeConfig.widthMultiplier,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: isSelected ? Colors.blue : AppColors.greyMedium),
              ),
              child: Center(
                child: Container(
                  height: 13.57 * SizeConfig.heightMultiplier,
                  width: 13.57 * SizeConfig.widthMultiplier,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected ? Colors.blue : AppColors.greyMedium,
                  ),
                ),
              ),
            ),
            SizedBox(width: 19 * SizeConfig.widthMultiplier),
            Text(
              label,
              style: AppTextStyles.f15PoppinsBlackMediumW400,
            ),
          ],
        ),
      ),
    );
  }
}