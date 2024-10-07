import 'package:flutter/material.dart';
import 'package:yourtyme_partner/constants/app_textstyles.dart';
import 'package:yourtyme_partner/core/size_config.dart';
import 'package:yourtyme_partner/features/auth/presentation/collect_user_info/widgets/category.dart';
import 'package:yourtyme_partner/features/auth/presentation/collect_user_info/widgets/select_button.dart';
import 'package:yourtyme_partner/features/auth/presentation/widgets/auth_background.dart';
import 'package:yourtyme_partner/features/auth/presentation/widgets/auth_primary_button.dart';

class ChooseCityandCategoryScreen extends StatefulWidget {
  static const String route = "/chooseCityandCategoryScreen";
  const ChooseCityandCategoryScreen({super.key});

  @override
  _ChooseCityandCategoryScreenState createState() =>
      _ChooseCityandCategoryScreenState();
}

class _ChooseCityandCategoryScreenState
    extends State<ChooseCityandCategoryScreen> {
  List<String> selectedCategories = [];
  String? selectedCity;

  final List<String> categories = [
    "Men's grooming",
    "Men's Luxe",
    'Salon for women',
    'Women Spa',
    "Men's grooming",
    'AC repair',
    'Home Cleaning',
    'Bathroom Cleaning',
    'Painting'
  ];
  final List<String> cities = [
    'Delhi NCR',
    'Gurgaon',
    'Noida',
    'Ghaziabad',
    'Faridabad'
  ];

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 117 * SizeConfig.heightMultiplier),
          _buildTextSection('Choose Your Category',
              'You can select multiple options'),
          SizedBox(height: 16 * SizeConfig.heightMultiplier),
          SelectionButton(
              label: 'Select Categories', onPressed: _showCategoryDialog),
          SizedBox(height: 48 * SizeConfig.heightMultiplier),
          _buildTextSection('Choose Your City', 'Choose your working city'),
          SizedBox(height: 9 * SizeConfig.heightMultiplier),
          SelectionButton(label: 'Select City', onPressed: _showCityDialog),
          const Spacer(),
          AuthPrimaryButton(label: 'Save', onTap: () {}),
          SizedBox(height: 73 * SizeConfig.heightMultiplier),
        ],
      ),
    );
  }

  Widget _buildTextSection(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.f16PoppinsBlackMediumW500),
        Opacity(
          opacity: 0.5,
          child: Text(subtitle, style: AppTextStyles.f12PoppinsRichBlackMediumW500),
        ),
      ],
    );
  }

  void _showCategoryDialog() {
    _showDialog(
      categories,
      selectedCategories,
      (String category) {
        setState(() {
          if (selectedCategories.contains(category)) {
            selectedCategories.remove(category);
             Navigator.of(context).pop(); 
          } else {
            selectedCategories.add(category);
             Navigator.of(context).pop(); 
          }
        });
      },
    );
  }

  void _showCityDialog() {
    _showDialog(
      cities,
      [if (selectedCity != null) selectedCity!],
      (String city) {
        setState(() {
          selectedCity = city;
        });
        Navigator.of(context).pop(); // Close the dialog after selection
      },
    );
  }

  void _showDialog(List<String> options, List<String> selectedOptions,
      Function(String) onItemSelected) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CategoryCityDialog(
          options: options,
          selectedOptions: selectedOptions,
          onItemSelected: onItemSelected,
        );
      },
    );
  }
}
