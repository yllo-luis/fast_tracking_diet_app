import 'package:fast_tracking_diet_app/app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  child: const SizedBox.shrink(),
                ),
                ValueListenableBuilder<bool>(
                  valueListenable: isLoadingPlans,
                  builder: (context, value, child) {
                    return Visibility(
                      visible: !value,
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
                    );
                  },
                ),
              ],
            ),
            AnimatedSwitcher(
              duration: PresentationConstants.animationDuration,
              child: Column(
                spacing: 12,
                children: [
                  Icon(Icons.food_bank, size: 72),
                  Text(
                    AppLocalizations.of(context)!.homeFastingLayoutNotFasting,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    AppLocalizations.of(
                      context,
                    )!.homeFastingLayoutTimeSinceLastFasting,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text('0m', style: Theme.of(context).textTheme.displayLarge),
                  const SizedBox(height: 24),
                  IconButton(
                    onPressed: () => null,
                    icon: Icon(Icons.info, size: 64),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () => null,
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
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () => null,
                style: ButtonStyle(
                  backgroundColor: WidgetStateColor.resolveWith(
                    (states) => Colors.indigo,
                  ),
                ),
                child: Text(
                  AppLocalizations.of(
                    context,
                  )!.homeFastingLayoutPauseFastingButton,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.white),
                ),
              ),
            ),
            _MountCurrentFastingRoutine(),
            const SizedBox(),
            const _MountTipsSection(),
          ],
        ),
      ),
    );
  }
}

class _MountCurrentFastingRoutine extends StatelessWidget {
  const _MountCurrentFastingRoutine({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
                text: 'Hoje \n',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: Colors.black87),
              ),
              TextSpan(
                text: '19:40',
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
                text: 'Amanhã \n',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: Colors.black87),
              ),
              TextSpan(
                text: '11:40',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: Colors.black87),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MountTipsSection extends StatelessWidget {
  const _MountTipsSection({super.key});

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
