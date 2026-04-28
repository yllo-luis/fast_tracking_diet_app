import 'package:fast_tracking_diet_app/domain/entity/local_kcal_routine_model.dart';
import 'package:fast_tracking_diet_app/presentation/presentation_utils/presentation_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../../app/l10n/app_localizations.dart';
import '../../../../utils/enums/kcal_type_enum.dart';
import '../../../presentation_utils/widgets/bullet_list_widget.dart';
import '../controller/home_controller.dart';

class KCalRegistryModel {
  final TextEditingController kcalName;
  final TextEditingController kcalDescription;
  final TextEditingController kcalQuantity;
  final List<KcalTypeEnum> kcalType;
  final TextEditingController kcalDate;

  KCalRegistryModel({
    required this.kcalName,
    required this.kcalDescription,
    required this.kcalQuantity,
    required this.kcalType,
    required this.kcalDate,
  });
}

class KcalRegistryView extends StatefulWidget {
  const KcalRegistryView({super.key});

  @override
  State<KcalRegistryView> createState() => _KcalRegistryViewState();
}

class _KcalRegistryViewState extends State<KcalRegistryView> {
  final controller = Modular.get<HomeController>();

  final ValueNotifier<List<LocalKcalRoutineModel>> localKcalRegistry =
      ValueNotifier(List.empty(growable: true));

  final GlobalKey<FormState> formState = GlobalKey<FormState>();

  final ValueNotifier<bool> isSavingData = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () =>
                  _mountNewKcalRegistryDialog(context, genNewRegistryModel()),
              icon: Icon(Icons.plus_one),
            ),
          ],
        ),
        bottomSheet: Container(
          width: double.infinity,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 28.0),
          child: ValueListenableBuilder(
            valueListenable: isSavingData,
            builder: (context, value, child) {
              return value == false ? FilledButton(
                onPressed: () {
                  localKcalRegistry.value.forEach((element) async {
                    await controller.createKcalRoutine(localKcalModel: element);
                  },);

                  Navigator.pop(context);
                },
                child: Text(
                  AppLocalizations.of(context)!.homeFastingRegistryButton,
                ),
              ) : const CircularProgressIndicator();
            }
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ValueListenableBuilder<List<LocalKcalRoutineModel>>(
              valueListenable: localKcalRegistry,
              builder: (context, value, child) {
                return AnimatedSwitcher(
                  duration: PresentationConstants.animationDuration,
                  child: value.isEmpty
                      ? _MountNoFormRegistry(
                          onTap: () => _mountNewKcalRegistryDialog(
                            context,
                            genNewRegistryModel(),
                          ),
                        )
                      : _MountListViewKcalRegistry(kcalRegistries: value),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  KCalRegistryModel genNewRegistryModel() {
    return KCalRegistryModel(
      kcalName: TextEditingController(),
      kcalDescription: TextEditingController(),
      kcalQuantity: TextEditingController(),
      kcalType: KcalTypeEnum.values,
      kcalDate: TextEditingController(),
    );
  }

  void _mountNewKcalRegistryDialog(
    BuildContext context,
    KCalRegistryModel registryModel,
  ) {
    final ValueNotifier<KcalTypeEnum> selectedKcalType = ValueNotifier(
      KcalTypeEnum.breakfast,
    );

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
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Form(
                key: formState,
                child: Column(
                  spacing: 12,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: BulletListWidget(
                        texts: [
                          AppLocalizations.of(
                            context,
                          )!.homeFastingRegistryTip01,
                          AppLocalizations.of(
                            context,
                          )!.homeFastingRegistryTip02,
                          AppLocalizations.of(
                            context,
                          )!.homeFastingRegistryTip03,
                        ],
                      ),
                    ),
                    TextFormField(
                      controller: registryModel.kcalName,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context)!.errorValueTitle;
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(
                          context,
                        )!.homeFastingRegistryName,
                      ),
                    ),
                    TextFormField(
                      controller: registryModel.kcalQuantity,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context)!.errorValueTitle;
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(
                          context,
                        )!.homeFastingRegistryQuantity,
                      ),
                    ),
                    TextFormField(
                      controller: registryModel.kcalDate,
                      onEditingComplete: () {},
                      inputFormatters: [
                        MaskTextInputFormatter(mask: "##/##/####"),
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context)!.errorValueTitle;
                        }

                        final components = value.split("/");
                        if (components.length == 3) {
                          final day = int.tryParse(components[0]);
                          final month = int.tryParse(components[1]);
                          final year = int.tryParse(components[2]);
                          if (day != null && month != null && year != null) {
                            final date = DateTime(year, month, day);
                            if (date.year == year &&
                                date.month == month &&
                                date.day == day) {
                              return null;
                            }
                          }
                        }
                        return AppLocalizations.of(context)!.errorValueTitle;
                      },
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(
                          context,
                        )!.homeFastingRegistryDate,
                      ),
                    ),
                    ValueListenableBuilder<KcalTypeEnum>(
                      valueListenable: selectedKcalType,
                      builder: (context, value, _) {
                        return DropdownButtonFormField<KcalTypeEnum>(
                          initialValue: value,
                          items: KcalTypeEnum.values.map((type) {
                            return DropdownMenuItem(
                              value: type,
                              child: Text(
                                type.getKcalTypeLabel(context: context),
                              ),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            if (newValue != null) {
                              selectedKcalType.value = newValue;
                            }
                          },
                          decoration: InputDecoration(
                            hintText: AppLocalizations.of(
                              context,
                            )!.homeFastingRegistryType,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            FilledButton(
              onPressed: () {
                if (formState.currentState?.validate() == true) {
                  localKcalRegistry.value = List.from(localKcalRegistry.value)
                    ..add(
                      LocalKcalRoutineModel(
                        kcalName: registryModel.kcalName.text,
                        kcalQuantity: int.parse(registryModel.kcalQuantity.text),
                        kcalType: selectedKcalType.value
                            .getKcalTypeForDatabase(),
                        kcalDate: DateTime.tryParse(
                          genDateFromString(registryModel.kcalDate.text),
                        ),
                        userId: controller.homeStore.currentUser.value!.id,
                      ),
                    );
                  Navigator.pop(context);
                }
              },
              child: Text(
                AppLocalizations.of(context)!.homeFastingRegistryButton,
              ),
            ),
          ],
        );
      },
    );
  }

  String genDateFromString(String dateString) {
    final components = dateString.split("/");
    if (components.length == 3) {
      final day = int.tryParse(components[0]);
      final month = int.tryParse(components[1]);
      final year = int.tryParse(components[2]);
      if (day != null && month != null && year != null) {
        final date = DateTime(year, month, day);
        if (date.year == year && date.month == month && date.day == day) {
          return date.toIso8601String();
        }
      }
    }

    return DateTime.now().toIso8601String();
  }
}

class _MountNoFormRegistry extends StatelessWidget {
  final Function onTap;

  const _MountNoFormRegistry({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        spacing: 12,
        children: [
          Icon(Icons.tips_and_updates, color: Colors.deepPurple, size: 92),
          Text(
            AppLocalizations.of(
              context,
            )!.homeFastingKcalRegistryNoRegistryMessage,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Colors.black),
            textAlign: TextAlign.center,
          ),
          FilledButton(
            onPressed: () => onTap(),
            child: Text(
              AppLocalizations.of(context)!.homeFastingKcalRegistryButton,
            ),
          ),
        ],
      ),
    );
  }
}

class _MountListViewKcalRegistry extends StatelessWidget {
  final List<LocalKcalRoutineModel> kcalRegistries;

  const _MountListViewKcalRegistry({required this.kcalRegistries});

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

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 8.0, left: 4.0),
              child: Text(
                date,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            ...items.map(
              (item) => Card(
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
