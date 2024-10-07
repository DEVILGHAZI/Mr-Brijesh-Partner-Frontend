// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:yourtyme_partner/constants/app_textstyles.dart';
// import 'package:yourtyme_partner/features/auth/presentation/widgets/auth_background.dart';

// class PhoneAuthScreen extends StatelessWidget {
//   static const String route = "/phoneAuthScreen";
//   const PhoneAuthScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AuthBackground(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             "Sign up with Phone Number",
//             style: AppTextStyles.f30MulishdarkGrayW900,
//           ),
//           PhoneNumberInput()
//         ],
//       ),
//     );
//   }

// }
// class PhoneNumberInput extends StatefulWidget {
//   const PhoneNumberInput({Key? key}) : super(key: key);

//   @override
//   _PhoneNumberInputState createState() => _PhoneNumberInputState();
// }

// class _PhoneNumberInputState extends State<PhoneNumberInput> {
//   final _phoneController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: [
//           TextFormField(
//             controller: _phoneController,
//             keyboardType: TextInputType.phone,
//             inputFormatters: [
//               FilteringTextInputFormatter.digitsOnly, // Allow only digits
//               LengthLimitingTextInputFormatter(10), // Limit to 10 digits
//             ],
//             decoration: InputDecoration(
//               labelText: 'Phone Number',
//               border: OutlineInputBorder(),
//               hintText: 'Enter your phone number',
//               prefixIcon: Icon(Icons.phone),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Phone number is required';
//               }
//               if (value.length != 10) {
//                 return 'Phone number must be exactly 10 digits';
//               }
//               if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
//                 return 'Enter a valid phone number';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () {
//               if (_formKey.currentState!.validate()) {
//                 // Phone number is valid
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text('Phone number is valid')),
//                 );
//               }
//             },
//             child: const Text('Submit'),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _phoneController.dispose();
//     super.dispose();
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yourtyme_partner/constants/app_colors.dart';
import 'package:yourtyme_partner/constants/app_textstyles.dart';
import 'package:yourtyme_partner/core/size_config.dart';
import 'package:yourtyme_partner/features/auth/presentation/phone_auth/otp_screen.dart';
import 'package:yourtyme_partner/features/auth/presentation/widgets/auth_background.dart';
import 'package:yourtyme_partner/features/auth/presentation/widgets/auth_primary_button.dart';

class PhoneAuthScreen extends StatelessWidget {
  static const String route = "/phoneAuthScreen";
  const PhoneAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      isLeading: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 221 * SizeConfig.heightMultiplier,
          ),
          Text(
            "Sign up with Phone Number",
            style: AppTextStyles.f30MulishdarkGrayW900,
          ),
          SizedBox(
            height: 40 * SizeConfig.heightMultiplier,
          ),
          PhoneNumberInput(),
          const Spacer(),
          AuthPrimaryButton(
            label: 'Get OTP',
            onTap: () {
              Navigator.pushNamed(context, OTPScreen.route);
            },
          ),
          SizedBox(
            height: 60 * SizeConfig.heightMultiplier,
          ),
          Text(
            'Already have an account?',
            style: AppTextStyles.f15PoppinsBlackMediumW400,
          ),
          SizedBox(
            height: 30 * SizeConfig.heightMultiplier,
          )
        ],
      ),
    );
  }
}

class PhoneNumberInput extends StatefulWidget {
  const PhoneNumberInput({super.key});

  @override
  _PhoneNumberInputState createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: 20 * SizeConfig.widthMultiplier,
            vertical: 7 * SizeConfig.heightMultiplier),
        height: 55 * SizeConfig.heightMultiplier,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.lightGrey),
        child: TextFormField(
          controller: _phoneController,
          keyboardType: TextInputType.phone,
          style: AppTextStyles.f15MulishBlackMediumW500,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(10),
          ],
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Enter Phone Number',
              hintStyle: AppTextStyles.f15MulishgreyMediumW500),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Phone number is required';
            }
            if (value.length != 10) {
              return 'Phone number must be exactly 10 digits';
            }
            if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
              return 'Enter a valid phone number';
            }
            return null;
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }
}
