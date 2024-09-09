import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/navbarnav/navbarnav_widget.dart';
import '/flutter_flow/request_manager.dart';

import 'dart:async';
import 'widgets_widget.dart' show WidgetsWidget;
import 'package:flutter/material.dart';

class WidgetsModel extends FlutterFlowModel<WidgetsWidget> {
  ///  Local state fields for this page.

  String? listSelect;

  int? countTry = 0;

  ///  State fields for stateful widgets in this page.

  // Model for navbarnav component.
  late NavbarnavModel navbarnavModel;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;
  Completer<List<IntegrationsRow>>? requestCompleter;

  /// Query cache managers for this widget.

  final _hostedCacheManager = FutureRequestManager<List<HostedSubsRow>>();
  Future<List<HostedSubsRow>> hostedCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<HostedSubsRow>> Function() requestFn,
  }) =>
      _hostedCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearHostedCacheCache() => _hostedCacheManager.clear();
  void clearHostedCacheCacheKey(String? uniqueKey) =>
      _hostedCacheManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    navbarnavModel = createModel(context, () => NavbarnavModel());
  }

  @override
  void dispose() {
    navbarnavModel.dispose();

    /// Dispose query cache managers for this widget.

    clearHostedCacheCache();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
