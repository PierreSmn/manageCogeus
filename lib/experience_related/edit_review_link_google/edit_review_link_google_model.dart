import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'edit_review_link_google_widget.dart' show EditReviewLinkGoogleWidget;
import 'package:flutter/material.dart';

class EditReviewLinkGoogleModel
    extends FlutterFlowModel<EditReviewLinkGoogleWidget> {
  ///  Local state fields for this component.

  bool confirmed = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = const FFPlace();
  // Stores action output result for [Backend Call - API (placeIdRequest)] action in Button widget.
  ApiCallResponse? apiResultxcr;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
