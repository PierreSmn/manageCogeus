import '/components/experiencee_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/navbarnav/navbarnav_widget.dart';
import '/index.dart';
import 'experiences_widget.dart' show ExperiencesWidget;
import 'package:flutter/material.dart';

class ExperiencesModel extends FlutterFlowModel<ExperiencesWidget> {
  ///  Local state fields for this page.

  bool showExperience = false;

  int? xid;

  String? t1;

  String? t2;

  String? t3;

  String? t4;

  ///  State fields for stateful widgets in this page.

  // Model for navbarnav component.
  late NavbarnavModel navbarnavModel;
  // Model for experiencee component.
  late ExperienceeModel experienceeModel;

  @override
  void initState(BuildContext context) {
    navbarnavModel = createModel(context, () => NavbarnavModel());
    experienceeModel = createModel(context, () => ExperienceeModel());
  }

  @override
  void dispose() {
    navbarnavModel.dispose();
    experienceeModel.dispose();
  }
}
