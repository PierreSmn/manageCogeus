import '/flutter_flow/flutter_flow_util.dart';
import '/pages/navbarnav/navbarnav_widget.dart';
import 'tremor_test_widget.dart' show TremorTestWidget;
import 'package:flutter/material.dart';

class TremorTestModel extends FlutterFlowModel<TremorTestWidget> {
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
