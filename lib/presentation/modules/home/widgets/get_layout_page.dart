import 'package:fast_tracking_diet_app/presentation/modules/home/widgets/home_components/diary_view_component.dart';
import 'package:fast_tracking_diet_app/presentation/modules/home/widgets/home_components/fasting_component.dart';
import 'package:flutter/material.dart';

import '../../../../utils/enums/home_items.dart';
import 'home_components/kcal_calculator_view_component.dart';
import 'home_components/profile_view_component.dart';

class GetLayoutPage extends StatelessWidget {
  const GetLayoutPage({super.key, required this.homeItems});

  final HomeItems homeItems;

  @override
  Widget build(BuildContext context) {
    switch (homeItems) {
      case HomeItems.fasting:
        return const FastingComponent();
      case HomeItems.kCalCalculator:
        return const KcalCalculatorViewComponent();
      case HomeItems.diary:
        return DiaryViewComponent();
      case HomeItems.userProfile:
        return const ProfileViewComponent();
    }
  }
}
