import '/flutter_flow/flutter_flow_util.dart';
import '/library_components/calendar_date_item/calendar_date_item_widget.dart';
import '/library_components/icon_button/icon_button_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'calendar_widget.dart' show CalendarWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CalendarModel extends FlutterFlowModel<CalendarWidget> {
  ///  Local state fields for this component.

  DateTime? month;

  ///  State fields for stateful widgets in this component.

  // Model for Icon_Button component.
  late IconButtonModel iconButtonModel1;
  // Model for Icon_Button component.
  late IconButtonModel iconButtonModel2;
  // Models for Calendar_Date_Item dynamic component.
  late FlutterFlowDynamicModels<CalendarDateItemModel> calendarDateItemModels;

  @override
  void initState(BuildContext context) {
    iconButtonModel1 = createModel(context, () => IconButtonModel());
    iconButtonModel2 = createModel(context, () => IconButtonModel());
    calendarDateItemModels =
        FlutterFlowDynamicModels(() => CalendarDateItemModel());
  }

  @override
  void dispose() {
    iconButtonModel1.dispose();
    iconButtonModel2.dispose();
    calendarDateItemModels.dispose();
  }
}
