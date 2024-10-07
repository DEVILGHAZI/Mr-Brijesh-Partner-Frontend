import 'package:flutter/material.dart';
import 'package:yourtyme_partner/constants/app_colors.dart';
import 'package:yourtyme_partner/constants/app_textstyles.dart';
import 'package:yourtyme_partner/core/size_config.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;
  final bool isLeading;
  final double? padding;

  const AuthBackground({
    Key? key,
    required this.child,
    this.isLeading = true,
    this.padding = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: padding ?? 30 * SizeConfig.widthMultiplier,
              ),
              child: Center(child: child),
            ),
          ),
          Positioned(
            top: 46 * SizeConfig.heightMultiplier,
            right: 18 * SizeConfig.widthMultiplier,
            left: 24 * SizeConfig.widthMultiplier,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (isLeading)
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.navigate_before_sharp,
                      size: 34,
                    ),
                  ),
                SizedBox(
                    width: isLeading ? 0 : 24 * SizeConfig.widthMultiplier),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 73 * SizeConfig.widthMultiplier,
                      height: 39 * SizeConfig.heightMultiplier,
                      color: AppColors.black,
                      child: Center(
                        child: Text(
                          'YOUR',
                          style: AppTextStyles.f20MulishWhiteW900,
                        ),
                      ),
                    ),
                    Container(
                      width: 58 * SizeConfig.widthMultiplier,
                      height: 39 * SizeConfig.heightMultiplier,
                      color: AppColors.white,
                      child: Center(
                        child: Text(
                          'TYM',
                          style: AppTextStyles.f20MulishTomatoW900,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
