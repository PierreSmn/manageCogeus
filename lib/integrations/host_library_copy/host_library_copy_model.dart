import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/navbarnav/navbarnav_widget.dart';
import 'host_library_copy_widget.dart' show HostLibraryCopyWidget;
import 'package:flutter/material.dart';

class HostLibraryCopyModel extends FlutterFlowModel<HostLibraryCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for navbarnav component.
  late NavbarnavModel navbarnavModel;
  // Stores action output result for [Backend Call - API (mux get views)] action in Button widget.
  ApiCallResponse? apiResultb7l;

  @override
  void initState(BuildContext context) {
    navbarnavModel = createModel(context, () => NavbarnavModel());
  }

  @override
  void dispose() {
    navbarnavModel.dispose();
  }
}
