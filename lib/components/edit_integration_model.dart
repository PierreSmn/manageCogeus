import '/flutter_flow/flutter_flow_util.dart';
import 'edit_integration_widget.dart' show EditIntegrationWidget;
import 'package:flutter/material.dart';

class EditIntegrationModel extends FlutterFlowModel<EditIntegrationWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for inteName widget.
  FocusNode? inteNameFocusNode;
  TextEditingController? inteNameTextController;
  String? Function(BuildContext, String?)? inteNameTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    inteNameFocusNode?.dispose();
    inteNameTextController?.dispose();
  }
}
