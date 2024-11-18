import '/backend/supabase/supabase.dart';
import '/experience_related/read_engagement/read_engagement_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/navbarnav/navbarnav_widget.dart';
import 'engagement_widget.dart' show EngagementWidget;
import 'package:flutter/material.dart';

class EngagementModel extends FlutterFlowModel<EngagementWidget> {
  ///  Local state fields for this page.

  String? npsLink;

  ///  State fields for stateful widgets in this page.

  // Model for navbarnav component.
  late NavbarnavModel navbarnavModel;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsersRow>? userRow;
  // Model for readEngagement component.
  late ReadEngagementModel readEngagementModel;

  @override
  void initState(BuildContext context) {
    navbarnavModel = createModel(context, () => NavbarnavModel());
    readEngagementModel = createModel(context, () => ReadEngagementModel());
  }

  @override
  void dispose() {
    navbarnavModel.dispose();
    readEngagementModel.dispose();
  }
}
