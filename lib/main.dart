import 'package:flutter/material.dart';

import 'app.dart';
import 'data/connection.dart';
import 'data/database.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final database = AppDatabase(openConnection());
  runApp(ProtocolApp(database: database));
}
