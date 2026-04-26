import 'package:flutter/material.dart';

import '../../../../presentation_utils/presentation_constants.dart';

class FastingComponent extends StatelessWidget {
  const FastingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
        child: Column(
          crossAxisAlignment: .center,
          spacing: 16,
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                AnimatedSwitcher(
                  duration: PresentationConstants.animationDuration,
                  child: const SizedBox.shrink(),
                ),
                FilledButton(
                  onPressed: () => null,
                  child: Row(
                    crossAxisAlignment: .start,
                    spacing: 6,
                    children: [Text('16:8'), Icon(Icons.edit)],
                  ),
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
                    'Sem jejum',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    'Tempo desde o último jejum',
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
                  'Iniciar jejum',
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
                  'Pausar jejum',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
