# Protocol

A personal daily-routine app: medication and supplement reminders, a home
training programme, and a nutrition log. Flutter, local SQLite (drift), no
backend. Greek UI, English code.

The app is a reminder and a log. **It never gives medical advice, never
suggests a dose change, and never computes a dose.**

## Status

| Slice | Scope | State |
| --- | --- | --- |
| 0.1 | Flutter skeleton, navigation shell, drift schema, Greek localisation | done |
| 0.2 | Seed data as editable defaults, Settings screen | next |

## Layout

```
lib/
  main.dart                 entry point, opens the database
  app.dart                  MaterialApp.router, Greek locale, theme
  router.dart               go_router shell with five tabs
  data/
    tables.dart             drift table definitions (the data model)
    database.dart           AppDatabase, migrations, schema introspection
    connection.dart         on-device SQLite file via drift_flutter
    database_scope.dart     InheritedWidget exposing the database
  features/<tab>/           one screen per tab
  l10n/app_el.arb           all user-facing strings (Greek)
  widgets/                  shared widgets
test/                       database and navigation tests
docs/verification/          what was run and seen for each slice
```

## Working on it

```sh
flutter pub get
dart run build_runner build --delete-conflicting-outputs   # after editing lib/data/tables.dart
flutter gen-l10n                                            # after editing lib/l10n/app_el.arb
flutter analyze
flutter test
flutter run                                                 # iOS simulator, Android, or Linux desktop
```

Generated files (`lib/data/database.g.dart`, `lib/l10n/app_localizations*.dart`)
are committed so a fresh checkout builds without a codegen step; regenerate
them after changing their sources.

The `linux/` target exists for running the app on a desktop during
development and verification. iOS and Android are the shipping targets.
