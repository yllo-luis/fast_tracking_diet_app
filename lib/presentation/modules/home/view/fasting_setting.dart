import 'package:fast_tracking_diet_app/presentation/modules/home/controller/home_controller.dart';
import 'package:fast_tracking_diet_app/presentation/presentation_utils/presentation_constants.dart';
import 'package:fast_tracking_diet_app/presentation/presentation_utils/widgets/bullet_list_widget.dart';
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

  late final customPlansList = getCustomRoutinesList();

  List<FastingRoutineModel> getCustomRoutinesList() {
    return controller.homeStore.availableFastingModels.value
    .where((element) => element.isCustom == true)
    .toList();
  }

  ValueNotifier<FastingRoutineModel?> get currentSelectedPlan =>
      controller.homeStore.currentFastingModel;

  ValueNotifier<bool> get isCreatingCustomFast =>
      controller.homeStore.isCreatingNewFast;

  ValueNotifier<bool> get isLoadingFastingList =>
      controller.homeStore.isLoadingRoutines;

  final GlobalKey<FormState> formState = GlobalKey<FormState>();

  final TextEditingController customFastingTimeController =
      TextEditingController();
  final TextEditingController customFastingRestController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () =>
                _mountNewFastingRoutineDialog(context),
            icon: Icon(Icons.plus_one),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            spacing: 8,
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
                replacement: ValueListenableBuilder(
                  valueListenable: currentSelectedPlan,
                  builder: (context, value, child) {
                    return _SelectPlanCarrousel(
                      routinesList: customPlansList,
                      currentSelection: value!,
                      onSelected: (selected) =>
                          currentSelectedPlan.value = selected,
                      canRemove: true,
                      onRemove: (removed) {
                        controller
                            .removeFastingRoutine(fastingRoutine: removed)
                            .then(
                              (value) {
                                customPlansList.remove(removed);

                                setState(() {});
                              },
                              onError: (error, stacktrace) {
                                if (context.mounted) {
                                  mountErrorSnackBar(context: context);
                                }
                              },
                            );
                      },
                    );
                  },
                ),
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

  Future<void> _mountNewFastingRoutineDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 20.0),
          contentPadding: EdgeInsets.symmetric(
            vertical: 24.0,
            horizontal: 16.0,
          ),
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: BulletListWidget(
                texts: [
                  AppLocalizations.of(
                    context,
                  )!.homeFastingRoutineCustomFastingTipSchedule,
                  AppLocalizations.of(
                    context,
                  )!.homeFastingRoutineCustomFastingTipWater,
                  AppLocalizations.of(
                    context,
                  )!.homeFastingRoutineCustomFastingTipBreakfast,
                  AppLocalizations.of(
                    context,
                  )!.homeFastingRoutineCustomFastingTipWork,
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Form(
                key: formState,
                child: Column(
                  children: [
                    TextFormField(
                      controller: customFastingTimeController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context)!.errorValueTitle;
                        }

                        return null;
                      },
                      maxLength: 2,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(
                          context,
                        )!.homeFastingRoutineCustomFastingHintFastingTime,
                      ),
                    ),
                    TextFormField(
                      controller: customFastingRestController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context)!.errorValueTitle;
                        }

                        return null;
                      },
                      maxLength: 2,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(
                          context,
                        )!.homeFastingRoutineCustomFastingHintRestTime,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ValueListenableBuilder<bool>(
              valueListenable: isCreatingCustomFast,
              builder: (context, value, child) {
                return AnimatedSwitcher(
                  duration: PresentationConstants.animationDuration,
                  child: FilledButton(
                    onPressed: () {
                      final newFasting = FastingRoutineModel(
                        fastingPeriod: Duration(
                          hours: int.parse(
                            customFastingTimeController.text,
                          ),
                        ),
                        fastingRestPeriod: Duration(
                          hours: int.parse(
                            customFastingRestController.text,
                          ),
                        ),
                        isCustom: true,
                      );
                      
                      controller
                          .createFastingRoutines(
                            fastingRoutine: newFasting,
                          )
                          .whenComplete(() {
                            if (context.mounted) {
                              customFastingRestController.clear();
                              customFastingTimeController.clear();
                              
                              setState(() {
                                customPlansList.add(newFasting);
                              });

                              Navigator.pop(context);
                            }
                          });
                    },
                    child: Text(
                      AppLocalizations.of(
                        context,
                      )!.homeFastingRoutineCustomCreateButton,
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void mountErrorSnackBar({required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              AppLocalizations.of(context)!.errorTitle,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.white),
            ),
            Text(
              AppLocalizations.of(context)!.errorSubTitle2,
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

class _SelectPlanCarrousel extends StatelessWidget {
  final List<FastingRoutineModel> routinesList;
  final FastingRoutineModel currentSelection;
  final Function(FastingRoutineModel selected) onSelected;
  final bool canRemove;
  final Function(FastingRoutineModel removed)? onRemove;

  const _SelectPlanCarrousel({
    super.key,
    required this.routinesList,
    required this.currentSelection,
    required this.onSelected,
    this.canRemove = false,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.only(bottom: 12.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        mainAxisExtent: 92,
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
              spacing: 2,
              children: [
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      '${routinesList[index].fastingPeriod.inHours}:${routinesList[index].fastingRestPeriod.inHours}',
                    ),
                    Visibility(
                      visible: canRemove,
                      child: GestureDetector(
                        onTap: () => onRemove!(routinesList[index]),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 6.0),
                          child: Icon(Icons.remove, color: Colors.red),
                        ),
                      ),
                    ),
                  ],
                ),
                Visibility(visible: !canRemove, child: SizedBox(height: 6)),
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
