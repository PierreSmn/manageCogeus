// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SpacingStruct extends BaseStruct {
  SpacingStruct({
    String? label,
    double? value,
  })  : _label = label,
        _value = value;

  // "label" field.
  String? _label;
  String get label => _label ?? '';
  set label(String? val) => _label = val;

  bool hasLabel() => _label != null;

  // "value" field.
  double? _value;
  double get value => _value ?? 0.0;
  set value(double? val) => _value = val;

  void incrementValue(double amount) => value = value + amount;

  bool hasValue() => _value != null;

  static SpacingStruct fromMap(Map<String, dynamic> data) => SpacingStruct(
        label: data['label'] as String?,
        value: castToType<double>(data['value']),
      );

  static SpacingStruct? maybeFromMap(dynamic data) =>
      data is Map ? SpacingStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'label': _label,
        'value': _value,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'label': serializeParam(
          _label,
          ParamType.String,
        ),
        'value': serializeParam(
          _value,
          ParamType.double,
        ),
      }.withoutNulls;

  static SpacingStruct fromSerializableMap(Map<String, dynamic> data) =>
      SpacingStruct(
        label: deserializeParam(
          data['label'],
          ParamType.String,
          false,
        ),
        value: deserializeParam(
          data['value'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'SpacingStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SpacingStruct &&
        label == other.label &&
        value == other.value;
  }

  @override
  int get hashCode => const ListEquality().hash([label, value]);
}

SpacingStruct createSpacingStruct({
  String? label,
  double? value,
}) =>
    SpacingStruct(
      label: label,
      value: value,
    );
