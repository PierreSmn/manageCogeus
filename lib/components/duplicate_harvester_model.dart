import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'duplicate_harvester_widget.dart' show DuplicateHarvesterWidget;
import 'package:flutter/material.dart';

class DuplicateHarvesterModel
    extends FlutterFlowModel<DuplicateHarvesterWidget> {
  ///  Local state fields for this component.

  String state = 'no';

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for titre widget.
  FocusNode? titreFocusNode;
  TextEditingController? titreTextController;
  String? Function(BuildContext, String?)? titreTextControllerValidator;
  // State field(s) for slug widget.
  FocusNode? slugFocusNode;
  TextEditingController? slugTextController;
  String? Function(BuildContext, String?)? slugTextControllerValidator;
  String? _slugTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('^[a-z]+\$').hasMatch(val)) {
      return 'Votre mot ne respecte pas les règles ci-dessus.';
    }
    return null;
  }

  // State field(s) for question widget.
  FocusNode? questionFocusNode;
  TextEditingController? questionTextController;
  String? Function(BuildContext, String?)? questionTextControllerValidator;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validSlug;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<LiveFlowsRow>? matchSlug;

  @override
  void initState(BuildContext context) {
    slugTextControllerValidator = _slugTextControllerValidator;
  }

  @override
  void dispose() {
    titreFocusNode?.dispose();
    titreTextController?.dispose();

    slugFocusNode?.dispose();
    slugTextController?.dispose();

    questionFocusNode?.dispose();
    questionTextController?.dispose();
  }
}
