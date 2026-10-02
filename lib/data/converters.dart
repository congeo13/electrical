import 'dart:convert';

import 'package:drift/drift.dart';

/// Stores a list of strings as a JSON array in a TEXT column.
///
/// Used for ordered free-text lists that have no identity of their own, such
/// as the execution cues of an exercise or the substances a spacing rule
/// keeps apart from a medication.
class StringListConverter extends TypeConverter<List<String>, String> {
  const StringListConverter();

  @override
  List<String> fromSql(String fromDb) =>
      (jsonDecode(fromDb) as List<dynamic>).cast<String>();

  @override
  String toSql(List<String> value) => jsonEncode(value);
}
