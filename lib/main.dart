import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourtyme_partner/core/size_config.dart';
import 'package:yourtyme_partner/features/onboarding/presenation/welcome_screen.dart';
import 'package:yourtyme_partner/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        builder: (context, _) {
          return LayoutBuilder(builder: (context, constraints) {
            return OrientationBuilder(builder: (context, orientation) {
              SizeConfig().init(constraints, orientation);
              return MaterialApp(
                title: 'Flutter Demo',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(
                      seedColor: const Color.fromRGBO(103, 58, 183, 1)),
                  useMaterial3: true,
                ),
                initialRoute: WelcomeScreen.route,
                onGenerateRoute: AppRoutes.onGenerateRoute,
              );
            });
          });
        });
  }
}
