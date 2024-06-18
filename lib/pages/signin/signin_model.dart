import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'signin_widget.dart' show SigninWidget;
import 'package:flutter/material.dart';

class SigninModel extends FlutterFlowModel<SigninWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for email widget.
  final emailKey = GlobalKey();
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? emailSelectedOption;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }
    if (val != emailSelectedOption) {
      return 'Please choose an option from the dropdown';
    }

    return null;
  }

  // State field(s) for password widget.
  final passwordKey = GlobalKey();
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  String? passwordSelectedOption;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }
    if (val != passwordSelectedOption) {
      return 'Please choose an option from the dropdown';
    }

    return null;
  }

  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;
  Completer<List<UsersRow>>? requestCompleter;

  @override
  void initState(BuildContext context) {
    emailTextControllerValidator = _emailTextControllerValidator;
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    emailFocusNode?.dispose();

    passwordFocusNode?.dispose();
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
