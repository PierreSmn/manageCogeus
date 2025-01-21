import '/flutter_flow/flutter_flow_util.dart';
import '/library_components/radio_group_item/radio_group_item_widget.dart';
import 'dart:ui';
import 'radio_group_widget.dart' show RadioGroupWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RadioGroupModel extends FlutterFlowModel<RadioGroupWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for Radio_Group_Item dynamic component.
  late FlutterFlowDynamicModels<RadioGroupItemModel> radioGroupItemModels;

  @override
  void initState(BuildContext context) {
    radioGroupItemModels =
        FlutterFlowDynamicModels(() => RadioGroupItemModel());
  }

  @override
  void dispose() {
    radioGroupItemModels.dispose();
  }
}
