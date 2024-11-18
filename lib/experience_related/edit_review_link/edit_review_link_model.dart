import '/flutter_flow/flutter_flow_util.dart';
import 'edit_review_link_widget.dart' show EditReviewLinkWidget;
import 'package:flutter/material.dart';

class EditReviewLinkModel extends FlutterFlowModel<EditReviewLinkWidget> {
  ///  Local state fields for this component.

  bool confirmed = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Le nom du site doit être entré';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'L\'Url de vos avis est obligatoire';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? allsettest;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? allset;

  @override
  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
    textController2Validator = _textController2Validator;
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
