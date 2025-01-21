import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/library_components/dropdown_menu/dropdown_menu_widget.dart';
import '/library_components/menu_section_title/menu_section_title_widget.dart';
import 'dart:ui';
import 'dropdown_menu_item_widget.dart' show DropdownMenuItemWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DropdownMenuItemModel extends FlutterFlowModel<DropdownMenuItemWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;
  // Model for Menu_Section_Title component.
  late MenuSectionTitleModel menuSectionTitleModel;

  @override
  void initState(BuildContext context) {
    menuSectionTitleModel = createModel(context, () => MenuSectionTitleModel());
  }

  @override
  void dispose() {
    menuSectionTitleModel.dispose();
  }
}
