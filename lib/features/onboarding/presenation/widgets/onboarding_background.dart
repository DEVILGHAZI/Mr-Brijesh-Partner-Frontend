import 'package:flutter/material.dart';
import 'package:yourtyme_partner/constants/app_colors.dart';
import 'package:yourtyme_partner/constants/app_textstyles.dart';
import 'package:yourtyme_partner/core/size_config.dart';

class OnboardingBackGroundScreen extends StatelessWidget {
  final Widget child;
  final double progressValue;
  final VoidCallback onNextTap;

  const OnboardingBackGroundScreen({
    Key? key,
    required this.child,
    required this.progressValue,
    required this.onNextTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.peachCream,
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 20 * SizeConfig.widthMultiplier,
                    vertical: 20 * SizeConfig.heightMultiplier),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
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
                          )),
                        ),
                      ],
                    ),
                    Text(
                      'AB EXPERTS GHAR PE',
                      style: AppTextStyles.f8MulishBlackW500,
                    ),
                  ],
                ),
              ),
              Expanded(child: child),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 200 * SizeConfig.heightMultiplier,
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: 15 * SizeConfig.heightMultiplier),
                    child: SizedBox(
                      width: 108 * SizeConfig.widthMultiplier,
                      height: 3 * SizeConfig.heightMultiplier,
                      child: LinearProgressIndicator(
                        value: progressValue,
                        minHeight: 3,
                        color: AppColors.tomato,
                        backgroundColor: AppColors.semiTransparentDarkGray,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 44 * SizeConfig.heightMultiplier,
                        left: 30 * SizeConfig.widthMultiplier,
                        right: 30 * SizeConfig.widthMultiplier),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text('Welcome to',
                                textAlign: TextAlign.start,
                                style: AppTextStyles.f20MulishdarkGrayW800),
                            Text('YourTym',
                                textAlign: TextAlign.start,
                                style: AppTextStyles.f30MulishdarkGrayW900),
                          ],
                        ),
                        GestureDetector(
                          onTap: onNextTap,
                          child: Container(
                            height: 60 * SizeConfig.heightMultiplier,
                            width: 60 * SizeConfig.widthMultiplier,
                            decoration: const BoxDecoration(
                                color: AppColors.paleYellow,
                                shape: BoxShape.circle),
                            child: Icon(
                              Icons.navigate_next_rounded,
                              size: 32,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:yourtyme_partner/constants/app_colors.dart';
// import 'package:yourtyme_partner/constants/app_textstyles.dart';
// import 'package:yourtyme_partner/core/size_config.dart';

// class SplashScreen extends StatefulWidget {
//   final Widget nextScreen;

//   const SplashScreen({Key? key, required this.nextScreen}) : super(key: key);

//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Offset> _slideAnimation;
//   late Animation<double> _fadeAnimation;

//   @override
//   void initState() {
//     super.initState();
    
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 1500),
//       vsync: this,
//     );

//     _slideAnimation = Tween<Offset>(
//       begin: const Offset(0, 0),
//       end: Offset(-0.4, -0.70),
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeOut,
//     ));

//     _fadeAnimation = Tween<double>(
//       begin: 1.0,
//       end: 0.1,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeOut,
//     ));

//     Timer(const Duration(seconds: 3), () {
//       _controller.forward().then((_) {
//         Navigator.pushReplacement(
//           context,
//           PageRouteBuilder(
//             pageBuilder: (context, animation, secondaryAnimation) => widget.nextScreen,
//             transitionDuration: Duration.zero,
//           ),
//         );
//       });
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       body: Stack(
//         children: [
//           Center(
//             child: SlideTransition(
//               position: _slideAnimation,
//               child: FadeTransition(
//                 opacity: _fadeAnimation,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           width: 73 * SizeConfig.widthMultiplier,
//                           height: 39 * SizeConfig.heightMultiplier,
//                           color: AppColors.black,
//                           child: Center(
//                             child: Text(
//                               'YOUR',
//                               style: AppTextStyles.f20MulishWhiteW900,
//                             ),
//                           ),
//                         ),
//                         Container(
//                           width: 58 * SizeConfig.widthMultiplier,
//                           height: 39 * SizeConfig.heightMultiplier,
//                           color: AppColors.white,
//                           child: Center(
//                             child: Text(
//                               'TYM',
//                               style: AppTextStyles.f20MulishTomatoW900,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 5 * SizeConfig.heightMultiplier),
//                     Text(
//                       'AB EXPERTS GHAR PE',
//                       style: AppTextStyles.f8MulishBlackW500,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             top: 20 * SizeConfig.heightMultiplier,
//             left: 20 * SizeConfig.widthMultiplier,
//             child: AnimatedBuilder(
//               animation: _controller,
//               builder: (context, child) {
//                 return Opacity(
//                   opacity: 1 - _fadeAnimation.value,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Container(
//                             width: 73 * SizeConfig.widthMultiplier,
//                             height: 39 * SizeConfig.heightMultiplier,
//                             color: AppColors.black,
//                             child: Center(
//                               child: Text(
//                                 'YOUR',
//                                 style: AppTextStyles.f20MulishWhiteW900,
//                               ),
//                             ),
//                           ),
//                           Container(
//                             width: 58 * SizeConfig.widthMultiplier,
//                             height: 39 * SizeConfig.heightMultiplier,
//                             color: AppColors.white,
//                             child: Center(
//                               child: Text(
//                                 'TYM',
//                                 style: AppTextStyles.f20MulishTomatoW900,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 5 * SizeConfig.heightMultiplier),
//                       Text(
//                         'AB EXPERTS GHAR PE',
//                         style: AppTextStyles.f8MulishBlackW500,
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// // Onboarding Background Screen
// class OnboardingBackGroundScreen extends StatelessWidget {
//   final Widget child;
//   final double progressValue;
//   final VoidCallback onNextTap;

//   const OnboardingBackGroundScreen({
//     Key? key,
//     required this.child,
//     required this.progressValue,
//     required this.onNextTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.peachCream,
//       body: Stack(
//         children: [
//           Column(
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: 20 * SizeConfig.widthMultiplier,
//                   vertical: 20 * SizeConfig.heightMultiplier,
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Container(
//                           width: 73 * SizeConfig.widthMultiplier,
//                           height: 39 * SizeConfig.heightMultiplier,
//                           color: AppColors.black,
//                           child: Center(
//                             child: Text(
//                               'YOUR',
//                               style: AppTextStyles.f20MulishWhiteW900,
//                             ),
//                           ),
//                         ),
//                         Container(
//                           width: 58 * SizeConfig.widthMultiplier,
//                           height: 39 * SizeConfig.heightMultiplier,
//                           color: AppColors.white,
//                           child: Center(
//                             child: Text(
//                               'TYM',
//                               style: AppTextStyles.f20MulishTomatoW900,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Text(
//                       'AB EXPERTS GHAR PE',
//                       style: AppTextStyles.f8MulishBlackW500,
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(child: child),
//             ],
//           ),
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//               height: 200 * SizeConfig.heightMultiplier,
//               decoration: const BoxDecoration(
//                 color: AppColors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(30),
//                   topRight: Radius.circular(30),
//                 ),
//               ),
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(top: 15 * SizeConfig.heightMultiplier),
//                     child: SizedBox(
//                       width: 108 * SizeConfig.widthMultiplier,
//                       height: 3 * SizeConfig.heightMultiplier,
//                       child: LinearProgressIndicator(
//                         value: progressValue,
//                         minHeight: 3,
//                         color: AppColors.tomato,
//                         backgroundColor: AppColors.semiTransparentDarkGray,
//                         borderRadius: BorderRadius.circular(5),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(
//                       top: 44 * SizeConfig.heightMultiplier,
//                       left: 30 * SizeConfig.widthMultiplier,
//                       right: 30 * SizeConfig.widthMultiplier,
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Welcome to',
//                               style: AppTextStyles.f20MulishdarkGrayW800,
//                             ),
//                             Text(
//                               'YourTym',
//                               style: AppTextStyles.f30MulishdarkGrayW900,
//                             ),
//                           ],
//                         ),
//                         GestureDetector(
//                           onTap: onNextTap,
//                           child: Container(
//                             height: 60 * SizeConfig.heightMultiplier,
//                             width: 60 * SizeConfig.widthMultiplier,
//                             decoration: const BoxDecoration(
//                               color: AppColors.paleYellow,
//                               shape: BoxShape.circle,
//                             ),
//                             child: const Icon(
//                               Icons.navigate_next_rounded,
//                               size: 32,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

