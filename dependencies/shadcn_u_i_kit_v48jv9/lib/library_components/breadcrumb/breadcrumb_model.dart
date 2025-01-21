import '/flutter_flow/flutter_flow_util.dart';
import '/library_components/breadcrumb_item/breadcrumb_item_widget.dart';
import 'dart:ui';
import 'breadcrumb_widget.dart' show BreadcrumbWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BreadcrumbModel extends FlutterFlowModel<BreadcrumbWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for Breadcrumb_Item dynamic component.
  late FlutterFlowDynamicModels<BreadcrumbItemModel> breadcrumbItemModels;

  @override
  void initState(BuildContext context) {
    breadcrumbItemModels =
        FlutterFlowDynamicModels(() => BreadcrumbItemModel());
  }

  @override
  void dispose() {
    breadcrumbItemModels.dispose();
  }
}
