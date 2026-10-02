import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../../widgets/placeholder_screen.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return PlaceholderScreen(
      title: l10n.tabToday,
      description: l10n.todayPlaceholder,
    );
  }
}
