import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'alert_model.dart';
export 'alert_model.dart';

class AlertWidget extends StatefulWidget {
  const AlertWidget({
    super.key,
    bool? isDestructive,
    required this.title,
    required this.description,
    this.icon,
  }) : this.isDestructive = isDestructive ?? false;

  final bool isDestructive;
  final String? title;
  final String? description;
  final Widget? icon;

  @override
  State<AlertWidget> createState() => _AlertWidgetState();
}

class _AlertWidgetState extends State<AlertWidget> {
  late AlertModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AlertModel());

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
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).background,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: valueOrDefault<Color>(
            widget!.isDestructive
                ? FlutterFlowTheme.of(context).borderdestructive
                : FlutterFlowTheme.of(context).border,
            FlutterFlowTheme.of(context).border,
          ),
          width: 1.0,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(),
                  child: Visibility(
                    visible: valueOrDefault<bool>(
                      widget!.icon != null,
                      false,
                    ),
                    child: widget!.icon!,
                  ),
                ),
              ].divide(SizedBox(height: 4.0)),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                valueOrDefault<String>(
                  widget!.title,
                  'Alert Title',
                ),
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: 'Geist',
                      color: valueOrDefault<Color>(
                        widget!.isDestructive
                            ? FlutterFlowTheme.of(context).destructive
                            : FlutterFlowTheme.of(context).foreground,
                        FlutterFlowTheme.of(context).foreground,
                      ),
                      letterSpacing: 0.0,
                      useGoogleFonts: false,
                    ),
              ),
              Text(
                valueOrDefault<String>(
                  widget!.description,
                  'Alert Description',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Geist',
                      color: valueOrDefault<Color>(
                        widget!.isDestructive
                            ? FlutterFlowTheme.of(context).destructive
                            : FlutterFlowTheme.of(context).foreground,
                        FlutterFlowTheme.of(context).foreground,
                      ),
                      letterSpacing: 0.0,
                      useGoogleFonts: false,
                    ),
              ),
            ]
                .divide(SizedBox(height: 6.0))
                .addToStart(SizedBox(height: 13.0))
                .addToEnd(SizedBox(height: 13.0)),
          ),
        ],
      ),
    );
  }
}
