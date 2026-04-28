import 'package:fast_tracking_diet_app/domain/entity/local_kcal_routine_model.dart';
import 'package:fast_tracking_diet_app/presentation/modules/home/controller/home_controller.dart';
import 'package:fast_tracking_diet_app/presentation/presentation_utils/presentation_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

import '../../../../../app/l10n/app_localizations.dart';
import '../../../../../utils/enums/home_items.dart';
import '../../../../../utils/enums/kcal_type_enum.dart';

class KcalCalculatorViewComponent extends StatefulWidget {
  const KcalCalculatorViewComponent({super.key});

  @override
  State<KcalCalculatorViewComponent> createState() =>
      _KcalCalculatorViewComponentState();
}

class _KcalCalculatorViewComponentState
    extends State<KcalCalculatorViewComponent> {
  final controller = Modular.get<HomeController>();

  List<LocalKcalRoutineModel> get kcalHistory =>
      controller.homeStore.kCalHistory.value;

  ValueNotifier<bool> get isLoadingKcalHistory =>
      controller.homeStore.isLoadingKcalHistory;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.getKcalHistory();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const SizedBox.shrink(),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              if (controller.homeStore.currentUser.value?.kcalTarget == null ||
                  controller.homeStore.currentUser.value?.kcalTarget == 0) {
                controller.pageController.animateToPage(
                  HomeItems.values.length,
                  duration: PresentationConstants.animationDuration,
                  curve: Curves.easeIn,
                );
              } else {
                Modular.to.pushNamed('kcal_registry_view').whenComplete(() {
                  Modular.get<HomeController>().getKcalHistory();
                });
              }
            },
            icon: Icon(Icons.plus_one),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: ValueListenableBuilder<bool>(
          valueListenable: isLoadingKcalHistory,
          builder: (context, value, child) {
            return AnimatedSwitcher(
              duration: PresentationConstants.animationDuration,
              child: value == false
                  ? kcalHistory.isEmpty
                        ? controller.homeStore.currentUser.value?.kcalTarget ==
                                      0 ||
                                  controller
                                          .homeStore
                                          .currentUser
                                          .value
                                          ?.kcalTarget ==
                                      null
                              ? _MountDefineKcalUser()
                              : _MountNoKcalHistoryLayout()
                        : _MountKcalHistoryList(
                            kcalRegistries: kcalHistory,
                            userKcalMax:
                                controller
                                    .homeStore
                                    .currentUser
                                    .value
                                    ?.kcalTarget ??
                                1200,
                          )
                  : const CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

class _MountKcalHistoryList extends StatelessWidget {
  final List<LocalKcalRoutineModel> kcalRegistries;
  final int userKcalMax;

  const _MountKcalHistoryList({
    required this.kcalRegistries,
    required this.userKcalMax,
  });

  // Helper to group entries by date
  Map<String, List<LocalKcalRoutineModel>> get _groupedRegistries {
    final Map<String, List<LocalKcalRoutineModel>> groups = {};
    for (var registry in kcalRegistries) {
      final date = DateFormat('dd/MM/yyyy').format(registry.kcalDate!);
      groups.putIfAbsent(date, () => []).add(registry);
    }
    return groups;
  }

  @override
  Widget build(BuildContext context) {
    final groups = _groupedRegistries;
    final sortedDates = groups.keys.toList()
      ..sort((a, b) => b.compareTo(a)); // Sort dates descending

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: sortedDates.length,
      itemBuilder: (context, index) {
        final date = sortedDates[index];
        final items = groups[date]!;

        final dailyTotal = items.fold<int>(
          0,
          (sum, item) => sum + (item.kcalQuantity ?? 0),
        );

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 8.0, left: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    date,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  Text(
                    '$dailyTotal / $userKcalMax kcal',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: dailyTotal > userKcalMax
                          ? Colors.red
                          : Colors.deepPurple,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: LinearProgressIndicator(
                  value: (dailyTotal / userKcalMax).clamp(0.0, 1.0),
                  backgroundColor: Colors.grey.shade200,
                  color: dailyTotal > userKcalMax
                      ? Colors.red
                      : Colors.deepPurple,
                  minHeight: 8,
                ),
              ),
            ),
            const SizedBox(height: 8),
            ...items.map(
              (item) => Column(
                children: [
                  Card(
                    margin: const EdgeInsets.symmetric(vertical: 4.0),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.grey.shade200),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      leading: CircleAvatar(
                        backgroundColor: Colors.deepPurple.withOpacity(0.1),
                        child: const Icon(
                          Icons.restaurant,
                          color: Colors.deepPurple,
                        ),
                      ),
                      title: Text(
                        item.kcalName ?? '',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle:
                          item.kcalDescription != null &&
                              item.kcalDescription!.isNotEmpty
                          ? Text(item.kcalDescription!)
                          : null,
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${item.kcalQuantity ?? 0} kcal',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),
                          if (item.kcalType != null)
                            Text(
                              _getKcalTypeLabel(context, item.kcalType!),
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  String _getKcalTypeLabel(BuildContext context, String type) {
    try {
      return KcalTypeEnum.values
          .firstWhere((e) => e.getKcalTypeForDatabase() == type)
          .getKcalTypeLabel(context: context);
    } catch (_) {
      return type;
    }
  }
}

class _MountNoKcalHistoryLayout extends StatelessWidget {
  const _MountNoKcalHistoryLayout();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        spacing: 12,
        children: [
          Icon(Icons.tips_and_updates, color: Colors.deepPurple, size: 92),
          Text(
            AppLocalizations.of(context)!.homeFastingKcalRegistryMessage,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Colors.black),
            textAlign: TextAlign.center,
          ),
          FilledButton(
            onPressed: () {
              Modular.to.pushNamed('kcal_registry_view').whenComplete(() {
                Modular.get<HomeController>().getKcalHistory();
              });
            },
            child: Text(
              AppLocalizations.of(context)!.homeFastingKcalRegistryButton,
            ),
          ),
        ],
      ),
    );
  }
}

class _MountDefineKcalUser extends StatelessWidget {
  const _MountDefineKcalUser();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        spacing: 12,
        children: [
          Icon(Icons.tips_and_updates, color: Colors.deepPurple, size: 92),
          Text(
            AppLocalizations.of(context)!.homeFastingNoKcalDefinedWarning,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Colors.black),
            textAlign: TextAlign.center,
          ),
          FilledButton(
            onPressed: () {
              Modular.get<HomeController>().pageController.animateToPage(
                HomeItems.values.length,
                duration: PresentationConstants.animationDuration,
                curve: Curves.easeIn,
              );
            },
            child: Text(
              AppLocalizations.of(
                context,
              )!.homeFastingNoKcalDefinedWarningButton,
            ),
          ),
        ],
      ),
    );
  }
}
