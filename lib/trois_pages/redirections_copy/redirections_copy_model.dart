import '/flutter_flow/flutter_flow_util.dart';
import '/pages/navbarnav/navbarnav_widget.dart';
import '/index.dart';
import 'redirections_copy_widget.dart' show RedirectionsCopyWidget;
import 'package:flutter/material.dart';

class RedirectionsCopyModel extends FlutterFlowModel<RedirectionsCopyWidget> {
  ///  Local state fields for this page.

  String? npsLink;

  bool customColor = false;

  ///  State fields for stateful widgets in this page.

  // Model for navbarnav component.
  late NavbarnavModel navbarnavModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    navbarnavModel = createModel(context, () => NavbarnavModel());
  }

  @override
  void dispose() {
    navbarnavModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
