import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'progress_bar_model.dart';
export 'progress_bar_model.dart';

class ProgressBarWidget extends StatefulWidget {
  /// Displays an indicator showing the completion progress of a task, typically
  /// displayed as a progress bar.
  const ProgressBarWidget({
    super.key,
    double? value,
  }) : this.value = value ?? 0.5;

  final double value;

  @override
  State<ProgressBarWidget> createState() => _ProgressBarWidgetState();
}

class _ProgressBarWidgetState extends State<ProgressBarWidget> {
  late ProgressBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProgressBarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: LinearPercentIndicator(
        percent: widget!.value,
        width: 300.0,
        lineHeight: 14.0,
        animation: true,
        animateFromLastPercent: true,
        progressColor: FlutterFlowTheme.of(context).accentforeground,
        backgroundColor: FlutterFlowTheme.of(context).accent,
        barRadius: Radius.circular(50.0),
        padding: EdgeInsets.zero,
      ),
    );
  }
}
