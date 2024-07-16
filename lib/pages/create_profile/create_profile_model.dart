import '/flutter_flow/flutter_flow_util.dart';
import 'create_profile_widget.dart' show CreateProfileWidget;
import 'package:flutter/material.dart';

class CreateProfileModel extends FlutterFlowModel<CreateProfileWidget> {
  ///  Local state fields for this page.

  bool isBrandSet = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for lastName widget.
  FocusNode? lastNameFocusNode1;
  TextEditingController? lastNameTextController1;
  String? Function(BuildContext, String?)? lastNameTextController1Validator;
  // State field(s) for lastName widget.
  FocusNode? lastNameFocusNode2;
  TextEditingController? lastNameTextController2;
  String? Function(BuildContext, String?)? lastNameTextController2Validator;
  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  String? Function(BuildContext, String?)? phoneTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    lastNameFocusNode1?.dispose();
    lastNameTextController1?.dispose();

    lastNameFocusNode2?.dispose();
    lastNameTextController2?.dispose();

    phoneFocusNode?.dispose();
    phoneTextController?.dispose();
  }
}
