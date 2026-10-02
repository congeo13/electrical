import 'package:flutter/material.dart';

import '../../data/database.dart';
import '../../data/database_scope.dart';
import '../../l10n/app_localizations.dart';

/// Settings. In this slice it only reports the state of the local database;
/// the editable configuration arrives in the next slice.
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.tabSettings)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            l10n.settingsPlaceholder,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          DatabaseStatusCard(database: DatabaseScope.of(context)),
        ],
      ),
    );
  }
}

/// What the live database reports about itself.
class DatabaseStatus {
  const DatabaseStatus({required this.schemaVersion, required this.tableCount});

  final int schemaVersion;
  final int tableCount;
}

/// Reads the schema version and table count back from SQLite.
///
/// A failed read is shown as an error, never as an empty card.
class DatabaseStatusCard extends StatefulWidget {
  const DatabaseStatusCard({super.key, required this.database});

  final AppDatabase database;

  @override
  State<DatabaseStatusCard> createState() => _DatabaseStatusCardState();
}

class _DatabaseStatusCardState extends State<DatabaseStatusCard> {
  late Future<DatabaseStatus> _status;

  @override
  void initState() {
    super.initState();
    _status = _load();
  }

  Future<DatabaseStatus> _load() async {
    final version = await widget.database.userVersion();
    final tables = await widget.database.tableNames();
    return DatabaseStatus(schemaVersion: version, tableCount: tables.length);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;
    return Card(
      child: FutureBuilder<DatabaseStatus>(
        future: _status,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ListTile(
              leading: Icon(Icons.error_outline, color: scheme.error),
              title: Text(l10n.databaseSectionTitle),
              subtitle: Text(l10n.databaseError('${snapshot.error}')),
            );
          }
          final status = snapshot.data;
          if (status == null) {
            return ListTile(
              leading: const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
              title: Text(l10n.databaseSectionTitle),
              subtitle: Text(l10n.databaseChecking),
            );
          }
          return ListTile(
            leading: const Icon(Icons.storage_outlined),
            title: Text(l10n.databaseSectionTitle),
            subtitle: Text(
              l10n.databaseReady(status.schemaVersion, status.tableCount),
            ),
          );
        },
      ),
    );
  }
}
