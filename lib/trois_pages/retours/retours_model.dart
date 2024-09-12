import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/navbarnav/navbarnav_widget.dart';
import 'dart:async';
import 'retours_widget.dart' show RetoursWidget;
import 'package:flutter/material.dart';

class RetoursModel extends FlutterFlowModel<RetoursWidget> {
  ///  Local state fields for this page.

  int? pageselect = 0;

  int? tagId;

  ///  State fields for stateful widgets in this page.

  // Model for navbarnav component.
  late NavbarnavModel navbarnavModel;
  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  // State field(s) for Row widget.
  ScrollController? rowController1;
  Completer<ApiCallResponse>? apiRequestCompleter2;
  // State field(s) for Row widget.
  ScrollController? rowController2;
  Completer<ApiCallResponse>? apiRequestCompleter1;
  // State field(s) for loadTags widget.
  ScrollController? loadTags;
  // State field(s) for loadall widget.
  ScrollController? loadall;

  @override
  void initState(BuildContext context) {
    navbarnavModel = createModel(context, () => NavbarnavModel());
    columnController1 = ScrollController();
    columnController2 = ScrollController();
    rowController1 = ScrollController();
    rowController2 = ScrollController();
    loadTags = ScrollController();
    loadall = ScrollController();
  }

  @override
  void dispose() {
    navbarnavModel.dispose();
    columnController1?.dispose();
    columnController2?.dispose();
    rowController1?.dispose();
    rowController2?.dispose();
    loadTags?.dispose();
    loadall?.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
