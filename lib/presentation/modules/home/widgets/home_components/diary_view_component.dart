import 'package:fast_tracking_diet_app/app/l10n/app_localizations.dart';
import 'package:fast_tracking_diet_app/presentation/presentation_utils/presentation_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../domain/entity/local_fasting_model.dart';
import '../../controller/home_controller.dart';

class DiaryViewComponent extends StatefulWidget {
  const DiaryViewComponent({super.key});

  @override
  State<DiaryViewComponent> createState() => _DiaryViewComponentState();
}

class _DiaryViewComponentState extends State<DiaryViewComponent> {
  final controller = Modular.get<HomeController>();

  List<LocalFastingModel> get fastingHistoryList =>
      controller.homeStore.fastingHistory.value;

  ValueNotifier<bool> get isLoadingHistory =>
      controller.homeStore.isLoadingFastingHistory;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.getFastingHistory();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: ValueListenableBuilder<bool>(
          valueListenable: isLoadingHistory,
          builder: (context, value, child) {
            return AnimatedSwitcher(
              duration: PresentationConstants.animationDuration,
              child: value == false
                  ? fastingHistoryList.isEmpty
                        ? _MountNoHistoryLayout(
                            controller: Modular.get<HomeController>(),
                          )
                        : _MountUserFastingHistoryGraph(
                            fastingHistory: fastingHistoryList,
                          )
                  : const CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

class _MountUserFastingHistoryGraph extends StatelessWidget {
  final List<LocalFastingModel> fastingHistory;

  const _MountUserFastingHistoryGraph({
    required this.fastingHistory,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
      child: Column(
        crossAxisAlignment: .start,
        spacing: 16,
        children: [
          SfCartesianChart(
            primaryXAxis: const CategoryAxis(),
            title: ChartTitle(
              text: AppLocalizations.of(context)!.homeFastingHistoryGraphTitle,
            ),
            series: <ColumnSeries<LocalFastingModel, String>>[
              ColumnSeries<LocalFastingModel, String>(
                dataSource: fastingHistory,
                xValueMapper: (LocalFastingModel data, _) =>
                    DateFormat('dd/MM').format(data.fastingDateStart),
                yValueMapper: (LocalFastingModel data, _) =>
                    (data.fastingTotalTime?.inHours ??
                    0), // Shows duration in hours
                dataLabelSettings: const DataLabelSettings(isVisible: true),
              ),
            ],
          ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                tileColor:
                    fastingHistory[index].fastingTotalTime!.inHours ==
                        fastingHistory[index].fastingElapsedTime!.inHours
                    ? Colors.blue.shade100
                    : Colors.red.shade100,
                title: Text(
                  AppLocalizations.of(context)!.homeFastingHistoryDataTitle(
                    fastingHistory[index].fastingTotalTime!.inHours.toString(),
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: .start,
                        children: [
                          Icon(Icons.start),
                          Text(
                            DateFormat(
                              'dd/MM hh:mm',
                            ).format(fastingHistory[index].fastingDateStart),
                          ),
                          const Spacer(),
                          Icon(Icons.watch_off),
                          Text(
                            DateFormat(
                              'dd/MM hh:mm',
                            ).format(fastingHistory[index].fastingDateEnd!),
                          ),
                        ],
                      ),
                      Visibility(
                          visible: fastingHistory[index].fastingTotalTime!.inHours !=
                              fastingHistory[index].fastingElapsedTime!.inHours,
                          child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          spacing: 6,
                          children: [
                            Icon(Icons.not_interested),
                            Text('Meta não cumprida')
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemCount: fastingHistory.length,
          ),
        ],
      ),
    );
  }
}

class _MountNoHistoryLayout extends StatelessWidget {
  final HomeController controller;

  const _MountNoHistoryLayout({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        spacing: 12,
        children: [
          Icon(Icons.tips_and_updates, color: Colors.deepPurple, size: 92),
          Text(
            AppLocalizations.of(context)!.homeFastingHistoryNoHistoryText1,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Colors.black),
          ),
          Text(
            AppLocalizations.of(context)!.homeFastingHistoryNoHistoryText2,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Colors.black),
          ),
          FilledButton(
            onPressed: () {
              controller.pageController.animateTo(
                0,
                duration: PresentationConstants.animationDuration,
                curve: Curves.easeIn,
              );
            },
            child: Text(
              AppLocalizations.of(
                context,
              )!.homeFastingHistoryStartFastingButton,
            ),
          ),
        ],
      ),
    );
  }
}
