import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:yourtyme_partner/constants/app_colors.dart';
import 'package:yourtyme_partner/constants/app_textstyles.dart';
import 'package:yourtyme_partner/core/size_config.dart';
import 'package:yourtyme_partner/features/auth/presentation/collect_user_info/choose_city_category_screen.dart';
import 'package:yourtyme_partner/features/auth/presentation/widgets/auth_background.dart';
import 'package:yourtyme_partner/features/auth/presentation/widgets/auth_primary_button.dart';

class OTPScreen extends StatefulWidget {
  static const String route = "/OTPScreen";

  const OTPScreen({super.key});

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  Timer? _timer;
  int _timeRemaining = 30; // 30 seconds
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _canResend = false;
    _timeRemaining = 30;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeRemaining == 0) {
        setState(() {
          _canResend = true;
          _timer?.cancel();
        });
      } else {
        setState(() {
          _timeRemaining--;
        });
      }
    });
  }

  String get formattedTime {
    final minutes = (_timeRemaining / 60).floor().toString().padLeft(2, '0');
    final seconds = (_timeRemaining % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void resendOTP() {
    if (_canResend) {
      startTimer();
      // Add your OTP resend logic here
    }
  }

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 189 * SizeConfig.heightMultiplier),
          Text(
            "Enter your OTP",
            style: AppTextStyles.f16PoppinsBlackMediumW500,
          ),
          SizedBox(height: 20 * SizeConfig.heightMultiplier),
          otpInputWidget(
            onCompleted: (pin) {
              // Handle OTP completion
              print('Completed: $pin');
            },
          ),
          SizedBox(height: 20 * SizeConfig.heightMultiplier),
          Center(
            child: Opacity(
              opacity: 0.5,
              child: Text(
                "Didn't Receive OTP?",
                style: AppTextStyles.f12PoppinsRichBlackMediumW500,
              ),
            ),
          ),
          SizedBox(height: 8 * SizeConfig.heightMultiplier),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(formattedTime, style: AppTextStyles.f16PoppinsBlackMediumW700),
            SizedBox(width: 4 * SizeConfig.widthMultiplier),
            TextButton(
              onPressed: _canResend ? resendOTP : null,
              child: Text(
                'Resend',
                style: AppTextStyles.f16PoppinsBlackMediumW700.copyWith(
                  decoration: TextDecoration.underline,
                  decorationColor:
                      _canResend ? AppColors.black : AppColors.grey,
                  color: _canResend ? AppColors.black : AppColors.grey,
                ),
              ),
            ),
          ]),
          const Spacer(),
          AuthPrimaryButton(
            label: 'Verify',
            onTap: () {
              Navigator.pushNamed(context, ChooseCityandCategoryScreen.route);
            },
          ),
          SizedBox(height: 73 * SizeConfig.heightMultiplier),
        ],
      ),
    );
  }
}

Widget otpInputWidget({required ValueChanged<String> onCompleted}) {
  final defaultPinTheme = PinTheme(
    width: 50,
    height: 50,
    textStyle: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(8),
      color:AppColors.lightGrey
    ),
  );

  final focusedPinTheme = defaultPinTheme.copyWith(
    decoration: defaultPinTheme.decoration!.copyWith(
      border: Border.all(color: Colors.black, width: 1),
    ),
  );

  return Pinput(
    length: 6,
    defaultPinTheme: defaultPinTheme,
    focusedPinTheme: focusedPinTheme,
    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
    showCursor: true,
    onCompleted: onCompleted,
  );
}
