import '/flutter_flow/flutter_flow_util.dart';
import 'edit_question_widget.dart' show EditQuestionWidget;
import 'package:flutter/material.dart';

class EditQuestionModel extends FlutterFlowModel<EditQuestionWidget> {
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
