import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yourtyme_partner/constants/app_colors.dart';
import 'package:yourtyme_partner/core/size_config.dart';

class AppTextStyles {
  static TextStyle get f20MulishWhiteW900 => GoogleFonts.mulish(
        color: AppColors.white,
        fontSize: 20 * SizeConfig.textMultiplier,
        fontWeight: FontWeight.w900,
      );
  static TextStyle get f20MulishTomatoW900 => GoogleFonts.mulish(
        color: AppColors.tomato,
        fontSize: 20 * SizeConfig.textMultiplier,
        fontWeight: FontWeight.w900,
      );
  static TextStyle get f8MulishBlackW500 => GoogleFonts.mulish(
        color: AppColors.black,
        fontSize: 8 * SizeConfig.textMultiplier,
        fontWeight: FontWeight.w500,
        letterSpacing: 2.64,
      );

  static TextStyle get f30MulishdarkGrayW900 => GoogleFonts.mulish(
        color: AppColors.darkGray,
        fontSize: 30 * SizeConfig.textMultiplier,
        fontWeight: FontWeight.w900,
      );

  static TextStyle get f20MulishdarkGrayW800 => GoogleFonts.mulish(
        color: AppColors.darkGray,
        fontSize: 20 * SizeConfig.textMultiplier,
        fontWeight: FontWeight.w800,
      );
  static TextStyle get f15MulishgreyMediumW500 => GoogleFonts.mulish(
        color: AppColors.greyMedium,
        fontSize: 15 * SizeConfig.textMultiplier,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get f15MulishBlackMediumW500 => GoogleFonts.mulish(
        color: AppColors.black,
        fontSize: 15 * SizeConfig.textMultiplier,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get f16PoppinsBlackMediumW500 => GoogleFonts.poppins(
        color: AppColors.black,
        fontSize: 16 * SizeConfig.textMultiplier,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get f12PoppinsRichBlackMediumW500 => GoogleFonts.poppins(
        color: AppColors.richBlack,
        fontSize: 12 * SizeConfig.textMultiplier,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get f16PoppinsBlackMediumW700 => GoogleFonts.poppins(
        color: AppColors.black,
        fontSize: 16 * SizeConfig.textMultiplier,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get f15PoppinsBlackMediumW400 => GoogleFonts.poppins(
        color: AppColors.black,
        fontSize: 15 * SizeConfig.textMultiplier,
        fontWeight: FontWeight.w400,
      );
}
