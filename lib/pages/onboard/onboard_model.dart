import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'onboard_widget.dart' show OnboardWidget;
import 'package:flutter/material.dart';

class OnboardModel extends FlutterFlowModel<OnboardWidget> {
  ///  Local state fields for this page.

  bool isBrandSet = false;

  int? step = 1;

  bool chooseEmailSending = false;

  bool stripeChecked = false;

  bool stripeOnce = false;

  bool visualise = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered1 = false;
  Completer<List<ClientsRow>>? requestCompleter2;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered2 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered3 = false;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for lienLogo widget.
  FocusNode? lienLogoFocusNode;
  TextEditingController? lienLogoTextController;
  String? Function(BuildContext, String?)? lienLogoTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered4 = false;
  Completer<List<ClientsRow>>? requestCompleter1;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered5 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered6 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered7 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered8 = false;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ClientsRow>? stripeActiveCheck;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ClientsRow>? clientRow;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ClientsRow>? stripeActiveCheckOnce;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ClientsRow>? clientRowRE;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered9 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered10 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered11 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered12 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered13 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered14 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered15 = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    lienLogoFocusNode?.dispose();
    lienLogoTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
