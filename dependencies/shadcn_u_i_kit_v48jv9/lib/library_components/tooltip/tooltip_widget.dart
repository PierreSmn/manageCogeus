import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tooltip_model.dart';
export 'tooltip_model.dart';

class TooltipWidget extends StatefulWidget {
  const TooltipWidget({
    super.key,
    required this.message,
    Color? backgroundColor,
    Color? borderColor,
  })  : this.backgroundColor = backgroundColor ?? Colors.white,
        this.borderColor = borderColor ?? const Color(0xFFE5E7EB);

  final String? message;
  final Color backgroundColor;
  final Color borderColor;

  @override
  State<TooltipWidget> createState() => _TooltipWidgetState();
}

class _TooltipWidgetState extends State<TooltipWidget> {
  late TooltipModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TooltipModel());

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
      height: 36.0,
      decoration: BoxDecoration(
        color: widget!.backgroundColor,
        borderRadius: BorderRadius.circular(6.0),
        border: Border.all(
          color: valueOrDefault<Color>(
            widget!.borderColor,
            Color(0xFFE5E7EB),
          ),
          width: 1.0,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            valueOrDefault<String>(
              widget!.message,
              'message',
            ),
            style: FlutterFlowTheme.of(context).bodySmall.override(
                  fontFamily: 'Geist',
                  letterSpacing: 0.0,
                  useGoogleFonts: false,
                ),
          ),
        ].addToStart(SizedBox(width: 12.0)).addToEnd(SizedBox(width: 12.0)),
      ),
    );
  }
}
