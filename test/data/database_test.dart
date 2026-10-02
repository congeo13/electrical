import 'package:drift/drift.dart' hide isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:protocol_app/data/database.dart';

void main() {
  late AppDatabase db;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
  });

  tearDown(() => db.close());

  test('creates every table of the data model at schema version 1', () async {
    expect(await db.userVersion(), 1);
    expect(
      await db.tableNames(),
      containsAll(<String>[
        'protocols',
        'schedule_items',
        'medications',
        'spacing_rules',
        'log_entries',
        'training_plans',
        'exercises',
        'interval_cycles',
        'interval_blocks',
        'erg_sessions',
        'meals',
        'meal_logs',
        'measurements',
        'corrections',
        'settings',
      ]),
    );
  });

  test('persists a protocol with a schedule item and a medication', () async {
    final protocolId = await db
        .into(db.protocols)
        .insert(
          ProtocolsCompanion.insert(name: 'Default', active: const Value(true)),
        );

    await db
        .into(db.scheduleItems)
        .insert(
          ScheduleItemsCompanion.insert(
            protocolId: protocolId,
            kind: ScheduleItemKind.medication,
            label: 'Λεβοθυροξίνη',
            offsetFromWake: const Value(0),
          ),
        );
    await db
        .into(db.medications)
        .insert(
          MedicationsCompanion.insert(
            protocolId: protocolId,
            name: 'Λεβοθυροξίνη',
            dose: '150 mcg',
            foodRule: FoodRule.emptyStomach,
          ),
        );

    final items = await db.select(db.scheduleItems).get();
    expect(items.single.label, 'Λεβοθυροξίνη');
    expect(items.single.kind, ScheduleItemKind.medication);
    expect(items.single.time, isNull);
    expect(items.single.offsetFromWake, 0);

    final meds = await db.select(db.medications).get();
    expect(meds.single.dose, '150 mcg');
    expect(meds.single.foodRule, FoodRule.emptyStomach);
    expect(meds.single.enabled, isTrue);
  });

  test('enforces foreign keys', () async {
    expect(
      () => db
          .into(db.scheduleItems)
          .insert(
            ScheduleItemsCompanion.insert(
              protocolId: 999,
              kind: ScheduleItemKind.meal,
              label: 'Πρωινό',
            ),
          ),
      throwsA(isA<SqliteException>()),
    );
  });

  test('round-trips string lists through the JSON converter', () async {
    final protocolId = await db
        .into(db.protocols)
        .insert(ProtocolsCompanion.insert(name: 'Default'));
    final planId = await db
        .into(db.trainingPlans)
        .insert(
          TrainingPlansCompanion.insert(
            protocolId: protocolId,
            dayOfWeek: DateTime.monday,
            sessionName: 'Ώθηση & κορμός',
            durationMin: 30,
          ),
        );
    const cues = ['Χέρια λίγο πιο έξω από τους ώμους', 'Αγκώνες περίπου 45°'];
    await db
        .into(db.exercises)
        .insert(
          ExercisesCompanion.insert(
            trainingPlanId: planId,
            position: 0,
            name: 'Push-ups',
            sets: const Value(4),
            reps: const Value('μέγιστο − 2'),
            restSeconds: const Value(60),
            cues: cues,
          ),
        );

    final exercise = (await db.select(db.exercises).get()).single;
    expect(exercise.cues, cues);
    expect(exercise.reps, 'μέγιστο − 2');
  });

  test('settings use the key as primary key', () async {
    await db
        .into(db.settings)
        .insert(SettingsCompanion.insert(key: 'wakeTime', value: '06:15'));
    await db
        .into(db.settings)
        .insertOnConflictUpdate(
          SettingsCompanion.insert(key: 'wakeTime', value: '07:15'),
        );
    final rows = await db.select(db.settings).get();
    expect(rows.single.value, '07:15');
  });
}
