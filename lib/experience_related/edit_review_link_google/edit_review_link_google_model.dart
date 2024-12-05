import '/flutter_flow/flutter_flow_util.dart';
import 'edit_review_link_google_widget.dart' show EditReviewLinkGoogleWidget;
import 'package:flutter/material.dart';

class EditReviewLinkGoogleModel
    extends FlutterFlowModel<EditReviewLinkGoogleWidget> {
  ///  Local state fields for this component.

  bool confirmed = false;

  bool placeIded = false;

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
