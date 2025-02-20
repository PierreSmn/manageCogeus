import '/backend/supabase/supabase.dart';
import '/experience_related/read_engagement/read_engagement_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/navbarnav/navbarnav_widget.dart';
import '/index.dart';
import 'dart:async';
import 'redirections_widget.dart' show RedirectionsWidget;
import 'package:flutter/material.dart';

class RedirectionsModel extends FlutterFlowModel<RedirectionsWidget> {
  ///  Local state fields for this page.

  String? npsLink;

  bool customColor = false;

  ///  State fields for stateful widgets in this page.

  // Model for navbarnav component.
  late NavbarnavModel navbarnavModel;
  // Model for readEngagement component.
  late ReadEngagementModel readEngagementModel;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsersRow>? userRow;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;
  Completer<List<ClientsRow>>? requestCompleter;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    navbarnavModel = createModel(context, () => NavbarnavModel());
    readEngagementModel = createModel(context, () => ReadEngagementModel());
  }

  @override
  void dispose() {
    navbarnavModel.dispose();
    readEngagementModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
