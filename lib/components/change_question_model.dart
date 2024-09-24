import '/flutter_flow/flutter_flow_util.dart';
import 'change_question_widget.dart' show ChangeQuestionWidget;
import 'package:flutter/material.dart';

class ChangeQuestionModel extends FlutterFlowModel<ChangeQuestionWidget> {
  ///  Local state fields for this component.

  String state = 'no';

  ///  State fields for stateful widgets in this component.

  // State field(s) for colorTitle widget.
  FocusNode? colorTitleFocusNode;
  TextEditingController? colorTitleTextController;
  String? Function(BuildContext, String?)? colorTitleTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    colorTitleFocusNode?.dispose();
    colorTitleTextController?.dispose();
  }
}
