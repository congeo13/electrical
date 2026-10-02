import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'data/database.dart';
import 'data/database_scope.dart';
import 'l10n/app_localizations.dart';
import 'router.dart';

class ProtocolApp extends StatefulWidget {
  const ProtocolApp({super.key, required this.database});

  final AppDatabase database;

  @override
  State<ProtocolApp> createState() => _ProtocolAppState();
}

class _ProtocolAppState extends State<ProtocolApp> {
  late final GoRouter _router = createRouter();

  @override
  void dispose() {
    _router.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DatabaseScope(
      database: widget.database,
      child: MaterialApp.router(
        onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
        // Greek UI, English code.
        locale: const Locale('el'),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        theme: ThemeData(colorSchemeSeed: const Color(0xFF2E6B5E)),
        routerConfig: _router,
      ),
    );
  }
}
