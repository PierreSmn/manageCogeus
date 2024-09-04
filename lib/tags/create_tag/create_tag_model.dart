import '/flutter_flow/flutter_flow_util.dart';
import 'create_tag_widget.dart' show CreateTagWidget;
import 'package:flutter/material.dart';

class CreateTagModel extends FlutterFlowModel<CreateTagWidget> {
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
