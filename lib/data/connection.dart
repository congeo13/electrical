import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

/// Opens the on-device SQLite file. All data stays on the phone.
QueryExecutor openConnection() => driftDatabase(name: 'protocol');
