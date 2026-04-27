import 'package:fast_tracking_diet_app/presentation/modules/home/controller/home_controller.dart';
import 'package:fast_tracking_diet_app/presentation/modules/home/widgets/get_layout_page.dart';
import 'package:fast_tracking_diet_app/presentation/presentation_utils/presentation_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../utils/enums/home_items.dart';
import '../../../../utils/enums/home_items_utils.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = Modular.get<HomeController>();

  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        onPageChanged: (value) => controller.setCurrentPage = value,
        itemBuilder: (context, index) =>
            GetLayoutPage(homeItems: HomeItems.values[index]),
        itemCount: HomeItems.values.length,
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: controller.getCurrentPage,
        builder: (context, value, child) {
          return BottomNavigationBar(
            items: HomeItemUtils.getBottomNavigationItems(context: context),
            currentIndex: value,
            onTap: (value) {
              pageController.animateToPage(
                value,
                duration: PresentationConstants.animationDuration,
                curve: Curves.easeIn,
              );
            },
          );
        },
      ),
    );
  }
}
