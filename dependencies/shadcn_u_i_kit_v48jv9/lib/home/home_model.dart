import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  Local state fields for this page.

  List<String> breadcrumbs = ['Home', 'Products', 'Perfume'];
  void addToBreadcrumbs(String item) => breadcrumbs.add(item);
  void removeFromBreadcrumbs(String item) => breadcrumbs.remove(item);
  void removeAtIndexFromBreadcrumbs(int index) => breadcrumbs.removeAt(index);
  void insertAtIndexInBreadcrumbs(int index, String item) =>
      breadcrumbs.insert(index, item);
  void updateBreadcrumbsAtIndex(int index, Function(String) updateFn) =>
      breadcrumbs[index] = updateFn(breadcrumbs[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
