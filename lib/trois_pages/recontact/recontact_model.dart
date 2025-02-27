import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/navbarnav/navbarnav_widget.dart';
import '/trois_pages/experiencee/experiencee_widget.dart';
import '/index.dart';
import 'recontact_widget.dart' show RecontactWidget;
import 'package:flutter/material.dart';

class RecontactModel extends FlutterFlowModel<RecontactWidget> {
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
  // State field(s) for Checkbox widget.
  Map<RecontactRow, bool> checkboxValueMap1 = {};
  List<RecontactRow> get checkboxCheckedItems1 => checkboxValueMap1.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // Model for experiencee component.
  late ExperienceeModel experienceeModel1;
  // State field(s) for Checkbox widget.
  Map<RecontactRow, bool> checkboxValueMap2 = {};
  List<RecontactRow> get checkboxCheckedItems2 => checkboxValueMap2.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // Model for experiencee component.
  late ExperienceeModel experienceeModel2;
  // State field(s) for Checkbox widget.
  Map<RecontactRow, bool> checkboxValueMap3 = {};
  List<RecontactRow> get checkboxCheckedItems3 => checkboxValueMap3.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // Model for experiencee component.
  late ExperienceeModel experienceeModel3;

  @override
  void initState(BuildContext context) {
    navbarnavModel = createModel(context, () => NavbarnavModel());
    experienceeModel1 = createModel(context, () => ExperienceeModel());
    experienceeModel2 = createModel(context, () => ExperienceeModel());
    experienceeModel3 = createModel(context, () => ExperienceeModel());
  }

  @override
  void dispose() {
    navbarnavModel.dispose();
    experienceeModel1.dispose();
    experienceeModel2.dispose();
    experienceeModel3.dispose();
  }
}
