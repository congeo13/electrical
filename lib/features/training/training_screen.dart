import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../../widgets/placeholder_screen.dart';

class TrainingScreen extends StatelessWidget {
  const TrainingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return PlaceholderScreen(
      title: l10n.tabTraining,
      description: l10n.trainingPlaceholder,
    );
  }
}
