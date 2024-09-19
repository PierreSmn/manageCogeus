import '/flutter_flow/flutter_flow_util.dart';
import '/pages/navbarnav/navbarnav_widget.dart';
import 'dossiers_widget.dart' show DossiersWidget;
import 'package:flutter/material.dart';

class DossiersModel extends FlutterFlowModel<DossiersWidget> {
  ///  Local state fields for this page.

  String? listSelect;

  ///  State fields for stateful widgets in this page.

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
    navbarnavModel.dispose();
  }
}
