import '/flutter_flow/flutter_flow_util.dart';
import 'edit_notif_email_widget.dart' show EditNotifEmailWidget;
import 'package:flutter/material.dart';

class EditNotifEmailModel extends FlutterFlowModel<EditNotifEmailWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
