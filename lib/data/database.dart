import 'package:drift/drift.dart';

import 'converters.dart';
import 'tables.dart';

export 'tables.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    Protocols,
    ScheduleItems,
    Medications,
    SpacingRules,
    LogEntries,
    TrainingPlans,
    Exercises,
    IntervalCycles,
    IntervalBlocks,
    ErgSessions,
    Meals,
    MealLogs,
    Measurements,
    Corrections,
    Settings,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.executor);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) => m.createAll(),
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );

  /// The schema version SQLite reports for the opened file.
  Future<int> userVersion() =>
      customSelect('PRAGMA user_version')
          .map((row) => row.read<int>('user_version'))
          .getSingle();

  /// Names of the tables that actually exist in the opened database.
  Future<List<String>> tableNames() => customSelect(
    "SELECT name FROM sqlite_master "
    "WHERE type = 'table' AND name NOT LIKE 'sqlite_%' ORDER BY name",
  ).map((row) => row.read<String>('name')).get();
}
