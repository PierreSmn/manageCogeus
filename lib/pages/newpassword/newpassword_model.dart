import '/flutter_flow/flutter_flow_util.dart';
import 'newpassword_widget.dart' show NewpasswordWidget;
import 'package:flutter/material.dart';

class NewpasswordModel extends FlutterFlowModel<NewpasswordWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
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

  // Stores action output result for [Custom Action - changePasswordError] action in Button widget.
  bool? success;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    passwordFocusNode?.dispose();
  }
}
