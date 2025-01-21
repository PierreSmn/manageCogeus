// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MenuItemStruct extends BaseStruct {
  MenuItemStruct({
    String? name,
    String? shortcut,
    bool? isDisabled,
    bool? isDestructive,
    bool? isDivider,
    bool? isSectionHeader,
    List<MenuItemStruct>? subMenuItems,
  })  : _name = name,
        _shortcut = shortcut,
        _isDisabled = isDisabled,
        _isDestructive = isDestructive,
        _isDivider = isDivider,
        _isSectionHeader = isSectionHeader,
        _subMenuItems = subMenuItems;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "shortcut" field.
  String? _shortcut;
  String get shortcut => _shortcut ?? '';
  set shortcut(String? val) => _shortcut = val;

  bool hasShortcut() => _shortcut != null;

  // "isDisabled" field.
  bool? _isDisabled;
  bool get isDisabled => _isDisabled ?? false;
  set isDisabled(bool? val) => _isDisabled = val;

  bool hasIsDisabled() => _isDisabled != null;

  // "isDestructive" field.
  bool? _isDestructive;
  bool get isDestructive => _isDestructive ?? false;
  set isDestructive(bool? val) => _isDestructive = val;

  bool hasIsDestructive() => _isDestructive != null;

  // "isDivider" field.
  bool? _isDivider;
  bool get isDivider => _isDivider ?? false;
  set isDivider(bool? val) => _isDivider = val;

  bool hasIsDivider() => _isDivider != null;

  // "isSectionHeader" field.
  bool? _isSectionHeader;
  bool get isSectionHeader => _isSectionHeader ?? false;
  set isSectionHeader(bool? val) => _isSectionHeader = val;

  bool hasIsSectionHeader() => _isSectionHeader != null;

  // "subMenuItems" field.
  List<MenuItemStruct>? _subMenuItems;
  List<MenuItemStruct> get subMenuItems => _subMenuItems ?? const [];
  set subMenuItems(List<MenuItemStruct>? val) => _subMenuItems = val;

  void updateSubMenuItems(Function(List<MenuItemStruct>) updateFn) {
    updateFn(_subMenuItems ??= []);
  }

  bool hasSubMenuItems() => _subMenuItems != null;

  static MenuItemStruct fromMap(Map<String, dynamic> data) => MenuItemStruct(
        name: data['name'] as String?,
        shortcut: data['shortcut'] as String?,
        isDisabled: data['isDisabled'] as bool?,
        isDestructive: data['isDestructive'] as bool?,
        isDivider: data['isDivider'] as bool?,
        isSectionHeader: data['isSectionHeader'] as bool?,
        subMenuItems: getStructList(
          data['subMenuItems'],
          MenuItemStruct.fromMap,
        ),
      );

  static MenuItemStruct? maybeFromMap(dynamic data) =>
      data is Map ? MenuItemStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'shortcut': _shortcut,
        'isDisabled': _isDisabled,
        'isDestructive': _isDestructive,
        'isDivider': _isDivider,
        'isSectionHeader': _isSectionHeader,
        'subMenuItems': _subMenuItems?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'shortcut': serializeParam(
          _shortcut,
          ParamType.String,
        ),
        'isDisabled': serializeParam(
          _isDisabled,
          ParamType.bool,
        ),
        'isDestructive': serializeParam(
          _isDestructive,
          ParamType.bool,
        ),
        'isDivider': serializeParam(
          _isDivider,
          ParamType.bool,
        ),
        'isSectionHeader': serializeParam(
          _isSectionHeader,
          ParamType.bool,
        ),
        'subMenuItems': serializeParam(
          _subMenuItems,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static MenuItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      MenuItemStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        shortcut: deserializeParam(
          data['shortcut'],
          ParamType.String,
          false,
        ),
        isDisabled: deserializeParam(
          data['isDisabled'],
          ParamType.bool,
          false,
        ),
        isDestructive: deserializeParam(
          data['isDestructive'],
          ParamType.bool,
          false,
        ),
        isDivider: deserializeParam(
          data['isDivider'],
          ParamType.bool,
          false,
        ),
        isSectionHeader: deserializeParam(
          data['isSectionHeader'],
          ParamType.bool,
          false,
        ),
        subMenuItems: deserializeStructParam<MenuItemStruct>(
          data['subMenuItems'],
          ParamType.DataStruct,
          true,
          structBuilder: MenuItemStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'MenuItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MenuItemStruct &&
        name == other.name &&
        shortcut == other.shortcut &&
        isDisabled == other.isDisabled &&
        isDestructive == other.isDestructive &&
        isDivider == other.isDivider &&
        isSectionHeader == other.isSectionHeader &&
        listEquality.equals(subMenuItems, other.subMenuItems);
  }

  @override
  int get hashCode => const ListEquality().hash([
        name,
        shortcut,
        isDisabled,
        isDestructive,
        isDivider,
        isSectionHeader,
        subMenuItems
      ]);
}

MenuItemStruct createMenuItemStruct({
  String? name,
  String? shortcut,
  bool? isDisabled,
  bool? isDestructive,
  bool? isDivider,
  bool? isSectionHeader,
}) =>
    MenuItemStruct(
      name: name,
      shortcut: shortcut,
      isDisabled: isDisabled,
      isDestructive: isDestructive,
      isDivider: isDivider,
      isSectionHeader: isSectionHeader,
    );
