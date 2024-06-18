// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DateStruct extends BaseStruct {
  DateStruct({
    DateTime? date,
  }) : _date = date;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  static DateStruct fromMap(Map<String, dynamic> data) => DateStruct(
        date: data['date'] as DateTime?,
      );

  static DateStruct? maybeFromMap(dynamic data) =>
      data is Map ? DateStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'date': _date,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static DateStruct fromSerializableMap(Map<String, dynamic> data) =>
      DateStruct(
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'DateStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DateStruct && date == other.date;
  }

  @override
  int get hashCode => const ListEquality().hash([date]);
}

DateStruct createDateStruct({
  DateTime? date,
}) =>
    DateStruct(
      date: date,
    );
