import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'icon_button_model.dart';
export 'icon_button_model.dart';

class IconButtonWidget extends StatefulWidget {
  const IconButtonWidget({
    super.key,
    required this.icon,
    bool? isSmall,
    bool? isFilled,
    this.action,
  })  : this.isSmall = isSmall ?? false,
        this.isFilled = isFilled ?? false;

  final Widget? icon;
  final bool isSmall;
  final bool isFilled;
  final Future Function()? action;

  @override
  State<IconButtonWidget> createState() => _IconButtonWidgetState();
}

class _IconButtonWidgetState extends State<IconButtonWidget> {
  late IconButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IconButtonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowIconButton(
      borderColor: valueOrDefault<Color>(
        widget!.isFilled
            ? FlutterFlowTheme.of(context).input
            : Colors.transparent,
        Colors.transparent,
      ),
      borderRadius: 6.0,
      borderWidth: 1.0,
      buttonSize: valueOrDefault<double>(
        widget!.isSmall ? 30.0 : 40.0,
        30.0,
      ),
      fillColor: valueOrDefault<Color>(
        widget!.isFilled
            ? FlutterFlowTheme.of(context).background
            : Colors.transparent,
        Colors.transparent,
      ),
      hoverColor: FlutterFlowTheme.of(context).accent,
      hoverIconColor: FlutterFlowTheme.of(context).accentforeground,
      icon: widget!.icon!,
      onPressed: () async {
        await widget.action?.call();
      },
    );
  }
}
