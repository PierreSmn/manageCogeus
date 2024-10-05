import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/navbarnav/navbarnav_widget.dart';
import 'copyharvestdata_widget.dart' show CopyharvestdataWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class CopyharvestdataModel extends FlutterFlowModel<CopyharvestdataWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for navbarnav component.
  late NavbarnavModel navbarnavModel;
  Completer<List<LiveFlowsRow>>? requestCompleter;

  @override
  void initState(BuildContext context) {
    navbarnavModel = createModel(context, () => NavbarnavModel());
  }

  @override
  void dispose() {
    navbarnavModel.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
