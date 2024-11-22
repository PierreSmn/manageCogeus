import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/navbarnav/navbarnav_widget.dart';
import 'experience_widget.dart' show ExperienceWidget;
import 'package:flutter/material.dart';

class ExperienceModel extends FlutterFlowModel<ExperienceWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for navbarnav component.
  late NavbarnavModel navbarnavModel;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsersRow>? userRow;

  @override
  void initState(BuildContext context) {
    navbarnavModel = createModel(context, () => NavbarnavModel());
  }

  @override
  void dispose() {
    navbarnavModel.dispose();
  }
}
