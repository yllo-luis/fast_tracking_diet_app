import 'package:fast_tracking_diet_app/app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:slide_countdown/slide_countdown.dart';

import '../../../../../domain/entity/fasting_routine_model.dart';
import '../../../../../utils/enums/home_fasting_layout_tips_enum.dart';
import '../../../../presentation_utils/presentation_constants.dart';
import '../../controller/home_controller.dart';

class FastingComponent extends StatefulWidget {
  const FastingComponent({super.key});

  @override
  State<FastingComponent> createState() => _FastingComponentState();
}

class _FastingComponentState extends State<FastingComponent> {
  final controller = Modular.get<HomeController>();

  FastingRoutineModel? get currentFastingPlan =>
      controller.homeStore.currentFastingModel.value;

  ValueNotifier<bool> get isLoadingPlans =>
      controller.homeStore.isLoadingRoutines;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.getFastingRoutines();
      controller.getLoggedUser();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
        child: Column(
          crossAxisAlignment: .center,
          spacing: 16,
          children: [
            Text('Fast Tracking', style: GoogleFonts.pacifico(fontSize: 28)),
            const SizedBox(),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                AnimatedSwitcher(
                  duration: PresentationConstants.animationDuration,
                  child: controller.homeStore.isDoingFasting
                      ? IconButton(
                          onPressed: () =>
                              controller.shareFasting(context: context),
                          icon: Icon(Icons.share),
                        )
                      : SizedBox.shrink(),
                ),
                ValueListenableBuilder<bool>(
                  valueListenable: isLoadingPlans,
                  builder: (context, value, child) {
                    return Visibility(
                      visible: !value,
                      child: IgnorePointer(
                        ignoring: controller.homeStore.isDoingFasting,
                        child: FilledButton(
                          onPressed: () => Modular.to
                              .pushNamed('fasting_setting')
                              .whenComplete(() => setState(() {})),
                          child: Row(
                            crossAxisAlignment: .start,
                            spacing: 6,
                            children: [
                              Text(
                                '${currentFastingPlan?.fastingPeriod.inHours}:${currentFastingPlan?.fastingRestPeriod.inHours}',
                              ),
                              Icon(Icons.edit),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            AnimatedSwitcher(
              duration: PresentationConstants.animationDuration,
              child: controller.homeStore.isDoingFasting
                  ? Center(
                      child: Column(
                        spacing: 12,
                        children: [
                          Icon(Icons.no_food, size: 72),
                          Text(
                            AppLocalizations.of(
                              context,
                            )!.homeFastingLayoutTimeRemainingTitle,
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(color: Colors.black),
                          ),
                          SlideCountdown(
                            streamDuration:
                                controller.homeStore.currentFastingTime,
                            countUp: false,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              color: Colors.deepPurple,
                            ),
                            onDone: () {
                              controller.onFinishedFasting();
                              controller.showDoneNotification(context: context);
                            },
                            onChanged: (value) {
                              if (controller.homeStore.isDoingFasting) {
                                // value is the remaining duration
                                final total = controller
                                    .homeStore
                                    .currentFastingModel
                                    .value
                                    .fastingPeriod;

                                // Elapsed = Total - Remaining
                                controller
                                    .homeStore
                                    .timeElapsedFasting
                                    .value = Duration(
                                  milliseconds: (total - value).inMilliseconds,
                                );
                              }
                            },
                          ),
                          Text(
                            AppLocalizations.of(
                              context,
                            )!.homeFastingLayoutTimeElapsedTitle,
                          ),
                          ValueListenableBuilder(
                            valueListenable:
                                controller.homeStore.timeElapsedFasting,
                            builder: (context, value, child) {
                              return Text(
                                '${controller.homeStore.timeElapsedFasting.value.inMinutes}m',
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  : _MountNotInRoutineLayout(),
            ),
            Visibility(
              visible: controller.homeStore.isDoingFasting,
              replacement: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () async {
                    await controller.startFasting().whenComplete(() {
                      if (context.mounted) {
                        setState(() {});

                        controller.showStartNotification(context: context);
                      }
                    });
                  },
                  child: Text(
                    AppLocalizations.of(
                      context,
                    )!.homeFastingLayoutStartFastingButton,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: Colors.white),
                  ),
                ),
              ),
              child: Column(
                spacing: 12,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {
                        setState(() {
                          if (controller.fastingStreamDuration?.isPaused ==
                              false) {
                            controller.pauseFasting();
                            controller.showPausedNotification(context: context);
                          } else {
                            controller.resumeFasting();
                          }
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStateColor.resolveWith(
                          (states) => Colors.indigo,
                        ),
                      ),
                      child: Text(
                        controller.fastingStreamDuration?.isPaused == false
                            ? AppLocalizations.of(
                                context,
                              )!.homeFastingLayoutPauseFastingButton
                            : AppLocalizations.of(
                                context,
                              )!.homeFastingLayoutResumeFastingButton,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () => showCancelFastingDialog(),
                      style: ButtonStyle(
                        backgroundColor: WidgetStateColor.resolveWith(
                          (states) => Colors.red,
                        ),
                      ),
                      child: Text(
                        AppLocalizations.of(
                          context,
                        )!.homeFastingLayoutCancelFastingButton,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _MountCurrentFastingRoutine(
              isFasting: controller.homeStore.isDoingFasting,
              fastingRoutineModel:
                  controller.homeStore.currentFastingModel.value,
            ),
            const SizedBox(),
            const _MountTipsSection(),
          ],
        ),
      ),
    );
  }

  void showCancelFastingDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          contentPadding: EdgeInsets.symmetric(
            vertical: 24.0,
            horizontal: 16.0,
          ),
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text(
                AppLocalizations.of(context)!.homeFastingCancelFastingBody,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      controller.cancelFasting();
                    });

                    controller.showCancelledNotification(context: context);

                    Navigator.pop(context);
                  },
                  child: Text(AppLocalizations.of(context)!.yesTitle),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(AppLocalizations.of(context)!.noTitle),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _MountNotInRoutineLayout extends StatelessWidget {
  const _MountNotInRoutineLayout();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        Icon(Icons.food_bank, size: 72),
        Text(
          AppLocalizations.of(context)!.homeFastingLayoutNotFasting,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}

class _MountCurrentFastingRoutine extends StatelessWidget {
  final bool isFasting;
  final FastingRoutineModel fastingRoutineModel;

  const _MountCurrentFastingRoutine({
    required this.isFasting,
    required this.fastingRoutineModel,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: PresentationConstants.animationDuration,
      child: isFasting
          ? Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: Colors.black54),
                    children: [
                      TextSpan(
                        text:
                            '${AppLocalizations.of(context)!.homeFastingLayoutFastingDateStart} \n',
                      ),
                      TextSpan(
                        text:
                            '${DateFormat('EEEE', Localizations.localeOf(context).languageCode).format(DateTime.now())}\n',
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall?.copyWith(color: Colors.black87),
                      ),
                      TextSpan(
                        text: DateFormat('HH:mm').format(DateTime.now()),
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall?.copyWith(color: Colors.black87),
                      ),
                    ],
                  ),
                ),
                RichText(
                  textAlign: TextAlign.end,
                  text: TextSpan(
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: Colors.black54),
                    children: [
                      TextSpan(
                        text:
                            '${AppLocalizations.of(context)!.homeFastingLayoutFastingDateEnd} \n',
                      ),
                      TextSpan(
                        text:
                            '${DateFormat('EEEE', Localizations.localeOf(context).languageCode).format(DateTime.now().add(fastingRoutineModel.fastingPeriod))}\n',
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall?.copyWith(color: Colors.black87),
                      ),
                      TextSpan(
                        text: DateFormat('HH:mm').format(
                          DateTime.now().add(fastingRoutineModel.fastingPeriod),
                        ),
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall?.copyWith(color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : const SizedBox.shrink(),
    );
  }
}

class _MountTipsSection extends StatelessWidget {
  const _MountTipsSection();

  List<HomeFastingLayoutTipsEnum> get tipsValue =>
      HomeFastingLayoutTipsEnum.values;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 12,
      children: [
        Row(
          spacing: 12,
          children: [
            Icon(Icons.tips_and_updates, color: Colors.purple, size: 24),
            Text(
              AppLocalizations.of(context)!.homeFastingLayoutTipsTitle,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade600,
              ),
              child: RichText(
                text: TextSpan(
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.white),
                  children: [
                    TextSpan(
                      text:
                          '${tipsValue[index].getTipsTitle(context: context)}: ',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: tipsValue[index].getTipsBody(context: context),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 12),
          itemCount: tipsValue.length,
        ),
      ],
    );
  }
}
