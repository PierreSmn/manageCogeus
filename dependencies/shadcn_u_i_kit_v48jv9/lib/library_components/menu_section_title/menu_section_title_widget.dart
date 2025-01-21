import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'menu_section_title_model.dart';
export 'menu_section_title_model.dart';

class MenuSectionTitleWidget extends StatefulWidget {
  const MenuSectionTitleWidget({
    super.key,
    required this.text,
  });

  final String? text;

  @override
  State<MenuSectionTitleWidget> createState() => _MenuSectionTitleWidgetState();
}

class _MenuSectionTitleWidgetState extends State<MenuSectionTitleWidget> {
  late MenuSectionTitleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuSectionTitleModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
      child: Container(
        width: double.infinity,
        height: 32.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).popover,
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Text(
                valueOrDefault<String>(
                  widget!.text,
                  'Item Text',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Geist',
                      color: FlutterFlowTheme.of(context).popoverforeground,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      useGoogleFonts: false,
                    ),
              ),
            ),
          ].addToStart(SizedBox(width: 8.0)).addToEnd(SizedBox(width: 8.0)),
        ),
      ),
    );
  }
}
