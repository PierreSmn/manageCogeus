import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'breadcrumb_item_model.dart';
export 'breadcrumb_item_model.dart';

class BreadcrumbItemWidget extends StatefulWidget {
  const BreadcrumbItemWidget({
    super.key,
    required this.text,
    this.itemNo,
    this.count,
    this.onTapAction,
  });

  final String? text;
  final int? itemNo;
  final int? count;
  final Future Function(int index)? onTapAction;

  @override
  State<BreadcrumbItemWidget> createState() => _BreadcrumbItemWidgetState();
}

class _BreadcrumbItemWidgetState extends State<BreadcrumbItemWidget> {
  late BreadcrumbItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BreadcrumbItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      opaque: false,
      cursor: SystemMouseCursors.basic ?? MouseCursor.defer,
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          await widget.onTapAction?.call(
            widget!.itemNo!,
          );
        },
        child: Text(
          valueOrDefault<String>(
            widget!.text,
            'Breadcrumb',
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Geist',
                color: valueOrDefault<Color>(
                  () {
                    if (valueOrDefault<bool>(
                      widget!.itemNo == ((widget!.count!) - 1),
                      true,
                    )) {
                      return FlutterFlowTheme.of(context).foreground;
                    } else if (_model.mouseRegionHovered!) {
                      return FlutterFlowTheme.of(context).foreground;
                    } else {
                      return FlutterFlowTheme.of(context).mutedforeground;
                    }
                  }(),
                  FlutterFlowTheme.of(context).foreground,
                ),
                letterSpacing: 0.0,
                useGoogleFonts: false,
              ),
        ),
      ),
      onEnter: ((event) async {
        safeSetState(() => _model.mouseRegionHovered = true);
      }),
      onExit: ((event) async {
        safeSetState(() => _model.mouseRegionHovered = false);
      }),
    );
  }
}
