import 'package:fast_tracking_diet_app/app/l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';

enum HomeFastingLayoutTipsEnum {
  startSlowly,
  drinkWater,
  foodQuality,
  listenBody
}

extension HomeFastingLayoutTipsUtils on HomeFastingLayoutTipsEnum {
  String getTipsTitle({required BuildContext context}) {
    switch (this) {
      case HomeFastingLayoutTipsEnum.startSlowly:
        return AppLocalizations.of(context)!.homeFastingLayoutTipStartSlowlyTitle;
      case HomeFastingLayoutTipsEnum.drinkWater:
        return AppLocalizations.of(context)!.homeFastingLayoutTipDrinkWaterTitle;
      case HomeFastingLayoutTipsEnum.foodQuality:
        return AppLocalizations.of(context)!.homeFastingLayoutFoodQualityTitle;
      case HomeFastingLayoutTipsEnum.listenBody:
        return AppLocalizations.of(context)!.homeFastingLayoutListenBodyTitle;
    }
  }

  String getTipsBody({required BuildContext context}) {
    switch (this) {
      case HomeFastingLayoutTipsEnum.startSlowly:
        return AppLocalizations.of(context)!.homeFastingLayoutTipStartSlowlyBody;
      case HomeFastingLayoutTipsEnum.drinkWater:
        return AppLocalizations.of(context)!.homeFastingLayoutTipDrinkWaterBody;
      case HomeFastingLayoutTipsEnum.foodQuality:
        return AppLocalizations.of(context)!.homeFastingLayoutFoodQualityBody;
      case HomeFastingLayoutTipsEnum.listenBody:
        return AppLocalizations.of(context)!.homeFastingLayoutListenBody;
    }
  }
}