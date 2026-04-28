import 'package:fast_tracking_diet_app/presentation/modules/home/controller/home_controller.dart';
import 'package:fast_tracking_diet_app/presentation/modules/home/widgets/get_layout_page.dart';
import 'package:fast_tracking_diet_app/presentation/presentation_utils/presentation_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../app/l10n/app_localizations.dart';
import '../../../../utils/enums/home_items.dart';
import '../../../../utils/enums/home_items_utils.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
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
            selectedItemColor: Colors.deepPurple,
            unselectedItemColor: Colors.black45,
            currentIndex: value,
            onTap: (value) {
              if (controller.homeStore.isDoingFasting == false) {
                controller.pageController.animateToPage(
                  value,
                  duration: PresentationConstants.animationDuration,
                  curve: Curves.easeIn,
                );
              } else {
                showFocusOnFastingSnackbar();
              }
            },
          );
        },
      ),
    );
  }

  void showFocusOnFastingSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              AppLocalizations.of(context)!.homeFastingDenyChangeOnPageTitle,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.white),
            ),
            Text(
              AppLocalizations.of(context)!.homeFastingDenyChangeOnPageBody,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
