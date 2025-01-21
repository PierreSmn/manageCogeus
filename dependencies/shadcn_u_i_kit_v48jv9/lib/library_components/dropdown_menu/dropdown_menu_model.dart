import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/library_components/dropdown_menu_item/dropdown_menu_item_widget.dart';
import 'dart:ui';
import 'dropdown_menu_widget.dart' show DropdownMenuWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DropdownMenuModel extends FlutterFlowModel<DropdownMenuWidget> {
  ///  Local state fields for this component.

  int indexFocus = 0;

  ///  State fields for stateful widgets in this component.

  final dropdownMenuShortcutsFocusNode = FocusNode();
  // Models for Dropdown_Menu_Item dynamic component.
  late FlutterFlowDynamicModels<DropdownMenuItemModel> dropdownMenuItemModels;

  @override
  void initState(BuildContext context) {
    dropdownMenuItemModels =
        FlutterFlowDynamicModels(() => DropdownMenuItemModel());
  }

  @override
  void dispose() {
    dropdownMenuShortcutsFocusNode.dispose();
    dropdownMenuItemModels.dispose();
  }
}
