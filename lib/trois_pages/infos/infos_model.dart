import '/flutter_flow/flutter_flow_util.dart';
import '/trois_pages/navbarnav/navbarnav_widget.dart';
import 'infos_widget.dart' show InfosWidget;
import 'package:flutter/material.dart';

class InfosModel extends FlutterFlowModel<InfosWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for navbarnav component.
  late NavbarnavModel navbarnavModel;

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
