import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'badge_model.dart';
export 'badge_model.dart';

class BadgeWidget extends StatefulWidget {
  const BadgeWidget({
    super.key,
    required this.variant,
    required this.text,
  });

  final BadgeVariant? variant;
  final String? text;

  @override
  State<BadgeWidget> createState() => _BadgeWidgetState();
}

class _BadgeWidgetState extends State<BadgeWidget> {
  late BadgeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BadgeModel());

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
      decoration: BoxDecoration(
        color: valueOrDefault<Color>(
          () {
            if (widget!.variant == BadgeVariant.Primary) {
              return FlutterFlowTheme.of(context).primarycolor;
            } else if (widget!.variant == BadgeVariant.Secondary) {
              return FlutterFlowTheme.of(context).secondarycolor;
            } else if (widget!.variant == BadgeVariant.Outline) {
              return FlutterFlowTheme.of(context).background;
            } else if (widget!.variant == BadgeVariant.Destructive) {
              return FlutterFlowTheme.of(context).destructive;
            } else {
              return FlutterFlowTheme.of(context).primarycolor;
            }
          }(),
          FlutterFlowTheme.of(context).primarycolor,
        ),
        borderRadius: BorderRadius.circular(50.0),
        border: Border.all(
          color: valueOrDefault<Color>(
            widget!.variant == BadgeVariant.Outline
                ? FlutterFlowTheme.of(context).border
                : Colors.transparent,
            Colors.transparent,
          ),
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10.0, 2.0, 10.0, 2.0),
        child: Text(
          valueOrDefault<String>(
            widget!.text,
            'Badge Text',
          ),
          style: FlutterFlowTheme.of(context).bodySmall.override(
                fontFamily: 'Geist',
                color: valueOrDefault<Color>(
                  () {
                    if (widget!.variant == BadgeVariant.Primary) {
                      return FlutterFlowTheme.of(context).primaryforeground;
                    } else if (widget!.variant == BadgeVariant.Secondary) {
                      return FlutterFlowTheme.of(context).secondaryforeground;
                    } else if (widget!.variant == BadgeVariant.Outline) {
                      return FlutterFlowTheme.of(context).foreground;
                    } else if (widget!.variant == BadgeVariant.Destructive) {
                      return FlutterFlowTheme.of(context).destructiveforeground;
                    } else {
                      return FlutterFlowTheme.of(context).primaryforeground;
                    }
                  }(),
                  FlutterFlowTheme.of(context).primaryforeground,
                ),
                fontSize: 12.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w500,
                useGoogleFonts: false,
              ),
        ),
      ),
    );
  }
}
