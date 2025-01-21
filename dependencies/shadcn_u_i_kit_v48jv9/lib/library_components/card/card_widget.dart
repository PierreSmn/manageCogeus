import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'card_model.dart';
export 'card_model.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({
    super.key,
    required this.title,
    required this.description,
    required this.content,
    required this.footer,
    double? width,
    bool? includeFooter,
  })  : this.width = width ?? 350.0,
        this.includeFooter = includeFooter ?? false;

  final String? title;
  final String? description;
  final Widget Function()? content;
  final Widget Function()? footer;
  final double width;
  final bool includeFooter;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  late CardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardModel());

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
      constraints: BoxConstraints(
        maxWidth: 550.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).background,
        boxShadow: [
          BoxShadow(
            blurRadius: 6.0,
            color: Color(0x0F000000),
            offset: Offset(
              0.0,
              2.0,
            ),
            spreadRadius: 0.0,
          )
        ],
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).border,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  valueOrDefault<String>(
                    widget!.title,
                    'Alert Dialogue Title',
                  ),
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Geist',
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        useGoogleFonts: false,
                      ),
                ),
                Text(
                  valueOrDefault<String>(
                    widget!.description,
                    'Alert Dialogue Description',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Geist',
                        color: FlutterFlowTheme.of(context).mutedforeground,
                        letterSpacing: 0.0,
                        useGoogleFonts: false,
                      ),
                ),
              ].divide(SizedBox(height: 6.0)),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: Builder(builder: (_) {
                  return widget.content!();
                }),
              ),
            ),
            if (valueOrDefault<bool>(
              widget!.includeFooter,
              true,
            ))
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    0.0,
                    valueOrDefault<double>(
                      widget!.footer != null ? 24.0 : 0.0,
                      24.0,
                    ),
                    0.0,
                    0.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(),
                  child: Builder(builder: (_) {
                    return widget.footer!();
                  }),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
