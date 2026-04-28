import 'package:fast_tracking_diet_app/domain/entity/local_user_model.dart';
import 'package:fast_tracking_diet_app/presentation/modules/home/controller/home_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfileViewComponent extends StatefulWidget {
  const ProfileViewComponent({super.key});

  @override
  State<ProfileViewComponent> createState() => _ProfileViewComponentState();
}

class _ProfileViewComponentState extends State<ProfileViewComponent> {
  final controller = Modular.get<HomeController>();

  User? get currentLoggedUser => controller.firebaseAuthService.currentUser;

  ValueNotifier<bool> isDarkModeEnabled = ValueNotifier(false);

  ValueNotifier<LocalUserModel?> get localUser =>
      controller.homeStore.currentUser;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.getFastingHistory();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0),
          child: Column(
            spacing: 12,
            children: [
              const CircleAvatar(
                minRadius: 52,
                child: Icon(Icons.supervised_user_circle, size: 72),
              ),
              Text('Perfil', style: Theme.of(context).textTheme.bodyLarge),
              ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: 12),
                children: [
                  ListTile(
                    title: Text('Nome de usuário'),
                    subtitle: Text(currentLoggedUser?.email ?? ''),
                  ),
                  const SizedBox(height: 12, child: Center(child: Divider())),
                  ListTile(
                    title: Text('Jejuns feitos até o momento'),
                    subtitle: Text(
                      (controller.homeStore.fastingHistory.value.length)
                          .toString(),
                    ),
                  ),
                  const SizedBox(height: 12, child: Center(child: Divider())),
                  ValueListenableBuilder(
                    valueListenable: localUser,
                    builder: (context, value, child) {
                      return ListTile(
                        title: Text('Meta de calorias'),
                        subtitle: value?.kcalTarget == null
                            ? Text('Não definido')
                            : Text((value?.kcalTarget ?? 1600).toString()),
                        onTap: () => _showUpdateKcalDialog(),
                      );
                    },
                  ),
                  const SizedBox(height: 12, child: Center(child: Divider())),
                  Visibility(
                    visible: false,
                    child: ValueListenableBuilder(
                      valueListenable: isDarkModeEnabled,
                      builder: (context, value, child) {
                        return ListTile(
                          title: Text('Ativar Dark Mode?'),
                          trailing: Switch(
                            value: value,
                            onChanged: (value) {
                              isDarkModeEnabled.value = value;
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showUpdateKcalDialog() {
    final textController = TextEditingController(
      text: (controller.homeStore.currentUser.value?.kcalTarget ?? 1600)
          .toString(),
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Atualizar Meta de Calorias'),
          content: TextField(
            controller: textController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Nova meta (kcal)',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            FilledButton(
              onPressed: () async {
                final newValue = int.tryParse(textController.text);
                if (newValue != null) {
                  await controller.updateKcalTarget(newValue);
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                }
              },
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }
}
