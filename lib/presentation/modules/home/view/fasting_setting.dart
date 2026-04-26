import 'package:fast_tracking_diet_app/presentation/modules/home/controller/home_controller.dart';
import 'package:fast_tracking_diet_app/presentation/presentation_utils/presentation_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../app/l10n/app_localizations.dart';
import '../../../../domain/entity/fasting_routine_model.dart';

class FastingSetting extends StatefulWidget {
  const FastingSetting({super.key});

  @override
  State<FastingSetting> createState() => _FastingSettingState();
}

class _FastingSettingState extends State<FastingSetting> {
  final controller = Modular.get<HomeController>();

  bool get hasNoCustomPlans => controller.homeStore.availableFastingModels.value
      .where((element) => element.isCustom == true)
      .isEmpty;

  List<FastingRoutineModel> get plansList => List.from(
    controller.homeStore.availableFastingModels.value.where(
      (element) => element.isCustom == false,
    ),
    growable: true,
  );
  List<FastingRoutineModel> get customPlansList => controller
      .homeStore
      .availableFastingModels
      .value
      .where((element) => element.isCustom == true)
      .toList();

  ValueNotifier<FastingRoutineModel?> get currentSelectedPlan =>
      controller.homeStore.currentFastingModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          IconButton(onPressed: () => null, icon: Icon(Icons.plus_one)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            spacing: 16,
            crossAxisAlignment: .start,
            children: [
              Row(
                spacing: 12,
                children: [
                  Icon(
                    Icons.bookmark_outlined,
                    color: Colors.blueAccent,
                    size: 32,
                  ),
                  Text(
                    AppLocalizations.of(
                      context,
                    )!.homeFastingRoutineSelectCustomPlan,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              Visibility(
                visible: hasNoCustomPlans,
                replacement: const Placeholder(),
                child: const _NoCustomPlansWidget(),
              ),
              Row(
                spacing: 12,
                children: [
                  Icon(
                    Icons.access_time_filled,
                    color: Colors.blueAccent,
                    size: 32,
                  ),
                  Text(
                    AppLocalizations.of(
                      context,
                    )!.homeFastingRoutineSelectQuickPlan,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              ValueListenableBuilder(
                valueListenable: currentSelectedPlan,
                builder: (context, value, _) {
                  return _SelectPlanCarrousel(
                    routinesList: plansList,
                    currentSelection: value!,
                    onSelected: (selected) =>
                        currentSelectedPlan.value = selected,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SelectPlanCarrousel extends StatelessWidget {
  final List<FastingRoutineModel> routinesList;
  final FastingRoutineModel currentSelection;
  final Function(FastingRoutineModel selected) onSelected;

  const _SelectPlanCarrousel({
    super.key,
    required this.routinesList,
    required this.currentSelection,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        mainAxisExtent: 80,
      ),
      itemCount: routinesList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => onSelected(routinesList[index]),
          child: AnimatedContainer(
            padding: const EdgeInsets.all(12),
            duration: PresentationConstants.animationDuration,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                width: 1,
                color: routinesList[index] == currentSelection
                    ? Colors.purple
                    : Colors.black,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 6,
              children: [
                Text(
                  '${routinesList[index].fastingPeriod.inHours}:${routinesList[index].fastingRestPeriod.inHours}',
                ),
                Row(
                  mainAxisAlignment: .spaceAround,
                  children: [
                    Icon(Icons.no_food, color: Colors.blue),
                    Text('${routinesList[index].fastingPeriod.inHours}h'),
                    Icon(Icons.arrow_forward_ios),
                    Icon(Icons.dinner_dining, color: Colors.blue),
                    Text('${routinesList[index].fastingRestPeriod.inHours}h'),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _NoCustomPlansWidget extends StatelessWidget {
  const _NoCustomPlansWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.blueAccent,
      ),
      child: Row(
        mainAxisAlignment: .start,
        spacing: 12,
        children: [
          Icon(Icons.tips_and_updates, color: Colors.white, size: 24),
          Text(
            AppLocalizations.of(
              context,
            )!.homeFastingRoutineSelectCustomPlanEmpty,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
