// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PasscodeSegmentStruct extends BaseStruct {
  PasscodeSegmentStruct({
    List<int>? digits,
  }) : _digits = digits;

  // "digits" field.
  List<int>? _digits;
  List<int> get digits => _digits ?? const [];
  set digits(List<int>? val) => _digits = val;

  void updateDigits(Function(List<int>) updateFn) {
    updateFn(_digits ??= []);
  }

  bool hasDigits() => _digits != null;

  static PasscodeSegmentStruct fromMap(Map<String, dynamic> data) =>
      PasscodeSegmentStruct(
        digits: getDataList(data['digits']),
      );

  static PasscodeSegmentStruct? maybeFromMap(dynamic data) => data is Map
      ? PasscodeSegmentStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'digits': _digits,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'digits': serializeParam(
          _digits,
          ParamType.int,
          isList: true,
        ),
      }.withoutNulls;

  static PasscodeSegmentStruct fromSerializableMap(Map<String, dynamic> data) =>
      PasscodeSegmentStruct(
        digits: deserializeParam<int>(
          data['digits'],
          ParamType.int,
          true,
        ),
      );

  @override
  String toString() => 'PasscodeSegmentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PasscodeSegmentStruct &&
        listEquality.equals(digits, other.digits);
  }

  @override
  int get hashCode => const ListEquality().hash([digits]);
}

PasscodeSegmentStruct createPasscodeSegmentStruct() => PasscodeSegmentStruct();
