import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'features/measurements/measurements_screen.dart';
import 'features/nutrition/nutrition_screen.dart';
import 'features/settings/settings_screen.dart';
import 'features/today/today_screen.dart';
import 'features/training/training_screen.dart';
import 'l10n/app_localizations.dart';

/// Route paths. One branch per bottom tab.
abstract final class AppRoutes {
  static const today = '/today';
  static const training = '/training';
  static const nutrition = '/nutrition';
  static const measurements = '/measurements';
  static const settings = '/settings';
}

GoRouter createRouter() => GoRouter(
  initialLocation: AppRoutes.today,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          AppShell(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.today,
              builder: (context, state) => const TodayScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.training,
              builder: (context, state) => const TrainingScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.nutrition,
              builder: (context, state) => const NutritionScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.measurements,
              builder: (context, state) => const MeasurementsScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.settings,
              builder: (context, state) => const SettingsScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);

/// The bottom navigation shell. Each tab keeps its own navigation stack.
class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.today_outlined),
            selectedIcon: const Icon(Icons.today),
            label: l10n.tabToday,
          ),
          NavigationDestination(
            icon: const Icon(Icons.fitness_center_outlined),
            selectedIcon: const Icon(Icons.fitness_center),
            label: l10n.tabTraining,
          ),
          NavigationDestination(
            icon: const Icon(Icons.restaurant_outlined),
            selectedIcon: const Icon(Icons.restaurant),
            label: l10n.tabNutrition,
          ),
          NavigationDestination(
            icon: const Icon(Icons.monitor_weight_outlined),
            selectedIcon: const Icon(Icons.monitor_weight),
            label: l10n.tabMeasurements,
          ),
          NavigationDestination(
            icon: const Icon(Icons.settings_outlined),
            selectedIcon: const Icon(Icons.settings),
            label: l10n.tabSettings,
          ),
        ],
      ),
    );
  }
}
