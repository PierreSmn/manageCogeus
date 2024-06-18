import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/trois_pages/navbarnav/navbarnav_widget.dart';
import 'dart:async';
import 'invalids_widget.dart' show InvalidsWidget;
import 'package:flutter/material.dart';

class InvalidsModel extends FlutterFlowModel<InvalidsWidget> {
  ///  Local state fields for this page.

  int? pageselect = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for navbarnav component.
  late NavbarnavModel navbarnavModel;
  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  // State field(s) for scroll1 widget.
  ScrollController? scroll1;
  Completer<ApiCallResponse>? apiRequestCompleter;

  @override
  void initState(BuildContext context) {
    navbarnavModel = createModel(context, () => NavbarnavModel());
    columnController1 = ScrollController();
    columnController2 = ScrollController();
    scroll1 = ScrollController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    navbarnavModel.dispose();
    columnController1?.dispose();
    columnController2?.dispose();
    scroll1?.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
