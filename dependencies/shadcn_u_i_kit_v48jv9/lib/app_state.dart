import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<MenuItemStruct> _sampleComboboxItems = [
    MenuItemStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Flutter\",\"shortcut\":\"\",\"isDisabled\":\"false\",\"isDestructive\":\"false\",\"isDivider\":\"false\",\"isSectionHeader\":\"false\",\"subMenuItems\":\"[]\"}')),
    MenuItemStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Swift UI\",\"shortcut\":\"\",\"isDisabled\":\"false\",\"isDestructive\":\"false\",\"isDivider\":\"false\",\"isSectionHeader\":\"false\",\"subMenuItems\":\"[]\"}')),
    MenuItemStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"React\",\"shortcut\":\"\",\"isDisabled\":\"false\",\"isDestructive\":\"false\",\"isDivider\":\"false\",\"isSectionHeader\":\"false\",\"subMenuItems\":\"[]\"}')),
    MenuItemStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Angular\",\"shortcut\":\"\",\"isDisabled\":\"false\",\"isDestructive\":\"false\",\"isDivider\":\"false\",\"isSectionHeader\":\"false\",\"subMenuItems\":\"[]\"}')),
    MenuItemStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Vanilla JS\",\"shortcut\":\"\",\"isDisabled\":\"false\",\"isDestructive\":\"false\",\"isDivider\":\"false\",\"isSectionHeader\":\"false\",\"subMenuItems\":\"[]\"}'))
  ];
  List<MenuItemStruct> get sampleComboboxItems => _sampleComboboxItems;
  set sampleComboboxItems(List<MenuItemStruct> value) {
    _sampleComboboxItems = value;
  }

  void addToSampleComboboxItems(MenuItemStruct value) {
    sampleComboboxItems.add(value);
  }

  void removeFromSampleComboboxItems(MenuItemStruct value) {
    sampleComboboxItems.remove(value);
  }

  void removeAtIndexFromSampleComboboxItems(int index) {
    sampleComboboxItems.removeAt(index);
  }

  void updateSampleComboboxItemsAtIndex(
    int index,
    MenuItemStruct Function(MenuItemStruct) updateFn,
  ) {
    sampleComboboxItems[index] = updateFn(_sampleComboboxItems[index]);
  }

  void insertAtIndexInSampleComboboxItems(int index, MenuItemStruct value) {
    sampleComboboxItems.insert(index, value);
  }

  List<MenuItemStruct> _sampleDropdownMenuItems = [
    MenuItemStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Back\",\"shortcut\":\"⌘ [\",\"isDisabled\":\"false\",\"isDestructive\":\"false\",\"isDivider\":\"false\",\"isSectionHeader\":\"false\",\"subMenuItems\":\"[]\"}')),
    MenuItemStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Forward\",\"shortcut\":\"⌘ ]\",\"isDisabled\":\"true\",\"isDestructive\":\"false\",\"isDivider\":\"false\",\"isSectionHeader\":\"false\",\"subMenuItems\":\"[]\"}')),
    MenuItemStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Reload\",\"shortcut\":\"⌘ R\",\"isDisabled\":\"false\",\"isDestructive\":\"false\",\"isDivider\":\"false\",\"isSectionHeader\":\"false\",\"subMenuItems\":\"[]\"}')),
    MenuItemStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"More Tools\",\"shortcut\":\"\",\"isDisabled\":\"false\",\"isDestructive\":\"false\",\"isDivider\":\"false\",\"isSectionHeader\":\"false\",\"subMenuItems\":\"[\\\"{\\\\\\\"name\\\\\\\":\\\\\\\"Tool 1\\\\\\\",\\\\\\\"shortcut\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"isDisabled\\\\\\\":\\\\\\\"false\\\\\\\",\\\\\\\"isDestructive\\\\\\\":\\\\\\\"false\\\\\\\",\\\\\\\"isDivider\\\\\\\":\\\\\\\"false\\\\\\\",\\\\\\\"isSectionHeader\\\\\\\":\\\\\\\"false\\\\\\\",\\\\\\\"subMenuItems\\\\\\\":\\\\\\\"[]\\\\\\\"}\\\",\\\"{\\\\\\\"name\\\\\\\":\\\\\\\"Tool 2\\\\\\\",\\\\\\\"shortcut\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"isDisabled\\\\\\\":\\\\\\\"false\\\\\\\",\\\\\\\"isDestructive\\\\\\\":\\\\\\\"false\\\\\\\",\\\\\\\"isDivider\\\\\\\":\\\\\\\"false\\\\\\\",\\\\\\\"isSectionHeader\\\\\\\":\\\\\\\"false\\\\\\\",\\\\\\\"subMenuItems\\\\\\\":\\\\\\\"[]\\\\\\\"}\\\",\\\"{\\\\\\\"name\\\\\\\":\\\\\\\"Tool 3\\\\\\\",\\\\\\\"shortcut\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"isDisabled\\\\\\\":\\\\\\\"false\\\\\\\",\\\\\\\"isDestructive\\\\\\\":\\\\\\\"false\\\\\\\",\\\\\\\"isDivider\\\\\\\":\\\\\\\"false\\\\\\\",\\\\\\\"isSectionHeader\\\\\\\":\\\\\\\"false\\\\\\\",\\\\\\\"subMenuItems\\\\\\\":\\\\\\\"[]\\\\\\\"}\\\"]\"}')),
    MenuItemStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"\",\"shortcut\":\"\",\"isDisabled\":\"false\",\"isDestructive\":\"false\",\"isDivider\":\"true\",\"isSectionHeader\":\"false\",\"subMenuItems\":\"[]\"}')),
    MenuItemStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Show Bookmarks Bar\",\"shortcut\":\"⌘⇧B\",\"isDisabled\":\"false\",\"isDestructive\":\"false\",\"isDivider\":\"false\",\"isSectionHeader\":\"false\",\"subMenuItems\":\"[]\"}')),
    MenuItemStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Show Full URLs\",\"shortcut\":\"⇧U\",\"isDisabled\":\"false\",\"isDestructive\":\"false\",\"isDivider\":\"false\",\"isSectionHeader\":\"false\",\"subMenuItems\":\"[]\"}'))
  ];
  List<MenuItemStruct> get sampleDropdownMenuItems => _sampleDropdownMenuItems;
  set sampleDropdownMenuItems(List<MenuItemStruct> value) {
    _sampleDropdownMenuItems = value;
  }

  void addToSampleDropdownMenuItems(MenuItemStruct value) {
    sampleDropdownMenuItems.add(value);
  }

  void removeFromSampleDropdownMenuItems(MenuItemStruct value) {
    sampleDropdownMenuItems.remove(value);
  }

  void removeAtIndexFromSampleDropdownMenuItems(int index) {
    sampleDropdownMenuItems.removeAt(index);
  }

  void updateSampleDropdownMenuItemsAtIndex(
    int index,
    MenuItemStruct Function(MenuItemStruct) updateFn,
  ) {
    sampleDropdownMenuItems[index] = updateFn(_sampleDropdownMenuItems[index]);
  }

  void insertAtIndexInSampleDropdownMenuItems(int index, MenuItemStruct value) {
    sampleDropdownMenuItems.insert(index, value);
  }

  List<MenuItemStruct> _tags = [
    MenuItemStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Red\",\"shortcut\":\"r\",\"isDisabled\":\"false\",\"isDestructive\":\"false\",\"isDivider\":\"false\",\"isSectionHeader\":\"false\",\"subMenuItems\":\"[]\"}')),
    MenuItemStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Green\",\"shortcut\":\"g\",\"isDisabled\":\"false\",\"isDestructive\":\"false\",\"isDivider\":\"false\",\"isSectionHeader\":\"false\",\"subMenuItems\":\"[]\"}')),
    MenuItemStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Blue\",\"shortcut\":\"b\",\"isDisabled\":\"false\",\"isDestructive\":\"false\",\"isDivider\":\"false\",\"isSectionHeader\":\"false\",\"subMenuItems\":\"[]\"}'))
  ];
  List<MenuItemStruct> get tags => _tags;
  set tags(List<MenuItemStruct> value) {
    _tags = value;
  }

  void addToTags(MenuItemStruct value) {
    tags.add(value);
  }

  void removeFromTags(MenuItemStruct value) {
    tags.remove(value);
  }

  void removeAtIndexFromTags(int index) {
    tags.removeAt(index);
  }

  void updateTagsAtIndex(
    int index,
    MenuItemStruct Function(MenuItemStruct) updateFn,
  ) {
    tags[index] = updateFn(_tags[index]);
  }

  void insertAtIndexInTags(int index, MenuItemStruct value) {
    tags.insert(index, value);
  }
}
