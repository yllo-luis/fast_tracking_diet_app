import 'package:fast_tracking_diet_app/app/l10n/app_localizations.dart';
import 'package:fast_tracking_diet_app/utils/enums/home_items.dart';
import 'package:flutter/material.dart';

class HomeItemUtils {
  static List<BottomNavigationBarItem> getBottomNavigationItems({
    required BuildContext context,
  }) {
    return List<BottomNavigationBarItem>.from(
      HomeItems.values
          .map(
            (e) => BottomNavigationBarItem(
              icon: getIconPerHomeItem(e),
              label: getHomeLabel(context, e),
            ),
          )
          .toList(),
    );
  }

  static Icon getIconPerHomeItem(HomeItems homeItem) {
    switch (homeItem) {
      case HomeItems.fasting:
        return Icon(Icons.home);
      case HomeItems.diary:
        return Icon(Icons.book);
      case HomeItems.userProfile:
        return Icon(Icons.person);
    }
  }

  static String getHomeLabel(BuildContext context, HomeItems homeItem) {
    switch (homeItem) {
      case HomeItems.fasting:
        return AppLocalizations.of(context)!.homeBottomNavigationItemFasting;
      case HomeItems.diary:
        return AppLocalizations.of(context)!.homeBottomNavigationItemDiary;
      case HomeItems.userProfile:
        return AppLocalizations.of(context)!.homeBottomNavigationItemProfile;
    }
  }
}
