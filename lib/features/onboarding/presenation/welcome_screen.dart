import 'package:flutter/material.dart';
import 'package:yourtyme_partner/constants/app_colors.dart';
import 'package:yourtyme_partner/constants/asset_path.dart';
import 'package:yourtyme_partner/core/size_config.dart';
import 'package:yourtyme_partner/features/auth/presentation/phone_auth/phone_auth_screen.dart';
import 'package:yourtyme_partner/features/onboarding/presenation/widgets/onboarding_background.dart';

class WelcomeScreen extends StatefulWidget {
  static const String route = "/welcomeScreen";

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isWomenImage = false;
  double progressValue = 0.5;
  double top = 107;

  bool isFirstClick = true;

  void _onNextTap() {
    if (isFirstClick) {
      setState(() {
        isWomenImage = true;
        progressValue = 0.95;
        top = 233;
        isFirstClick = false;
      });
    } else {
      Navigator.pushNamed(context, PhoneAuthScreen.route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return OnboardingBackGroundScreen(
      progressValue: progressValue,
      onNextTap: _onNextTap,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: top * SizeConfig.heightMultiplier),
            child: Stack(
              children: [
                Image.asset(
                  isWomenImage
                      ? AssetPath.womenGettingTreatment
                      : AssetPath.womenColoringHair,
                ),
                if (!isWomenImage)
                  Positioned(
                    top: 17,
                    left: 217,
                    child: Opacity(
                      opacity: 0.3,
                      child:
                          Image.asset(AssetPath.black, color: AppColors.black),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
