import '/flutter_flow/flutter_flow_util.dart';
import '/trois_pages/navbarnav/navbarnav_widget.dart';
import 'widgets_edit_widget.dart' show WidgetsEditWidget;
import 'package:flutter/material.dart';

class WidgetsEditModel extends FlutterFlowModel<WidgetsEditWidget> {
  ///  Local state fields for this page.

  String? listSelect;

  int? countTry = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for navbarnav component.
  late NavbarnavModel navbarnavModel;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;

  @override
  void initState(BuildContext context) {
    navbarnavModel = createModel(context, () => NavbarnavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    navbarnavModel.dispose();
  }
}
