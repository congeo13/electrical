import 'package:drift/drift.dart';

import 'converters.dart';

// Schema for the Protocol app, following the data-model sketch in the spec.
//
// Configuration tables (schedule, medications, training, meals) carry a
// `protocolId`, so a future change of plan creates a new Protocol row and the
// logs recorded against the old one stay intact. Log tables reference the
// configuration row they belong to rather than the protocol directly.
//
// Times of day are stored as whole minutes after midnight. Doses are free text
// as written on the prescription; the app never computes or derives them.

/// A whole configuration. Only one is active at a time.
class Protocols extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 80)();
  BoolColumn get active => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

enum ScheduleItemKind {
  wake,
  medication,
  supplement,
  meal,
  training,
  habit,
  sleep,
}

/// One row of the hour-by-hour daily schedule.
class ScheduleItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get protocolId => integer().references(Protocols, #id)();
  TextColumn get kind => textEnum<ScheduleItemKind>()();
  TextColumn get label => text()();

  /// Minutes after midnight. Null when the item is positioned by
  /// [offsetFromWake] instead.
  IntColumn get time => integer().nullable()();

  /// Minutes after the configured wake time. Null when positioned by [time].
  IntColumn get offsetFromWake => integer().nullable()();
  BoolColumn get enabled => boolean().withDefault(const Constant(true))();
}

/// Whether an item is taken with food, on an empty stomach, or either.
enum FoodRule { withFood, emptyStomach, either }

/// A medication or supplement. The app reminds and logs; it never computes,
/// suggests or adjusts a dose, so [dose] is free text as prescribed.
class Medications extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get protocolId => integer().references(Protocols, #id)();
  TextColumn get name => text()();
  TextColumn get dose => text()();

  /// Minutes after midnight. Null until the user sets a time.
  IntColumn get time => integer().nullable()();
  TextColumn get foodRule => textEnum<FoodRule>()();
  IntColumn get spacingRuleId =>
      integer().nullable().references(SpacingRules, #id)();
  BoolColumn get enabled => boolean().withDefault(const Constant(true))();
}

/// A minimum gap between a medication and other substances.
class SpacingRules extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get description => text()();
  RealColumn get hours => real()();

  /// Names of the substances the gap applies to. Some of them (calcium,
  /// iron) are not medications in this database, hence a list, not a join.
  TextColumn get appliesTo => text().map(const StringListConverter())();
}

/// A tick on a schedule item. Ticking late records the actual time and is
/// not a failure.
class LogEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get itemId => integer().references(ScheduleItems, #id)();
  DateTimeColumn get scheduledAt => dateTime()();
  DateTimeColumn get completedAt => dateTime().nullable()();
  BoolColumn get skipped => boolean().withDefault(const Constant(false))();
}

/// One day of the weekly training plan.
class TrainingPlans extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get protocolId => integer().references(Protocols, #id)();

  /// 1 = Monday … 7 = Sunday, matching [DateTime.weekday].
  IntColumn get dayOfWeek => integer()();
  TextColumn get sessionName => text()();
  IntColumn get durationMin => integer()();
}

/// One exercise within a training session, with its cues and progression.
class Exercises extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get trainingPlanId => integer().references(TrainingPlans, #id)();
  IntColumn get position => integer()();
  TextColumn get name => text()();
  IntColumn get sets => integer().nullable()();

  /// Reps or hold time as written: "μέγιστο − 2", "8–10", "15–25΄΄".
  TextColumn get reps => text().nullable()();
  IntColumn get restSeconds => integer().nullable()();
  TextColumn get cues => text().map(const StringListConverter())();
  TextColumn get progression => text().nullable()();
  TextColumn get note => text().nullable()();
}

/// The 12-week interval cycle. Which block a date falls in is computed from
/// [startDate]; it is never stored per week.
class IntervalCycles extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get protocolId => integer().references(Protocols, #id)();
  DateTimeColumn get startDate => dateTime()();
  IntColumn get lengthWeeks => integer().withDefault(const Constant(12))();
}

/// One block (A, B, C, deload) of an interval cycle.
class IntervalBlocks extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get cycleId => integer().references(IntervalCycles, #id)();
  TextColumn get name => text()();
  IntColumn get weekFrom => integer()();
  IntColumn get weekTo => integer()();
  TextColumn get protocol => text()();
  IntColumn get warmUpMin => integer().nullable()();
  IntColumn get coolDownMin => integer().nullable()();
  TextColumn get damper => text().nullable()();
  TextColumn get strokeRate => text().nullable()();
  TextColumn get rpe => text().nullable()();

  /// Target split range, in seconds faster than the logged Zone 2 split.
  IntColumn get targetFasterBySecMin => integer().nullable()();
  IntColumn get targetFasterBySecMax => integer().nullable()();
}

/// A Concept2 session, typed in by hand.
class ErgSessions extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();

  /// Metres.
  IntColumn get distance => integer()();
  IntColumn get timeSec => integer()();

  /// Seconds per 500 m.
  RealColumn get splitSec => real()();
  IntColumn get spm => integer().nullable()();
  IntColumn get damper => integer().nullable()();
  TextColumn get note => text().nullable()();
}

/// Exact meals are weighed and carry their own macros. Portion meals are
/// dish types measured in palms and fists and carry no fixed numbers.
enum MealKind { exact, portion }

class Meals extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get protocolId => integer().references(Protocols, #id)();
  TextColumn get name => text()();
  TextColumn get kind => textEnum<MealKind>()();

  // Exact mode only. Null for portion-mode dish types.
  IntColumn get kcal => integer().nullable()();
  RealColumn get p => real().nullable()();
  RealColumn get c => real().nullable()();
  RealColumn get f => real().nullable()();

  // Portion mode only.
  TextColumn get defaultPortion => text().nullable()();
  TextColumn get requiredAddition => text().nullable()();
  TextColumn get warning => text().nullable()();

  BoolColumn get isUserCreated =>
      boolean().withDefault(const Constant(false))();
}

/// A logged meal. Calories are always a range; for an exact-mode meal the
/// bounds are equal, for a portion-mode meal they are never collapsed.
class MealLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
  IntColumn get mealId => integer().references(Meals, #id)();
  IntColumn get palms => integer().nullable()();
  IntColumn get fists => integer().nullable()();
  IntColumn get handfuls => integer().nullable()();
  IntColumn get thumbs => integer().nullable()();
  IntColumn get kcalMin => integer()();
  IntColumn get kcalMax => integer()();
  TextColumn get photoPath => text().nullable()();
}

enum MeasurementKind { weight, waist }

class Measurements extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
  TextColumn get kind => textEnum<MeasurementKind>()();
  RealColumn get value => real()();
}

/// A 3-week correction suggestion and whether it was accepted.
class Corrections extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
  RealColumn get deltaKg => real()();
  TextColumn get action => text()();
  BoolColumn get accepted => boolean().withDefault(const Constant(false))();
}

/// Key–value settings (wake time, targets, reminder switches, labels).
class Settings extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();

  @override
  Set<Column<Object>> get primaryKey => {key};
}
