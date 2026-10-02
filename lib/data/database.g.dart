// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ProtocolsTable extends Protocols
    with TableInfo<$ProtocolsTable, Protocol> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProtocolsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 80,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
    'active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("active" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, active, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'protocols';
  @override
  VerificationContext validateIntegrity(
    Insertable<Protocol> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('active')) {
      context.handle(
        _activeMeta,
        active.isAcceptableOrUnknown(data['active']!, _activeMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Protocol map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Protocol(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      active: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}active'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ProtocolsTable createAlias(String alias) {
    return $ProtocolsTable(attachedDatabase, alias);
  }
}

class Protocol extends DataClass implements Insertable<Protocol> {
  final int id;
  final String name;
  final bool active;
  final DateTime createdAt;
  const Protocol({
    required this.id,
    required this.name,
    required this.active,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['active'] = Variable<bool>(active);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ProtocolsCompanion toCompanion(bool nullToAbsent) {
    return ProtocolsCompanion(
      id: Value(id),
      name: Value(name),
      active: Value(active),
      createdAt: Value(createdAt),
    );
  }

  factory Protocol.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Protocol(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      active: serializer.fromJson<bool>(json['active']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'active': serializer.toJson<bool>(active),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Protocol copyWith({
    int? id,
    String? name,
    bool? active,
    DateTime? createdAt,
  }) => Protocol(
    id: id ?? this.id,
    name: name ?? this.name,
    active: active ?? this.active,
    createdAt: createdAt ?? this.createdAt,
  );
  Protocol copyWithCompanion(ProtocolsCompanion data) {
    return Protocol(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      active: data.active.present ? data.active.value : this.active,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Protocol(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('active: $active, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, active, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Protocol &&
          other.id == this.id &&
          other.name == this.name &&
          other.active == this.active &&
          other.createdAt == this.createdAt);
}

class ProtocolsCompanion extends UpdateCompanion<Protocol> {
  final Value<int> id;
  final Value<String> name;
  final Value<bool> active;
  final Value<DateTime> createdAt;
  const ProtocolsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.active = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ProtocolsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.active = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Protocol> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<bool>? active,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (active != null) 'active': active,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ProtocolsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<bool>? active,
    Value<DateTime>? createdAt,
  }) {
    return ProtocolsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      active: active ?? this.active,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProtocolsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('active: $active, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ScheduleItemsTable extends ScheduleItems
    with TableInfo<$ScheduleItemsTable, ScheduleItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ScheduleItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _protocolIdMeta = const VerificationMeta(
    'protocolId',
  );
  @override
  late final GeneratedColumn<int> protocolId = GeneratedColumn<int>(
    'protocol_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES protocols (id)',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<ScheduleItemKind, String> kind =
      GeneratedColumn<String>(
        'kind',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<ScheduleItemKind>($ScheduleItemsTable.$converterkind);
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
    'label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<int> time = GeneratedColumn<int>(
    'time',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _offsetFromWakeMeta = const VerificationMeta(
    'offsetFromWake',
  );
  @override
  late final GeneratedColumn<int> offsetFromWake = GeneratedColumn<int>(
    'offset_from_wake',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _enabledMeta = const VerificationMeta(
    'enabled',
  );
  @override
  late final GeneratedColumn<bool> enabled = GeneratedColumn<bool>(
    'enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    protocolId,
    kind,
    label,
    time,
    offsetFromWake,
    enabled,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'schedule_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<ScheduleItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('protocol_id')) {
      context.handle(
        _protocolIdMeta,
        protocolId.isAcceptableOrUnknown(data['protocol_id']!, _protocolIdMeta),
      );
    } else if (isInserting) {
      context.missing(_protocolIdMeta);
    }
    if (data.containsKey('label')) {
      context.handle(
        _labelMeta,
        label.isAcceptableOrUnknown(data['label']!, _labelMeta),
      );
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
        _timeMeta,
        time.isAcceptableOrUnknown(data['time']!, _timeMeta),
      );
    }
    if (data.containsKey('offset_from_wake')) {
      context.handle(
        _offsetFromWakeMeta,
        offsetFromWake.isAcceptableOrUnknown(
          data['offset_from_wake']!,
          _offsetFromWakeMeta,
        ),
      );
    }
    if (data.containsKey('enabled')) {
      context.handle(
        _enabledMeta,
        enabled.isAcceptableOrUnknown(data['enabled']!, _enabledMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ScheduleItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ScheduleItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      protocolId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}protocol_id'],
      )!,
      kind: $ScheduleItemsTable.$converterkind.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}kind'],
        )!,
      ),
      label: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label'],
      )!,
      time: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}time'],
      ),
      offsetFromWake: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}offset_from_wake'],
      ),
      enabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}enabled'],
      )!,
    );
  }

  @override
  $ScheduleItemsTable createAlias(String alias) {
    return $ScheduleItemsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<ScheduleItemKind, String, String> $converterkind =
      const EnumNameConverter<ScheduleItemKind>(ScheduleItemKind.values);
}

class ScheduleItem extends DataClass implements Insertable<ScheduleItem> {
  final int id;
  final int protocolId;
  final ScheduleItemKind kind;
  final String label;

  /// Minutes after midnight. Null when the item is positioned by
  /// [offsetFromWake] instead.
  final int? time;

  /// Minutes after the configured wake time. Null when positioned by [time].
  final int? offsetFromWake;
  final bool enabled;
  const ScheduleItem({
    required this.id,
    required this.protocolId,
    required this.kind,
    required this.label,
    this.time,
    this.offsetFromWake,
    required this.enabled,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['protocol_id'] = Variable<int>(protocolId);
    {
      map['kind'] = Variable<String>(
        $ScheduleItemsTable.$converterkind.toSql(kind),
      );
    }
    map['label'] = Variable<String>(label);
    if (!nullToAbsent || time != null) {
      map['time'] = Variable<int>(time);
    }
    if (!nullToAbsent || offsetFromWake != null) {
      map['offset_from_wake'] = Variable<int>(offsetFromWake);
    }
    map['enabled'] = Variable<bool>(enabled);
    return map;
  }

  ScheduleItemsCompanion toCompanion(bool nullToAbsent) {
    return ScheduleItemsCompanion(
      id: Value(id),
      protocolId: Value(protocolId),
      kind: Value(kind),
      label: Value(label),
      time: time == null && nullToAbsent ? const Value.absent() : Value(time),
      offsetFromWake: offsetFromWake == null && nullToAbsent
          ? const Value.absent()
          : Value(offsetFromWake),
      enabled: Value(enabled),
    );
  }

  factory ScheduleItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ScheduleItem(
      id: serializer.fromJson<int>(json['id']),
      protocolId: serializer.fromJson<int>(json['protocolId']),
      kind: $ScheduleItemsTable.$converterkind.fromJson(
        serializer.fromJson<String>(json['kind']),
      ),
      label: serializer.fromJson<String>(json['label']),
      time: serializer.fromJson<int?>(json['time']),
      offsetFromWake: serializer.fromJson<int?>(json['offsetFromWake']),
      enabled: serializer.fromJson<bool>(json['enabled']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'protocolId': serializer.toJson<int>(protocolId),
      'kind': serializer.toJson<String>(
        $ScheduleItemsTable.$converterkind.toJson(kind),
      ),
      'label': serializer.toJson<String>(label),
      'time': serializer.toJson<int?>(time),
      'offsetFromWake': serializer.toJson<int?>(offsetFromWake),
      'enabled': serializer.toJson<bool>(enabled),
    };
  }

  ScheduleItem copyWith({
    int? id,
    int? protocolId,
    ScheduleItemKind? kind,
    String? label,
    Value<int?> time = const Value.absent(),
    Value<int?> offsetFromWake = const Value.absent(),
    bool? enabled,
  }) => ScheduleItem(
    id: id ?? this.id,
    protocolId: protocolId ?? this.protocolId,
    kind: kind ?? this.kind,
    label: label ?? this.label,
    time: time.present ? time.value : this.time,
    offsetFromWake: offsetFromWake.present
        ? offsetFromWake.value
        : this.offsetFromWake,
    enabled: enabled ?? this.enabled,
  );
  ScheduleItem copyWithCompanion(ScheduleItemsCompanion data) {
    return ScheduleItem(
      id: data.id.present ? data.id.value : this.id,
      protocolId: data.protocolId.present
          ? data.protocolId.value
          : this.protocolId,
      kind: data.kind.present ? data.kind.value : this.kind,
      label: data.label.present ? data.label.value : this.label,
      time: data.time.present ? data.time.value : this.time,
      offsetFromWake: data.offsetFromWake.present
          ? data.offsetFromWake.value
          : this.offsetFromWake,
      enabled: data.enabled.present ? data.enabled.value : this.enabled,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ScheduleItem(')
          ..write('id: $id, ')
          ..write('protocolId: $protocolId, ')
          ..write('kind: $kind, ')
          ..write('label: $label, ')
          ..write('time: $time, ')
          ..write('offsetFromWake: $offsetFromWake, ')
          ..write('enabled: $enabled')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, protocolId, kind, label, time, offsetFromWake, enabled);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ScheduleItem &&
          other.id == this.id &&
          other.protocolId == this.protocolId &&
          other.kind == this.kind &&
          other.label == this.label &&
          other.time == this.time &&
          other.offsetFromWake == this.offsetFromWake &&
          other.enabled == this.enabled);
}

class ScheduleItemsCompanion extends UpdateCompanion<ScheduleItem> {
  final Value<int> id;
  final Value<int> protocolId;
  final Value<ScheduleItemKind> kind;
  final Value<String> label;
  final Value<int?> time;
  final Value<int?> offsetFromWake;
  final Value<bool> enabled;
  const ScheduleItemsCompanion({
    this.id = const Value.absent(),
    this.protocolId = const Value.absent(),
    this.kind = const Value.absent(),
    this.label = const Value.absent(),
    this.time = const Value.absent(),
    this.offsetFromWake = const Value.absent(),
    this.enabled = const Value.absent(),
  });
  ScheduleItemsCompanion.insert({
    this.id = const Value.absent(),
    required int protocolId,
    required ScheduleItemKind kind,
    required String label,
    this.time = const Value.absent(),
    this.offsetFromWake = const Value.absent(),
    this.enabled = const Value.absent(),
  }) : protocolId = Value(protocolId),
       kind = Value(kind),
       label = Value(label);
  static Insertable<ScheduleItem> custom({
    Expression<int>? id,
    Expression<int>? protocolId,
    Expression<String>? kind,
    Expression<String>? label,
    Expression<int>? time,
    Expression<int>? offsetFromWake,
    Expression<bool>? enabled,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (protocolId != null) 'protocol_id': protocolId,
      if (kind != null) 'kind': kind,
      if (label != null) 'label': label,
      if (time != null) 'time': time,
      if (offsetFromWake != null) 'offset_from_wake': offsetFromWake,
      if (enabled != null) 'enabled': enabled,
    });
  }

  ScheduleItemsCompanion copyWith({
    Value<int>? id,
    Value<int>? protocolId,
    Value<ScheduleItemKind>? kind,
    Value<String>? label,
    Value<int?>? time,
    Value<int?>? offsetFromWake,
    Value<bool>? enabled,
  }) {
    return ScheduleItemsCompanion(
      id: id ?? this.id,
      protocolId: protocolId ?? this.protocolId,
      kind: kind ?? this.kind,
      label: label ?? this.label,
      time: time ?? this.time,
      offsetFromWake: offsetFromWake ?? this.offsetFromWake,
      enabled: enabled ?? this.enabled,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (protocolId.present) {
      map['protocol_id'] = Variable<int>(protocolId.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(
        $ScheduleItemsTable.$converterkind.toSql(kind.value),
      );
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (time.present) {
      map['time'] = Variable<int>(time.value);
    }
    if (offsetFromWake.present) {
      map['offset_from_wake'] = Variable<int>(offsetFromWake.value);
    }
    if (enabled.present) {
      map['enabled'] = Variable<bool>(enabled.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScheduleItemsCompanion(')
          ..write('id: $id, ')
          ..write('protocolId: $protocolId, ')
          ..write('kind: $kind, ')
          ..write('label: $label, ')
          ..write('time: $time, ')
          ..write('offsetFromWake: $offsetFromWake, ')
          ..write('enabled: $enabled')
          ..write(')'))
        .toString();
  }
}

class $SpacingRulesTable extends SpacingRules
    with TableInfo<$SpacingRulesTable, SpacingRule> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SpacingRulesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hoursMeta = const VerificationMeta('hours');
  @override
  late final GeneratedColumn<double> hours = GeneratedColumn<double>(
    'hours',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> appliesTo =
      GeneratedColumn<String>(
        'applies_to',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<String>>($SpacingRulesTable.$converterappliesTo);
  @override
  List<GeneratedColumn> get $columns => [id, description, hours, appliesTo];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'spacing_rules';
  @override
  VerificationContext validateIntegrity(
    Insertable<SpacingRule> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('hours')) {
      context.handle(
        _hoursMeta,
        hours.isAcceptableOrUnknown(data['hours']!, _hoursMeta),
      );
    } else if (isInserting) {
      context.missing(_hoursMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SpacingRule map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SpacingRule(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      hours: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}hours'],
      )!,
      appliesTo: $SpacingRulesTable.$converterappliesTo.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}applies_to'],
        )!,
      ),
    );
  }

  @override
  $SpacingRulesTable createAlias(String alias) {
    return $SpacingRulesTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converterappliesTo =
      const StringListConverter();
}

class SpacingRule extends DataClass implements Insertable<SpacingRule> {
  final int id;
  final String description;
  final double hours;

  /// Names of the substances the gap applies to. Some of them (calcium,
  /// iron) are not medications in this database, hence a list, not a join.
  final List<String> appliesTo;
  const SpacingRule({
    required this.id,
    required this.description,
    required this.hours,
    required this.appliesTo,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['description'] = Variable<String>(description);
    map['hours'] = Variable<double>(hours);
    {
      map['applies_to'] = Variable<String>(
        $SpacingRulesTable.$converterappliesTo.toSql(appliesTo),
      );
    }
    return map;
  }

  SpacingRulesCompanion toCompanion(bool nullToAbsent) {
    return SpacingRulesCompanion(
      id: Value(id),
      description: Value(description),
      hours: Value(hours),
      appliesTo: Value(appliesTo),
    );
  }

  factory SpacingRule.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SpacingRule(
      id: serializer.fromJson<int>(json['id']),
      description: serializer.fromJson<String>(json['description']),
      hours: serializer.fromJson<double>(json['hours']),
      appliesTo: serializer.fromJson<List<String>>(json['appliesTo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'description': serializer.toJson<String>(description),
      'hours': serializer.toJson<double>(hours),
      'appliesTo': serializer.toJson<List<String>>(appliesTo),
    };
  }

  SpacingRule copyWith({
    int? id,
    String? description,
    double? hours,
    List<String>? appliesTo,
  }) => SpacingRule(
    id: id ?? this.id,
    description: description ?? this.description,
    hours: hours ?? this.hours,
    appliesTo: appliesTo ?? this.appliesTo,
  );
  SpacingRule copyWithCompanion(SpacingRulesCompanion data) {
    return SpacingRule(
      id: data.id.present ? data.id.value : this.id,
      description: data.description.present
          ? data.description.value
          : this.description,
      hours: data.hours.present ? data.hours.value : this.hours,
      appliesTo: data.appliesTo.present ? data.appliesTo.value : this.appliesTo,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SpacingRule(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('hours: $hours, ')
          ..write('appliesTo: $appliesTo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, description, hours, appliesTo);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SpacingRule &&
          other.id == this.id &&
          other.description == this.description &&
          other.hours == this.hours &&
          other.appliesTo == this.appliesTo);
}

class SpacingRulesCompanion extends UpdateCompanion<SpacingRule> {
  final Value<int> id;
  final Value<String> description;
  final Value<double> hours;
  final Value<List<String>> appliesTo;
  const SpacingRulesCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.hours = const Value.absent(),
    this.appliesTo = const Value.absent(),
  });
  SpacingRulesCompanion.insert({
    this.id = const Value.absent(),
    required String description,
    required double hours,
    required List<String> appliesTo,
  }) : description = Value(description),
       hours = Value(hours),
       appliesTo = Value(appliesTo);
  static Insertable<SpacingRule> custom({
    Expression<int>? id,
    Expression<String>? description,
    Expression<double>? hours,
    Expression<String>? appliesTo,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
      if (hours != null) 'hours': hours,
      if (appliesTo != null) 'applies_to': appliesTo,
    });
  }

  SpacingRulesCompanion copyWith({
    Value<int>? id,
    Value<String>? description,
    Value<double>? hours,
    Value<List<String>>? appliesTo,
  }) {
    return SpacingRulesCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
      hours: hours ?? this.hours,
      appliesTo: appliesTo ?? this.appliesTo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (hours.present) {
      map['hours'] = Variable<double>(hours.value);
    }
    if (appliesTo.present) {
      map['applies_to'] = Variable<String>(
        $SpacingRulesTable.$converterappliesTo.toSql(appliesTo.value),
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SpacingRulesCompanion(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('hours: $hours, ')
          ..write('appliesTo: $appliesTo')
          ..write(')'))
        .toString();
  }
}

class $MedicationsTable extends Medications
    with TableInfo<$MedicationsTable, Medication> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MedicationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _protocolIdMeta = const VerificationMeta(
    'protocolId',
  );
  @override
  late final GeneratedColumn<int> protocolId = GeneratedColumn<int>(
    'protocol_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES protocols (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _doseMeta = const VerificationMeta('dose');
  @override
  late final GeneratedColumn<String> dose = GeneratedColumn<String>(
    'dose',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<int> time = GeneratedColumn<int>(
    'time',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<FoodRule, String> foodRule =
      GeneratedColumn<String>(
        'food_rule',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<FoodRule>($MedicationsTable.$converterfoodRule);
  static const VerificationMeta _spacingRuleIdMeta = const VerificationMeta(
    'spacingRuleId',
  );
  @override
  late final GeneratedColumn<int> spacingRuleId = GeneratedColumn<int>(
    'spacing_rule_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES spacing_rules (id)',
    ),
  );
  static const VerificationMeta _enabledMeta = const VerificationMeta(
    'enabled',
  );
  @override
  late final GeneratedColumn<bool> enabled = GeneratedColumn<bool>(
    'enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    protocolId,
    name,
    dose,
    time,
    foodRule,
    spacingRuleId,
    enabled,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'medications';
  @override
  VerificationContext validateIntegrity(
    Insertable<Medication> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('protocol_id')) {
      context.handle(
        _protocolIdMeta,
        protocolId.isAcceptableOrUnknown(data['protocol_id']!, _protocolIdMeta),
      );
    } else if (isInserting) {
      context.missing(_protocolIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('dose')) {
      context.handle(
        _doseMeta,
        dose.isAcceptableOrUnknown(data['dose']!, _doseMeta),
      );
    } else if (isInserting) {
      context.missing(_doseMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
        _timeMeta,
        time.isAcceptableOrUnknown(data['time']!, _timeMeta),
      );
    }
    if (data.containsKey('spacing_rule_id')) {
      context.handle(
        _spacingRuleIdMeta,
        spacingRuleId.isAcceptableOrUnknown(
          data['spacing_rule_id']!,
          _spacingRuleIdMeta,
        ),
      );
    }
    if (data.containsKey('enabled')) {
      context.handle(
        _enabledMeta,
        enabled.isAcceptableOrUnknown(data['enabled']!, _enabledMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Medication map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Medication(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      protocolId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}protocol_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      dose: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dose'],
      )!,
      time: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}time'],
      ),
      foodRule: $MedicationsTable.$converterfoodRule.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}food_rule'],
        )!,
      ),
      spacingRuleId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}spacing_rule_id'],
      ),
      enabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}enabled'],
      )!,
    );
  }

  @override
  $MedicationsTable createAlias(String alias) {
    return $MedicationsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<FoodRule, String, String> $converterfoodRule =
      const EnumNameConverter<FoodRule>(FoodRule.values);
}

class Medication extends DataClass implements Insertable<Medication> {
  final int id;
  final int protocolId;
  final String name;
  final String dose;

  /// Minutes after midnight. Null until the user sets a time.
  final int? time;
  final FoodRule foodRule;
  final int? spacingRuleId;
  final bool enabled;
  const Medication({
    required this.id,
    required this.protocolId,
    required this.name,
    required this.dose,
    this.time,
    required this.foodRule,
    this.spacingRuleId,
    required this.enabled,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['protocol_id'] = Variable<int>(protocolId);
    map['name'] = Variable<String>(name);
    map['dose'] = Variable<String>(dose);
    if (!nullToAbsent || time != null) {
      map['time'] = Variable<int>(time);
    }
    {
      map['food_rule'] = Variable<String>(
        $MedicationsTable.$converterfoodRule.toSql(foodRule),
      );
    }
    if (!nullToAbsent || spacingRuleId != null) {
      map['spacing_rule_id'] = Variable<int>(spacingRuleId);
    }
    map['enabled'] = Variable<bool>(enabled);
    return map;
  }

  MedicationsCompanion toCompanion(bool nullToAbsent) {
    return MedicationsCompanion(
      id: Value(id),
      protocolId: Value(protocolId),
      name: Value(name),
      dose: Value(dose),
      time: time == null && nullToAbsent ? const Value.absent() : Value(time),
      foodRule: Value(foodRule),
      spacingRuleId: spacingRuleId == null && nullToAbsent
          ? const Value.absent()
          : Value(spacingRuleId),
      enabled: Value(enabled),
    );
  }

  factory Medication.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Medication(
      id: serializer.fromJson<int>(json['id']),
      protocolId: serializer.fromJson<int>(json['protocolId']),
      name: serializer.fromJson<String>(json['name']),
      dose: serializer.fromJson<String>(json['dose']),
      time: serializer.fromJson<int?>(json['time']),
      foodRule: $MedicationsTable.$converterfoodRule.fromJson(
        serializer.fromJson<String>(json['foodRule']),
      ),
      spacingRuleId: serializer.fromJson<int?>(json['spacingRuleId']),
      enabled: serializer.fromJson<bool>(json['enabled']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'protocolId': serializer.toJson<int>(protocolId),
      'name': serializer.toJson<String>(name),
      'dose': serializer.toJson<String>(dose),
      'time': serializer.toJson<int?>(time),
      'foodRule': serializer.toJson<String>(
        $MedicationsTable.$converterfoodRule.toJson(foodRule),
      ),
      'spacingRuleId': serializer.toJson<int?>(spacingRuleId),
      'enabled': serializer.toJson<bool>(enabled),
    };
  }

  Medication copyWith({
    int? id,
    int? protocolId,
    String? name,
    String? dose,
    Value<int?> time = const Value.absent(),
    FoodRule? foodRule,
    Value<int?> spacingRuleId = const Value.absent(),
    bool? enabled,
  }) => Medication(
    id: id ?? this.id,
    protocolId: protocolId ?? this.protocolId,
    name: name ?? this.name,
    dose: dose ?? this.dose,
    time: time.present ? time.value : this.time,
    foodRule: foodRule ?? this.foodRule,
    spacingRuleId: spacingRuleId.present
        ? spacingRuleId.value
        : this.spacingRuleId,
    enabled: enabled ?? this.enabled,
  );
  Medication copyWithCompanion(MedicationsCompanion data) {
    return Medication(
      id: data.id.present ? data.id.value : this.id,
      protocolId: data.protocolId.present
          ? data.protocolId.value
          : this.protocolId,
      name: data.name.present ? data.name.value : this.name,
      dose: data.dose.present ? data.dose.value : this.dose,
      time: data.time.present ? data.time.value : this.time,
      foodRule: data.foodRule.present ? data.foodRule.value : this.foodRule,
      spacingRuleId: data.spacingRuleId.present
          ? data.spacingRuleId.value
          : this.spacingRuleId,
      enabled: data.enabled.present ? data.enabled.value : this.enabled,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Medication(')
          ..write('id: $id, ')
          ..write('protocolId: $protocolId, ')
          ..write('name: $name, ')
          ..write('dose: $dose, ')
          ..write('time: $time, ')
          ..write('foodRule: $foodRule, ')
          ..write('spacingRuleId: $spacingRuleId, ')
          ..write('enabled: $enabled')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    protocolId,
    name,
    dose,
    time,
    foodRule,
    spacingRuleId,
    enabled,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Medication &&
          other.id == this.id &&
          other.protocolId == this.protocolId &&
          other.name == this.name &&
          other.dose == this.dose &&
          other.time == this.time &&
          other.foodRule == this.foodRule &&
          other.spacingRuleId == this.spacingRuleId &&
          other.enabled == this.enabled);
}

class MedicationsCompanion extends UpdateCompanion<Medication> {
  final Value<int> id;
  final Value<int> protocolId;
  final Value<String> name;
  final Value<String> dose;
  final Value<int?> time;
  final Value<FoodRule> foodRule;
  final Value<int?> spacingRuleId;
  final Value<bool> enabled;
  const MedicationsCompanion({
    this.id = const Value.absent(),
    this.protocolId = const Value.absent(),
    this.name = const Value.absent(),
    this.dose = const Value.absent(),
    this.time = const Value.absent(),
    this.foodRule = const Value.absent(),
    this.spacingRuleId = const Value.absent(),
    this.enabled = const Value.absent(),
  });
  MedicationsCompanion.insert({
    this.id = const Value.absent(),
    required int protocolId,
    required String name,
    required String dose,
    this.time = const Value.absent(),
    required FoodRule foodRule,
    this.spacingRuleId = const Value.absent(),
    this.enabled = const Value.absent(),
  }) : protocolId = Value(protocolId),
       name = Value(name),
       dose = Value(dose),
       foodRule = Value(foodRule);
  static Insertable<Medication> custom({
    Expression<int>? id,
    Expression<int>? protocolId,
    Expression<String>? name,
    Expression<String>? dose,
    Expression<int>? time,
    Expression<String>? foodRule,
    Expression<int>? spacingRuleId,
    Expression<bool>? enabled,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (protocolId != null) 'protocol_id': protocolId,
      if (name != null) 'name': name,
      if (dose != null) 'dose': dose,
      if (time != null) 'time': time,
      if (foodRule != null) 'food_rule': foodRule,
      if (spacingRuleId != null) 'spacing_rule_id': spacingRuleId,
      if (enabled != null) 'enabled': enabled,
    });
  }

  MedicationsCompanion copyWith({
    Value<int>? id,
    Value<int>? protocolId,
    Value<String>? name,
    Value<String>? dose,
    Value<int?>? time,
    Value<FoodRule>? foodRule,
    Value<int?>? spacingRuleId,
    Value<bool>? enabled,
  }) {
    return MedicationsCompanion(
      id: id ?? this.id,
      protocolId: protocolId ?? this.protocolId,
      name: name ?? this.name,
      dose: dose ?? this.dose,
      time: time ?? this.time,
      foodRule: foodRule ?? this.foodRule,
      spacingRuleId: spacingRuleId ?? this.spacingRuleId,
      enabled: enabled ?? this.enabled,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (protocolId.present) {
      map['protocol_id'] = Variable<int>(protocolId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (dose.present) {
      map['dose'] = Variable<String>(dose.value);
    }
    if (time.present) {
      map['time'] = Variable<int>(time.value);
    }
    if (foodRule.present) {
      map['food_rule'] = Variable<String>(
        $MedicationsTable.$converterfoodRule.toSql(foodRule.value),
      );
    }
    if (spacingRuleId.present) {
      map['spacing_rule_id'] = Variable<int>(spacingRuleId.value);
    }
    if (enabled.present) {
      map['enabled'] = Variable<bool>(enabled.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedicationsCompanion(')
          ..write('id: $id, ')
          ..write('protocolId: $protocolId, ')
          ..write('name: $name, ')
          ..write('dose: $dose, ')
          ..write('time: $time, ')
          ..write('foodRule: $foodRule, ')
          ..write('spacingRuleId: $spacingRuleId, ')
          ..write('enabled: $enabled')
          ..write(')'))
        .toString();
  }
}

class $LogEntriesTable extends LogEntries
    with TableInfo<$LogEntriesTable, LogEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LogEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<int> itemId = GeneratedColumn<int>(
    'item_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES schedule_items (id)',
    ),
  );
  static const VerificationMeta _scheduledAtMeta = const VerificationMeta(
    'scheduledAt',
  );
  @override
  late final GeneratedColumn<DateTime> scheduledAt = GeneratedColumn<DateTime>(
    'scheduled_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _skippedMeta = const VerificationMeta(
    'skipped',
  );
  @override
  late final GeneratedColumn<bool> skipped = GeneratedColumn<bool>(
    'skipped',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("skipped" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    itemId,
    scheduledAt,
    completedAt,
    skipped,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'log_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<LogEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('item_id')) {
      context.handle(
        _itemIdMeta,
        itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta),
      );
    } else if (isInserting) {
      context.missing(_itemIdMeta);
    }
    if (data.containsKey('scheduled_at')) {
      context.handle(
        _scheduledAtMeta,
        scheduledAt.isAcceptableOrUnknown(
          data['scheduled_at']!,
          _scheduledAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_scheduledAtMeta);
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    if (data.containsKey('skipped')) {
      context.handle(
        _skippedMeta,
        skipped.isAcceptableOrUnknown(data['skipped']!, _skippedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LogEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LogEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      itemId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}item_id'],
      )!,
      scheduledAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}scheduled_at'],
      )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      ),
      skipped: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}skipped'],
      )!,
    );
  }

  @override
  $LogEntriesTable createAlias(String alias) {
    return $LogEntriesTable(attachedDatabase, alias);
  }
}

class LogEntry extends DataClass implements Insertable<LogEntry> {
  final int id;
  final int itemId;
  final DateTime scheduledAt;
  final DateTime? completedAt;
  final bool skipped;
  const LogEntry({
    required this.id,
    required this.itemId,
    required this.scheduledAt,
    this.completedAt,
    required this.skipped,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['item_id'] = Variable<int>(itemId);
    map['scheduled_at'] = Variable<DateTime>(scheduledAt);
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    map['skipped'] = Variable<bool>(skipped);
    return map;
  }

  LogEntriesCompanion toCompanion(bool nullToAbsent) {
    return LogEntriesCompanion(
      id: Value(id),
      itemId: Value(itemId),
      scheduledAt: Value(scheduledAt),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
      skipped: Value(skipped),
    );
  }

  factory LogEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LogEntry(
      id: serializer.fromJson<int>(json['id']),
      itemId: serializer.fromJson<int>(json['itemId']),
      scheduledAt: serializer.fromJson<DateTime>(json['scheduledAt']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
      skipped: serializer.fromJson<bool>(json['skipped']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'itemId': serializer.toJson<int>(itemId),
      'scheduledAt': serializer.toJson<DateTime>(scheduledAt),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
      'skipped': serializer.toJson<bool>(skipped),
    };
  }

  LogEntry copyWith({
    int? id,
    int? itemId,
    DateTime? scheduledAt,
    Value<DateTime?> completedAt = const Value.absent(),
    bool? skipped,
  }) => LogEntry(
    id: id ?? this.id,
    itemId: itemId ?? this.itemId,
    scheduledAt: scheduledAt ?? this.scheduledAt,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
    skipped: skipped ?? this.skipped,
  );
  LogEntry copyWithCompanion(LogEntriesCompanion data) {
    return LogEntry(
      id: data.id.present ? data.id.value : this.id,
      itemId: data.itemId.present ? data.itemId.value : this.itemId,
      scheduledAt: data.scheduledAt.present
          ? data.scheduledAt.value
          : this.scheduledAt,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
      skipped: data.skipped.present ? data.skipped.value : this.skipped,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LogEntry(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('scheduledAt: $scheduledAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('skipped: $skipped')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, itemId, scheduledAt, completedAt, skipped);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LogEntry &&
          other.id == this.id &&
          other.itemId == this.itemId &&
          other.scheduledAt == this.scheduledAt &&
          other.completedAt == this.completedAt &&
          other.skipped == this.skipped);
}

class LogEntriesCompanion extends UpdateCompanion<LogEntry> {
  final Value<int> id;
  final Value<int> itemId;
  final Value<DateTime> scheduledAt;
  final Value<DateTime?> completedAt;
  final Value<bool> skipped;
  const LogEntriesCompanion({
    this.id = const Value.absent(),
    this.itemId = const Value.absent(),
    this.scheduledAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.skipped = const Value.absent(),
  });
  LogEntriesCompanion.insert({
    this.id = const Value.absent(),
    required int itemId,
    required DateTime scheduledAt,
    this.completedAt = const Value.absent(),
    this.skipped = const Value.absent(),
  }) : itemId = Value(itemId),
       scheduledAt = Value(scheduledAt);
  static Insertable<LogEntry> custom({
    Expression<int>? id,
    Expression<int>? itemId,
    Expression<DateTime>? scheduledAt,
    Expression<DateTime>? completedAt,
    Expression<bool>? skipped,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (itemId != null) 'item_id': itemId,
      if (scheduledAt != null) 'scheduled_at': scheduledAt,
      if (completedAt != null) 'completed_at': completedAt,
      if (skipped != null) 'skipped': skipped,
    });
  }

  LogEntriesCompanion copyWith({
    Value<int>? id,
    Value<int>? itemId,
    Value<DateTime>? scheduledAt,
    Value<DateTime?>? completedAt,
    Value<bool>? skipped,
  }) {
    return LogEntriesCompanion(
      id: id ?? this.id,
      itemId: itemId ?? this.itemId,
      scheduledAt: scheduledAt ?? this.scheduledAt,
      completedAt: completedAt ?? this.completedAt,
      skipped: skipped ?? this.skipped,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (itemId.present) {
      map['item_id'] = Variable<int>(itemId.value);
    }
    if (scheduledAt.present) {
      map['scheduled_at'] = Variable<DateTime>(scheduledAt.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (skipped.present) {
      map['skipped'] = Variable<bool>(skipped.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LogEntriesCompanion(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('scheduledAt: $scheduledAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('skipped: $skipped')
          ..write(')'))
        .toString();
  }
}

class $TrainingPlansTable extends TrainingPlans
    with TableInfo<$TrainingPlansTable, TrainingPlan> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TrainingPlansTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _protocolIdMeta = const VerificationMeta(
    'protocolId',
  );
  @override
  late final GeneratedColumn<int> protocolId = GeneratedColumn<int>(
    'protocol_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES protocols (id)',
    ),
  );
  static const VerificationMeta _dayOfWeekMeta = const VerificationMeta(
    'dayOfWeek',
  );
  @override
  late final GeneratedColumn<int> dayOfWeek = GeneratedColumn<int>(
    'day_of_week',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sessionNameMeta = const VerificationMeta(
    'sessionName',
  );
  @override
  late final GeneratedColumn<String> sessionName = GeneratedColumn<String>(
    'session_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _durationMinMeta = const VerificationMeta(
    'durationMin',
  );
  @override
  late final GeneratedColumn<int> durationMin = GeneratedColumn<int>(
    'duration_min',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    protocolId,
    dayOfWeek,
    sessionName,
    durationMin,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'training_plans';
  @override
  VerificationContext validateIntegrity(
    Insertable<TrainingPlan> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('protocol_id')) {
      context.handle(
        _protocolIdMeta,
        protocolId.isAcceptableOrUnknown(data['protocol_id']!, _protocolIdMeta),
      );
    } else if (isInserting) {
      context.missing(_protocolIdMeta);
    }
    if (data.containsKey('day_of_week')) {
      context.handle(
        _dayOfWeekMeta,
        dayOfWeek.isAcceptableOrUnknown(data['day_of_week']!, _dayOfWeekMeta),
      );
    } else if (isInserting) {
      context.missing(_dayOfWeekMeta);
    }
    if (data.containsKey('session_name')) {
      context.handle(
        _sessionNameMeta,
        sessionName.isAcceptableOrUnknown(
          data['session_name']!,
          _sessionNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_sessionNameMeta);
    }
    if (data.containsKey('duration_min')) {
      context.handle(
        _durationMinMeta,
        durationMin.isAcceptableOrUnknown(
          data['duration_min']!,
          _durationMinMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_durationMinMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TrainingPlan map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TrainingPlan(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      protocolId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}protocol_id'],
      )!,
      dayOfWeek: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}day_of_week'],
      )!,
      sessionName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}session_name'],
      )!,
      durationMin: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_min'],
      )!,
    );
  }

  @override
  $TrainingPlansTable createAlias(String alias) {
    return $TrainingPlansTable(attachedDatabase, alias);
  }
}

class TrainingPlan extends DataClass implements Insertable<TrainingPlan> {
  final int id;
  final int protocolId;

  /// 1 = Monday … 7 = Sunday, matching [DateTime.weekday].
  final int dayOfWeek;
  final String sessionName;
  final int durationMin;
  const TrainingPlan({
    required this.id,
    required this.protocolId,
    required this.dayOfWeek,
    required this.sessionName,
    required this.durationMin,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['protocol_id'] = Variable<int>(protocolId);
    map['day_of_week'] = Variable<int>(dayOfWeek);
    map['session_name'] = Variable<String>(sessionName);
    map['duration_min'] = Variable<int>(durationMin);
    return map;
  }

  TrainingPlansCompanion toCompanion(bool nullToAbsent) {
    return TrainingPlansCompanion(
      id: Value(id),
      protocolId: Value(protocolId),
      dayOfWeek: Value(dayOfWeek),
      sessionName: Value(sessionName),
      durationMin: Value(durationMin),
    );
  }

  factory TrainingPlan.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TrainingPlan(
      id: serializer.fromJson<int>(json['id']),
      protocolId: serializer.fromJson<int>(json['protocolId']),
      dayOfWeek: serializer.fromJson<int>(json['dayOfWeek']),
      sessionName: serializer.fromJson<String>(json['sessionName']),
      durationMin: serializer.fromJson<int>(json['durationMin']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'protocolId': serializer.toJson<int>(protocolId),
      'dayOfWeek': serializer.toJson<int>(dayOfWeek),
      'sessionName': serializer.toJson<String>(sessionName),
      'durationMin': serializer.toJson<int>(durationMin),
    };
  }

  TrainingPlan copyWith({
    int? id,
    int? protocolId,
    int? dayOfWeek,
    String? sessionName,
    int? durationMin,
  }) => TrainingPlan(
    id: id ?? this.id,
    protocolId: protocolId ?? this.protocolId,
    dayOfWeek: dayOfWeek ?? this.dayOfWeek,
    sessionName: sessionName ?? this.sessionName,
    durationMin: durationMin ?? this.durationMin,
  );
  TrainingPlan copyWithCompanion(TrainingPlansCompanion data) {
    return TrainingPlan(
      id: data.id.present ? data.id.value : this.id,
      protocolId: data.protocolId.present
          ? data.protocolId.value
          : this.protocolId,
      dayOfWeek: data.dayOfWeek.present ? data.dayOfWeek.value : this.dayOfWeek,
      sessionName: data.sessionName.present
          ? data.sessionName.value
          : this.sessionName,
      durationMin: data.durationMin.present
          ? data.durationMin.value
          : this.durationMin,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TrainingPlan(')
          ..write('id: $id, ')
          ..write('protocolId: $protocolId, ')
          ..write('dayOfWeek: $dayOfWeek, ')
          ..write('sessionName: $sessionName, ')
          ..write('durationMin: $durationMin')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, protocolId, dayOfWeek, sessionName, durationMin);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TrainingPlan &&
          other.id == this.id &&
          other.protocolId == this.protocolId &&
          other.dayOfWeek == this.dayOfWeek &&
          other.sessionName == this.sessionName &&
          other.durationMin == this.durationMin);
}

class TrainingPlansCompanion extends UpdateCompanion<TrainingPlan> {
  final Value<int> id;
  final Value<int> protocolId;
  final Value<int> dayOfWeek;
  final Value<String> sessionName;
  final Value<int> durationMin;
  const TrainingPlansCompanion({
    this.id = const Value.absent(),
    this.protocolId = const Value.absent(),
    this.dayOfWeek = const Value.absent(),
    this.sessionName = const Value.absent(),
    this.durationMin = const Value.absent(),
  });
  TrainingPlansCompanion.insert({
    this.id = const Value.absent(),
    required int protocolId,
    required int dayOfWeek,
    required String sessionName,
    required int durationMin,
  }) : protocolId = Value(protocolId),
       dayOfWeek = Value(dayOfWeek),
       sessionName = Value(sessionName),
       durationMin = Value(durationMin);
  static Insertable<TrainingPlan> custom({
    Expression<int>? id,
    Expression<int>? protocolId,
    Expression<int>? dayOfWeek,
    Expression<String>? sessionName,
    Expression<int>? durationMin,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (protocolId != null) 'protocol_id': protocolId,
      if (dayOfWeek != null) 'day_of_week': dayOfWeek,
      if (sessionName != null) 'session_name': sessionName,
      if (durationMin != null) 'duration_min': durationMin,
    });
  }

  TrainingPlansCompanion copyWith({
    Value<int>? id,
    Value<int>? protocolId,
    Value<int>? dayOfWeek,
    Value<String>? sessionName,
    Value<int>? durationMin,
  }) {
    return TrainingPlansCompanion(
      id: id ?? this.id,
      protocolId: protocolId ?? this.protocolId,
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      sessionName: sessionName ?? this.sessionName,
      durationMin: durationMin ?? this.durationMin,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (protocolId.present) {
      map['protocol_id'] = Variable<int>(protocolId.value);
    }
    if (dayOfWeek.present) {
      map['day_of_week'] = Variable<int>(dayOfWeek.value);
    }
    if (sessionName.present) {
      map['session_name'] = Variable<String>(sessionName.value);
    }
    if (durationMin.present) {
      map['duration_min'] = Variable<int>(durationMin.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TrainingPlansCompanion(')
          ..write('id: $id, ')
          ..write('protocolId: $protocolId, ')
          ..write('dayOfWeek: $dayOfWeek, ')
          ..write('sessionName: $sessionName, ')
          ..write('durationMin: $durationMin')
          ..write(')'))
        .toString();
  }
}

class $ExercisesTable extends Exercises
    with TableInfo<$ExercisesTable, Exercise> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExercisesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _trainingPlanIdMeta = const VerificationMeta(
    'trainingPlanId',
  );
  @override
  late final GeneratedColumn<int> trainingPlanId = GeneratedColumn<int>(
    'training_plan_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES training_plans (id)',
    ),
  );
  static const VerificationMeta _positionMeta = const VerificationMeta(
    'position',
  );
  @override
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
    'position',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _setsMeta = const VerificationMeta('sets');
  @override
  late final GeneratedColumn<int> sets = GeneratedColumn<int>(
    'sets',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _repsMeta = const VerificationMeta('reps');
  @override
  late final GeneratedColumn<String> reps = GeneratedColumn<String>(
    'reps',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _restSecondsMeta = const VerificationMeta(
    'restSeconds',
  );
  @override
  late final GeneratedColumn<int> restSeconds = GeneratedColumn<int>(
    'rest_seconds',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> cues =
      GeneratedColumn<String>(
        'cues',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<String>>($ExercisesTable.$convertercues);
  static const VerificationMeta _progressionMeta = const VerificationMeta(
    'progression',
  );
  @override
  late final GeneratedColumn<String> progression = GeneratedColumn<String>(
    'progression',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    trainingPlanId,
    position,
    name,
    sets,
    reps,
    restSeconds,
    cues,
    progression,
    note,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exercises';
  @override
  VerificationContext validateIntegrity(
    Insertable<Exercise> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('training_plan_id')) {
      context.handle(
        _trainingPlanIdMeta,
        trainingPlanId.isAcceptableOrUnknown(
          data['training_plan_id']!,
          _trainingPlanIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_trainingPlanIdMeta);
    }
    if (data.containsKey('position')) {
      context.handle(
        _positionMeta,
        position.isAcceptableOrUnknown(data['position']!, _positionMeta),
      );
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('sets')) {
      context.handle(
        _setsMeta,
        sets.isAcceptableOrUnknown(data['sets']!, _setsMeta),
      );
    }
    if (data.containsKey('reps')) {
      context.handle(
        _repsMeta,
        reps.isAcceptableOrUnknown(data['reps']!, _repsMeta),
      );
    }
    if (data.containsKey('rest_seconds')) {
      context.handle(
        _restSecondsMeta,
        restSeconds.isAcceptableOrUnknown(
          data['rest_seconds']!,
          _restSecondsMeta,
        ),
      );
    }
    if (data.containsKey('progression')) {
      context.handle(
        _progressionMeta,
        progression.isAcceptableOrUnknown(
          data['progression']!,
          _progressionMeta,
        ),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Exercise map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Exercise(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      trainingPlanId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}training_plan_id'],
      )!,
      position: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}position'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      sets: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sets'],
      ),
      reps: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reps'],
      ),
      restSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rest_seconds'],
      ),
      cues: $ExercisesTable.$convertercues.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}cues'],
        )!,
      ),
      progression: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}progression'],
      ),
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
    );
  }

  @override
  $ExercisesTable createAlias(String alias) {
    return $ExercisesTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $convertercues =
      const StringListConverter();
}

class Exercise extends DataClass implements Insertable<Exercise> {
  final int id;
  final int trainingPlanId;
  final int position;
  final String name;
  final int? sets;

  /// Reps or hold time as written: "μέγιστο − 2", "8–10", "15–25΄΄".
  final String? reps;
  final int? restSeconds;
  final List<String> cues;
  final String? progression;
  final String? note;
  const Exercise({
    required this.id,
    required this.trainingPlanId,
    required this.position,
    required this.name,
    this.sets,
    this.reps,
    this.restSeconds,
    required this.cues,
    this.progression,
    this.note,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['training_plan_id'] = Variable<int>(trainingPlanId);
    map['position'] = Variable<int>(position);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || sets != null) {
      map['sets'] = Variable<int>(sets);
    }
    if (!nullToAbsent || reps != null) {
      map['reps'] = Variable<String>(reps);
    }
    if (!nullToAbsent || restSeconds != null) {
      map['rest_seconds'] = Variable<int>(restSeconds);
    }
    {
      map['cues'] = Variable<String>(
        $ExercisesTable.$convertercues.toSql(cues),
      );
    }
    if (!nullToAbsent || progression != null) {
      map['progression'] = Variable<String>(progression);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    return map;
  }

  ExercisesCompanion toCompanion(bool nullToAbsent) {
    return ExercisesCompanion(
      id: Value(id),
      trainingPlanId: Value(trainingPlanId),
      position: Value(position),
      name: Value(name),
      sets: sets == null && nullToAbsent ? const Value.absent() : Value(sets),
      reps: reps == null && nullToAbsent ? const Value.absent() : Value(reps),
      restSeconds: restSeconds == null && nullToAbsent
          ? const Value.absent()
          : Value(restSeconds),
      cues: Value(cues),
      progression: progression == null && nullToAbsent
          ? const Value.absent()
          : Value(progression),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory Exercise.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Exercise(
      id: serializer.fromJson<int>(json['id']),
      trainingPlanId: serializer.fromJson<int>(json['trainingPlanId']),
      position: serializer.fromJson<int>(json['position']),
      name: serializer.fromJson<String>(json['name']),
      sets: serializer.fromJson<int?>(json['sets']),
      reps: serializer.fromJson<String?>(json['reps']),
      restSeconds: serializer.fromJson<int?>(json['restSeconds']),
      cues: serializer.fromJson<List<String>>(json['cues']),
      progression: serializer.fromJson<String?>(json['progression']),
      note: serializer.fromJson<String?>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'trainingPlanId': serializer.toJson<int>(trainingPlanId),
      'position': serializer.toJson<int>(position),
      'name': serializer.toJson<String>(name),
      'sets': serializer.toJson<int?>(sets),
      'reps': serializer.toJson<String?>(reps),
      'restSeconds': serializer.toJson<int?>(restSeconds),
      'cues': serializer.toJson<List<String>>(cues),
      'progression': serializer.toJson<String?>(progression),
      'note': serializer.toJson<String?>(note),
    };
  }

  Exercise copyWith({
    int? id,
    int? trainingPlanId,
    int? position,
    String? name,
    Value<int?> sets = const Value.absent(),
    Value<String?> reps = const Value.absent(),
    Value<int?> restSeconds = const Value.absent(),
    List<String>? cues,
    Value<String?> progression = const Value.absent(),
    Value<String?> note = const Value.absent(),
  }) => Exercise(
    id: id ?? this.id,
    trainingPlanId: trainingPlanId ?? this.trainingPlanId,
    position: position ?? this.position,
    name: name ?? this.name,
    sets: sets.present ? sets.value : this.sets,
    reps: reps.present ? reps.value : this.reps,
    restSeconds: restSeconds.present ? restSeconds.value : this.restSeconds,
    cues: cues ?? this.cues,
    progression: progression.present ? progression.value : this.progression,
    note: note.present ? note.value : this.note,
  );
  Exercise copyWithCompanion(ExercisesCompanion data) {
    return Exercise(
      id: data.id.present ? data.id.value : this.id,
      trainingPlanId: data.trainingPlanId.present
          ? data.trainingPlanId.value
          : this.trainingPlanId,
      position: data.position.present ? data.position.value : this.position,
      name: data.name.present ? data.name.value : this.name,
      sets: data.sets.present ? data.sets.value : this.sets,
      reps: data.reps.present ? data.reps.value : this.reps,
      restSeconds: data.restSeconds.present
          ? data.restSeconds.value
          : this.restSeconds,
      cues: data.cues.present ? data.cues.value : this.cues,
      progression: data.progression.present
          ? data.progression.value
          : this.progression,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Exercise(')
          ..write('id: $id, ')
          ..write('trainingPlanId: $trainingPlanId, ')
          ..write('position: $position, ')
          ..write('name: $name, ')
          ..write('sets: $sets, ')
          ..write('reps: $reps, ')
          ..write('restSeconds: $restSeconds, ')
          ..write('cues: $cues, ')
          ..write('progression: $progression, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    trainingPlanId,
    position,
    name,
    sets,
    reps,
    restSeconds,
    cues,
    progression,
    note,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Exercise &&
          other.id == this.id &&
          other.trainingPlanId == this.trainingPlanId &&
          other.position == this.position &&
          other.name == this.name &&
          other.sets == this.sets &&
          other.reps == this.reps &&
          other.restSeconds == this.restSeconds &&
          other.cues == this.cues &&
          other.progression == this.progression &&
          other.note == this.note);
}

class ExercisesCompanion extends UpdateCompanion<Exercise> {
  final Value<int> id;
  final Value<int> trainingPlanId;
  final Value<int> position;
  final Value<String> name;
  final Value<int?> sets;
  final Value<String?> reps;
  final Value<int?> restSeconds;
  final Value<List<String>> cues;
  final Value<String?> progression;
  final Value<String?> note;
  const ExercisesCompanion({
    this.id = const Value.absent(),
    this.trainingPlanId = const Value.absent(),
    this.position = const Value.absent(),
    this.name = const Value.absent(),
    this.sets = const Value.absent(),
    this.reps = const Value.absent(),
    this.restSeconds = const Value.absent(),
    this.cues = const Value.absent(),
    this.progression = const Value.absent(),
    this.note = const Value.absent(),
  });
  ExercisesCompanion.insert({
    this.id = const Value.absent(),
    required int trainingPlanId,
    required int position,
    required String name,
    this.sets = const Value.absent(),
    this.reps = const Value.absent(),
    this.restSeconds = const Value.absent(),
    required List<String> cues,
    this.progression = const Value.absent(),
    this.note = const Value.absent(),
  }) : trainingPlanId = Value(trainingPlanId),
       position = Value(position),
       name = Value(name),
       cues = Value(cues);
  static Insertable<Exercise> custom({
    Expression<int>? id,
    Expression<int>? trainingPlanId,
    Expression<int>? position,
    Expression<String>? name,
    Expression<int>? sets,
    Expression<String>? reps,
    Expression<int>? restSeconds,
    Expression<String>? cues,
    Expression<String>? progression,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (trainingPlanId != null) 'training_plan_id': trainingPlanId,
      if (position != null) 'position': position,
      if (name != null) 'name': name,
      if (sets != null) 'sets': sets,
      if (reps != null) 'reps': reps,
      if (restSeconds != null) 'rest_seconds': restSeconds,
      if (cues != null) 'cues': cues,
      if (progression != null) 'progression': progression,
      if (note != null) 'note': note,
    });
  }

  ExercisesCompanion copyWith({
    Value<int>? id,
    Value<int>? trainingPlanId,
    Value<int>? position,
    Value<String>? name,
    Value<int?>? sets,
    Value<String?>? reps,
    Value<int?>? restSeconds,
    Value<List<String>>? cues,
    Value<String?>? progression,
    Value<String?>? note,
  }) {
    return ExercisesCompanion(
      id: id ?? this.id,
      trainingPlanId: trainingPlanId ?? this.trainingPlanId,
      position: position ?? this.position,
      name: name ?? this.name,
      sets: sets ?? this.sets,
      reps: reps ?? this.reps,
      restSeconds: restSeconds ?? this.restSeconds,
      cues: cues ?? this.cues,
      progression: progression ?? this.progression,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (trainingPlanId.present) {
      map['training_plan_id'] = Variable<int>(trainingPlanId.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (sets.present) {
      map['sets'] = Variable<int>(sets.value);
    }
    if (reps.present) {
      map['reps'] = Variable<String>(reps.value);
    }
    if (restSeconds.present) {
      map['rest_seconds'] = Variable<int>(restSeconds.value);
    }
    if (cues.present) {
      map['cues'] = Variable<String>(
        $ExercisesTable.$convertercues.toSql(cues.value),
      );
    }
    if (progression.present) {
      map['progression'] = Variable<String>(progression.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExercisesCompanion(')
          ..write('id: $id, ')
          ..write('trainingPlanId: $trainingPlanId, ')
          ..write('position: $position, ')
          ..write('name: $name, ')
          ..write('sets: $sets, ')
          ..write('reps: $reps, ')
          ..write('restSeconds: $restSeconds, ')
          ..write('cues: $cues, ')
          ..write('progression: $progression, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

class $IntervalCyclesTable extends IntervalCycles
    with TableInfo<$IntervalCyclesTable, IntervalCycle> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IntervalCyclesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _protocolIdMeta = const VerificationMeta(
    'protocolId',
  );
  @override
  late final GeneratedColumn<int> protocolId = GeneratedColumn<int>(
    'protocol_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES protocols (id)',
    ),
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lengthWeeksMeta = const VerificationMeta(
    'lengthWeeks',
  );
  @override
  late final GeneratedColumn<int> lengthWeeks = GeneratedColumn<int>(
    'length_weeks',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(12),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    protocolId,
    startDate,
    lengthWeeks,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'interval_cycles';
  @override
  VerificationContext validateIntegrity(
    Insertable<IntervalCycle> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('protocol_id')) {
      context.handle(
        _protocolIdMeta,
        protocolId.isAcceptableOrUnknown(data['protocol_id']!, _protocolIdMeta),
      );
    } else if (isInserting) {
      context.missing(_protocolIdMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('length_weeks')) {
      context.handle(
        _lengthWeeksMeta,
        lengthWeeks.isAcceptableOrUnknown(
          data['length_weeks']!,
          _lengthWeeksMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  IntervalCycle map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IntervalCycle(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      protocolId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}protocol_id'],
      )!,
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date'],
      )!,
      lengthWeeks: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}length_weeks'],
      )!,
    );
  }

  @override
  $IntervalCyclesTable createAlias(String alias) {
    return $IntervalCyclesTable(attachedDatabase, alias);
  }
}

class IntervalCycle extends DataClass implements Insertable<IntervalCycle> {
  final int id;
  final int protocolId;
  final DateTime startDate;
  final int lengthWeeks;
  const IntervalCycle({
    required this.id,
    required this.protocolId,
    required this.startDate,
    required this.lengthWeeks,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['protocol_id'] = Variable<int>(protocolId);
    map['start_date'] = Variable<DateTime>(startDate);
    map['length_weeks'] = Variable<int>(lengthWeeks);
    return map;
  }

  IntervalCyclesCompanion toCompanion(bool nullToAbsent) {
    return IntervalCyclesCompanion(
      id: Value(id),
      protocolId: Value(protocolId),
      startDate: Value(startDate),
      lengthWeeks: Value(lengthWeeks),
    );
  }

  factory IntervalCycle.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IntervalCycle(
      id: serializer.fromJson<int>(json['id']),
      protocolId: serializer.fromJson<int>(json['protocolId']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      lengthWeeks: serializer.fromJson<int>(json['lengthWeeks']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'protocolId': serializer.toJson<int>(protocolId),
      'startDate': serializer.toJson<DateTime>(startDate),
      'lengthWeeks': serializer.toJson<int>(lengthWeeks),
    };
  }

  IntervalCycle copyWith({
    int? id,
    int? protocolId,
    DateTime? startDate,
    int? lengthWeeks,
  }) => IntervalCycle(
    id: id ?? this.id,
    protocolId: protocolId ?? this.protocolId,
    startDate: startDate ?? this.startDate,
    lengthWeeks: lengthWeeks ?? this.lengthWeeks,
  );
  IntervalCycle copyWithCompanion(IntervalCyclesCompanion data) {
    return IntervalCycle(
      id: data.id.present ? data.id.value : this.id,
      protocolId: data.protocolId.present
          ? data.protocolId.value
          : this.protocolId,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      lengthWeeks: data.lengthWeeks.present
          ? data.lengthWeeks.value
          : this.lengthWeeks,
    );
  }

  @override
  String toString() {
    return (StringBuffer('IntervalCycle(')
          ..write('id: $id, ')
          ..write('protocolId: $protocolId, ')
          ..write('startDate: $startDate, ')
          ..write('lengthWeeks: $lengthWeeks')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, protocolId, startDate, lengthWeeks);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IntervalCycle &&
          other.id == this.id &&
          other.protocolId == this.protocolId &&
          other.startDate == this.startDate &&
          other.lengthWeeks == this.lengthWeeks);
}

class IntervalCyclesCompanion extends UpdateCompanion<IntervalCycle> {
  final Value<int> id;
  final Value<int> protocolId;
  final Value<DateTime> startDate;
  final Value<int> lengthWeeks;
  const IntervalCyclesCompanion({
    this.id = const Value.absent(),
    this.protocolId = const Value.absent(),
    this.startDate = const Value.absent(),
    this.lengthWeeks = const Value.absent(),
  });
  IntervalCyclesCompanion.insert({
    this.id = const Value.absent(),
    required int protocolId,
    required DateTime startDate,
    this.lengthWeeks = const Value.absent(),
  }) : protocolId = Value(protocolId),
       startDate = Value(startDate);
  static Insertable<IntervalCycle> custom({
    Expression<int>? id,
    Expression<int>? protocolId,
    Expression<DateTime>? startDate,
    Expression<int>? lengthWeeks,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (protocolId != null) 'protocol_id': protocolId,
      if (startDate != null) 'start_date': startDate,
      if (lengthWeeks != null) 'length_weeks': lengthWeeks,
    });
  }

  IntervalCyclesCompanion copyWith({
    Value<int>? id,
    Value<int>? protocolId,
    Value<DateTime>? startDate,
    Value<int>? lengthWeeks,
  }) {
    return IntervalCyclesCompanion(
      id: id ?? this.id,
      protocolId: protocolId ?? this.protocolId,
      startDate: startDate ?? this.startDate,
      lengthWeeks: lengthWeeks ?? this.lengthWeeks,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (protocolId.present) {
      map['protocol_id'] = Variable<int>(protocolId.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (lengthWeeks.present) {
      map['length_weeks'] = Variable<int>(lengthWeeks.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IntervalCyclesCompanion(')
          ..write('id: $id, ')
          ..write('protocolId: $protocolId, ')
          ..write('startDate: $startDate, ')
          ..write('lengthWeeks: $lengthWeeks')
          ..write(')'))
        .toString();
  }
}

class $IntervalBlocksTable extends IntervalBlocks
    with TableInfo<$IntervalBlocksTable, IntervalBlock> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IntervalBlocksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _cycleIdMeta = const VerificationMeta(
    'cycleId',
  );
  @override
  late final GeneratedColumn<int> cycleId = GeneratedColumn<int>(
    'cycle_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES interval_cycles (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weekFromMeta = const VerificationMeta(
    'weekFrom',
  );
  @override
  late final GeneratedColumn<int> weekFrom = GeneratedColumn<int>(
    'week_from',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weekToMeta = const VerificationMeta('weekTo');
  @override
  late final GeneratedColumn<int> weekTo = GeneratedColumn<int>(
    'week_to',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _protocolMeta = const VerificationMeta(
    'protocol',
  );
  @override
  late final GeneratedColumn<String> protocol = GeneratedColumn<String>(
    'protocol',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _warmUpMinMeta = const VerificationMeta(
    'warmUpMin',
  );
  @override
  late final GeneratedColumn<int> warmUpMin = GeneratedColumn<int>(
    'warm_up_min',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _coolDownMinMeta = const VerificationMeta(
    'coolDownMin',
  );
  @override
  late final GeneratedColumn<int> coolDownMin = GeneratedColumn<int>(
    'cool_down_min',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _damperMeta = const VerificationMeta('damper');
  @override
  late final GeneratedColumn<String> damper = GeneratedColumn<String>(
    'damper',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _strokeRateMeta = const VerificationMeta(
    'strokeRate',
  );
  @override
  late final GeneratedColumn<String> strokeRate = GeneratedColumn<String>(
    'stroke_rate',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _rpeMeta = const VerificationMeta('rpe');
  @override
  late final GeneratedColumn<String> rpe = GeneratedColumn<String>(
    'rpe',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _targetFasterBySecMinMeta =
      const VerificationMeta('targetFasterBySecMin');
  @override
  late final GeneratedColumn<int> targetFasterBySecMin = GeneratedColumn<int>(
    'target_faster_by_sec_min',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _targetFasterBySecMaxMeta =
      const VerificationMeta('targetFasterBySecMax');
  @override
  late final GeneratedColumn<int> targetFasterBySecMax = GeneratedColumn<int>(
    'target_faster_by_sec_max',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    cycleId,
    name,
    weekFrom,
    weekTo,
    protocol,
    warmUpMin,
    coolDownMin,
    damper,
    strokeRate,
    rpe,
    targetFasterBySecMin,
    targetFasterBySecMax,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'interval_blocks';
  @override
  VerificationContext validateIntegrity(
    Insertable<IntervalBlock> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('cycle_id')) {
      context.handle(
        _cycleIdMeta,
        cycleId.isAcceptableOrUnknown(data['cycle_id']!, _cycleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_cycleIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('week_from')) {
      context.handle(
        _weekFromMeta,
        weekFrom.isAcceptableOrUnknown(data['week_from']!, _weekFromMeta),
      );
    } else if (isInserting) {
      context.missing(_weekFromMeta);
    }
    if (data.containsKey('week_to')) {
      context.handle(
        _weekToMeta,
        weekTo.isAcceptableOrUnknown(data['week_to']!, _weekToMeta),
      );
    } else if (isInserting) {
      context.missing(_weekToMeta);
    }
    if (data.containsKey('protocol')) {
      context.handle(
        _protocolMeta,
        protocol.isAcceptableOrUnknown(data['protocol']!, _protocolMeta),
      );
    } else if (isInserting) {
      context.missing(_protocolMeta);
    }
    if (data.containsKey('warm_up_min')) {
      context.handle(
        _warmUpMinMeta,
        warmUpMin.isAcceptableOrUnknown(data['warm_up_min']!, _warmUpMinMeta),
      );
    }
    if (data.containsKey('cool_down_min')) {
      context.handle(
        _coolDownMinMeta,
        coolDownMin.isAcceptableOrUnknown(
          data['cool_down_min']!,
          _coolDownMinMeta,
        ),
      );
    }
    if (data.containsKey('damper')) {
      context.handle(
        _damperMeta,
        damper.isAcceptableOrUnknown(data['damper']!, _damperMeta),
      );
    }
    if (data.containsKey('stroke_rate')) {
      context.handle(
        _strokeRateMeta,
        strokeRate.isAcceptableOrUnknown(data['stroke_rate']!, _strokeRateMeta),
      );
    }
    if (data.containsKey('rpe')) {
      context.handle(
        _rpeMeta,
        rpe.isAcceptableOrUnknown(data['rpe']!, _rpeMeta),
      );
    }
    if (data.containsKey('target_faster_by_sec_min')) {
      context.handle(
        _targetFasterBySecMinMeta,
        targetFasterBySecMin.isAcceptableOrUnknown(
          data['target_faster_by_sec_min']!,
          _targetFasterBySecMinMeta,
        ),
      );
    }
    if (data.containsKey('target_faster_by_sec_max')) {
      context.handle(
        _targetFasterBySecMaxMeta,
        targetFasterBySecMax.isAcceptableOrUnknown(
          data['target_faster_by_sec_max']!,
          _targetFasterBySecMaxMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  IntervalBlock map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IntervalBlock(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      cycleId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cycle_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      weekFrom: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}week_from'],
      )!,
      weekTo: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}week_to'],
      )!,
      protocol: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}protocol'],
      )!,
      warmUpMin: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}warm_up_min'],
      ),
      coolDownMin: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cool_down_min'],
      ),
      damper: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}damper'],
      ),
      strokeRate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}stroke_rate'],
      ),
      rpe: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rpe'],
      ),
      targetFasterBySecMin: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}target_faster_by_sec_min'],
      ),
      targetFasterBySecMax: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}target_faster_by_sec_max'],
      ),
    );
  }

  @override
  $IntervalBlocksTable createAlias(String alias) {
    return $IntervalBlocksTable(attachedDatabase, alias);
  }
}

class IntervalBlock extends DataClass implements Insertable<IntervalBlock> {
  final int id;
  final int cycleId;
  final String name;
  final int weekFrom;
  final int weekTo;
  final String protocol;
  final int? warmUpMin;
  final int? coolDownMin;
  final String? damper;
  final String? strokeRate;
  final String? rpe;

  /// Target split range, in seconds faster than the logged Zone 2 split.
  final int? targetFasterBySecMin;
  final int? targetFasterBySecMax;
  const IntervalBlock({
    required this.id,
    required this.cycleId,
    required this.name,
    required this.weekFrom,
    required this.weekTo,
    required this.protocol,
    this.warmUpMin,
    this.coolDownMin,
    this.damper,
    this.strokeRate,
    this.rpe,
    this.targetFasterBySecMin,
    this.targetFasterBySecMax,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['cycle_id'] = Variable<int>(cycleId);
    map['name'] = Variable<String>(name);
    map['week_from'] = Variable<int>(weekFrom);
    map['week_to'] = Variable<int>(weekTo);
    map['protocol'] = Variable<String>(protocol);
    if (!nullToAbsent || warmUpMin != null) {
      map['warm_up_min'] = Variable<int>(warmUpMin);
    }
    if (!nullToAbsent || coolDownMin != null) {
      map['cool_down_min'] = Variable<int>(coolDownMin);
    }
    if (!nullToAbsent || damper != null) {
      map['damper'] = Variable<String>(damper);
    }
    if (!nullToAbsent || strokeRate != null) {
      map['stroke_rate'] = Variable<String>(strokeRate);
    }
    if (!nullToAbsent || rpe != null) {
      map['rpe'] = Variable<String>(rpe);
    }
    if (!nullToAbsent || targetFasterBySecMin != null) {
      map['target_faster_by_sec_min'] = Variable<int>(targetFasterBySecMin);
    }
    if (!nullToAbsent || targetFasterBySecMax != null) {
      map['target_faster_by_sec_max'] = Variable<int>(targetFasterBySecMax);
    }
    return map;
  }

  IntervalBlocksCompanion toCompanion(bool nullToAbsent) {
    return IntervalBlocksCompanion(
      id: Value(id),
      cycleId: Value(cycleId),
      name: Value(name),
      weekFrom: Value(weekFrom),
      weekTo: Value(weekTo),
      protocol: Value(protocol),
      warmUpMin: warmUpMin == null && nullToAbsent
          ? const Value.absent()
          : Value(warmUpMin),
      coolDownMin: coolDownMin == null && nullToAbsent
          ? const Value.absent()
          : Value(coolDownMin),
      damper: damper == null && nullToAbsent
          ? const Value.absent()
          : Value(damper),
      strokeRate: strokeRate == null && nullToAbsent
          ? const Value.absent()
          : Value(strokeRate),
      rpe: rpe == null && nullToAbsent ? const Value.absent() : Value(rpe),
      targetFasterBySecMin: targetFasterBySecMin == null && nullToAbsent
          ? const Value.absent()
          : Value(targetFasterBySecMin),
      targetFasterBySecMax: targetFasterBySecMax == null && nullToAbsent
          ? const Value.absent()
          : Value(targetFasterBySecMax),
    );
  }

  factory IntervalBlock.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IntervalBlock(
      id: serializer.fromJson<int>(json['id']),
      cycleId: serializer.fromJson<int>(json['cycleId']),
      name: serializer.fromJson<String>(json['name']),
      weekFrom: serializer.fromJson<int>(json['weekFrom']),
      weekTo: serializer.fromJson<int>(json['weekTo']),
      protocol: serializer.fromJson<String>(json['protocol']),
      warmUpMin: serializer.fromJson<int?>(json['warmUpMin']),
      coolDownMin: serializer.fromJson<int?>(json['coolDownMin']),
      damper: serializer.fromJson<String?>(json['damper']),
      strokeRate: serializer.fromJson<String?>(json['strokeRate']),
      rpe: serializer.fromJson<String?>(json['rpe']),
      targetFasterBySecMin: serializer.fromJson<int?>(
        json['targetFasterBySecMin'],
      ),
      targetFasterBySecMax: serializer.fromJson<int?>(
        json['targetFasterBySecMax'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'cycleId': serializer.toJson<int>(cycleId),
      'name': serializer.toJson<String>(name),
      'weekFrom': serializer.toJson<int>(weekFrom),
      'weekTo': serializer.toJson<int>(weekTo),
      'protocol': serializer.toJson<String>(protocol),
      'warmUpMin': serializer.toJson<int?>(warmUpMin),
      'coolDownMin': serializer.toJson<int?>(coolDownMin),
      'damper': serializer.toJson<String?>(damper),
      'strokeRate': serializer.toJson<String?>(strokeRate),
      'rpe': serializer.toJson<String?>(rpe),
      'targetFasterBySecMin': serializer.toJson<int?>(targetFasterBySecMin),
      'targetFasterBySecMax': serializer.toJson<int?>(targetFasterBySecMax),
    };
  }

  IntervalBlock copyWith({
    int? id,
    int? cycleId,
    String? name,
    int? weekFrom,
    int? weekTo,
    String? protocol,
    Value<int?> warmUpMin = const Value.absent(),
    Value<int?> coolDownMin = const Value.absent(),
    Value<String?> damper = const Value.absent(),
    Value<String?> strokeRate = const Value.absent(),
    Value<String?> rpe = const Value.absent(),
    Value<int?> targetFasterBySecMin = const Value.absent(),
    Value<int?> targetFasterBySecMax = const Value.absent(),
  }) => IntervalBlock(
    id: id ?? this.id,
    cycleId: cycleId ?? this.cycleId,
    name: name ?? this.name,
    weekFrom: weekFrom ?? this.weekFrom,
    weekTo: weekTo ?? this.weekTo,
    protocol: protocol ?? this.protocol,
    warmUpMin: warmUpMin.present ? warmUpMin.value : this.warmUpMin,
    coolDownMin: coolDownMin.present ? coolDownMin.value : this.coolDownMin,
    damper: damper.present ? damper.value : this.damper,
    strokeRate: strokeRate.present ? strokeRate.value : this.strokeRate,
    rpe: rpe.present ? rpe.value : this.rpe,
    targetFasterBySecMin: targetFasterBySecMin.present
        ? targetFasterBySecMin.value
        : this.targetFasterBySecMin,
    targetFasterBySecMax: targetFasterBySecMax.present
        ? targetFasterBySecMax.value
        : this.targetFasterBySecMax,
  );
  IntervalBlock copyWithCompanion(IntervalBlocksCompanion data) {
    return IntervalBlock(
      id: data.id.present ? data.id.value : this.id,
      cycleId: data.cycleId.present ? data.cycleId.value : this.cycleId,
      name: data.name.present ? data.name.value : this.name,
      weekFrom: data.weekFrom.present ? data.weekFrom.value : this.weekFrom,
      weekTo: data.weekTo.present ? data.weekTo.value : this.weekTo,
      protocol: data.protocol.present ? data.protocol.value : this.protocol,
      warmUpMin: data.warmUpMin.present ? data.warmUpMin.value : this.warmUpMin,
      coolDownMin: data.coolDownMin.present
          ? data.coolDownMin.value
          : this.coolDownMin,
      damper: data.damper.present ? data.damper.value : this.damper,
      strokeRate: data.strokeRate.present
          ? data.strokeRate.value
          : this.strokeRate,
      rpe: data.rpe.present ? data.rpe.value : this.rpe,
      targetFasterBySecMin: data.targetFasterBySecMin.present
          ? data.targetFasterBySecMin.value
          : this.targetFasterBySecMin,
      targetFasterBySecMax: data.targetFasterBySecMax.present
          ? data.targetFasterBySecMax.value
          : this.targetFasterBySecMax,
    );
  }

  @override
  String toString() {
    return (StringBuffer('IntervalBlock(')
          ..write('id: $id, ')
          ..write('cycleId: $cycleId, ')
          ..write('name: $name, ')
          ..write('weekFrom: $weekFrom, ')
          ..write('weekTo: $weekTo, ')
          ..write('protocol: $protocol, ')
          ..write('warmUpMin: $warmUpMin, ')
          ..write('coolDownMin: $coolDownMin, ')
          ..write('damper: $damper, ')
          ..write('strokeRate: $strokeRate, ')
          ..write('rpe: $rpe, ')
          ..write('targetFasterBySecMin: $targetFasterBySecMin, ')
          ..write('targetFasterBySecMax: $targetFasterBySecMax')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    cycleId,
    name,
    weekFrom,
    weekTo,
    protocol,
    warmUpMin,
    coolDownMin,
    damper,
    strokeRate,
    rpe,
    targetFasterBySecMin,
    targetFasterBySecMax,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IntervalBlock &&
          other.id == this.id &&
          other.cycleId == this.cycleId &&
          other.name == this.name &&
          other.weekFrom == this.weekFrom &&
          other.weekTo == this.weekTo &&
          other.protocol == this.protocol &&
          other.warmUpMin == this.warmUpMin &&
          other.coolDownMin == this.coolDownMin &&
          other.damper == this.damper &&
          other.strokeRate == this.strokeRate &&
          other.rpe == this.rpe &&
          other.targetFasterBySecMin == this.targetFasterBySecMin &&
          other.targetFasterBySecMax == this.targetFasterBySecMax);
}

class IntervalBlocksCompanion extends UpdateCompanion<IntervalBlock> {
  final Value<int> id;
  final Value<int> cycleId;
  final Value<String> name;
  final Value<int> weekFrom;
  final Value<int> weekTo;
  final Value<String> protocol;
  final Value<int?> warmUpMin;
  final Value<int?> coolDownMin;
  final Value<String?> damper;
  final Value<String?> strokeRate;
  final Value<String?> rpe;
  final Value<int?> targetFasterBySecMin;
  final Value<int?> targetFasterBySecMax;
  const IntervalBlocksCompanion({
    this.id = const Value.absent(),
    this.cycleId = const Value.absent(),
    this.name = const Value.absent(),
    this.weekFrom = const Value.absent(),
    this.weekTo = const Value.absent(),
    this.protocol = const Value.absent(),
    this.warmUpMin = const Value.absent(),
    this.coolDownMin = const Value.absent(),
    this.damper = const Value.absent(),
    this.strokeRate = const Value.absent(),
    this.rpe = const Value.absent(),
    this.targetFasterBySecMin = const Value.absent(),
    this.targetFasterBySecMax = const Value.absent(),
  });
  IntervalBlocksCompanion.insert({
    this.id = const Value.absent(),
    required int cycleId,
    required String name,
    required int weekFrom,
    required int weekTo,
    required String protocol,
    this.warmUpMin = const Value.absent(),
    this.coolDownMin = const Value.absent(),
    this.damper = const Value.absent(),
    this.strokeRate = const Value.absent(),
    this.rpe = const Value.absent(),
    this.targetFasterBySecMin = const Value.absent(),
    this.targetFasterBySecMax = const Value.absent(),
  }) : cycleId = Value(cycleId),
       name = Value(name),
       weekFrom = Value(weekFrom),
       weekTo = Value(weekTo),
       protocol = Value(protocol);
  static Insertable<IntervalBlock> custom({
    Expression<int>? id,
    Expression<int>? cycleId,
    Expression<String>? name,
    Expression<int>? weekFrom,
    Expression<int>? weekTo,
    Expression<String>? protocol,
    Expression<int>? warmUpMin,
    Expression<int>? coolDownMin,
    Expression<String>? damper,
    Expression<String>? strokeRate,
    Expression<String>? rpe,
    Expression<int>? targetFasterBySecMin,
    Expression<int>? targetFasterBySecMax,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cycleId != null) 'cycle_id': cycleId,
      if (name != null) 'name': name,
      if (weekFrom != null) 'week_from': weekFrom,
      if (weekTo != null) 'week_to': weekTo,
      if (protocol != null) 'protocol': protocol,
      if (warmUpMin != null) 'warm_up_min': warmUpMin,
      if (coolDownMin != null) 'cool_down_min': coolDownMin,
      if (damper != null) 'damper': damper,
      if (strokeRate != null) 'stroke_rate': strokeRate,
      if (rpe != null) 'rpe': rpe,
      if (targetFasterBySecMin != null)
        'target_faster_by_sec_min': targetFasterBySecMin,
      if (targetFasterBySecMax != null)
        'target_faster_by_sec_max': targetFasterBySecMax,
    });
  }

  IntervalBlocksCompanion copyWith({
    Value<int>? id,
    Value<int>? cycleId,
    Value<String>? name,
    Value<int>? weekFrom,
    Value<int>? weekTo,
    Value<String>? protocol,
    Value<int?>? warmUpMin,
    Value<int?>? coolDownMin,
    Value<String?>? damper,
    Value<String?>? strokeRate,
    Value<String?>? rpe,
    Value<int?>? targetFasterBySecMin,
    Value<int?>? targetFasterBySecMax,
  }) {
    return IntervalBlocksCompanion(
      id: id ?? this.id,
      cycleId: cycleId ?? this.cycleId,
      name: name ?? this.name,
      weekFrom: weekFrom ?? this.weekFrom,
      weekTo: weekTo ?? this.weekTo,
      protocol: protocol ?? this.protocol,
      warmUpMin: warmUpMin ?? this.warmUpMin,
      coolDownMin: coolDownMin ?? this.coolDownMin,
      damper: damper ?? this.damper,
      strokeRate: strokeRate ?? this.strokeRate,
      rpe: rpe ?? this.rpe,
      targetFasterBySecMin: targetFasterBySecMin ?? this.targetFasterBySecMin,
      targetFasterBySecMax: targetFasterBySecMax ?? this.targetFasterBySecMax,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (cycleId.present) {
      map['cycle_id'] = Variable<int>(cycleId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (weekFrom.present) {
      map['week_from'] = Variable<int>(weekFrom.value);
    }
    if (weekTo.present) {
      map['week_to'] = Variable<int>(weekTo.value);
    }
    if (protocol.present) {
      map['protocol'] = Variable<String>(protocol.value);
    }
    if (warmUpMin.present) {
      map['warm_up_min'] = Variable<int>(warmUpMin.value);
    }
    if (coolDownMin.present) {
      map['cool_down_min'] = Variable<int>(coolDownMin.value);
    }
    if (damper.present) {
      map['damper'] = Variable<String>(damper.value);
    }
    if (strokeRate.present) {
      map['stroke_rate'] = Variable<String>(strokeRate.value);
    }
    if (rpe.present) {
      map['rpe'] = Variable<String>(rpe.value);
    }
    if (targetFasterBySecMin.present) {
      map['target_faster_by_sec_min'] = Variable<int>(
        targetFasterBySecMin.value,
      );
    }
    if (targetFasterBySecMax.present) {
      map['target_faster_by_sec_max'] = Variable<int>(
        targetFasterBySecMax.value,
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IntervalBlocksCompanion(')
          ..write('id: $id, ')
          ..write('cycleId: $cycleId, ')
          ..write('name: $name, ')
          ..write('weekFrom: $weekFrom, ')
          ..write('weekTo: $weekTo, ')
          ..write('protocol: $protocol, ')
          ..write('warmUpMin: $warmUpMin, ')
          ..write('coolDownMin: $coolDownMin, ')
          ..write('damper: $damper, ')
          ..write('strokeRate: $strokeRate, ')
          ..write('rpe: $rpe, ')
          ..write('targetFasterBySecMin: $targetFasterBySecMin, ')
          ..write('targetFasterBySecMax: $targetFasterBySecMax')
          ..write(')'))
        .toString();
  }
}

class $ErgSessionsTable extends ErgSessions
    with TableInfo<$ErgSessionsTable, ErgSession> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ErgSessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _distanceMeta = const VerificationMeta(
    'distance',
  );
  @override
  late final GeneratedColumn<int> distance = GeneratedColumn<int>(
    'distance',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timeSecMeta = const VerificationMeta(
    'timeSec',
  );
  @override
  late final GeneratedColumn<int> timeSec = GeneratedColumn<int>(
    'time_sec',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _splitSecMeta = const VerificationMeta(
    'splitSec',
  );
  @override
  late final GeneratedColumn<double> splitSec = GeneratedColumn<double>(
    'split_sec',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _spmMeta = const VerificationMeta('spm');
  @override
  late final GeneratedColumn<int> spm = GeneratedColumn<int>(
    'spm',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _damperMeta = const VerificationMeta('damper');
  @override
  late final GeneratedColumn<int> damper = GeneratedColumn<int>(
    'damper',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    date,
    distance,
    timeSec,
    splitSec,
    spm,
    damper,
    note,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'erg_sessions';
  @override
  VerificationContext validateIntegrity(
    Insertable<ErgSession> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('distance')) {
      context.handle(
        _distanceMeta,
        distance.isAcceptableOrUnknown(data['distance']!, _distanceMeta),
      );
    } else if (isInserting) {
      context.missing(_distanceMeta);
    }
    if (data.containsKey('time_sec')) {
      context.handle(
        _timeSecMeta,
        timeSec.isAcceptableOrUnknown(data['time_sec']!, _timeSecMeta),
      );
    } else if (isInserting) {
      context.missing(_timeSecMeta);
    }
    if (data.containsKey('split_sec')) {
      context.handle(
        _splitSecMeta,
        splitSec.isAcceptableOrUnknown(data['split_sec']!, _splitSecMeta),
      );
    } else if (isInserting) {
      context.missing(_splitSecMeta);
    }
    if (data.containsKey('spm')) {
      context.handle(
        _spmMeta,
        spm.isAcceptableOrUnknown(data['spm']!, _spmMeta),
      );
    }
    if (data.containsKey('damper')) {
      context.handle(
        _damperMeta,
        damper.isAcceptableOrUnknown(data['damper']!, _damperMeta),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ErgSession map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ErgSession(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      distance: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}distance'],
      )!,
      timeSec: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}time_sec'],
      )!,
      splitSec: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}split_sec'],
      )!,
      spm: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}spm'],
      ),
      damper: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}damper'],
      ),
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
    );
  }

  @override
  $ErgSessionsTable createAlias(String alias) {
    return $ErgSessionsTable(attachedDatabase, alias);
  }
}

class ErgSession extends DataClass implements Insertable<ErgSession> {
  final int id;
  final DateTime date;

  /// Metres.
  final int distance;
  final int timeSec;

  /// Seconds per 500 m.
  final double splitSec;
  final int? spm;
  final int? damper;
  final String? note;
  const ErgSession({
    required this.id,
    required this.date,
    required this.distance,
    required this.timeSec,
    required this.splitSec,
    this.spm,
    this.damper,
    this.note,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    map['distance'] = Variable<int>(distance);
    map['time_sec'] = Variable<int>(timeSec);
    map['split_sec'] = Variable<double>(splitSec);
    if (!nullToAbsent || spm != null) {
      map['spm'] = Variable<int>(spm);
    }
    if (!nullToAbsent || damper != null) {
      map['damper'] = Variable<int>(damper);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    return map;
  }

  ErgSessionsCompanion toCompanion(bool nullToAbsent) {
    return ErgSessionsCompanion(
      id: Value(id),
      date: Value(date),
      distance: Value(distance),
      timeSec: Value(timeSec),
      splitSec: Value(splitSec),
      spm: spm == null && nullToAbsent ? const Value.absent() : Value(spm),
      damper: damper == null && nullToAbsent
          ? const Value.absent()
          : Value(damper),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory ErgSession.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ErgSession(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      distance: serializer.fromJson<int>(json['distance']),
      timeSec: serializer.fromJson<int>(json['timeSec']),
      splitSec: serializer.fromJson<double>(json['splitSec']),
      spm: serializer.fromJson<int?>(json['spm']),
      damper: serializer.fromJson<int?>(json['damper']),
      note: serializer.fromJson<String?>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'distance': serializer.toJson<int>(distance),
      'timeSec': serializer.toJson<int>(timeSec),
      'splitSec': serializer.toJson<double>(splitSec),
      'spm': serializer.toJson<int?>(spm),
      'damper': serializer.toJson<int?>(damper),
      'note': serializer.toJson<String?>(note),
    };
  }

  ErgSession copyWith({
    int? id,
    DateTime? date,
    int? distance,
    int? timeSec,
    double? splitSec,
    Value<int?> spm = const Value.absent(),
    Value<int?> damper = const Value.absent(),
    Value<String?> note = const Value.absent(),
  }) => ErgSession(
    id: id ?? this.id,
    date: date ?? this.date,
    distance: distance ?? this.distance,
    timeSec: timeSec ?? this.timeSec,
    splitSec: splitSec ?? this.splitSec,
    spm: spm.present ? spm.value : this.spm,
    damper: damper.present ? damper.value : this.damper,
    note: note.present ? note.value : this.note,
  );
  ErgSession copyWithCompanion(ErgSessionsCompanion data) {
    return ErgSession(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      distance: data.distance.present ? data.distance.value : this.distance,
      timeSec: data.timeSec.present ? data.timeSec.value : this.timeSec,
      splitSec: data.splitSec.present ? data.splitSec.value : this.splitSec,
      spm: data.spm.present ? data.spm.value : this.spm,
      damper: data.damper.present ? data.damper.value : this.damper,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ErgSession(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('distance: $distance, ')
          ..write('timeSec: $timeSec, ')
          ..write('splitSec: $splitSec, ')
          ..write('spm: $spm, ')
          ..write('damper: $damper, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, date, distance, timeSec, splitSec, spm, damper, note);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ErgSession &&
          other.id == this.id &&
          other.date == this.date &&
          other.distance == this.distance &&
          other.timeSec == this.timeSec &&
          other.splitSec == this.splitSec &&
          other.spm == this.spm &&
          other.damper == this.damper &&
          other.note == this.note);
}

class ErgSessionsCompanion extends UpdateCompanion<ErgSession> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<int> distance;
  final Value<int> timeSec;
  final Value<double> splitSec;
  final Value<int?> spm;
  final Value<int?> damper;
  final Value<String?> note;
  const ErgSessionsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.distance = const Value.absent(),
    this.timeSec = const Value.absent(),
    this.splitSec = const Value.absent(),
    this.spm = const Value.absent(),
    this.damper = const Value.absent(),
    this.note = const Value.absent(),
  });
  ErgSessionsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    required int distance,
    required int timeSec,
    required double splitSec,
    this.spm = const Value.absent(),
    this.damper = const Value.absent(),
    this.note = const Value.absent(),
  }) : date = Value(date),
       distance = Value(distance),
       timeSec = Value(timeSec),
       splitSec = Value(splitSec);
  static Insertable<ErgSession> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<int>? distance,
    Expression<int>? timeSec,
    Expression<double>? splitSec,
    Expression<int>? spm,
    Expression<int>? damper,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (distance != null) 'distance': distance,
      if (timeSec != null) 'time_sec': timeSec,
      if (splitSec != null) 'split_sec': splitSec,
      if (spm != null) 'spm': spm,
      if (damper != null) 'damper': damper,
      if (note != null) 'note': note,
    });
  }

  ErgSessionsCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? date,
    Value<int>? distance,
    Value<int>? timeSec,
    Value<double>? splitSec,
    Value<int?>? spm,
    Value<int?>? damper,
    Value<String?>? note,
  }) {
    return ErgSessionsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      distance: distance ?? this.distance,
      timeSec: timeSec ?? this.timeSec,
      splitSec: splitSec ?? this.splitSec,
      spm: spm ?? this.spm,
      damper: damper ?? this.damper,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (distance.present) {
      map['distance'] = Variable<int>(distance.value);
    }
    if (timeSec.present) {
      map['time_sec'] = Variable<int>(timeSec.value);
    }
    if (splitSec.present) {
      map['split_sec'] = Variable<double>(splitSec.value);
    }
    if (spm.present) {
      map['spm'] = Variable<int>(spm.value);
    }
    if (damper.present) {
      map['damper'] = Variable<int>(damper.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ErgSessionsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('distance: $distance, ')
          ..write('timeSec: $timeSec, ')
          ..write('splitSec: $splitSec, ')
          ..write('spm: $spm, ')
          ..write('damper: $damper, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

class $MealsTable extends Meals with TableInfo<$MealsTable, Meal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MealsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _protocolIdMeta = const VerificationMeta(
    'protocolId',
  );
  @override
  late final GeneratedColumn<int> protocolId = GeneratedColumn<int>(
    'protocol_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES protocols (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<MealKind, String> kind =
      GeneratedColumn<String>(
        'kind',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<MealKind>($MealsTable.$converterkind);
  static const VerificationMeta _kcalMeta = const VerificationMeta('kcal');
  @override
  late final GeneratedColumn<int> kcal = GeneratedColumn<int>(
    'kcal',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pMeta = const VerificationMeta('p');
  @override
  late final GeneratedColumn<double> p = GeneratedColumn<double>(
    'p',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cMeta = const VerificationMeta('c');
  @override
  late final GeneratedColumn<double> c = GeneratedColumn<double>(
    'c',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fMeta = const VerificationMeta('f');
  @override
  late final GeneratedColumn<double> f = GeneratedColumn<double>(
    'f',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _defaultPortionMeta = const VerificationMeta(
    'defaultPortion',
  );
  @override
  late final GeneratedColumn<String> defaultPortion = GeneratedColumn<String>(
    'default_portion',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _requiredAdditionMeta = const VerificationMeta(
    'requiredAddition',
  );
  @override
  late final GeneratedColumn<String> requiredAddition = GeneratedColumn<String>(
    'required_addition',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _warningMeta = const VerificationMeta(
    'warning',
  );
  @override
  late final GeneratedColumn<String> warning = GeneratedColumn<String>(
    'warning',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isUserCreatedMeta = const VerificationMeta(
    'isUserCreated',
  );
  @override
  late final GeneratedColumn<bool> isUserCreated = GeneratedColumn<bool>(
    'is_user_created',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_user_created" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    protocolId,
    name,
    kind,
    kcal,
    p,
    c,
    f,
    defaultPortion,
    requiredAddition,
    warning,
    isUserCreated,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'meals';
  @override
  VerificationContext validateIntegrity(
    Insertable<Meal> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('protocol_id')) {
      context.handle(
        _protocolIdMeta,
        protocolId.isAcceptableOrUnknown(data['protocol_id']!, _protocolIdMeta),
      );
    } else if (isInserting) {
      context.missing(_protocolIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('kcal')) {
      context.handle(
        _kcalMeta,
        kcal.isAcceptableOrUnknown(data['kcal']!, _kcalMeta),
      );
    }
    if (data.containsKey('p')) {
      context.handle(_pMeta, p.isAcceptableOrUnknown(data['p']!, _pMeta));
    }
    if (data.containsKey('c')) {
      context.handle(_cMeta, c.isAcceptableOrUnknown(data['c']!, _cMeta));
    }
    if (data.containsKey('f')) {
      context.handle(_fMeta, f.isAcceptableOrUnknown(data['f']!, _fMeta));
    }
    if (data.containsKey('default_portion')) {
      context.handle(
        _defaultPortionMeta,
        defaultPortion.isAcceptableOrUnknown(
          data['default_portion']!,
          _defaultPortionMeta,
        ),
      );
    }
    if (data.containsKey('required_addition')) {
      context.handle(
        _requiredAdditionMeta,
        requiredAddition.isAcceptableOrUnknown(
          data['required_addition']!,
          _requiredAdditionMeta,
        ),
      );
    }
    if (data.containsKey('warning')) {
      context.handle(
        _warningMeta,
        warning.isAcceptableOrUnknown(data['warning']!, _warningMeta),
      );
    }
    if (data.containsKey('is_user_created')) {
      context.handle(
        _isUserCreatedMeta,
        isUserCreated.isAcceptableOrUnknown(
          data['is_user_created']!,
          _isUserCreatedMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Meal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Meal(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      protocolId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}protocol_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      kind: $MealsTable.$converterkind.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}kind'],
        )!,
      ),
      kcal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}kcal'],
      ),
      p: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}p'],
      ),
      c: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}c'],
      ),
      f: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}f'],
      ),
      defaultPortion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}default_portion'],
      ),
      requiredAddition: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}required_addition'],
      ),
      warning: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}warning'],
      ),
      isUserCreated: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_user_created'],
      )!,
    );
  }

  @override
  $MealsTable createAlias(String alias) {
    return $MealsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<MealKind, String, String> $converterkind =
      const EnumNameConverter<MealKind>(MealKind.values);
}

class Meal extends DataClass implements Insertable<Meal> {
  final int id;
  final int protocolId;
  final String name;
  final MealKind kind;
  final int? kcal;
  final double? p;
  final double? c;
  final double? f;
  final String? defaultPortion;
  final String? requiredAddition;
  final String? warning;
  final bool isUserCreated;
  const Meal({
    required this.id,
    required this.protocolId,
    required this.name,
    required this.kind,
    this.kcal,
    this.p,
    this.c,
    this.f,
    this.defaultPortion,
    this.requiredAddition,
    this.warning,
    required this.isUserCreated,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['protocol_id'] = Variable<int>(protocolId);
    map['name'] = Variable<String>(name);
    {
      map['kind'] = Variable<String>($MealsTable.$converterkind.toSql(kind));
    }
    if (!nullToAbsent || kcal != null) {
      map['kcal'] = Variable<int>(kcal);
    }
    if (!nullToAbsent || p != null) {
      map['p'] = Variable<double>(p);
    }
    if (!nullToAbsent || c != null) {
      map['c'] = Variable<double>(c);
    }
    if (!nullToAbsent || f != null) {
      map['f'] = Variable<double>(f);
    }
    if (!nullToAbsent || defaultPortion != null) {
      map['default_portion'] = Variable<String>(defaultPortion);
    }
    if (!nullToAbsent || requiredAddition != null) {
      map['required_addition'] = Variable<String>(requiredAddition);
    }
    if (!nullToAbsent || warning != null) {
      map['warning'] = Variable<String>(warning);
    }
    map['is_user_created'] = Variable<bool>(isUserCreated);
    return map;
  }

  MealsCompanion toCompanion(bool nullToAbsent) {
    return MealsCompanion(
      id: Value(id),
      protocolId: Value(protocolId),
      name: Value(name),
      kind: Value(kind),
      kcal: kcal == null && nullToAbsent ? const Value.absent() : Value(kcal),
      p: p == null && nullToAbsent ? const Value.absent() : Value(p),
      c: c == null && nullToAbsent ? const Value.absent() : Value(c),
      f: f == null && nullToAbsent ? const Value.absent() : Value(f),
      defaultPortion: defaultPortion == null && nullToAbsent
          ? const Value.absent()
          : Value(defaultPortion),
      requiredAddition: requiredAddition == null && nullToAbsent
          ? const Value.absent()
          : Value(requiredAddition),
      warning: warning == null && nullToAbsent
          ? const Value.absent()
          : Value(warning),
      isUserCreated: Value(isUserCreated),
    );
  }

  factory Meal.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Meal(
      id: serializer.fromJson<int>(json['id']),
      protocolId: serializer.fromJson<int>(json['protocolId']),
      name: serializer.fromJson<String>(json['name']),
      kind: $MealsTable.$converterkind.fromJson(
        serializer.fromJson<String>(json['kind']),
      ),
      kcal: serializer.fromJson<int?>(json['kcal']),
      p: serializer.fromJson<double?>(json['p']),
      c: serializer.fromJson<double?>(json['c']),
      f: serializer.fromJson<double?>(json['f']),
      defaultPortion: serializer.fromJson<String?>(json['defaultPortion']),
      requiredAddition: serializer.fromJson<String?>(json['requiredAddition']),
      warning: serializer.fromJson<String?>(json['warning']),
      isUserCreated: serializer.fromJson<bool>(json['isUserCreated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'protocolId': serializer.toJson<int>(protocolId),
      'name': serializer.toJson<String>(name),
      'kind': serializer.toJson<String>(
        $MealsTable.$converterkind.toJson(kind),
      ),
      'kcal': serializer.toJson<int?>(kcal),
      'p': serializer.toJson<double?>(p),
      'c': serializer.toJson<double?>(c),
      'f': serializer.toJson<double?>(f),
      'defaultPortion': serializer.toJson<String?>(defaultPortion),
      'requiredAddition': serializer.toJson<String?>(requiredAddition),
      'warning': serializer.toJson<String?>(warning),
      'isUserCreated': serializer.toJson<bool>(isUserCreated),
    };
  }

  Meal copyWith({
    int? id,
    int? protocolId,
    String? name,
    MealKind? kind,
    Value<int?> kcal = const Value.absent(),
    Value<double?> p = const Value.absent(),
    Value<double?> c = const Value.absent(),
    Value<double?> f = const Value.absent(),
    Value<String?> defaultPortion = const Value.absent(),
    Value<String?> requiredAddition = const Value.absent(),
    Value<String?> warning = const Value.absent(),
    bool? isUserCreated,
  }) => Meal(
    id: id ?? this.id,
    protocolId: protocolId ?? this.protocolId,
    name: name ?? this.name,
    kind: kind ?? this.kind,
    kcal: kcal.present ? kcal.value : this.kcal,
    p: p.present ? p.value : this.p,
    c: c.present ? c.value : this.c,
    f: f.present ? f.value : this.f,
    defaultPortion: defaultPortion.present
        ? defaultPortion.value
        : this.defaultPortion,
    requiredAddition: requiredAddition.present
        ? requiredAddition.value
        : this.requiredAddition,
    warning: warning.present ? warning.value : this.warning,
    isUserCreated: isUserCreated ?? this.isUserCreated,
  );
  Meal copyWithCompanion(MealsCompanion data) {
    return Meal(
      id: data.id.present ? data.id.value : this.id,
      protocolId: data.protocolId.present
          ? data.protocolId.value
          : this.protocolId,
      name: data.name.present ? data.name.value : this.name,
      kind: data.kind.present ? data.kind.value : this.kind,
      kcal: data.kcal.present ? data.kcal.value : this.kcal,
      p: data.p.present ? data.p.value : this.p,
      c: data.c.present ? data.c.value : this.c,
      f: data.f.present ? data.f.value : this.f,
      defaultPortion: data.defaultPortion.present
          ? data.defaultPortion.value
          : this.defaultPortion,
      requiredAddition: data.requiredAddition.present
          ? data.requiredAddition.value
          : this.requiredAddition,
      warning: data.warning.present ? data.warning.value : this.warning,
      isUserCreated: data.isUserCreated.present
          ? data.isUserCreated.value
          : this.isUserCreated,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Meal(')
          ..write('id: $id, ')
          ..write('protocolId: $protocolId, ')
          ..write('name: $name, ')
          ..write('kind: $kind, ')
          ..write('kcal: $kcal, ')
          ..write('p: $p, ')
          ..write('c: $c, ')
          ..write('f: $f, ')
          ..write('defaultPortion: $defaultPortion, ')
          ..write('requiredAddition: $requiredAddition, ')
          ..write('warning: $warning, ')
          ..write('isUserCreated: $isUserCreated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    protocolId,
    name,
    kind,
    kcal,
    p,
    c,
    f,
    defaultPortion,
    requiredAddition,
    warning,
    isUserCreated,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Meal &&
          other.id == this.id &&
          other.protocolId == this.protocolId &&
          other.name == this.name &&
          other.kind == this.kind &&
          other.kcal == this.kcal &&
          other.p == this.p &&
          other.c == this.c &&
          other.f == this.f &&
          other.defaultPortion == this.defaultPortion &&
          other.requiredAddition == this.requiredAddition &&
          other.warning == this.warning &&
          other.isUserCreated == this.isUserCreated);
}

class MealsCompanion extends UpdateCompanion<Meal> {
  final Value<int> id;
  final Value<int> protocolId;
  final Value<String> name;
  final Value<MealKind> kind;
  final Value<int?> kcal;
  final Value<double?> p;
  final Value<double?> c;
  final Value<double?> f;
  final Value<String?> defaultPortion;
  final Value<String?> requiredAddition;
  final Value<String?> warning;
  final Value<bool> isUserCreated;
  const MealsCompanion({
    this.id = const Value.absent(),
    this.protocolId = const Value.absent(),
    this.name = const Value.absent(),
    this.kind = const Value.absent(),
    this.kcal = const Value.absent(),
    this.p = const Value.absent(),
    this.c = const Value.absent(),
    this.f = const Value.absent(),
    this.defaultPortion = const Value.absent(),
    this.requiredAddition = const Value.absent(),
    this.warning = const Value.absent(),
    this.isUserCreated = const Value.absent(),
  });
  MealsCompanion.insert({
    this.id = const Value.absent(),
    required int protocolId,
    required String name,
    required MealKind kind,
    this.kcal = const Value.absent(),
    this.p = const Value.absent(),
    this.c = const Value.absent(),
    this.f = const Value.absent(),
    this.defaultPortion = const Value.absent(),
    this.requiredAddition = const Value.absent(),
    this.warning = const Value.absent(),
    this.isUserCreated = const Value.absent(),
  }) : protocolId = Value(protocolId),
       name = Value(name),
       kind = Value(kind);
  static Insertable<Meal> custom({
    Expression<int>? id,
    Expression<int>? protocolId,
    Expression<String>? name,
    Expression<String>? kind,
    Expression<int>? kcal,
    Expression<double>? p,
    Expression<double>? c,
    Expression<double>? f,
    Expression<String>? defaultPortion,
    Expression<String>? requiredAddition,
    Expression<String>? warning,
    Expression<bool>? isUserCreated,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (protocolId != null) 'protocol_id': protocolId,
      if (name != null) 'name': name,
      if (kind != null) 'kind': kind,
      if (kcal != null) 'kcal': kcal,
      if (p != null) 'p': p,
      if (c != null) 'c': c,
      if (f != null) 'f': f,
      if (defaultPortion != null) 'default_portion': defaultPortion,
      if (requiredAddition != null) 'required_addition': requiredAddition,
      if (warning != null) 'warning': warning,
      if (isUserCreated != null) 'is_user_created': isUserCreated,
    });
  }

  MealsCompanion copyWith({
    Value<int>? id,
    Value<int>? protocolId,
    Value<String>? name,
    Value<MealKind>? kind,
    Value<int?>? kcal,
    Value<double?>? p,
    Value<double?>? c,
    Value<double?>? f,
    Value<String?>? defaultPortion,
    Value<String?>? requiredAddition,
    Value<String?>? warning,
    Value<bool>? isUserCreated,
  }) {
    return MealsCompanion(
      id: id ?? this.id,
      protocolId: protocolId ?? this.protocolId,
      name: name ?? this.name,
      kind: kind ?? this.kind,
      kcal: kcal ?? this.kcal,
      p: p ?? this.p,
      c: c ?? this.c,
      f: f ?? this.f,
      defaultPortion: defaultPortion ?? this.defaultPortion,
      requiredAddition: requiredAddition ?? this.requiredAddition,
      warning: warning ?? this.warning,
      isUserCreated: isUserCreated ?? this.isUserCreated,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (protocolId.present) {
      map['protocol_id'] = Variable<int>(protocolId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(
        $MealsTable.$converterkind.toSql(kind.value),
      );
    }
    if (kcal.present) {
      map['kcal'] = Variable<int>(kcal.value);
    }
    if (p.present) {
      map['p'] = Variable<double>(p.value);
    }
    if (c.present) {
      map['c'] = Variable<double>(c.value);
    }
    if (f.present) {
      map['f'] = Variable<double>(f.value);
    }
    if (defaultPortion.present) {
      map['default_portion'] = Variable<String>(defaultPortion.value);
    }
    if (requiredAddition.present) {
      map['required_addition'] = Variable<String>(requiredAddition.value);
    }
    if (warning.present) {
      map['warning'] = Variable<String>(warning.value);
    }
    if (isUserCreated.present) {
      map['is_user_created'] = Variable<bool>(isUserCreated.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MealsCompanion(')
          ..write('id: $id, ')
          ..write('protocolId: $protocolId, ')
          ..write('name: $name, ')
          ..write('kind: $kind, ')
          ..write('kcal: $kcal, ')
          ..write('p: $p, ')
          ..write('c: $c, ')
          ..write('f: $f, ')
          ..write('defaultPortion: $defaultPortion, ')
          ..write('requiredAddition: $requiredAddition, ')
          ..write('warning: $warning, ')
          ..write('isUserCreated: $isUserCreated')
          ..write(')'))
        .toString();
  }
}

class $MealLogsTable extends MealLogs with TableInfo<$MealLogsTable, MealLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MealLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mealIdMeta = const VerificationMeta('mealId');
  @override
  late final GeneratedColumn<int> mealId = GeneratedColumn<int>(
    'meal_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES meals (id)',
    ),
  );
  static const VerificationMeta _palmsMeta = const VerificationMeta('palms');
  @override
  late final GeneratedColumn<int> palms = GeneratedColumn<int>(
    'palms',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fistsMeta = const VerificationMeta('fists');
  @override
  late final GeneratedColumn<int> fists = GeneratedColumn<int>(
    'fists',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _handfulsMeta = const VerificationMeta(
    'handfuls',
  );
  @override
  late final GeneratedColumn<int> handfuls = GeneratedColumn<int>(
    'handfuls',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _thumbsMeta = const VerificationMeta('thumbs');
  @override
  late final GeneratedColumn<int> thumbs = GeneratedColumn<int>(
    'thumbs',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _kcalMinMeta = const VerificationMeta(
    'kcalMin',
  );
  @override
  late final GeneratedColumn<int> kcalMin = GeneratedColumn<int>(
    'kcal_min',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _kcalMaxMeta = const VerificationMeta(
    'kcalMax',
  );
  @override
  late final GeneratedColumn<int> kcalMax = GeneratedColumn<int>(
    'kcal_max',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _photoPathMeta = const VerificationMeta(
    'photoPath',
  );
  @override
  late final GeneratedColumn<String> photoPath = GeneratedColumn<String>(
    'photo_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    date,
    mealId,
    palms,
    fists,
    handfuls,
    thumbs,
    kcalMin,
    kcalMax,
    photoPath,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'meal_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<MealLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('meal_id')) {
      context.handle(
        _mealIdMeta,
        mealId.isAcceptableOrUnknown(data['meal_id']!, _mealIdMeta),
      );
    } else if (isInserting) {
      context.missing(_mealIdMeta);
    }
    if (data.containsKey('palms')) {
      context.handle(
        _palmsMeta,
        palms.isAcceptableOrUnknown(data['palms']!, _palmsMeta),
      );
    }
    if (data.containsKey('fists')) {
      context.handle(
        _fistsMeta,
        fists.isAcceptableOrUnknown(data['fists']!, _fistsMeta),
      );
    }
    if (data.containsKey('handfuls')) {
      context.handle(
        _handfulsMeta,
        handfuls.isAcceptableOrUnknown(data['handfuls']!, _handfulsMeta),
      );
    }
    if (data.containsKey('thumbs')) {
      context.handle(
        _thumbsMeta,
        thumbs.isAcceptableOrUnknown(data['thumbs']!, _thumbsMeta),
      );
    }
    if (data.containsKey('kcal_min')) {
      context.handle(
        _kcalMinMeta,
        kcalMin.isAcceptableOrUnknown(data['kcal_min']!, _kcalMinMeta),
      );
    } else if (isInserting) {
      context.missing(_kcalMinMeta);
    }
    if (data.containsKey('kcal_max')) {
      context.handle(
        _kcalMaxMeta,
        kcalMax.isAcceptableOrUnknown(data['kcal_max']!, _kcalMaxMeta),
      );
    } else if (isInserting) {
      context.missing(_kcalMaxMeta);
    }
    if (data.containsKey('photo_path')) {
      context.handle(
        _photoPathMeta,
        photoPath.isAcceptableOrUnknown(data['photo_path']!, _photoPathMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MealLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MealLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      mealId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}meal_id'],
      )!,
      palms: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}palms'],
      ),
      fists: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}fists'],
      ),
      handfuls: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}handfuls'],
      ),
      thumbs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}thumbs'],
      ),
      kcalMin: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}kcal_min'],
      )!,
      kcalMax: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}kcal_max'],
      )!,
      photoPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}photo_path'],
      ),
    );
  }

  @override
  $MealLogsTable createAlias(String alias) {
    return $MealLogsTable(attachedDatabase, alias);
  }
}

class MealLog extends DataClass implements Insertable<MealLog> {
  final int id;
  final DateTime date;
  final int mealId;
  final int? palms;
  final int? fists;
  final int? handfuls;
  final int? thumbs;
  final int kcalMin;
  final int kcalMax;
  final String? photoPath;
  const MealLog({
    required this.id,
    required this.date,
    required this.mealId,
    this.palms,
    this.fists,
    this.handfuls,
    this.thumbs,
    required this.kcalMin,
    required this.kcalMax,
    this.photoPath,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    map['meal_id'] = Variable<int>(mealId);
    if (!nullToAbsent || palms != null) {
      map['palms'] = Variable<int>(palms);
    }
    if (!nullToAbsent || fists != null) {
      map['fists'] = Variable<int>(fists);
    }
    if (!nullToAbsent || handfuls != null) {
      map['handfuls'] = Variable<int>(handfuls);
    }
    if (!nullToAbsent || thumbs != null) {
      map['thumbs'] = Variable<int>(thumbs);
    }
    map['kcal_min'] = Variable<int>(kcalMin);
    map['kcal_max'] = Variable<int>(kcalMax);
    if (!nullToAbsent || photoPath != null) {
      map['photo_path'] = Variable<String>(photoPath);
    }
    return map;
  }

  MealLogsCompanion toCompanion(bool nullToAbsent) {
    return MealLogsCompanion(
      id: Value(id),
      date: Value(date),
      mealId: Value(mealId),
      palms: palms == null && nullToAbsent
          ? const Value.absent()
          : Value(palms),
      fists: fists == null && nullToAbsent
          ? const Value.absent()
          : Value(fists),
      handfuls: handfuls == null && nullToAbsent
          ? const Value.absent()
          : Value(handfuls),
      thumbs: thumbs == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbs),
      kcalMin: Value(kcalMin),
      kcalMax: Value(kcalMax),
      photoPath: photoPath == null && nullToAbsent
          ? const Value.absent()
          : Value(photoPath),
    );
  }

  factory MealLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MealLog(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      mealId: serializer.fromJson<int>(json['mealId']),
      palms: serializer.fromJson<int?>(json['palms']),
      fists: serializer.fromJson<int?>(json['fists']),
      handfuls: serializer.fromJson<int?>(json['handfuls']),
      thumbs: serializer.fromJson<int?>(json['thumbs']),
      kcalMin: serializer.fromJson<int>(json['kcalMin']),
      kcalMax: serializer.fromJson<int>(json['kcalMax']),
      photoPath: serializer.fromJson<String?>(json['photoPath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'mealId': serializer.toJson<int>(mealId),
      'palms': serializer.toJson<int?>(palms),
      'fists': serializer.toJson<int?>(fists),
      'handfuls': serializer.toJson<int?>(handfuls),
      'thumbs': serializer.toJson<int?>(thumbs),
      'kcalMin': serializer.toJson<int>(kcalMin),
      'kcalMax': serializer.toJson<int>(kcalMax),
      'photoPath': serializer.toJson<String?>(photoPath),
    };
  }

  MealLog copyWith({
    int? id,
    DateTime? date,
    int? mealId,
    Value<int?> palms = const Value.absent(),
    Value<int?> fists = const Value.absent(),
    Value<int?> handfuls = const Value.absent(),
    Value<int?> thumbs = const Value.absent(),
    int? kcalMin,
    int? kcalMax,
    Value<String?> photoPath = const Value.absent(),
  }) => MealLog(
    id: id ?? this.id,
    date: date ?? this.date,
    mealId: mealId ?? this.mealId,
    palms: palms.present ? palms.value : this.palms,
    fists: fists.present ? fists.value : this.fists,
    handfuls: handfuls.present ? handfuls.value : this.handfuls,
    thumbs: thumbs.present ? thumbs.value : this.thumbs,
    kcalMin: kcalMin ?? this.kcalMin,
    kcalMax: kcalMax ?? this.kcalMax,
    photoPath: photoPath.present ? photoPath.value : this.photoPath,
  );
  MealLog copyWithCompanion(MealLogsCompanion data) {
    return MealLog(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      mealId: data.mealId.present ? data.mealId.value : this.mealId,
      palms: data.palms.present ? data.palms.value : this.palms,
      fists: data.fists.present ? data.fists.value : this.fists,
      handfuls: data.handfuls.present ? data.handfuls.value : this.handfuls,
      thumbs: data.thumbs.present ? data.thumbs.value : this.thumbs,
      kcalMin: data.kcalMin.present ? data.kcalMin.value : this.kcalMin,
      kcalMax: data.kcalMax.present ? data.kcalMax.value : this.kcalMax,
      photoPath: data.photoPath.present ? data.photoPath.value : this.photoPath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MealLog(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('mealId: $mealId, ')
          ..write('palms: $palms, ')
          ..write('fists: $fists, ')
          ..write('handfuls: $handfuls, ')
          ..write('thumbs: $thumbs, ')
          ..write('kcalMin: $kcalMin, ')
          ..write('kcalMax: $kcalMax, ')
          ..write('photoPath: $photoPath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    date,
    mealId,
    palms,
    fists,
    handfuls,
    thumbs,
    kcalMin,
    kcalMax,
    photoPath,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MealLog &&
          other.id == this.id &&
          other.date == this.date &&
          other.mealId == this.mealId &&
          other.palms == this.palms &&
          other.fists == this.fists &&
          other.handfuls == this.handfuls &&
          other.thumbs == this.thumbs &&
          other.kcalMin == this.kcalMin &&
          other.kcalMax == this.kcalMax &&
          other.photoPath == this.photoPath);
}

class MealLogsCompanion extends UpdateCompanion<MealLog> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<int> mealId;
  final Value<int?> palms;
  final Value<int?> fists;
  final Value<int?> handfuls;
  final Value<int?> thumbs;
  final Value<int> kcalMin;
  final Value<int> kcalMax;
  final Value<String?> photoPath;
  const MealLogsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.mealId = const Value.absent(),
    this.palms = const Value.absent(),
    this.fists = const Value.absent(),
    this.handfuls = const Value.absent(),
    this.thumbs = const Value.absent(),
    this.kcalMin = const Value.absent(),
    this.kcalMax = const Value.absent(),
    this.photoPath = const Value.absent(),
  });
  MealLogsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    required int mealId,
    this.palms = const Value.absent(),
    this.fists = const Value.absent(),
    this.handfuls = const Value.absent(),
    this.thumbs = const Value.absent(),
    required int kcalMin,
    required int kcalMax,
    this.photoPath = const Value.absent(),
  }) : date = Value(date),
       mealId = Value(mealId),
       kcalMin = Value(kcalMin),
       kcalMax = Value(kcalMax);
  static Insertable<MealLog> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<int>? mealId,
    Expression<int>? palms,
    Expression<int>? fists,
    Expression<int>? handfuls,
    Expression<int>? thumbs,
    Expression<int>? kcalMin,
    Expression<int>? kcalMax,
    Expression<String>? photoPath,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (mealId != null) 'meal_id': mealId,
      if (palms != null) 'palms': palms,
      if (fists != null) 'fists': fists,
      if (handfuls != null) 'handfuls': handfuls,
      if (thumbs != null) 'thumbs': thumbs,
      if (kcalMin != null) 'kcal_min': kcalMin,
      if (kcalMax != null) 'kcal_max': kcalMax,
      if (photoPath != null) 'photo_path': photoPath,
    });
  }

  MealLogsCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? date,
    Value<int>? mealId,
    Value<int?>? palms,
    Value<int?>? fists,
    Value<int?>? handfuls,
    Value<int?>? thumbs,
    Value<int>? kcalMin,
    Value<int>? kcalMax,
    Value<String?>? photoPath,
  }) {
    return MealLogsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      mealId: mealId ?? this.mealId,
      palms: palms ?? this.palms,
      fists: fists ?? this.fists,
      handfuls: handfuls ?? this.handfuls,
      thumbs: thumbs ?? this.thumbs,
      kcalMin: kcalMin ?? this.kcalMin,
      kcalMax: kcalMax ?? this.kcalMax,
      photoPath: photoPath ?? this.photoPath,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (mealId.present) {
      map['meal_id'] = Variable<int>(mealId.value);
    }
    if (palms.present) {
      map['palms'] = Variable<int>(palms.value);
    }
    if (fists.present) {
      map['fists'] = Variable<int>(fists.value);
    }
    if (handfuls.present) {
      map['handfuls'] = Variable<int>(handfuls.value);
    }
    if (thumbs.present) {
      map['thumbs'] = Variable<int>(thumbs.value);
    }
    if (kcalMin.present) {
      map['kcal_min'] = Variable<int>(kcalMin.value);
    }
    if (kcalMax.present) {
      map['kcal_max'] = Variable<int>(kcalMax.value);
    }
    if (photoPath.present) {
      map['photo_path'] = Variable<String>(photoPath.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MealLogsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('mealId: $mealId, ')
          ..write('palms: $palms, ')
          ..write('fists: $fists, ')
          ..write('handfuls: $handfuls, ')
          ..write('thumbs: $thumbs, ')
          ..write('kcalMin: $kcalMin, ')
          ..write('kcalMax: $kcalMax, ')
          ..write('photoPath: $photoPath')
          ..write(')'))
        .toString();
  }
}

class $MeasurementsTable extends Measurements
    with TableInfo<$MeasurementsTable, Measurement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MeasurementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<MeasurementKind, String> kind =
      GeneratedColumn<String>(
        'kind',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<MeasurementKind>($MeasurementsTable.$converterkind);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<double> value = GeneratedColumn<double>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, date, kind, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'measurements';
  @override
  VerificationContext validateIntegrity(
    Insertable<Measurement> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Measurement map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Measurement(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      kind: $MeasurementsTable.$converterkind.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}kind'],
        )!,
      ),
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $MeasurementsTable createAlias(String alias) {
    return $MeasurementsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<MeasurementKind, String, String> $converterkind =
      const EnumNameConverter<MeasurementKind>(MeasurementKind.values);
}

class Measurement extends DataClass implements Insertable<Measurement> {
  final int id;
  final DateTime date;
  final MeasurementKind kind;
  final double value;
  const Measurement({
    required this.id,
    required this.date,
    required this.kind,
    required this.value,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    {
      map['kind'] = Variable<String>(
        $MeasurementsTable.$converterkind.toSql(kind),
      );
    }
    map['value'] = Variable<double>(value);
    return map;
  }

  MeasurementsCompanion toCompanion(bool nullToAbsent) {
    return MeasurementsCompanion(
      id: Value(id),
      date: Value(date),
      kind: Value(kind),
      value: Value(value),
    );
  }

  factory Measurement.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Measurement(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      kind: $MeasurementsTable.$converterkind.fromJson(
        serializer.fromJson<String>(json['kind']),
      ),
      value: serializer.fromJson<double>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'kind': serializer.toJson<String>(
        $MeasurementsTable.$converterkind.toJson(kind),
      ),
      'value': serializer.toJson<double>(value),
    };
  }

  Measurement copyWith({
    int? id,
    DateTime? date,
    MeasurementKind? kind,
    double? value,
  }) => Measurement(
    id: id ?? this.id,
    date: date ?? this.date,
    kind: kind ?? this.kind,
    value: value ?? this.value,
  );
  Measurement copyWithCompanion(MeasurementsCompanion data) {
    return Measurement(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      kind: data.kind.present ? data.kind.value : this.kind,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Measurement(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('kind: $kind, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, kind, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Measurement &&
          other.id == this.id &&
          other.date == this.date &&
          other.kind == this.kind &&
          other.value == this.value);
}

class MeasurementsCompanion extends UpdateCompanion<Measurement> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<MeasurementKind> kind;
  final Value<double> value;
  const MeasurementsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.kind = const Value.absent(),
    this.value = const Value.absent(),
  });
  MeasurementsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    required MeasurementKind kind,
    required double value,
  }) : date = Value(date),
       kind = Value(kind),
       value = Value(value);
  static Insertable<Measurement> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<String>? kind,
    Expression<double>? value,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (kind != null) 'kind': kind,
      if (value != null) 'value': value,
    });
  }

  MeasurementsCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? date,
    Value<MeasurementKind>? kind,
    Value<double>? value,
  }) {
    return MeasurementsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      kind: kind ?? this.kind,
      value: value ?? this.value,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(
        $MeasurementsTable.$converterkind.toSql(kind.value),
      );
    }
    if (value.present) {
      map['value'] = Variable<double>(value.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MeasurementsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('kind: $kind, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }
}

class $CorrectionsTable extends Corrections
    with TableInfo<$CorrectionsTable, Correction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CorrectionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deltaKgMeta = const VerificationMeta(
    'deltaKg',
  );
  @override
  late final GeneratedColumn<double> deltaKg = GeneratedColumn<double>(
    'delta_kg',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actionMeta = const VerificationMeta('action');
  @override
  late final GeneratedColumn<String> action = GeneratedColumn<String>(
    'action',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _acceptedMeta = const VerificationMeta(
    'accepted',
  );
  @override
  late final GeneratedColumn<bool> accepted = GeneratedColumn<bool>(
    'accepted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("accepted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [id, date, deltaKg, action, accepted];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'corrections';
  @override
  VerificationContext validateIntegrity(
    Insertable<Correction> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('delta_kg')) {
      context.handle(
        _deltaKgMeta,
        deltaKg.isAcceptableOrUnknown(data['delta_kg']!, _deltaKgMeta),
      );
    } else if (isInserting) {
      context.missing(_deltaKgMeta);
    }
    if (data.containsKey('action')) {
      context.handle(
        _actionMeta,
        action.isAcceptableOrUnknown(data['action']!, _actionMeta),
      );
    } else if (isInserting) {
      context.missing(_actionMeta);
    }
    if (data.containsKey('accepted')) {
      context.handle(
        _acceptedMeta,
        accepted.isAcceptableOrUnknown(data['accepted']!, _acceptedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Correction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Correction(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      deltaKg: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}delta_kg'],
      )!,
      action: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}action'],
      )!,
      accepted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}accepted'],
      )!,
    );
  }

  @override
  $CorrectionsTable createAlias(String alias) {
    return $CorrectionsTable(attachedDatabase, alias);
  }
}

class Correction extends DataClass implements Insertable<Correction> {
  final int id;
  final DateTime date;
  final double deltaKg;
  final String action;
  final bool accepted;
  const Correction({
    required this.id,
    required this.date,
    required this.deltaKg,
    required this.action,
    required this.accepted,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    map['delta_kg'] = Variable<double>(deltaKg);
    map['action'] = Variable<String>(action);
    map['accepted'] = Variable<bool>(accepted);
    return map;
  }

  CorrectionsCompanion toCompanion(bool nullToAbsent) {
    return CorrectionsCompanion(
      id: Value(id),
      date: Value(date),
      deltaKg: Value(deltaKg),
      action: Value(action),
      accepted: Value(accepted),
    );
  }

  factory Correction.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Correction(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      deltaKg: serializer.fromJson<double>(json['deltaKg']),
      action: serializer.fromJson<String>(json['action']),
      accepted: serializer.fromJson<bool>(json['accepted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'deltaKg': serializer.toJson<double>(deltaKg),
      'action': serializer.toJson<String>(action),
      'accepted': serializer.toJson<bool>(accepted),
    };
  }

  Correction copyWith({
    int? id,
    DateTime? date,
    double? deltaKg,
    String? action,
    bool? accepted,
  }) => Correction(
    id: id ?? this.id,
    date: date ?? this.date,
    deltaKg: deltaKg ?? this.deltaKg,
    action: action ?? this.action,
    accepted: accepted ?? this.accepted,
  );
  Correction copyWithCompanion(CorrectionsCompanion data) {
    return Correction(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      deltaKg: data.deltaKg.present ? data.deltaKg.value : this.deltaKg,
      action: data.action.present ? data.action.value : this.action,
      accepted: data.accepted.present ? data.accepted.value : this.accepted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Correction(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('deltaKg: $deltaKg, ')
          ..write('action: $action, ')
          ..write('accepted: $accepted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, deltaKg, action, accepted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Correction &&
          other.id == this.id &&
          other.date == this.date &&
          other.deltaKg == this.deltaKg &&
          other.action == this.action &&
          other.accepted == this.accepted);
}

class CorrectionsCompanion extends UpdateCompanion<Correction> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<double> deltaKg;
  final Value<String> action;
  final Value<bool> accepted;
  const CorrectionsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.deltaKg = const Value.absent(),
    this.action = const Value.absent(),
    this.accepted = const Value.absent(),
  });
  CorrectionsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    required double deltaKg,
    required String action,
    this.accepted = const Value.absent(),
  }) : date = Value(date),
       deltaKg = Value(deltaKg),
       action = Value(action);
  static Insertable<Correction> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<double>? deltaKg,
    Expression<String>? action,
    Expression<bool>? accepted,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (deltaKg != null) 'delta_kg': deltaKg,
      if (action != null) 'action': action,
      if (accepted != null) 'accepted': accepted,
    });
  }

  CorrectionsCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? date,
    Value<double>? deltaKg,
    Value<String>? action,
    Value<bool>? accepted,
  }) {
    return CorrectionsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      deltaKg: deltaKg ?? this.deltaKg,
      action: action ?? this.action,
      accepted: accepted ?? this.accepted,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (deltaKg.present) {
      map['delta_kg'] = Variable<double>(deltaKg.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(action.value);
    }
    if (accepted.present) {
      map['accepted'] = Variable<bool>(accepted.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CorrectionsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('deltaKg: $deltaKg, ')
          ..write('action: $action, ')
          ..write('accepted: $accepted')
          ..write(')'))
        .toString();
  }
}

class $SettingsTable extends Settings with TableInfo<$SettingsTable, Setting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<Setting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  Setting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Setting(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $SettingsTable createAlias(String alias) {
    return $SettingsTable(attachedDatabase, alias);
  }
}

class Setting extends DataClass implements Insertable<Setting> {
  final String key;
  final String value;
  const Setting({required this.key, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  SettingsCompanion toCompanion(bool nullToAbsent) {
    return SettingsCompanion(key: Value(key), value: Value(value));
  }

  factory Setting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Setting(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  Setting copyWith({String? key, String? value}) =>
      Setting(key: key ?? this.key, value: value ?? this.value);
  Setting copyWithCompanion(SettingsCompanion data) {
    return Setting(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Setting(')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Setting && other.key == this.key && other.value == this.value);
}

class SettingsCompanion extends UpdateCompanion<Setting> {
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const SettingsCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SettingsCompanion.insert({
    required String key,
    required String value,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value);
  static Insertable<Setting> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SettingsCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<int>? rowid,
  }) {
    return SettingsCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProtocolsTable protocols = $ProtocolsTable(this);
  late final $ScheduleItemsTable scheduleItems = $ScheduleItemsTable(this);
  late final $SpacingRulesTable spacingRules = $SpacingRulesTable(this);
  late final $MedicationsTable medications = $MedicationsTable(this);
  late final $LogEntriesTable logEntries = $LogEntriesTable(this);
  late final $TrainingPlansTable trainingPlans = $TrainingPlansTable(this);
  late final $ExercisesTable exercises = $ExercisesTable(this);
  late final $IntervalCyclesTable intervalCycles = $IntervalCyclesTable(this);
  late final $IntervalBlocksTable intervalBlocks = $IntervalBlocksTable(this);
  late final $ErgSessionsTable ergSessions = $ErgSessionsTable(this);
  late final $MealsTable meals = $MealsTable(this);
  late final $MealLogsTable mealLogs = $MealLogsTable(this);
  late final $MeasurementsTable measurements = $MeasurementsTable(this);
  late final $CorrectionsTable corrections = $CorrectionsTable(this);
  late final $SettingsTable settings = $SettingsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    protocols,
    scheduleItems,
    spacingRules,
    medications,
    logEntries,
    trainingPlans,
    exercises,
    intervalCycles,
    intervalBlocks,
    ergSessions,
    meals,
    mealLogs,
    measurements,
    corrections,
    settings,
  ];
}

typedef $$ProtocolsTableCreateCompanionBuilder = ProtocolsCompanion Function({
  Value<int> id,
  required String name,
  Value<bool> active,
  Value<DateTime> createdAt,
});
typedef $$ProtocolsTableUpdateCompanionBuilder = ProtocolsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<bool> active,
  Value<DateTime> createdAt,
});

final class $$ProtocolsTableReferences
    extends BaseReferences<_$AppDatabase, $ProtocolsTable, Protocol> {
  $$ProtocolsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ScheduleItemsTable, List<ScheduleItem>>
  _scheduleItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.scheduleItems,
    aliasName: 'protocols__id__schedule_items__protocol_id',
  );

  $$ScheduleItemsTableProcessedTableManager get scheduleItemsRefs {
    final manager = $$ScheduleItemsTableTableManager(
      $_db,
      $_db.scheduleItems,
    ).filter((f) => f.protocolId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_scheduleItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MedicationsTable, List<Medication>>
  _medicationsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.medications,
    aliasName: 'protocols__id__medications__protocol_id',
  );

  $$MedicationsTableProcessedTableManager get medicationsRefs {
    final manager = $$MedicationsTableTableManager(
      $_db,
      $_db.medications,
    ).filter((f) => f.protocolId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_medicationsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TrainingPlansTable, List<TrainingPlan>>
  _trainingPlansRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.trainingPlans,
    aliasName: 'protocols__id__training_plans__protocol_id',
  );

  $$TrainingPlansTableProcessedTableManager get trainingPlansRefs {
    final manager = $$TrainingPlansTableTableManager(
      $_db,
      $_db.trainingPlans,
    ).filter((f) => f.protocolId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_trainingPlansRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$IntervalCyclesTable, List<IntervalCycle>>
  _intervalCyclesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.intervalCycles,
    aliasName: 'protocols__id__interval_cycles__protocol_id',
  );

  $$IntervalCyclesTableProcessedTableManager get intervalCyclesRefs {
    final manager = $$IntervalCyclesTableTableManager(
      $_db,
      $_db.intervalCycles,
    ).filter((f) => f.protocolId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_intervalCyclesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MealsTable, List<Meal>> _mealsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.meals,
    aliasName: 'protocols__id__meals__protocol_id',
  );

  $$MealsTableProcessedTableManager get mealsRefs {
    final manager = $$MealsTableTableManager(
      $_db,
      $_db.meals,
    ).filter((f) => f.protocolId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_mealsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProtocolsTableFilterComposer
    extends Composer<_$AppDatabase, $ProtocolsTable> {
  $$ProtocolsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> scheduleItemsRefs(
    Expression<bool> Function($$ScheduleItemsTableFilterComposer f) f,
  ) {
    final $$ScheduleItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.scheduleItems,
      getReferencedColumn: (t) => t.protocolId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScheduleItemsTableFilterComposer(
            $db: $db,
            $table: $db.scheduleItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> medicationsRefs(
    Expression<bool> Function($$MedicationsTableFilterComposer f) f,
  ) {
    final $$MedicationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.medications,
      getReferencedColumn: (t) => t.protocolId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicationsTableFilterComposer(
            $db: $db,
            $table: $db.medications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> trainingPlansRefs(
    Expression<bool> Function($$TrainingPlansTableFilterComposer f) f,
  ) {
    final $$TrainingPlansTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.trainingPlans,
      getReferencedColumn: (t) => t.protocolId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TrainingPlansTableFilterComposer(
            $db: $db,
            $table: $db.trainingPlans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> intervalCyclesRefs(
    Expression<bool> Function($$IntervalCyclesTableFilterComposer f) f,
  ) {
    final $$IntervalCyclesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.intervalCycles,
      getReferencedColumn: (t) => t.protocolId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IntervalCyclesTableFilterComposer(
            $db: $db,
            $table: $db.intervalCycles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> mealsRefs(
    Expression<bool> Function($$MealsTableFilterComposer f) f,
  ) {
    final $$MealsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.meals,
      getReferencedColumn: (t) => t.protocolId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealsTableFilterComposer(
            $db: $db,
            $table: $db.meals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProtocolsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProtocolsTable> {
  $$ProtocolsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProtocolsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProtocolsTable> {
  $$ProtocolsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> scheduleItemsRefs<T extends Object>(
    Expression<T> Function($$ScheduleItemsTableAnnotationComposer a) f,
  ) {
    final $$ScheduleItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.scheduleItems,
      getReferencedColumn: (t) => t.protocolId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScheduleItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.scheduleItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> medicationsRefs<T extends Object>(
    Expression<T> Function($$MedicationsTableAnnotationComposer a) f,
  ) {
    final $$MedicationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.medications,
      getReferencedColumn: (t) => t.protocolId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicationsTableAnnotationComposer(
            $db: $db,
            $table: $db.medications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> trainingPlansRefs<T extends Object>(
    Expression<T> Function($$TrainingPlansTableAnnotationComposer a) f,
  ) {
    final $$TrainingPlansTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.trainingPlans,
      getReferencedColumn: (t) => t.protocolId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TrainingPlansTableAnnotationComposer(
            $db: $db,
            $table: $db.trainingPlans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> intervalCyclesRefs<T extends Object>(
    Expression<T> Function($$IntervalCyclesTableAnnotationComposer a) f,
  ) {
    final $$IntervalCyclesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.intervalCycles,
      getReferencedColumn: (t) => t.protocolId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IntervalCyclesTableAnnotationComposer(
            $db: $db,
            $table: $db.intervalCycles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> mealsRefs<T extends Object>(
    Expression<T> Function($$MealsTableAnnotationComposer a) f,
  ) {
    final $$MealsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.meals,
      getReferencedColumn: (t) => t.protocolId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealsTableAnnotationComposer(
            $db: $db,
            $table: $db.meals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProtocolsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProtocolsTable,
          Protocol,
          $$ProtocolsTableFilterComposer,
          $$ProtocolsTableOrderingComposer,
          $$ProtocolsTableAnnotationComposer,
          $$ProtocolsTableCreateCompanionBuilder,
          $$ProtocolsTableUpdateCompanionBuilder,
          (Protocol, $$ProtocolsTableReferences),
          Protocol,
          PrefetchHooks Function({
            bool scheduleItemsRefs,
            bool medicationsRefs,
            bool trainingPlansRefs,
            bool intervalCyclesRefs,
            bool mealsRefs,
          })
        > {
  $$ProtocolsTableTableManager(_$AppDatabase db, $ProtocolsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProtocolsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProtocolsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProtocolsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<bool> active = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ProtocolsCompanion(
                id: id,
                name: name,
                active: active,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<bool> active = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ProtocolsCompanion.insert(
                id: id,
                name: name,
                active: active,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ProtocolsTable, Protocol>(table),
                  $$ProtocolsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                scheduleItemsRefs = false,
                medicationsRefs = false,
                trainingPlansRefs = false,
                intervalCyclesRefs = false,
                mealsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (scheduleItemsRefs) db.scheduleItems,
                    if (medicationsRefs) db.medications,
                    if (trainingPlansRefs) db.trainingPlans,
                    if (intervalCyclesRefs) db.intervalCycles,
                    if (mealsRefs) db.meals,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (scheduleItemsRefs)
                        await $_getPrefetchedData<
                          Protocol,
                          $ProtocolsTable,
                          ScheduleItem
                        >(
                          currentTable: table,
                          referencedTable: $$ProtocolsTableReferences
                              ._scheduleItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProtocolsTableReferences(
                                db,
                                table,
                                p0,
                              ).scheduleItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.protocolId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (medicationsRefs)
                        await $_getPrefetchedData<
                          Protocol,
                          $ProtocolsTable,
                          Medication
                        >(
                          currentTable: table,
                          referencedTable: $$ProtocolsTableReferences
                              ._medicationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProtocolsTableReferences(
                                db,
                                table,
                                p0,
                              ).medicationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.protocolId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (trainingPlansRefs)
                        await $_getPrefetchedData<
                          Protocol,
                          $ProtocolsTable,
                          TrainingPlan
                        >(
                          currentTable: table,
                          referencedTable: $$ProtocolsTableReferences
                              ._trainingPlansRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProtocolsTableReferences(
                                db,
                                table,
                                p0,
                              ).trainingPlansRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.protocolId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (intervalCyclesRefs)
                        await $_getPrefetchedData<
                          Protocol,
                          $ProtocolsTable,
                          IntervalCycle
                        >(
                          currentTable: table,
                          referencedTable: $$ProtocolsTableReferences
                              ._intervalCyclesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProtocolsTableReferences(
                                db,
                                table,
                                p0,
                              ).intervalCyclesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.protocolId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (mealsRefs)
                        await $_getPrefetchedData<
                          Protocol,
                          $ProtocolsTable,
                          Meal
                        >(
                          currentTable: table,
                          referencedTable: $$ProtocolsTableReferences
                              ._mealsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProtocolsTableReferences(
                                db,
                                table,
                                p0,
                              ).mealsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.protocolId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ProtocolsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProtocolsTable,
      Protocol,
      $$ProtocolsTableFilterComposer,
      $$ProtocolsTableOrderingComposer,
      $$ProtocolsTableAnnotationComposer,
      $$ProtocolsTableCreateCompanionBuilder,
      $$ProtocolsTableUpdateCompanionBuilder,
      (Protocol, $$ProtocolsTableReferences),
      Protocol,
      PrefetchHooks Function({
        bool scheduleItemsRefs,
        bool medicationsRefs,
        bool trainingPlansRefs,
        bool intervalCyclesRefs,
        bool mealsRefs,
      })
    >;
typedef $$ScheduleItemsTableCreateCompanionBuilder =
    ScheduleItemsCompanion Function({
      Value<int> id,
      required int protocolId,
      required ScheduleItemKind kind,
      required String label,
      Value<int?> time,
      Value<int?> offsetFromWake,
      Value<bool> enabled,
    });
typedef $$ScheduleItemsTableUpdateCompanionBuilder =
    ScheduleItemsCompanion Function({
      Value<int> id,
      Value<int> protocolId,
      Value<ScheduleItemKind> kind,
      Value<String> label,
      Value<int?> time,
      Value<int?> offsetFromWake,
      Value<bool> enabled,
    });

final class $$ScheduleItemsTableReferences
    extends BaseReferences<_$AppDatabase, $ScheduleItemsTable, ScheduleItem> {
  $$ScheduleItemsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ProtocolsTable _protocolIdTable(_$AppDatabase db) =>
      db.protocols.createAlias('schedule_items__protocol_id__protocols__id');

  $$ProtocolsTableProcessedTableManager get protocolId {
    final $_column = $_itemColumn<int>('protocol_id')!;

    final manager = $$ProtocolsTableTableManager(
      $_db,
      $_db.protocols,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_protocolIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$LogEntriesTable, List<LogEntry>>
  _logEntriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.logEntries,
    aliasName: 'schedule_items__id__log_entries__item_id',
  );

  $$LogEntriesTableProcessedTableManager get logEntriesRefs {
    final manager = $$LogEntriesTableTableManager(
      $_db,
      $_db.logEntries,
    ).filter((f) => f.itemId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_logEntriesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ScheduleItemsTableFilterComposer
    extends Composer<_$AppDatabase, $ScheduleItemsTable> {
  $$ScheduleItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<ScheduleItemKind, ScheduleItemKind, String>
  get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get offsetFromWake => $composableBuilder(
    column: $table.offsetFromWake,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnFilters(column),
  );

  $$ProtocolsTableFilterComposer get protocolId {
    final $$ProtocolsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.protocolId,
      referencedTable: $db.protocols,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProtocolsTableFilterComposer(
            $db: $db,
            $table: $db.protocols,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> logEntriesRefs(
    Expression<bool> Function($$LogEntriesTableFilterComposer f) f,
  ) {
    final $$LogEntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.logEntries,
      getReferencedColumn: (t) => t.itemId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LogEntriesTableFilterComposer(
            $db: $db,
            $table: $db.logEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ScheduleItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $ScheduleItemsTable> {
  $$ScheduleItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get offsetFromWake => $composableBuilder(
    column: $table.offsetFromWake,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProtocolsTableOrderingComposer get protocolId {
    final $$ProtocolsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.protocolId,
      referencedTable: $db.protocols,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProtocolsTableOrderingComposer(
            $db: $db,
            $table: $db.protocols,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ScheduleItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ScheduleItemsTable> {
  $$ScheduleItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ScheduleItemKind, String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<int> get time =>
      $composableBuilder(column: $table.time, builder: (column) => column);

  GeneratedColumn<int> get offsetFromWake => $composableBuilder(
    column: $table.offsetFromWake,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get enabled =>
      $composableBuilder(column: $table.enabled, builder: (column) => column);

  $$ProtocolsTableAnnotationComposer get protocolId {
    final $$ProtocolsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.protocolId,
      referencedTable: $db.protocols,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProtocolsTableAnnotationComposer(
            $db: $db,
            $table: $db.protocols,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> logEntriesRefs<T extends Object>(
    Expression<T> Function($$LogEntriesTableAnnotationComposer a) f,
  ) {
    final $$LogEntriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.logEntries,
      getReferencedColumn: (t) => t.itemId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LogEntriesTableAnnotationComposer(
            $db: $db,
            $table: $db.logEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ScheduleItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ScheduleItemsTable,
          ScheduleItem,
          $$ScheduleItemsTableFilterComposer,
          $$ScheduleItemsTableOrderingComposer,
          $$ScheduleItemsTableAnnotationComposer,
          $$ScheduleItemsTableCreateCompanionBuilder,
          $$ScheduleItemsTableUpdateCompanionBuilder,
          (ScheduleItem, $$ScheduleItemsTableReferences),
          ScheduleItem,
          PrefetchHooks Function({bool protocolId, bool logEntriesRefs})
        > {
  $$ScheduleItemsTableTableManager(_$AppDatabase db, $ScheduleItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ScheduleItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ScheduleItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ScheduleItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> protocolId = const Value.absent(),
                Value<ScheduleItemKind> kind = const Value.absent(),
                Value<String> label = const Value.absent(),
                Value<int?> time = const Value.absent(),
                Value<int?> offsetFromWake = const Value.absent(),
                Value<bool> enabled = const Value.absent(),
              }) => ScheduleItemsCompanion(
                id: id,
                protocolId: protocolId,
                kind: kind,
                label: label,
                time: time,
                offsetFromWake: offsetFromWake,
                enabled: enabled,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int protocolId,
                required ScheduleItemKind kind,
                required String label,
                Value<int?> time = const Value.absent(),
                Value<int?> offsetFromWake = const Value.absent(),
                Value<bool> enabled = const Value.absent(),
              }) => ScheduleItemsCompanion.insert(
                id: id,
                protocolId: protocolId,
                kind: kind,
                label: label,
                time: time,
                offsetFromWake: offsetFromWake,
                enabled: enabled,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ScheduleItemsTable, ScheduleItem>(table),
                  $$ScheduleItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({protocolId = false, logEntriesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [if (logEntriesRefs) db.logEntries],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (protocolId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.protocolId,
                            referencedTable: $$ScheduleItemsTableReferences
                                ._protocolIdTable(db),
                            referencedColumn: $$ScheduleItemsTableReferences
                                ._protocolIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (logEntriesRefs)
                        await $_getPrefetchedData<
                          ScheduleItem,
                          $ScheduleItemsTable,
                          LogEntry
                        >(
                          currentTable: table,
                          referencedTable: $$ScheduleItemsTableReferences
                              ._logEntriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ScheduleItemsTableReferences(
                                db,
                                table,
                                p0,
                              ).logEntriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.itemId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ScheduleItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ScheduleItemsTable,
      ScheduleItem,
      $$ScheduleItemsTableFilterComposer,
      $$ScheduleItemsTableOrderingComposer,
      $$ScheduleItemsTableAnnotationComposer,
      $$ScheduleItemsTableCreateCompanionBuilder,
      $$ScheduleItemsTableUpdateCompanionBuilder,
      (ScheduleItem, $$ScheduleItemsTableReferences),
      ScheduleItem,
      PrefetchHooks Function({bool protocolId, bool logEntriesRefs})
    >;
typedef $$SpacingRulesTableCreateCompanionBuilder =
    SpacingRulesCompanion Function({
      Value<int> id,
      required String description,
      required double hours,
      required List<String> appliesTo,
    });
typedef $$SpacingRulesTableUpdateCompanionBuilder =
    SpacingRulesCompanion Function({
      Value<int> id,
      Value<String> description,
      Value<double> hours,
      Value<List<String>> appliesTo,
    });

final class $$SpacingRulesTableReferences
    extends BaseReferences<_$AppDatabase, $SpacingRulesTable, SpacingRule> {
  $$SpacingRulesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$MedicationsTable, List<Medication>>
  _medicationsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.medications,
    aliasName: 'spacing_rules__id__medications__spacing_rule_id',
  );

  $$MedicationsTableProcessedTableManager get medicationsRefs {
    final manager = $$MedicationsTableTableManager(
      $_db,
      $_db.medications,
    ).filter((f) => f.spacingRuleId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_medicationsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SpacingRulesTableFilterComposer
    extends Composer<_$AppDatabase, $SpacingRulesTable> {
  $$SpacingRulesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get hours => $composableBuilder(
    column: $table.hours,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
  get appliesTo => $composableBuilder(
    column: $table.appliesTo,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  Expression<bool> medicationsRefs(
    Expression<bool> Function($$MedicationsTableFilterComposer f) f,
  ) {
    final $$MedicationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.medications,
      getReferencedColumn: (t) => t.spacingRuleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicationsTableFilterComposer(
            $db: $db,
            $table: $db.medications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SpacingRulesTableOrderingComposer
    extends Composer<_$AppDatabase, $SpacingRulesTable> {
  $$SpacingRulesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get hours => $composableBuilder(
    column: $table.hours,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get appliesTo => $composableBuilder(
    column: $table.appliesTo,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SpacingRulesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SpacingRulesTable> {
  $$SpacingRulesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<double> get hours =>
      $composableBuilder(column: $table.hours, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get appliesTo =>
      $composableBuilder(column: $table.appliesTo, builder: (column) => column);

  Expression<T> medicationsRefs<T extends Object>(
    Expression<T> Function($$MedicationsTableAnnotationComposer a) f,
  ) {
    final $$MedicationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.medications,
      getReferencedColumn: (t) => t.spacingRuleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicationsTableAnnotationComposer(
            $db: $db,
            $table: $db.medications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SpacingRulesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SpacingRulesTable,
          SpacingRule,
          $$SpacingRulesTableFilterComposer,
          $$SpacingRulesTableOrderingComposer,
          $$SpacingRulesTableAnnotationComposer,
          $$SpacingRulesTableCreateCompanionBuilder,
          $$SpacingRulesTableUpdateCompanionBuilder,
          (SpacingRule, $$SpacingRulesTableReferences),
          SpacingRule,
          PrefetchHooks Function({bool medicationsRefs})
        > {
  $$SpacingRulesTableTableManager(_$AppDatabase db, $SpacingRulesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SpacingRulesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SpacingRulesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SpacingRulesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<double> hours = const Value.absent(),
                Value<List<String>> appliesTo = const Value.absent(),
              }) => SpacingRulesCompanion(
                id: id,
                description: description,
                hours: hours,
                appliesTo: appliesTo,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String description,
                required double hours,
                required List<String> appliesTo,
              }) => SpacingRulesCompanion.insert(
                id: id,
                description: description,
                hours: hours,
                appliesTo: appliesTo,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SpacingRulesTable, SpacingRule>(table),
                  $$SpacingRulesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({medicationsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (medicationsRefs) db.medications],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (medicationsRefs)
                    await $_getPrefetchedData<
                      SpacingRule,
                      $SpacingRulesTable,
                      Medication
                    >(
                      currentTable: table,
                      referencedTable: $$SpacingRulesTableReferences
                          ._medicationsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$SpacingRulesTableReferences(
                            db,
                            table,
                            p0,
                          ).medicationsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.spacingRuleId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$SpacingRulesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SpacingRulesTable,
      SpacingRule,
      $$SpacingRulesTableFilterComposer,
      $$SpacingRulesTableOrderingComposer,
      $$SpacingRulesTableAnnotationComposer,
      $$SpacingRulesTableCreateCompanionBuilder,
      $$SpacingRulesTableUpdateCompanionBuilder,
      (SpacingRule, $$SpacingRulesTableReferences),
      SpacingRule,
      PrefetchHooks Function({bool medicationsRefs})
    >;
typedef $$MedicationsTableCreateCompanionBuilder =
    MedicationsCompanion Function({
      Value<int> id,
      required int protocolId,
      required String name,
      required String dose,
      Value<int?> time,
      required FoodRule foodRule,
      Value<int?> spacingRuleId,
      Value<bool> enabled,
    });
typedef $$MedicationsTableUpdateCompanionBuilder =
    MedicationsCompanion Function({
      Value<int> id,
      Value<int> protocolId,
      Value<String> name,
      Value<String> dose,
      Value<int?> time,
      Value<FoodRule> foodRule,
      Value<int?> spacingRuleId,
      Value<bool> enabled,
    });

final class $$MedicationsTableReferences
    extends BaseReferences<_$AppDatabase, $MedicationsTable, Medication> {
  $$MedicationsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProtocolsTable _protocolIdTable(_$AppDatabase db) =>
      db.protocols.createAlias('medications__protocol_id__protocols__id');

  $$ProtocolsTableProcessedTableManager get protocolId {
    final $_column = $_itemColumn<int>('protocol_id')!;

    final manager = $$ProtocolsTableTableManager(
      $_db,
      $_db.protocols,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_protocolIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $SpacingRulesTable _spacingRuleIdTable(_$AppDatabase db) => db
      .spacingRules
      .createAlias('medications__spacing_rule_id__spacing_rules__id');

  $$SpacingRulesTableProcessedTableManager? get spacingRuleId {
    final $_column = $_itemColumn<int>('spacing_rule_id');
    if ($_column == null) return null;
    final manager = $$SpacingRulesTableTableManager(
      $_db,
      $_db.spacingRules,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_spacingRuleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MedicationsTableFilterComposer
    extends Composer<_$AppDatabase, $MedicationsTable> {
  $$MedicationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dose => $composableBuilder(
    column: $table.dose,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<FoodRule, FoodRule, String> get foodRule =>
      $composableBuilder(
        column: $table.foodRule,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<bool> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnFilters(column),
  );

  $$ProtocolsTableFilterComposer get protocolId {
    final $$ProtocolsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.protocolId,
      referencedTable: $db.protocols,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProtocolsTableFilterComposer(
            $db: $db,
            $table: $db.protocols,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SpacingRulesTableFilterComposer get spacingRuleId {
    final $$SpacingRulesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.spacingRuleId,
      referencedTable: $db.spacingRules,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpacingRulesTableFilterComposer(
            $db: $db,
            $table: $db.spacingRules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MedicationsTableOrderingComposer
    extends Composer<_$AppDatabase, $MedicationsTable> {
  $$MedicationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dose => $composableBuilder(
    column: $table.dose,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get foodRule => $composableBuilder(
    column: $table.foodRule,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProtocolsTableOrderingComposer get protocolId {
    final $$ProtocolsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.protocolId,
      referencedTable: $db.protocols,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProtocolsTableOrderingComposer(
            $db: $db,
            $table: $db.protocols,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SpacingRulesTableOrderingComposer get spacingRuleId {
    final $$SpacingRulesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.spacingRuleId,
      referencedTable: $db.spacingRules,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpacingRulesTableOrderingComposer(
            $db: $db,
            $table: $db.spacingRules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MedicationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MedicationsTable> {
  $$MedicationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get dose =>
      $composableBuilder(column: $table.dose, builder: (column) => column);

  GeneratedColumn<int> get time =>
      $composableBuilder(column: $table.time, builder: (column) => column);

  GeneratedColumnWithTypeConverter<FoodRule, String> get foodRule =>
      $composableBuilder(column: $table.foodRule, builder: (column) => column);

  GeneratedColumn<bool> get enabled =>
      $composableBuilder(column: $table.enabled, builder: (column) => column);

  $$ProtocolsTableAnnotationComposer get protocolId {
    final $$ProtocolsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.protocolId,
      referencedTable: $db.protocols,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProtocolsTableAnnotationComposer(
            $db: $db,
            $table: $db.protocols,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SpacingRulesTableAnnotationComposer get spacingRuleId {
    final $$SpacingRulesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.spacingRuleId,
      referencedTable: $db.spacingRules,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpacingRulesTableAnnotationComposer(
            $db: $db,
            $table: $db.spacingRules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MedicationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MedicationsTable,
          Medication,
          $$MedicationsTableFilterComposer,
          $$MedicationsTableOrderingComposer,
          $$MedicationsTableAnnotationComposer,
          $$MedicationsTableCreateCompanionBuilder,
          $$MedicationsTableUpdateCompanionBuilder,
          (Medication, $$MedicationsTableReferences),
          Medication,
          PrefetchHooks Function({bool protocolId, bool spacingRuleId})
        > {
  $$MedicationsTableTableManager(_$AppDatabase db, $MedicationsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MedicationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MedicationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MedicationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> protocolId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> dose = const Value.absent(),
                Value<int?> time = const Value.absent(),
                Value<FoodRule> foodRule = const Value.absent(),
                Value<int?> spacingRuleId = const Value.absent(),
                Value<bool> enabled = const Value.absent(),
              }) => MedicationsCompanion(
                id: id,
                protocolId: protocolId,
                name: name,
                dose: dose,
                time: time,
                foodRule: foodRule,
                spacingRuleId: spacingRuleId,
                enabled: enabled,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int protocolId,
                required String name,
                required String dose,
                Value<int?> time = const Value.absent(),
                required FoodRule foodRule,
                Value<int?> spacingRuleId = const Value.absent(),
                Value<bool> enabled = const Value.absent(),
              }) => MedicationsCompanion.insert(
                id: id,
                protocolId: protocolId,
                name: name,
                dose: dose,
                time: time,
                foodRule: foodRule,
                spacingRuleId: spacingRuleId,
                enabled: enabled,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$MedicationsTable, Medication>(table),
                  $$MedicationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({protocolId = false, spacingRuleId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (protocolId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.protocolId,
                        referencedTable: $$MedicationsTableReferences
                            ._protocolIdTable(db),
                        referencedColumn: $$MedicationsTableReferences
                            ._protocolIdTable(db)
                            .id,
                      ) as T;
                    }
                    if (spacingRuleId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.spacingRuleId,
                        referencedTable: $$MedicationsTableReferences
                            ._spacingRuleIdTable(db),
                        referencedColumn: $$MedicationsTableReferences
                            ._spacingRuleIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$MedicationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MedicationsTable,
      Medication,
      $$MedicationsTableFilterComposer,
      $$MedicationsTableOrderingComposer,
      $$MedicationsTableAnnotationComposer,
      $$MedicationsTableCreateCompanionBuilder,
      $$MedicationsTableUpdateCompanionBuilder,
      (Medication, $$MedicationsTableReferences),
      Medication,
      PrefetchHooks Function({bool protocolId, bool spacingRuleId})
    >;
typedef $$LogEntriesTableCreateCompanionBuilder = LogEntriesCompanion Function({
  Value<int> id,
  required int itemId,
  required DateTime scheduledAt,
  Value<DateTime?> completedAt,
  Value<bool> skipped,
});
typedef $$LogEntriesTableUpdateCompanionBuilder = LogEntriesCompanion Function({
  Value<int> id,
  Value<int> itemId,
  Value<DateTime> scheduledAt,
  Value<DateTime?> completedAt,
  Value<bool> skipped,
});

final class $$LogEntriesTableReferences
    extends BaseReferences<_$AppDatabase, $LogEntriesTable, LogEntry> {
  $$LogEntriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ScheduleItemsTable _itemIdTable(_$AppDatabase db) =>
      db.scheduleItems.createAlias('log_entries__item_id__schedule_items__id');

  $$ScheduleItemsTableProcessedTableManager get itemId {
    final $_column = $_itemColumn<int>('item_id')!;

    final manager = $$ScheduleItemsTableTableManager(
      $_db,
      $_db.scheduleItems,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_itemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$LogEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $LogEntriesTable> {
  $$LogEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get skipped => $composableBuilder(
    column: $table.skipped,
    builder: (column) => ColumnFilters(column),
  );

  $$ScheduleItemsTableFilterComposer get itemId {
    final $$ScheduleItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itemId,
      referencedTable: $db.scheduleItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScheduleItemsTableFilterComposer(
            $db: $db,
            $table: $db.scheduleItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LogEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $LogEntriesTable> {
  $$LogEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get skipped => $composableBuilder(
    column: $table.skipped,
    builder: (column) => ColumnOrderings(column),
  );

  $$ScheduleItemsTableOrderingComposer get itemId {
    final $$ScheduleItemsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itemId,
      referencedTable: $db.scheduleItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScheduleItemsTableOrderingComposer(
            $db: $db,
            $table: $db.scheduleItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LogEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $LogEntriesTable> {
  $$LogEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get skipped =>
      $composableBuilder(column: $table.skipped, builder: (column) => column);

  $$ScheduleItemsTableAnnotationComposer get itemId {
    final $$ScheduleItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itemId,
      referencedTable: $db.scheduleItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScheduleItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.scheduleItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LogEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LogEntriesTable,
          LogEntry,
          $$LogEntriesTableFilterComposer,
          $$LogEntriesTableOrderingComposer,
          $$LogEntriesTableAnnotationComposer,
          $$LogEntriesTableCreateCompanionBuilder,
          $$LogEntriesTableUpdateCompanionBuilder,
          (LogEntry, $$LogEntriesTableReferences),
          LogEntry,
          PrefetchHooks Function({bool itemId})
        > {
  $$LogEntriesTableTableManager(_$AppDatabase db, $LogEntriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LogEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LogEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LogEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> itemId = const Value.absent(),
                Value<DateTime> scheduledAt = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<bool> skipped = const Value.absent(),
              }) => LogEntriesCompanion(
                id: id,
                itemId: itemId,
                scheduledAt: scheduledAt,
                completedAt: completedAt,
                skipped: skipped,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int itemId,
                required DateTime scheduledAt,
                Value<DateTime?> completedAt = const Value.absent(),
                Value<bool> skipped = const Value.absent(),
              }) => LogEntriesCompanion.insert(
                id: id,
                itemId: itemId,
                scheduledAt: scheduledAt,
                completedAt: completedAt,
                skipped: skipped,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$LogEntriesTable, LogEntry>(table),
                  $$LogEntriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({itemId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (itemId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.itemId,
                        referencedTable: $$LogEntriesTableReferences
                            ._itemIdTable(db),
                        referencedColumn: $$LogEntriesTableReferences
                            ._itemIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$LogEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LogEntriesTable,
      LogEntry,
      $$LogEntriesTableFilterComposer,
      $$LogEntriesTableOrderingComposer,
      $$LogEntriesTableAnnotationComposer,
      $$LogEntriesTableCreateCompanionBuilder,
      $$LogEntriesTableUpdateCompanionBuilder,
      (LogEntry, $$LogEntriesTableReferences),
      LogEntry,
      PrefetchHooks Function({bool itemId})
    >;
typedef $$TrainingPlansTableCreateCompanionBuilder =
    TrainingPlansCompanion Function({
      Value<int> id,
      required int protocolId,
      required int dayOfWeek,
      required String sessionName,
      required int durationMin,
    });
typedef $$TrainingPlansTableUpdateCompanionBuilder =
    TrainingPlansCompanion Function({
      Value<int> id,
      Value<int> protocolId,
      Value<int> dayOfWeek,
      Value<String> sessionName,
      Value<int> durationMin,
    });

final class $$TrainingPlansTableReferences
    extends BaseReferences<_$AppDatabase, $TrainingPlansTable, TrainingPlan> {
  $$TrainingPlansTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ProtocolsTable _protocolIdTable(_$AppDatabase db) =>
      db.protocols.createAlias('training_plans__protocol_id__protocols__id');

  $$ProtocolsTableProcessedTableManager get protocolId {
    final $_column = $_itemColumn<int>('protocol_id')!;

    final manager = $$ProtocolsTableTableManager(
      $_db,
      $_db.protocols,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_protocolIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ExercisesTable, List<Exercise>>
  _exercisesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.exercises,
    aliasName: 'training_plans__id__exercises__training_plan_id',
  );

  $$ExercisesTableProcessedTableManager get exercisesRefs {
    final manager = $$ExercisesTableTableManager(
      $_db,
      $_db.exercises,
    ).filter((f) => f.trainingPlanId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_exercisesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TrainingPlansTableFilterComposer
    extends Composer<_$AppDatabase, $TrainingPlansTable> {
  $$TrainingPlansTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dayOfWeek => $composableBuilder(
    column: $table.dayOfWeek,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sessionName => $composableBuilder(
    column: $table.sessionName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationMin => $composableBuilder(
    column: $table.durationMin,
    builder: (column) => ColumnFilters(column),
  );

  $$ProtocolsTableFilterComposer get protocolId {
    final $$ProtocolsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.protocolId,
      referencedTable: $db.protocols,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProtocolsTableFilterComposer(
            $db: $db,
            $table: $db.protocols,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> exercisesRefs(
    Expression<bool> Function($$ExercisesTableFilterComposer f) f,
  ) {
    final $$ExercisesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.exercises,
      getReferencedColumn: (t) => t.trainingPlanId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExercisesTableFilterComposer(
            $db: $db,
            $table: $db.exercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TrainingPlansTableOrderingComposer
    extends Composer<_$AppDatabase, $TrainingPlansTable> {
  $$TrainingPlansTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dayOfWeek => $composableBuilder(
    column: $table.dayOfWeek,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sessionName => $composableBuilder(
    column: $table.sessionName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationMin => $composableBuilder(
    column: $table.durationMin,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProtocolsTableOrderingComposer get protocolId {
    final $$ProtocolsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.protocolId,
      referencedTable: $db.protocols,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProtocolsTableOrderingComposer(
            $db: $db,
            $table: $db.protocols,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TrainingPlansTableAnnotationComposer
    extends Composer<_$AppDatabase, $TrainingPlansTable> {
  $$TrainingPlansTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get dayOfWeek =>
      $composableBuilder(column: $table.dayOfWeek, builder: (column) => column);

  GeneratedColumn<String> get sessionName => $composableBuilder(
    column: $table.sessionName,
    builder: (column) => column,
  );

  GeneratedColumn<int> get durationMin => $composableBuilder(
    column: $table.durationMin,
    builder: (column) => column,
  );

  $$ProtocolsTableAnnotationComposer get protocolId {
    final $$ProtocolsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.protocolId,
      referencedTable: $db.protocols,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProtocolsTableAnnotationComposer(
            $db: $db,
            $table: $db.protocols,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> exercisesRefs<T extends Object>(
    Expression<T> Function($$ExercisesTableAnnotationComposer a) f,
  ) {
    final $$ExercisesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.exercises,
      getReferencedColumn: (t) => t.trainingPlanId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExercisesTableAnnotationComposer(
            $db: $db,
            $table: $db.exercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TrainingPlansTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TrainingPlansTable,
          TrainingPlan,
          $$TrainingPlansTableFilterComposer,
          $$TrainingPlansTableOrderingComposer,
          $$TrainingPlansTableAnnotationComposer,
          $$TrainingPlansTableCreateCompanionBuilder,
          $$TrainingPlansTableUpdateCompanionBuilder,
          (TrainingPlan, $$TrainingPlansTableReferences),
          TrainingPlan,
          PrefetchHooks Function({bool protocolId, bool exercisesRefs})
        > {
  $$TrainingPlansTableTableManager(_$AppDatabase db, $TrainingPlansTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TrainingPlansTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TrainingPlansTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TrainingPlansTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> protocolId = const Value.absent(),
                Value<int> dayOfWeek = const Value.absent(),
                Value<String> sessionName = const Value.absent(),
                Value<int> durationMin = const Value.absent(),
              }) => TrainingPlansCompanion(
                id: id,
                protocolId: protocolId,
                dayOfWeek: dayOfWeek,
                sessionName: sessionName,
                durationMin: durationMin,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int protocolId,
                required int dayOfWeek,
                required String sessionName,
                required int durationMin,
              }) => TrainingPlansCompanion.insert(
                id: id,
                protocolId: protocolId,
                dayOfWeek: dayOfWeek,
                sessionName: sessionName,
                durationMin: durationMin,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$TrainingPlansTable, TrainingPlan>(table),
                  $$TrainingPlansTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({protocolId = false, exercisesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (exercisesRefs) db.exercises],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (protocolId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.protocolId,
                        referencedTable: $$TrainingPlansTableReferences
                            ._protocolIdTable(db),
                        referencedColumn: $$TrainingPlansTableReferences
                            ._protocolIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (exercisesRefs)
                    await $_getPrefetchedData<
                      TrainingPlan,
                      $TrainingPlansTable,
                      Exercise
                    >(
                      currentTable: table,
                      referencedTable: $$TrainingPlansTableReferences
                          ._exercisesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$TrainingPlansTableReferences(
                            db,
                            table,
                            p0,
                          ).exercisesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.trainingPlanId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$TrainingPlansTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TrainingPlansTable,
      TrainingPlan,
      $$TrainingPlansTableFilterComposer,
      $$TrainingPlansTableOrderingComposer,
      $$TrainingPlansTableAnnotationComposer,
      $$TrainingPlansTableCreateCompanionBuilder,
      $$TrainingPlansTableUpdateCompanionBuilder,
      (TrainingPlan, $$TrainingPlansTableReferences),
      TrainingPlan,
      PrefetchHooks Function({bool protocolId, bool exercisesRefs})
    >;
typedef $$ExercisesTableCreateCompanionBuilder = ExercisesCompanion Function({
  Value<int> id,
  required int trainingPlanId,
  required int position,
  required String name,
  Value<int?> sets,
  Value<String?> reps,
  Value<int?> restSeconds,
  required List<String> cues,
  Value<String?> progression,
  Value<String?> note,
});
typedef $$ExercisesTableUpdateCompanionBuilder = ExercisesCompanion Function({
  Value<int> id,
  Value<int> trainingPlanId,
  Value<int> position,
  Value<String> name,
  Value<int?> sets,
  Value<String?> reps,
  Value<int?> restSeconds,
  Value<List<String>> cues,
  Value<String?> progression,
  Value<String?> note,
});

final class $$ExercisesTableReferences
    extends BaseReferences<_$AppDatabase, $ExercisesTable, Exercise> {
  $$ExercisesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TrainingPlansTable _trainingPlanIdTable(_$AppDatabase db) => db
      .trainingPlans
      .createAlias('exercises__training_plan_id__training_plans__id');

  $$TrainingPlansTableProcessedTableManager get trainingPlanId {
    final $_column = $_itemColumn<int>('training_plan_id')!;

    final manager = $$TrainingPlansTableTableManager(
      $_db,
      $_db.trainingPlans,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_trainingPlanIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ExercisesTableFilterComposer
    extends Composer<_$AppDatabase, $ExercisesTable> {
  $$ExercisesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sets => $composableBuilder(
    column: $table.sets,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reps => $composableBuilder(
    column: $table.reps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get restSeconds => $composableBuilder(
    column: $table.restSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>, List<String>, String> get cues =>
      $composableBuilder(
        column: $table.cues,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get progression => $composableBuilder(
    column: $table.progression,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  $$TrainingPlansTableFilterComposer get trainingPlanId {
    final $$TrainingPlansTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.trainingPlanId,
      referencedTable: $db.trainingPlans,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TrainingPlansTableFilterComposer(
            $db: $db,
            $table: $db.trainingPlans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ExercisesTableOrderingComposer
    extends Composer<_$AppDatabase, $ExercisesTable> {
  $$ExercisesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sets => $composableBuilder(
    column: $table.sets,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reps => $composableBuilder(
    column: $table.reps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get restSeconds => $composableBuilder(
    column: $table.restSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cues => $composableBuilder(
    column: $table.cues,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get progression => $composableBuilder(
    column: $table.progression,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  $$TrainingPlansTableOrderingComposer get trainingPlanId {
    final $$TrainingPlansTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.trainingPlanId,
      referencedTable: $db.trainingPlans,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TrainingPlansTableOrderingComposer(
            $db: $db,
            $table: $db.trainingPlans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ExercisesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExercisesTable> {
  $$ExercisesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get position =>
      $composableBuilder(column: $table.position, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get sets =>
      $composableBuilder(column: $table.sets, builder: (column) => column);

  GeneratedColumn<String> get reps =>
      $composableBuilder(column: $table.reps, builder: (column) => column);

  GeneratedColumn<int> get restSeconds => $composableBuilder(
    column: $table.restSeconds,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<List<String>, String> get cues =>
      $composableBuilder(column: $table.cues, builder: (column) => column);

  GeneratedColumn<String> get progression => $composableBuilder(
    column: $table.progression,
    builder: (column) => column,
  );

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  $$TrainingPlansTableAnnotationComposer get trainingPlanId {
    final $$TrainingPlansTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.trainingPlanId,
      referencedTable: $db.trainingPlans,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TrainingPlansTableAnnotationComposer(
            $db: $db,
            $table: $db.trainingPlans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ExercisesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExercisesTable,
          Exercise,
          $$ExercisesTableFilterComposer,
          $$ExercisesTableOrderingComposer,
          $$ExercisesTableAnnotationComposer,
          $$ExercisesTableCreateCompanionBuilder,
          $$ExercisesTableUpdateCompanionBuilder,
          (Exercise, $$ExercisesTableReferences),
          Exercise,
          PrefetchHooks Function({bool trainingPlanId})
        > {
  $$ExercisesTableTableManager(_$AppDatabase db, $ExercisesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExercisesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExercisesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExercisesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> trainingPlanId = const Value.absent(),
                Value<int> position = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int?> sets = const Value.absent(),
                Value<String?> reps = const Value.absent(),
                Value<int?> restSeconds = const Value.absent(),
                Value<List<String>> cues = const Value.absent(),
                Value<String?> progression = const Value.absent(),
                Value<String?> note = const Value.absent(),
              }) => ExercisesCompanion(
                id: id,
                trainingPlanId: trainingPlanId,
                position: position,
                name: name,
                sets: sets,
                reps: reps,
                restSeconds: restSeconds,
                cues: cues,
                progression: progression,
                note: note,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int trainingPlanId,
                required int position,
                required String name,
                Value<int?> sets = const Value.absent(),
                Value<String?> reps = const Value.absent(),
                Value<int?> restSeconds = const Value.absent(),
                required List<String> cues,
                Value<String?> progression = const Value.absent(),
                Value<String?> note = const Value.absent(),
              }) => ExercisesCompanion.insert(
                id: id,
                trainingPlanId: trainingPlanId,
                position: position,
                name: name,
                sets: sets,
                reps: reps,
                restSeconds: restSeconds,
                cues: cues,
                progression: progression,
                note: note,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ExercisesTable, Exercise>(table),
                  $$ExercisesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({trainingPlanId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (trainingPlanId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.trainingPlanId,
                        referencedTable: $$ExercisesTableReferences
                            ._trainingPlanIdTable(db),
                        referencedColumn: $$ExercisesTableReferences
                            ._trainingPlanIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ExercisesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExercisesTable,
      Exercise,
      $$ExercisesTableFilterComposer,
      $$ExercisesTableOrderingComposer,
      $$ExercisesTableAnnotationComposer,
      $$ExercisesTableCreateCompanionBuilder,
      $$ExercisesTableUpdateCompanionBuilder,
      (Exercise, $$ExercisesTableReferences),
      Exercise,
      PrefetchHooks Function({bool trainingPlanId})
    >;
typedef $$IntervalCyclesTableCreateCompanionBuilder =
    IntervalCyclesCompanion Function({
      Value<int> id,
      required int protocolId,
      required DateTime startDate,
      Value<int> lengthWeeks,
    });
typedef $$IntervalCyclesTableUpdateCompanionBuilder =
    IntervalCyclesCompanion Function({
      Value<int> id,
      Value<int> protocolId,
      Value<DateTime> startDate,
      Value<int> lengthWeeks,
    });

final class $$IntervalCyclesTableReferences
    extends BaseReferences<_$AppDatabase, $IntervalCyclesTable, IntervalCycle> {
  $$IntervalCyclesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ProtocolsTable _protocolIdTable(_$AppDatabase db) =>
      db.protocols.createAlias('interval_cycles__protocol_id__protocols__id');

  $$ProtocolsTableProcessedTableManager get protocolId {
    final $_column = $_itemColumn<int>('protocol_id')!;

    final manager = $$ProtocolsTableTableManager(
      $_db,
      $_db.protocols,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_protocolIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$IntervalBlocksTable, List<IntervalBlock>>
  _intervalBlocksRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.intervalBlocks,
    aliasName: 'interval_cycles__id__interval_blocks__cycle_id',
  );

  $$IntervalBlocksTableProcessedTableManager get intervalBlocksRefs {
    final manager = $$IntervalBlocksTableTableManager(
      $_db,
      $_db.intervalBlocks,
    ).filter((f) => f.cycleId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_intervalBlocksRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$IntervalCyclesTableFilterComposer
    extends Composer<_$AppDatabase, $IntervalCyclesTable> {
  $$IntervalCyclesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lengthWeeks => $composableBuilder(
    column: $table.lengthWeeks,
    builder: (column) => ColumnFilters(column),
  );

  $$ProtocolsTableFilterComposer get protocolId {
    final $$ProtocolsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.protocolId,
      referencedTable: $db.protocols,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProtocolsTableFilterComposer(
            $db: $db,
            $table: $db.protocols,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> intervalBlocksRefs(
    Expression<bool> Function($$IntervalBlocksTableFilterComposer f) f,
  ) {
    final $$IntervalBlocksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.intervalBlocks,
      getReferencedColumn: (t) => t.cycleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IntervalBlocksTableFilterComposer(
            $db: $db,
            $table: $db.intervalBlocks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$IntervalCyclesTableOrderingComposer
    extends Composer<_$AppDatabase, $IntervalCyclesTable> {
  $$IntervalCyclesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lengthWeeks => $composableBuilder(
    column: $table.lengthWeeks,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProtocolsTableOrderingComposer get protocolId {
    final $$ProtocolsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.protocolId,
      referencedTable: $db.protocols,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProtocolsTableOrderingComposer(
            $db: $db,
            $table: $db.protocols,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$IntervalCyclesTableAnnotationComposer
    extends Composer<_$AppDatabase, $IntervalCyclesTable> {
  $$IntervalCyclesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<int> get lengthWeeks => $composableBuilder(
    column: $table.lengthWeeks,
    builder: (column) => column,
  );

  $$ProtocolsTableAnnotationComposer get protocolId {
    final $$ProtocolsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.protocolId,
      referencedTable: $db.protocols,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProtocolsTableAnnotationComposer(
            $db: $db,
            $table: $db.protocols,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> intervalBlocksRefs<T extends Object>(
    Expression<T> Function($$IntervalBlocksTableAnnotationComposer a) f,
  ) {
    final $$IntervalBlocksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.intervalBlocks,
      getReferencedColumn: (t) => t.cycleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IntervalBlocksTableAnnotationComposer(
            $db: $db,
            $table: $db.intervalBlocks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$IntervalCyclesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $IntervalCyclesTable,
          IntervalCycle,
          $$IntervalCyclesTableFilterComposer,
          $$IntervalCyclesTableOrderingComposer,
          $$IntervalCyclesTableAnnotationComposer,
          $$IntervalCyclesTableCreateCompanionBuilder,
          $$IntervalCyclesTableUpdateCompanionBuilder,
          (IntervalCycle, $$IntervalCyclesTableReferences),
          IntervalCycle,
          PrefetchHooks Function({bool protocolId, bool intervalBlocksRefs})
        > {
  $$IntervalCyclesTableTableManager(
    _$AppDatabase db,
    $IntervalCyclesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IntervalCyclesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$IntervalCyclesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$IntervalCyclesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> protocolId = const Value.absent(),
                Value<DateTime> startDate = const Value.absent(),
                Value<int> lengthWeeks = const Value.absent(),
              }) => IntervalCyclesCompanion(
                id: id,
                protocolId: protocolId,
                startDate: startDate,
                lengthWeeks: lengthWeeks,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int protocolId,
                required DateTime startDate,
                Value<int> lengthWeeks = const Value.absent(),
              }) => IntervalCyclesCompanion.insert(
                id: id,
                protocolId: protocolId,
                startDate: startDate,
                lengthWeeks: lengthWeeks,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$IntervalCyclesTable, IntervalCycle>(table),
                  $$IntervalCyclesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({protocolId = false, intervalBlocksRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (intervalBlocksRefs) db.intervalBlocks,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (protocolId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.protocolId,
                            referencedTable: $$IntervalCyclesTableReferences
                                ._protocolIdTable(db),
                            referencedColumn: $$IntervalCyclesTableReferences
                                ._protocolIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (intervalBlocksRefs)
                        await $_getPrefetchedData<
                          IntervalCycle,
                          $IntervalCyclesTable,
                          IntervalBlock
                        >(
                          currentTable: table,
                          referencedTable: $$IntervalCyclesTableReferences
                              ._intervalBlocksRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$IntervalCyclesTableReferences(
                                db,
                                table,
                                p0,
                              ).intervalBlocksRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.cycleId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$IntervalCyclesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $IntervalCyclesTable,
      IntervalCycle,
      $$IntervalCyclesTableFilterComposer,
      $$IntervalCyclesTableOrderingComposer,
      $$IntervalCyclesTableAnnotationComposer,
      $$IntervalCyclesTableCreateCompanionBuilder,
      $$IntervalCyclesTableUpdateCompanionBuilder,
      (IntervalCycle, $$IntervalCyclesTableReferences),
      IntervalCycle,
      PrefetchHooks Function({bool protocolId, bool intervalBlocksRefs})
    >;
typedef $$IntervalBlocksTableCreateCompanionBuilder =
    IntervalBlocksCompanion Function({
      Value<int> id,
      required int cycleId,
      required String name,
      required int weekFrom,
      required int weekTo,
      required String protocol,
      Value<int?> warmUpMin,
      Value<int?> coolDownMin,
      Value<String?> damper,
      Value<String?> strokeRate,
      Value<String?> rpe,
      Value<int?> targetFasterBySecMin,
      Value<int?> targetFasterBySecMax,
    });
typedef $$IntervalBlocksTableUpdateCompanionBuilder =
    IntervalBlocksCompanion Function({
      Value<int> id,
      Value<int> cycleId,
      Value<String> name,
      Value<int> weekFrom,
      Value<int> weekTo,
      Value<String> protocol,
      Value<int?> warmUpMin,
      Value<int?> coolDownMin,
      Value<String?> damper,
      Value<String?> strokeRate,
      Value<String?> rpe,
      Value<int?> targetFasterBySecMin,
      Value<int?> targetFasterBySecMax,
    });

final class $$IntervalBlocksTableReferences
    extends BaseReferences<_$AppDatabase, $IntervalBlocksTable, IntervalBlock> {
  $$IntervalBlocksTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $IntervalCyclesTable _cycleIdTable(_$AppDatabase db) => db
      .intervalCycles
      .createAlias('interval_blocks__cycle_id__interval_cycles__id');

  $$IntervalCyclesTableProcessedTableManager get cycleId {
    final $_column = $_itemColumn<int>('cycle_id')!;

    final manager = $$IntervalCyclesTableTableManager(
      $_db,
      $_db.intervalCycles,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_cycleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$IntervalBlocksTableFilterComposer
    extends Composer<_$AppDatabase, $IntervalBlocksTable> {
  $$IntervalBlocksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get weekFrom => $composableBuilder(
    column: $table.weekFrom,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get weekTo => $composableBuilder(
    column: $table.weekTo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get protocol => $composableBuilder(
    column: $table.protocol,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get warmUpMin => $composableBuilder(
    column: $table.warmUpMin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get coolDownMin => $composableBuilder(
    column: $table.coolDownMin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get damper => $composableBuilder(
    column: $table.damper,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get strokeRate => $composableBuilder(
    column: $table.strokeRate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rpe => $composableBuilder(
    column: $table.rpe,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get targetFasterBySecMin => $composableBuilder(
    column: $table.targetFasterBySecMin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get targetFasterBySecMax => $composableBuilder(
    column: $table.targetFasterBySecMax,
    builder: (column) => ColumnFilters(column),
  );

  $$IntervalCyclesTableFilterComposer get cycleId {
    final $$IntervalCyclesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cycleId,
      referencedTable: $db.intervalCycles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IntervalCyclesTableFilterComposer(
            $db: $db,
            $table: $db.intervalCycles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$IntervalBlocksTableOrderingComposer
    extends Composer<_$AppDatabase, $IntervalBlocksTable> {
  $$IntervalBlocksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get weekFrom => $composableBuilder(
    column: $table.weekFrom,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get weekTo => $composableBuilder(
    column: $table.weekTo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get protocol => $composableBuilder(
    column: $table.protocol,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get warmUpMin => $composableBuilder(
    column: $table.warmUpMin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get coolDownMin => $composableBuilder(
    column: $table.coolDownMin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get damper => $composableBuilder(
    column: $table.damper,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get strokeRate => $composableBuilder(
    column: $table.strokeRate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rpe => $composableBuilder(
    column: $table.rpe,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get targetFasterBySecMin => $composableBuilder(
    column: $table.targetFasterBySecMin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get targetFasterBySecMax => $composableBuilder(
    column: $table.targetFasterBySecMax,
    builder: (column) => ColumnOrderings(column),
  );

  $$IntervalCyclesTableOrderingComposer get cycleId {
    final $$IntervalCyclesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cycleId,
      referencedTable: $db.intervalCycles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IntervalCyclesTableOrderingComposer(
            $db: $db,
            $table: $db.intervalCycles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$IntervalBlocksTableAnnotationComposer
    extends Composer<_$AppDatabase, $IntervalBlocksTable> {
  $$IntervalBlocksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get weekFrom =>
      $composableBuilder(column: $table.weekFrom, builder: (column) => column);

  GeneratedColumn<int> get weekTo =>
      $composableBuilder(column: $table.weekTo, builder: (column) => column);

  GeneratedColumn<String> get protocol =>
      $composableBuilder(column: $table.protocol, builder: (column) => column);

  GeneratedColumn<int> get warmUpMin =>
      $composableBuilder(column: $table.warmUpMin, builder: (column) => column);

  GeneratedColumn<int> get coolDownMin => $composableBuilder(
    column: $table.coolDownMin,
    builder: (column) => column,
  );

  GeneratedColumn<String> get damper =>
      $composableBuilder(column: $table.damper, builder: (column) => column);

  GeneratedColumn<String> get strokeRate => $composableBuilder(
    column: $table.strokeRate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get rpe =>
      $composableBuilder(column: $table.rpe, builder: (column) => column);

  GeneratedColumn<int> get targetFasterBySecMin => $composableBuilder(
    column: $table.targetFasterBySecMin,
    builder: (column) => column,
  );

  GeneratedColumn<int> get targetFasterBySecMax => $composableBuilder(
    column: $table.targetFasterBySecMax,
    builder: (column) => column,
  );

  $$IntervalCyclesTableAnnotationComposer get cycleId {
    final $$IntervalCyclesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cycleId,
      referencedTable: $db.intervalCycles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IntervalCyclesTableAnnotationComposer(
            $db: $db,
            $table: $db.intervalCycles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$IntervalBlocksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $IntervalBlocksTable,
          IntervalBlock,
          $$IntervalBlocksTableFilterComposer,
          $$IntervalBlocksTableOrderingComposer,
          $$IntervalBlocksTableAnnotationComposer,
          $$IntervalBlocksTableCreateCompanionBuilder,
          $$IntervalBlocksTableUpdateCompanionBuilder,
          (IntervalBlock, $$IntervalBlocksTableReferences),
          IntervalBlock,
          PrefetchHooks Function({bool cycleId})
        > {
  $$IntervalBlocksTableTableManager(
    _$AppDatabase db,
    $IntervalBlocksTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IntervalBlocksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$IntervalBlocksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$IntervalBlocksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> cycleId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> weekFrom = const Value.absent(),
                Value<int> weekTo = const Value.absent(),
                Value<String> protocol = const Value.absent(),
                Value<int?> warmUpMin = const Value.absent(),
                Value<int?> coolDownMin = const Value.absent(),
                Value<String?> damper = const Value.absent(),
                Value<String?> strokeRate = const Value.absent(),
                Value<String?> rpe = const Value.absent(),
                Value<int?> targetFasterBySecMin = const Value.absent(),
                Value<int?> targetFasterBySecMax = const Value.absent(),
              }) => IntervalBlocksCompanion(
                id: id,
                cycleId: cycleId,
                name: name,
                weekFrom: weekFrom,
                weekTo: weekTo,
                protocol: protocol,
                warmUpMin: warmUpMin,
                coolDownMin: coolDownMin,
                damper: damper,
                strokeRate: strokeRate,
                rpe: rpe,
                targetFasterBySecMin: targetFasterBySecMin,
                targetFasterBySecMax: targetFasterBySecMax,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int cycleId,
                required String name,
                required int weekFrom,
                required int weekTo,
                required String protocol,
                Value<int?> warmUpMin = const Value.absent(),
                Value<int?> coolDownMin = const Value.absent(),
                Value<String?> damper = const Value.absent(),
                Value<String?> strokeRate = const Value.absent(),
                Value<String?> rpe = const Value.absent(),
                Value<int?> targetFasterBySecMin = const Value.absent(),
                Value<int?> targetFasterBySecMax = const Value.absent(),
              }) => IntervalBlocksCompanion.insert(
                id: id,
                cycleId: cycleId,
                name: name,
                weekFrom: weekFrom,
                weekTo: weekTo,
                protocol: protocol,
                warmUpMin: warmUpMin,
                coolDownMin: coolDownMin,
                damper: damper,
                strokeRate: strokeRate,
                rpe: rpe,
                targetFasterBySecMin: targetFasterBySecMin,
                targetFasterBySecMax: targetFasterBySecMax,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$IntervalBlocksTable, IntervalBlock>(table),
                  $$IntervalBlocksTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({cycleId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (cycleId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.cycleId,
                        referencedTable: $$IntervalBlocksTableReferences
                            ._cycleIdTable(db),
                        referencedColumn: $$IntervalBlocksTableReferences
                            ._cycleIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$IntervalBlocksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $IntervalBlocksTable,
      IntervalBlock,
      $$IntervalBlocksTableFilterComposer,
      $$IntervalBlocksTableOrderingComposer,
      $$IntervalBlocksTableAnnotationComposer,
      $$IntervalBlocksTableCreateCompanionBuilder,
      $$IntervalBlocksTableUpdateCompanionBuilder,
      (IntervalBlock, $$IntervalBlocksTableReferences),
      IntervalBlock,
      PrefetchHooks Function({bool cycleId})
    >;
typedef $$ErgSessionsTableCreateCompanionBuilder =
    ErgSessionsCompanion Function({
      Value<int> id,
      required DateTime date,
      required int distance,
      required int timeSec,
      required double splitSec,
      Value<int?> spm,
      Value<int?> damper,
      Value<String?> note,
    });
typedef $$ErgSessionsTableUpdateCompanionBuilder =
    ErgSessionsCompanion Function({
      Value<int> id,
      Value<DateTime> date,
      Value<int> distance,
      Value<int> timeSec,
      Value<double> splitSec,
      Value<int?> spm,
      Value<int?> damper,
      Value<String?> note,
    });

class $$ErgSessionsTableFilterComposer
    extends Composer<_$AppDatabase, $ErgSessionsTable> {
  $$ErgSessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get distance => $composableBuilder(
    column: $table.distance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get timeSec => $composableBuilder(
    column: $table.timeSec,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get splitSec => $composableBuilder(
    column: $table.splitSec,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get spm => $composableBuilder(
    column: $table.spm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get damper => $composableBuilder(
    column: $table.damper,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ErgSessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $ErgSessionsTable> {
  $$ErgSessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get distance => $composableBuilder(
    column: $table.distance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get timeSec => $composableBuilder(
    column: $table.timeSec,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get splitSec => $composableBuilder(
    column: $table.splitSec,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get spm => $composableBuilder(
    column: $table.spm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get damper => $composableBuilder(
    column: $table.damper,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ErgSessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ErgSessionsTable> {
  $$ErgSessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get distance =>
      $composableBuilder(column: $table.distance, builder: (column) => column);

  GeneratedColumn<int> get timeSec =>
      $composableBuilder(column: $table.timeSec, builder: (column) => column);

  GeneratedColumn<double> get splitSec =>
      $composableBuilder(column: $table.splitSec, builder: (column) => column);

  GeneratedColumn<int> get spm =>
      $composableBuilder(column: $table.spm, builder: (column) => column);

  GeneratedColumn<int> get damper =>
      $composableBuilder(column: $table.damper, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);
}

class $$ErgSessionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ErgSessionsTable,
          ErgSession,
          $$ErgSessionsTableFilterComposer,
          $$ErgSessionsTableOrderingComposer,
          $$ErgSessionsTableAnnotationComposer,
          $$ErgSessionsTableCreateCompanionBuilder,
          $$ErgSessionsTableUpdateCompanionBuilder,
          (
            ErgSession,
            BaseReferences<_$AppDatabase, $ErgSessionsTable, ErgSession>,
          ),
          ErgSession,
          PrefetchHooks Function()
        > {
  $$ErgSessionsTableTableManager(_$AppDatabase db, $ErgSessionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ErgSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ErgSessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ErgSessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<int> distance = const Value.absent(),
                Value<int> timeSec = const Value.absent(),
                Value<double> splitSec = const Value.absent(),
                Value<int?> spm = const Value.absent(),
                Value<int?> damper = const Value.absent(),
                Value<String?> note = const Value.absent(),
              }) => ErgSessionsCompanion(
                id: id,
                date: date,
                distance: distance,
                timeSec: timeSec,
                splitSec: splitSec,
                spm: spm,
                damper: damper,
                note: note,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime date,
                required int distance,
                required int timeSec,
                required double splitSec,
                Value<int?> spm = const Value.absent(),
                Value<int?> damper = const Value.absent(),
                Value<String?> note = const Value.absent(),
              }) => ErgSessionsCompanion.insert(
                id: id,
                date: date,
                distance: distance,
                timeSec: timeSec,
                splitSec: splitSec,
                spm: spm,
                damper: damper,
                note: note,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ErgSessionsTable, ErgSession>(table),
                  BaseReferences<_$AppDatabase, $ErgSessionsTable, ErgSession>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ErgSessionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ErgSessionsTable,
      ErgSession,
      $$ErgSessionsTableFilterComposer,
      $$ErgSessionsTableOrderingComposer,
      $$ErgSessionsTableAnnotationComposer,
      $$ErgSessionsTableCreateCompanionBuilder,
      $$ErgSessionsTableUpdateCompanionBuilder,
      (
        ErgSession,
        BaseReferences<_$AppDatabase, $ErgSessionsTable, ErgSession>,
      ),
      ErgSession,
      PrefetchHooks Function()
    >;
typedef $$MealsTableCreateCompanionBuilder = MealsCompanion Function({
  Value<int> id,
  required int protocolId,
  required String name,
  required MealKind kind,
  Value<int?> kcal,
  Value<double?> p,
  Value<double?> c,
  Value<double?> f,
  Value<String?> defaultPortion,
  Value<String?> requiredAddition,
  Value<String?> warning,
  Value<bool> isUserCreated,
});
typedef $$MealsTableUpdateCompanionBuilder = MealsCompanion Function({
  Value<int> id,
  Value<int> protocolId,
  Value<String> name,
  Value<MealKind> kind,
  Value<int?> kcal,
  Value<double?> p,
  Value<double?> c,
  Value<double?> f,
  Value<String?> defaultPortion,
  Value<String?> requiredAddition,
  Value<String?> warning,
  Value<bool> isUserCreated,
});

final class $$MealsTableReferences
    extends BaseReferences<_$AppDatabase, $MealsTable, Meal> {
  $$MealsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProtocolsTable _protocolIdTable(_$AppDatabase db) =>
      db.protocols.createAlias('meals__protocol_id__protocols__id');

  $$ProtocolsTableProcessedTableManager get protocolId {
    final $_column = $_itemColumn<int>('protocol_id')!;

    final manager = $$ProtocolsTableTableManager(
      $_db,
      $_db.protocols,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_protocolIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$MealLogsTable, List<MealLog>> _mealLogsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.mealLogs,
    aliasName: 'meals__id__meal_logs__meal_id',
  );

  $$MealLogsTableProcessedTableManager get mealLogsRefs {
    final manager = $$MealLogsTableTableManager(
      $_db,
      $_db.mealLogs,
    ).filter((f) => f.mealId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_mealLogsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MealsTableFilterComposer extends Composer<_$AppDatabase, $MealsTable> {
  $$MealsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<MealKind, MealKind, String> get kind =>
      $composableBuilder(
        column: $table.kind,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<int> get kcal => $composableBuilder(
    column: $table.kcal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get p => $composableBuilder(
    column: $table.p,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get c => $composableBuilder(
    column: $table.c,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get f => $composableBuilder(
    column: $table.f,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get defaultPortion => $composableBuilder(
    column: $table.defaultPortion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get requiredAddition => $composableBuilder(
    column: $table.requiredAddition,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get warning => $composableBuilder(
    column: $table.warning,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isUserCreated => $composableBuilder(
    column: $table.isUserCreated,
    builder: (column) => ColumnFilters(column),
  );

  $$ProtocolsTableFilterComposer get protocolId {
    final $$ProtocolsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.protocolId,
      referencedTable: $db.protocols,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProtocolsTableFilterComposer(
            $db: $db,
            $table: $db.protocols,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> mealLogsRefs(
    Expression<bool> Function($$MealLogsTableFilterComposer f) f,
  ) {
    final $$MealLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mealLogs,
      getReferencedColumn: (t) => t.mealId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealLogsTableFilterComposer(
            $db: $db,
            $table: $db.mealLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MealsTableOrderingComposer
    extends Composer<_$AppDatabase, $MealsTable> {
  $$MealsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get kcal => $composableBuilder(
    column: $table.kcal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get p => $composableBuilder(
    column: $table.p,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get c => $composableBuilder(
    column: $table.c,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get f => $composableBuilder(
    column: $table.f,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get defaultPortion => $composableBuilder(
    column: $table.defaultPortion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get requiredAddition => $composableBuilder(
    column: $table.requiredAddition,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get warning => $composableBuilder(
    column: $table.warning,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isUserCreated => $composableBuilder(
    column: $table.isUserCreated,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProtocolsTableOrderingComposer get protocolId {
    final $$ProtocolsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.protocolId,
      referencedTable: $db.protocols,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProtocolsTableOrderingComposer(
            $db: $db,
            $table: $db.protocols,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MealsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MealsTable> {
  $$MealsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumnWithTypeConverter<MealKind, String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<int> get kcal =>
      $composableBuilder(column: $table.kcal, builder: (column) => column);

  GeneratedColumn<double> get p =>
      $composableBuilder(column: $table.p, builder: (column) => column);

  GeneratedColumn<double> get c =>
      $composableBuilder(column: $table.c, builder: (column) => column);

  GeneratedColumn<double> get f =>
      $composableBuilder(column: $table.f, builder: (column) => column);

  GeneratedColumn<String> get defaultPortion => $composableBuilder(
    column: $table.defaultPortion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get requiredAddition => $composableBuilder(
    column: $table.requiredAddition,
    builder: (column) => column,
  );

  GeneratedColumn<String> get warning =>
      $composableBuilder(column: $table.warning, builder: (column) => column);

  GeneratedColumn<bool> get isUserCreated => $composableBuilder(
    column: $table.isUserCreated,
    builder: (column) => column,
  );

  $$ProtocolsTableAnnotationComposer get protocolId {
    final $$ProtocolsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.protocolId,
      referencedTable: $db.protocols,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProtocolsTableAnnotationComposer(
            $db: $db,
            $table: $db.protocols,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> mealLogsRefs<T extends Object>(
    Expression<T> Function($$MealLogsTableAnnotationComposer a) f,
  ) {
    final $$MealLogsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mealLogs,
      getReferencedColumn: (t) => t.mealId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealLogsTableAnnotationComposer(
            $db: $db,
            $table: $db.mealLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MealsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MealsTable,
          Meal,
          $$MealsTableFilterComposer,
          $$MealsTableOrderingComposer,
          $$MealsTableAnnotationComposer,
          $$MealsTableCreateCompanionBuilder,
          $$MealsTableUpdateCompanionBuilder,
          (Meal, $$MealsTableReferences),
          Meal,
          PrefetchHooks Function({bool protocolId, bool mealLogsRefs})
        > {
  $$MealsTableTableManager(_$AppDatabase db, $MealsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MealsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MealsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MealsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> protocolId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<MealKind> kind = const Value.absent(),
                Value<int?> kcal = const Value.absent(),
                Value<double?> p = const Value.absent(),
                Value<double?> c = const Value.absent(),
                Value<double?> f = const Value.absent(),
                Value<String?> defaultPortion = const Value.absent(),
                Value<String?> requiredAddition = const Value.absent(),
                Value<String?> warning = const Value.absent(),
                Value<bool> isUserCreated = const Value.absent(),
              }) => MealsCompanion(
                id: id,
                protocolId: protocolId,
                name: name,
                kind: kind,
                kcal: kcal,
                p: p,
                c: c,
                f: f,
                defaultPortion: defaultPortion,
                requiredAddition: requiredAddition,
                warning: warning,
                isUserCreated: isUserCreated,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int protocolId,
                required String name,
                required MealKind kind,
                Value<int?> kcal = const Value.absent(),
                Value<double?> p = const Value.absent(),
                Value<double?> c = const Value.absent(),
                Value<double?> f = const Value.absent(),
                Value<String?> defaultPortion = const Value.absent(),
                Value<String?> requiredAddition = const Value.absent(),
                Value<String?> warning = const Value.absent(),
                Value<bool> isUserCreated = const Value.absent(),
              }) => MealsCompanion.insert(
                id: id,
                protocolId: protocolId,
                name: name,
                kind: kind,
                kcal: kcal,
                p: p,
                c: c,
                f: f,
                defaultPortion: defaultPortion,
                requiredAddition: requiredAddition,
                warning: warning,
                isUserCreated: isUserCreated,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$MealsTable, Meal>(table),
                  $$MealsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({protocolId = false, mealLogsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (mealLogsRefs) db.mealLogs],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (protocolId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.protocolId,
                        referencedTable: $$MealsTableReferences
                            ._protocolIdTable(db),
                        referencedColumn: $$MealsTableReferences
                            ._protocolIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (mealLogsRefs)
                    await $_getPrefetchedData<Meal, $MealsTable, MealLog>(
                      currentTable: table,
                      referencedTable: $$MealsTableReferences
                          ._mealLogsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$MealsTableReferences(db, table, p0).mealLogsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.mealId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$MealsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MealsTable,
      Meal,
      $$MealsTableFilterComposer,
      $$MealsTableOrderingComposer,
      $$MealsTableAnnotationComposer,
      $$MealsTableCreateCompanionBuilder,
      $$MealsTableUpdateCompanionBuilder,
      (Meal, $$MealsTableReferences),
      Meal,
      PrefetchHooks Function({bool protocolId, bool mealLogsRefs})
    >;
typedef $$MealLogsTableCreateCompanionBuilder = MealLogsCompanion Function({
  Value<int> id,
  required DateTime date,
  required int mealId,
  Value<int?> palms,
  Value<int?> fists,
  Value<int?> handfuls,
  Value<int?> thumbs,
  required int kcalMin,
  required int kcalMax,
  Value<String?> photoPath,
});
typedef $$MealLogsTableUpdateCompanionBuilder = MealLogsCompanion Function({
  Value<int> id,
  Value<DateTime> date,
  Value<int> mealId,
  Value<int?> palms,
  Value<int?> fists,
  Value<int?> handfuls,
  Value<int?> thumbs,
  Value<int> kcalMin,
  Value<int> kcalMax,
  Value<String?> photoPath,
});

final class $$MealLogsTableReferences
    extends BaseReferences<_$AppDatabase, $MealLogsTable, MealLog> {
  $$MealLogsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MealsTable _mealIdTable(_$AppDatabase db) =>
      db.meals.createAlias('meal_logs__meal_id__meals__id');

  $$MealsTableProcessedTableManager get mealId {
    final $_column = $_itemColumn<int>('meal_id')!;

    final manager = $$MealsTableTableManager(
      $_db,
      $_db.meals,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_mealIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MealLogsTableFilterComposer
    extends Composer<_$AppDatabase, $MealLogsTable> {
  $$MealLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get palms => $composableBuilder(
    column: $table.palms,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get fists => $composableBuilder(
    column: $table.fists,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get handfuls => $composableBuilder(
    column: $table.handfuls,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get thumbs => $composableBuilder(
    column: $table.thumbs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get kcalMin => $composableBuilder(
    column: $table.kcalMin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get kcalMax => $composableBuilder(
    column: $table.kcalMax,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get photoPath => $composableBuilder(
    column: $table.photoPath,
    builder: (column) => ColumnFilters(column),
  );

  $$MealsTableFilterComposer get mealId {
    final $$MealsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mealId,
      referencedTable: $db.meals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealsTableFilterComposer(
            $db: $db,
            $table: $db.meals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MealLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $MealLogsTable> {
  $$MealLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get palms => $composableBuilder(
    column: $table.palms,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get fists => $composableBuilder(
    column: $table.fists,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get handfuls => $composableBuilder(
    column: $table.handfuls,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get thumbs => $composableBuilder(
    column: $table.thumbs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get kcalMin => $composableBuilder(
    column: $table.kcalMin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get kcalMax => $composableBuilder(
    column: $table.kcalMax,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get photoPath => $composableBuilder(
    column: $table.photoPath,
    builder: (column) => ColumnOrderings(column),
  );

  $$MealsTableOrderingComposer get mealId {
    final $$MealsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mealId,
      referencedTable: $db.meals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealsTableOrderingComposer(
            $db: $db,
            $table: $db.meals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MealLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MealLogsTable> {
  $$MealLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get palms =>
      $composableBuilder(column: $table.palms, builder: (column) => column);

  GeneratedColumn<int> get fists =>
      $composableBuilder(column: $table.fists, builder: (column) => column);

  GeneratedColumn<int> get handfuls =>
      $composableBuilder(column: $table.handfuls, builder: (column) => column);

  GeneratedColumn<int> get thumbs =>
      $composableBuilder(column: $table.thumbs, builder: (column) => column);

  GeneratedColumn<int> get kcalMin =>
      $composableBuilder(column: $table.kcalMin, builder: (column) => column);

  GeneratedColumn<int> get kcalMax =>
      $composableBuilder(column: $table.kcalMax, builder: (column) => column);

  GeneratedColumn<String> get photoPath =>
      $composableBuilder(column: $table.photoPath, builder: (column) => column);

  $$MealsTableAnnotationComposer get mealId {
    final $$MealsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mealId,
      referencedTable: $db.meals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealsTableAnnotationComposer(
            $db: $db,
            $table: $db.meals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MealLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MealLogsTable,
          MealLog,
          $$MealLogsTableFilterComposer,
          $$MealLogsTableOrderingComposer,
          $$MealLogsTableAnnotationComposer,
          $$MealLogsTableCreateCompanionBuilder,
          $$MealLogsTableUpdateCompanionBuilder,
          (MealLog, $$MealLogsTableReferences),
          MealLog,
          PrefetchHooks Function({bool mealId})
        > {
  $$MealLogsTableTableManager(_$AppDatabase db, $MealLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MealLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MealLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MealLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<int> mealId = const Value.absent(),
                Value<int?> palms = const Value.absent(),
                Value<int?> fists = const Value.absent(),
                Value<int?> handfuls = const Value.absent(),
                Value<int?> thumbs = const Value.absent(),
                Value<int> kcalMin = const Value.absent(),
                Value<int> kcalMax = const Value.absent(),
                Value<String?> photoPath = const Value.absent(),
              }) => MealLogsCompanion(
                id: id,
                date: date,
                mealId: mealId,
                palms: palms,
                fists: fists,
                handfuls: handfuls,
                thumbs: thumbs,
                kcalMin: kcalMin,
                kcalMax: kcalMax,
                photoPath: photoPath,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime date,
                required int mealId,
                Value<int?> palms = const Value.absent(),
                Value<int?> fists = const Value.absent(),
                Value<int?> handfuls = const Value.absent(),
                Value<int?> thumbs = const Value.absent(),
                required int kcalMin,
                required int kcalMax,
                Value<String?> photoPath = const Value.absent(),
              }) => MealLogsCompanion.insert(
                id: id,
                date: date,
                mealId: mealId,
                palms: palms,
                fists: fists,
                handfuls: handfuls,
                thumbs: thumbs,
                kcalMin: kcalMin,
                kcalMax: kcalMax,
                photoPath: photoPath,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$MealLogsTable, MealLog>(table),
                  $$MealLogsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({mealId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (mealId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.mealId,
                        referencedTable: $$MealLogsTableReferences._mealIdTable(
                          db,
                        ),
                        referencedColumn: $$MealLogsTableReferences
                            ._mealIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$MealLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MealLogsTable,
      MealLog,
      $$MealLogsTableFilterComposer,
      $$MealLogsTableOrderingComposer,
      $$MealLogsTableAnnotationComposer,
      $$MealLogsTableCreateCompanionBuilder,
      $$MealLogsTableUpdateCompanionBuilder,
      (MealLog, $$MealLogsTableReferences),
      MealLog,
      PrefetchHooks Function({bool mealId})
    >;
typedef $$MeasurementsTableCreateCompanionBuilder =
    MeasurementsCompanion Function({
      Value<int> id,
      required DateTime date,
      required MeasurementKind kind,
      required double value,
    });
typedef $$MeasurementsTableUpdateCompanionBuilder =
    MeasurementsCompanion Function({
      Value<int> id,
      Value<DateTime> date,
      Value<MeasurementKind> kind,
      Value<double> value,
    });

class $$MeasurementsTableFilterComposer
    extends Composer<_$AppDatabase, $MeasurementsTable> {
  $$MeasurementsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<MeasurementKind, MeasurementKind, String>
  get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<double> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MeasurementsTableOrderingComposer
    extends Composer<_$AppDatabase, $MeasurementsTable> {
  $$MeasurementsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MeasurementsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MeasurementsTable> {
  $$MeasurementsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumnWithTypeConverter<MeasurementKind, String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<double> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$MeasurementsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MeasurementsTable,
          Measurement,
          $$MeasurementsTableFilterComposer,
          $$MeasurementsTableOrderingComposer,
          $$MeasurementsTableAnnotationComposer,
          $$MeasurementsTableCreateCompanionBuilder,
          $$MeasurementsTableUpdateCompanionBuilder,
          (
            Measurement,
            BaseReferences<_$AppDatabase, $MeasurementsTable, Measurement>,
          ),
          Measurement,
          PrefetchHooks Function()
        > {
  $$MeasurementsTableTableManager(_$AppDatabase db, $MeasurementsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MeasurementsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MeasurementsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MeasurementsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<MeasurementKind> kind = const Value.absent(),
                Value<double> value = const Value.absent(),
              }) => MeasurementsCompanion(
                id: id,
                date: date,
                kind: kind,
                value: value,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime date,
                required MeasurementKind kind,
                required double value,
              }) => MeasurementsCompanion.insert(
                id: id,
                date: date,
                kind: kind,
                value: value,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$MeasurementsTable, Measurement>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $MeasurementsTable,
                    Measurement
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MeasurementsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MeasurementsTable,
      Measurement,
      $$MeasurementsTableFilterComposer,
      $$MeasurementsTableOrderingComposer,
      $$MeasurementsTableAnnotationComposer,
      $$MeasurementsTableCreateCompanionBuilder,
      $$MeasurementsTableUpdateCompanionBuilder,
      (
        Measurement,
        BaseReferences<_$AppDatabase, $MeasurementsTable, Measurement>,
      ),
      Measurement,
      PrefetchHooks Function()
    >;
typedef $$CorrectionsTableCreateCompanionBuilder =
    CorrectionsCompanion Function({
      Value<int> id,
      required DateTime date,
      required double deltaKg,
      required String action,
      Value<bool> accepted,
    });
typedef $$CorrectionsTableUpdateCompanionBuilder =
    CorrectionsCompanion Function({
      Value<int> id,
      Value<DateTime> date,
      Value<double> deltaKg,
      Value<String> action,
      Value<bool> accepted,
    });

class $$CorrectionsTableFilterComposer
    extends Composer<_$AppDatabase, $CorrectionsTable> {
  $$CorrectionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get deltaKg => $composableBuilder(
    column: $table.deltaKg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get accepted => $composableBuilder(
    column: $table.accepted,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CorrectionsTableOrderingComposer
    extends Composer<_$AppDatabase, $CorrectionsTable> {
  $$CorrectionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get deltaKg => $composableBuilder(
    column: $table.deltaKg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get accepted => $composableBuilder(
    column: $table.accepted,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CorrectionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CorrectionsTable> {
  $$CorrectionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<double> get deltaKg =>
      $composableBuilder(column: $table.deltaKg, builder: (column) => column);

  GeneratedColumn<String> get action =>
      $composableBuilder(column: $table.action, builder: (column) => column);

  GeneratedColumn<bool> get accepted =>
      $composableBuilder(column: $table.accepted, builder: (column) => column);
}

class $$CorrectionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CorrectionsTable,
          Correction,
          $$CorrectionsTableFilterComposer,
          $$CorrectionsTableOrderingComposer,
          $$CorrectionsTableAnnotationComposer,
          $$CorrectionsTableCreateCompanionBuilder,
          $$CorrectionsTableUpdateCompanionBuilder,
          (
            Correction,
            BaseReferences<_$AppDatabase, $CorrectionsTable, Correction>,
          ),
          Correction,
          PrefetchHooks Function()
        > {
  $$CorrectionsTableTableManager(_$AppDatabase db, $CorrectionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CorrectionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CorrectionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CorrectionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<double> deltaKg = const Value.absent(),
                Value<String> action = const Value.absent(),
                Value<bool> accepted = const Value.absent(),
              }) => CorrectionsCompanion(
                id: id,
                date: date,
                deltaKg: deltaKg,
                action: action,
                accepted: accepted,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime date,
                required double deltaKg,
                required String action,
                Value<bool> accepted = const Value.absent(),
              }) => CorrectionsCompanion.insert(
                id: id,
                date: date,
                deltaKg: deltaKg,
                action: action,
                accepted: accepted,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$CorrectionsTable, Correction>(table),
                  BaseReferences<_$AppDatabase, $CorrectionsTable, Correction>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CorrectionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CorrectionsTable,
      Correction,
      $$CorrectionsTableFilterComposer,
      $$CorrectionsTableOrderingComposer,
      $$CorrectionsTableAnnotationComposer,
      $$CorrectionsTableCreateCompanionBuilder,
      $$CorrectionsTableUpdateCompanionBuilder,
      (
        Correction,
        BaseReferences<_$AppDatabase, $CorrectionsTable, Correction>,
      ),
      Correction,
      PrefetchHooks Function()
    >;
typedef $$SettingsTableCreateCompanionBuilder = SettingsCompanion Function({
  required String key,
  required String value,
  Value<int> rowid,
});
typedef $$SettingsTableUpdateCompanionBuilder = SettingsCompanion Function({
  Value<String> key,
  Value<String> value,
  Value<int> rowid,
});

class $$SettingsTableFilterComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$SettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SettingsTable,
          Setting,
          $$SettingsTableFilterComposer,
          $$SettingsTableOrderingComposer,
          $$SettingsTableAnnotationComposer,
          $$SettingsTableCreateCompanionBuilder,
          $$SettingsTableUpdateCompanionBuilder,
          (Setting, BaseReferences<_$AppDatabase, $SettingsTable, Setting>),
          Setting,
          PrefetchHooks Function()
        > {
  $$SettingsTableTableManager(_$AppDatabase db, $SettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> key = const Value.absent(),
            Value<String> value = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) => SettingsCompanion(key: key, value: value, rowid: rowid),
          createCompanionCallback: ({
            required String key,
            required String value,
            Value<int> rowid = const Value.absent(),
          }) => SettingsCompanion.insert(key: key, value: value, rowid: rowid),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SettingsTable, Setting>(table),
                  BaseReferences<_$AppDatabase, $SettingsTable, Setting>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SettingsTable,
      Setting,
      $$SettingsTableFilterComposer,
      $$SettingsTableOrderingComposer,
      $$SettingsTableAnnotationComposer,
      $$SettingsTableCreateCompanionBuilder,
      $$SettingsTableUpdateCompanionBuilder,
      (Setting, BaseReferences<_$AppDatabase, $SettingsTable, Setting>),
      Setting,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProtocolsTableTableManager get protocols =>
      $$ProtocolsTableTableManager(_db, _db.protocols);
  $$ScheduleItemsTableTableManager get scheduleItems =>
      $$ScheduleItemsTableTableManager(_db, _db.scheduleItems);
  $$SpacingRulesTableTableManager get spacingRules =>
      $$SpacingRulesTableTableManager(_db, _db.spacingRules);
  $$MedicationsTableTableManager get medications =>
      $$MedicationsTableTableManager(_db, _db.medications);
  $$LogEntriesTableTableManager get logEntries =>
      $$LogEntriesTableTableManager(_db, _db.logEntries);
  $$TrainingPlansTableTableManager get trainingPlans =>
      $$TrainingPlansTableTableManager(_db, _db.trainingPlans);
  $$ExercisesTableTableManager get exercises =>
      $$ExercisesTableTableManager(_db, _db.exercises);
  $$IntervalCyclesTableTableManager get intervalCycles =>
      $$IntervalCyclesTableTableManager(_db, _db.intervalCycles);
  $$IntervalBlocksTableTableManager get intervalBlocks =>
      $$IntervalBlocksTableTableManager(_db, _db.intervalBlocks);
  $$ErgSessionsTableTableManager get ergSessions =>
      $$ErgSessionsTableTableManager(_db, _db.ergSessions);
  $$MealsTableTableManager get meals =>
      $$MealsTableTableManager(_db, _db.meals);
  $$MealLogsTableTableManager get mealLogs =>
      $$MealLogsTableTableManager(_db, _db.mealLogs);
  $$MeasurementsTableTableManager get measurements =>
      $$MeasurementsTableTableManager(_db, _db.measurements);
  $$CorrectionsTableTableManager get corrections =>
      $$CorrectionsTableTableManager(_db, _db.corrections);
  $$SettingsTableTableManager get settings =>
      $$SettingsTableTableManager(_db, _db.settings);
}
