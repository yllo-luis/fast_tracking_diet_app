import 'package:flutter/cupertino.dart';

import '../../app/l10n/app_localizations.dart';

enum KcalTypeEnum { breakfast, lunch, dinner, other }

extension KcalTypeEnumUtils on KcalTypeEnum {
  String getKcalTypeLabel({required BuildContext context}) {
    switch (this) {
      case KcalTypeEnum.breakfast:
        return AppLocalizations.of(context)!.kcalTypeBreakfastLabel;
      case KcalTypeEnum.lunch:
        return AppLocalizations.of(context)!.kcalTypeLunchLabel;
      case KcalTypeEnum.dinner:
        return AppLocalizations.of(context)!.kcalTypeDinnerLabel;
      case KcalTypeEnum.other:
        return AppLocalizations.of(context)!.kcalTypeOtherLabel;
    }
  }

  String getKcalTypeForDatabase() {
    switch (this) {
      case KcalTypeEnum.breakfast:
        return 'breakfast';
      case KcalTypeEnum.lunch:
        return 'lunch';
      case KcalTypeEnum.dinner:
        return 'dinner';
      case KcalTypeEnum.other:
        return 'other';
    }
  }
}
