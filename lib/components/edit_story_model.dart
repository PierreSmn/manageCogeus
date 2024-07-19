import '/flutter_flow/flutter_flow_util.dart';
import 'edit_story_widget.dart' show EditStoryWidget;
import 'package:flutter/material.dart';

class EditStoryModel extends FlutterFlowModel<EditStoryWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for inteName widget.
  FocusNode? inteNameFocusNode;
  TextEditingController? inteNameTextController;
  String? Function(BuildContext, String?)? inteNameTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    inteNameFocusNode?.dispose();
    inteNameTextController?.dispose();

    textFieldFocusNode1?.dispose();
    textController2?.dispose();

    textFieldFocusNode2?.dispose();
    textController3?.dispose();

    textFieldFocusNode3?.dispose();
    textController4?.dispose();
  }
}
