import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/trois_pages/navbarnav/navbarnav_widget.dart';
import 'host_library_widget.dart' show HostLibraryWidget;
import 'package:flutter/material.dart';

class HostLibraryModel extends FlutterFlowModel<HostLibraryWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for navbarnav component.
  late NavbarnavModel navbarnavModel;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - API (post to mux through fastgen)] action in Button widget.
  ApiCallResponse? apiResultUpload;

  @override
  void initState(BuildContext context) {
    navbarnavModel = createModel(context, () => NavbarnavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    navbarnavModel.dispose();
  }
}
