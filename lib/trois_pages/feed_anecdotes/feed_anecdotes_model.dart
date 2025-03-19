import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/navbarnav/navbarnav_widget.dart';
import '/index.dart';
import 'feed_anecdotes_widget.dart' show FeedAnecdotesWidget;
import 'package:flutter/material.dart';

class FeedAnecdotesModel extends FlutterFlowModel<FeedAnecdotesWidget> {
  ///  Local state fields for this page.

  bool showExperience = false;

  int? xid;

  String? t1;

  String? t2;

  String? t3;

  String? t4;

  List<ExperiencesRow> supaQuery = [];
  void addToSupaQuery(ExperiencesRow item) => supaQuery.add(item);
  void removeFromSupaQuery(ExperiencesRow item) => supaQuery.remove(item);
  void removeAtIndexFromSupaQuery(int index) => supaQuery.removeAt(index);
  void insertAtIndexInSupaQuery(int index, ExperiencesRow item) =>
      supaQuery.insert(index, item);
  void updateSupaQueryAtIndex(int index, Function(ExperiencesRow) updateFn) =>
      supaQuery[index] = updateFn(supaQuery[index]);

  bool dataDecreasing = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in feedAnecdotes widget.
  List<ExperiencesRow>? allExp;
  // Stores action output result for [Backend Call - Query Rows] action in feedAnecdotes widget.
  List<ExperiencesRow>? buExp;
  // Stores action output result for [Backend Call - Query Rows] action in feedAnecdotes widget.
  List<ExperiencesRow>? locExp;
  // Model for navbarnav component.
  late NavbarnavModel navbarnavModel;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ExperiencesRow>? filterCli1;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ExperiencesRow>? filterCli2;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ExperiencesRow>? filterCli3;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ExperiencesRow>? filterCli4;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ExperiencesRow>? filterCli5;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ExperiencesRow>? filterCli6;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ExperiencesRow>? filterCli7;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ExperiencesRow>? filterCli8;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ExperiencesRow>? filterBu1;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ExperiencesRow>? filterBu2;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ExperiencesRow>? filterBu3;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ExperiencesRow>? filterBu4;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ExperiencesRow>? filterBu5;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ExperiencesRow>? filterBu6;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ExperiencesRow>? filterBu7;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ExperiencesRow>? filterBu8;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ExperiencesRow>? filterLoc1;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ExperiencesRow>? filterLoc2;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ExperiencesRow>? filterLoc3;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ExperiencesRow>? filterLoc4;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ExperiencesRow>? filterLoc5;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ExperiencesRow>? filterLoc6;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ExperiencesRow>? filterLoc7;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ExperiencesRow>? filterLoc8;

  @override
  void initState(BuildContext context) {
    navbarnavModel = createModel(context, () => NavbarnavModel());
  }

  @override
  void dispose() {
    navbarnavModel.dispose();
  }
}
