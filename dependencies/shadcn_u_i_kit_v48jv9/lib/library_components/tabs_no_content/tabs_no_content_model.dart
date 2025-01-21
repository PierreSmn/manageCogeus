import '/flutter_flow/flutter_flow_util.dart';
import '/library_components/tab_menu_item/tab_menu_item_widget.dart';
import 'dart:ui';
import 'tabs_no_content_widget.dart' show TabsNoContentWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TabsNoContentModel extends FlutterFlowModel<TabsNoContentWidget> {
  ///  Local state fields for this component.

  int selection = 0;

  ///  State fields for stateful widgets in this component.

  // Models for Tab_Menu_Item dynamic component.
  late FlutterFlowDynamicModels<TabMenuItemModel> tabMenuItemModels;

  @override
  void initState(BuildContext context) {
    tabMenuItemModels = FlutterFlowDynamicModels(() => TabMenuItemModel());
  }

  @override
  void dispose() {
    tabMenuItemModels.dispose();
  }
}
