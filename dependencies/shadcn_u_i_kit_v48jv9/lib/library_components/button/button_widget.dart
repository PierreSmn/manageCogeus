import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'button_model.dart';
export 'button_model.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({
    super.key,
    required this.variant,
    required this.text,
    this.action,
  });

  final ButtonVariant? variant;
  final String? text;
  final Future Function()? action;

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  late ButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ButtonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: () async {
        await widget.action?.call();
      },
      text: valueOrDefault<String>(
        widget!.text,
        'Button Text',
      ),
      options: FFButtonOptions(
        height: 40.0,
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: valueOrDefault<Color>(
          () {
            if (widget!.variant == ButtonVariant.Primary) {
              return FlutterFlowTheme.of(context).primarycolor;
            } else if (widget!.variant == ButtonVariant.Secondary) {
              return FlutterFlowTheme.of(context).secondarycolor;
            } else if (widget!.variant == ButtonVariant.Destructive) {
              return FlutterFlowTheme.of(context).destructive;
            } else if (widget!.variant == ButtonVariant.Outline) {
              return FlutterFlowTheme.of(context).background;
            } else if (widget!.variant == ButtonVariant.Ghost) {
              return FlutterFlowTheme.of(context).background;
            } else {
              return FlutterFlowTheme.of(context).primarycolor;
            }
          }(),
          FlutterFlowTheme.of(context).primarycolor,
        ),
        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Geist',
              color: valueOrDefault<Color>(
                () {
                  if (widget!.variant == ButtonVariant.Primary) {
                    return FlutterFlowTheme.of(context).primaryforeground;
                  } else if (widget!.variant == ButtonVariant.Secondary) {
                    return FlutterFlowTheme.of(context).secondaryforeground;
                  } else if (widget!.variant == ButtonVariant.Destructive) {
                    return FlutterFlowTheme.of(context).destructiveforeground;
                  } else if (widget!.variant == ButtonVariant.Outline) {
                    return FlutterFlowTheme.of(context).foreground;
                  } else if (widget!.variant == ButtonVariant.Ghost) {
                    return FlutterFlowTheme.of(context).foreground;
                  } else {
                    return FlutterFlowTheme.of(context).primaryforeground;
                  }
                }(),
                FlutterFlowTheme.of(context).primaryforeground,
              ),
              letterSpacing: 0.0,
              useGoogleFonts: false,
            ),
        elevation: 0.0,
        borderSide: BorderSide(
          color: valueOrDefault<Color>(
            widget!.variant == ButtonVariant.Outline
                ? FlutterFlowTheme.of(context).border
                : Colors.transparent,
            Colors.transparent,
          ),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(6.0),
      ),
      showLoadingIndicator: false,
    );
  }
}
