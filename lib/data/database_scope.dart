import 'package:flutter/widgets.dart';

import 'database.dart';

/// Makes the single [AppDatabase] available to the widget tree.
class DatabaseScope extends InheritedWidget {
  const DatabaseScope({
    super.key,
    required this.database,
    required super.child,
  });

  final AppDatabase database;

  static AppDatabase of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<DatabaseScope>();
    assert(scope != null, 'No DatabaseScope found above this widget.');
    return scope!.database;
  }

  @override
  bool updateShouldNotify(DatabaseScope oldWidget) =>
      oldWidget.database != database;
}
