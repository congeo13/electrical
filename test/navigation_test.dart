import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:protocol_app/app.dart';
import 'package:protocol_app/data/database.dart';

void main() {
  late AppDatabase db;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
  });

  tearDown(() => db.close());

  Future<void> pumpApp(WidgetTester tester) async {
    await tester.pumpWidget(ProtocolApp(database: db));
    await tester.pumpAndSettle();
  }

  /// Taps the bottom-bar destination carrying [label].
  Future<void> openTab(WidgetTester tester, String label) async {
    final destination = find.descendant(
      of: find.byType(NavigationBar),
      matching: find.text(label),
    );
    expect(destination, findsOneWidget);
    await tester.tap(destination);
    await tester.pumpAndSettle();
  }

  testWidgets('opens on Today with Greek labels in the bottom bar', (
    tester,
  ) async {
    await pumpApp(tester);

    expect(find.byType(NavigationBar), findsOneWidget);
    for (final label in [
      'Σήμερα',
      'Προπόνηση',
      'Διατροφή',
      'Μετρήσεις',
      'Ρυθμίσεις',
    ]) {
      expect(
        find.descendant(
          of: find.byType(NavigationBar),
          matching: find.text(label),
        ),
        findsOneWidget,
      );
    }
    expect(find.widgetWithText(AppBar, 'Σήμερα'), findsOneWidget);
    expect(
      find.text('Εδώ θα εμφανίζεται το πρόγραμμα της ημέρας, ώρα προς ώρα.'),
      findsOneWidget,
    );
  });

  testWidgets('every tab is reachable and shows its own screen', (
    tester,
  ) async {
    await pumpApp(tester);

    await openTab(tester, 'Προπόνηση');
    expect(find.widgetWithText(AppBar, 'Προπόνηση'), findsOneWidget);
    expect(
      find.text(
        'Εδώ θα εμφανίζεται το εβδομαδιαίο πλάνο και η σημερινή προπόνηση.',
      ),
      findsOneWidget,
    );

    await openTab(tester, 'Διατροφή');
    expect(find.widgetWithText(AppBar, 'Διατροφή'), findsOneWidget);
    expect(
      find.text('Εδώ θα καταγράφονται τα γεύματα και τα ημερήσια σύνολα.'),
      findsOneWidget,
    );

    await openTab(tester, 'Μετρήσεις');
    expect(find.widgetWithText(AppBar, 'Μετρήσεις'), findsOneWidget);
    expect(
      find.text('Εδώ θα καταγράφονται το βάρος και η περίμετρος μέσης.'),
      findsOneWidget,
    );

    await openTab(tester, 'Ρυθμίσεις');
    expect(find.widgetWithText(AppBar, 'Ρυθμίσεις'), findsOneWidget);

    await openTab(tester, 'Σήμερα');
    expect(find.widgetWithText(AppBar, 'Σήμερα'), findsOneWidget);
  });

  testWidgets('Settings reports the migrated schema from the live database', (
    tester,
  ) async {
    await pumpApp(tester);
    await openTab(tester, 'Ρυθμίσεις');

    expect(find.text('Βάση δεδομένων'), findsOneWidget);
    expect(find.text('Έκδοση σχήματος 1 · 15 πίνακες'), findsOneWidget);
  });

  testWidgets('placeholder screens offer no actions', (tester) async {
    await pumpApp(tester);
    for (final label in ['Σήμερα', 'Προπόνηση', 'Διατροφή', 'Μετρήσεις']) {
      await openTab(tester, label);
      expect(find.byType(ButtonStyleButton), findsNothing);
      expect(find.byType(FloatingActionButton), findsNothing);
    }
  });
}
