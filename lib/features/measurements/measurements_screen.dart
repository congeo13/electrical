import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../../widgets/placeholder_screen.dart';

class MeasurementsScreen extends StatelessWidget {
  const MeasurementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return PlaceholderScreen(
      title: l10n.tabMeasurements,
      description: l10n.measurementsPlaceholder,
    );
  }
}
