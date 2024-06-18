import '/flutter_flow/flutter_flow_util.dart';
import '/trois_pages/navbarnav/navbarnav_widget.dart';
import 'exports_widget.dart' show ExportsWidget;
import 'package:flutter/material.dart';

class ExportsModel extends FlutterFlowModel<ExportsWidget> {
  ///  Local state fields for this page.

  String? listSelect;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for navbarnav component.
  late NavbarnavModel navbarnavModel;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered1 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered2 = false;

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
