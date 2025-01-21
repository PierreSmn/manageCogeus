import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/library_components/button/button_widget.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'alert_dialogue_model.dart';
export 'alert_dialogue_model.dart';

class AlertDialogueWidget extends StatefulWidget {
  const AlertDialogueWidget({
    super.key,
    required this.title,
    required this.description,
    required this.cancelText,
    required this.confirmText,
    this.cancelAction,
    this.confirmAction,
    double? width,
    bool? isDestructive,
    bool? showButtonA,
    bool? showButtonB,
  })  : this.width = width ?? 350.0,
        this.isDestructive = isDestructive ?? false,
        this.showButtonA = showButtonA ?? true,
        this.showButtonB = showButtonB ?? true;

  final String? title;
  final String? description;
  final String? cancelText;
  final String? confirmText;
  final Future Function()? cancelAction;
  final Future Function()? confirmAction;
  final double width;
  final bool isDestructive;
  final bool showButtonA;
  final bool showButtonB;

  @override
  State<AlertDialogueWidget> createState() => _AlertDialogueWidgetState();
}

class _AlertDialogueWidgetState extends State<AlertDialogueWidget> {
  late AlertDialogueModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AlertDialogueModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
      child: Container(
        width: widget!.width,
        constraints: BoxConstraints(
          maxWidth: 550.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).background,
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
              Text(
                valueOrDefault<String>(
                  widget!.title,
                  'Alert Dialogue Title',
                ),
                style: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Geist',
                      letterSpacing: 0.0,
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
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (valueOrDefault<bool>(
                    widget!.showButtonA,
                    true,
                  ))
                    wrapWithModel(
                      model: _model.buttonModel1,
                      updateCallback: () => safeSetState(() {}),
                      child: ButtonWidget(
                        text: valueOrDefault<String>(
                          widget!.cancelText,
                          'Cancel Text',
                        ),
                        variant: ButtonVariant.Outline,
                        action: () async {
                          await widget.cancelAction?.call();
                        },
                      ),
                    ),
                  if (valueOrDefault<bool>(
                    widget!.showButtonB,
                    true,
                  ))
                    wrapWithModel(
                      model: _model.buttonModel2,
                      updateCallback: () => safeSetState(() {}),
                      child: ButtonWidget(
                        text: valueOrDefault<String>(
                          widget!.confirmText,
                          'Confirm Text',
                        ),
                        variant: widget!.isDestructive
                            ? ButtonVariant.Destructive
                            : ButtonVariant.Primary,
                        action: () async {
                          await widget.confirmAction?.call();
                        },
                      ),
                    ),
                ].divide(SizedBox(width: 8.0)),
              ),
            ].divide(SizedBox(height: 16.0)),
          ),
        ),
      ),
    );
  }
}
