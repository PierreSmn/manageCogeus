import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/library_components/dropdown_menu_item/dropdown_menu_item_widget.dart';
import '/library_components/empty_list/empty_list_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'command_palatte_widget.dart' show CommandPalatteWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CommandPalatteModel extends FlutterFlowModel<CommandPalatteWidget> {
  ///  Local state fields for this component.

  int indexFocus = 0;

  String? searchInput;

  ///  State fields for stateful widgets in this component.

  final commandPalatteShortcutsFocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Models for Dropdown_Menu_Item dynamic component.
  late FlutterFlowDynamicModels<DropdownMenuItemModel> dropdownMenuItemModels;

  @override
  void initState(BuildContext context) {
    dropdownMenuItemModels =
        FlutterFlowDynamicModels(() => DropdownMenuItemModel());
  }

  @override
  void dispose() {
    commandPalatteShortcutsFocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    dropdownMenuItemModels.dispose();
  }
}
