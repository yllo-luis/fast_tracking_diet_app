import 'package:fast_tracking_diet_app/presentation/modules/home/widgets/home_components/fasting_component.dart';
import 'package:flutter/material.dart';

import '../../../../utils/enums/home_items.dart';

class GetLayoutPage extends StatelessWidget {
  const GetLayoutPage({super.key, required this.homeItems});

  final HomeItems homeItems;

  @override
  Widget build(BuildContext context) {
    switch (homeItems) {
      case HomeItems.fasting:
        return FastingComponent();
      case HomeItems.diary:
        return const Placeholder();
      case HomeItems.userProfile:
        return const Placeholder();
    }
  }
}
