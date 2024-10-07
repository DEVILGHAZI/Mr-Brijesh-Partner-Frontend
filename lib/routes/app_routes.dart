import 'package:flutter/material.dart';
import 'package:yourtyme_partner/features/auth/presentation/collect_user_info/choose_city_category_screen.dart';
import 'package:yourtyme_partner/features/auth/presentation/phone_auth/otp_screen.dart';
import 'package:yourtyme_partner/features/auth/presentation/phone_auth/phone_auth_screen.dart';
import 'package:yourtyme_partner/features/onboarding/presenation/welcome_screen.dart';

class AppRoutes {
  static Route<dynamic>? Function(RouteSettings)? onGenerateRoute =
      (RouteSettings settings) {
    //authentication
    switch (settings.name) {
      //Before Login
      case WelcomeScreen.route:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case PhoneAuthScreen.route:
        return MaterialPageRoute(builder: (_) => const PhoneAuthScreen());
      case OTPScreen.route:
        return MaterialPageRoute(builder: (_) => const OTPScreen());
      case ChooseCityandCategoryScreen.route:
        return MaterialPageRoute(
            builder: (_) => const ChooseCityandCategoryScreen());
    }
    return null;
  };
}
