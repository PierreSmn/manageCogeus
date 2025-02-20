import '/flutter_flow/flutter_flow_util.dart';
import '/pages/navbarnav/navbarnav_widget.dart';
import '/index.dart';
import 'home_copy2_widget.dart' show HomeCopy2Widget;
import 'package:flutter/material.dart';

class HomeCopy2Model extends FlutterFlowModel<HomeCopy2Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for navbarnav component.
  late NavbarnavModel navbarnavModel;

  @override
  void initState(BuildContext context) {
    navbarnavModel = createModel(context, () => NavbarnavModel());
  }

  @override
  void dispose() {
    navbarnavModel.dispose();
  }
}
