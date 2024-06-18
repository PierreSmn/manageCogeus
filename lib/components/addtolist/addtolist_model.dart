import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'addtolist_widget.dart' show AddtolistWidget;
import 'package:flutter/material.dart';

class AddtolistModel extends FlutterFlowModel<AddtolistWidget> {
  ///  Local state fields for this component.

  String? selected;

  int? idSelected;

  ///  State fields for stateful widgets in this component.

  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;
  // Stores action output result for [Backend Call - API (get list)] action in Button widget.
  ApiCallResponse? listGet;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
