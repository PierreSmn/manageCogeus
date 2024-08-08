import '/flutter_flow/flutter_flow_util.dart';
import 'change_color_widget.dart' show ChangeColorWidget;
import 'package:flutter/material.dart';

class ChangeColorModel extends FlutterFlowModel<ChangeColorWidget> {
  ///  Local state fields for this component.

  String state = 'no';

  ///  State fields for stateful widgets in this component.

  // State field(s) for colorTitle widget.
  FocusNode? colorTitleFocusNode;
  TextEditingController? colorTitleTextController;
  String? Function(BuildContext, String?)? colorTitleTextControllerValidator;
  // State field(s) for colorText widget.
  FocusNode? colorTextFocusNode;
  TextEditingController? colorTextTextController;
  String? Function(BuildContext, String?)? colorTextTextControllerValidator;
  // State field(s) for colorButton widget.
  FocusNode? colorButtonFocusNode;
  TextEditingController? colorButtonTextController;
  String? Function(BuildContext, String?)? colorButtonTextControllerValidator;
  // State field(s) for colorButtonText widget.
  FocusNode? colorButtonTextFocusNode;
  TextEditingController? colorButtonTextTextController;
  String? Function(BuildContext, String?)?
      colorButtonTextTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    colorTitleFocusNode?.dispose();
    colorTitleTextController?.dispose();

    colorTextFocusNode?.dispose();
    colorTextTextController?.dispose();

    colorButtonFocusNode?.dispose();
    colorButtonTextController?.dispose();

    colorButtonTextFocusNode?.dispose();
    colorButtonTextTextController?.dispose();
  }
}
