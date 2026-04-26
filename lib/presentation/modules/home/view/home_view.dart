import 'package:fast_tracking_diet_app/presentation/modules/home/controller/home_controller.dart';
import 'package:fast_tracking_diet_app/presentation/modules/home/widgets/get_layout_page.dart';
import 'package:fast_tracking_diet_app/presentation/presentation_utils/presentation_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

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
      appBar: AppBar(
        centerTitle: true,
        title: Text('Fast Tracking', style: GoogleFonts.pacifico(fontSize: 28)),
        elevation: 0,
      ),
      body: PageView.builder(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) =>
            GetLayoutPage(homeItems: HomeItems.values[index]),
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
              controller.setCurrentPage = value;
            },
          );
        },
      ),
    );
  }
}
