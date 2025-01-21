import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tab_menu_item_model.dart';
export 'tab_menu_item_model.dart';

class TabMenuItemWidget extends StatefulWidget {
  const TabMenuItemWidget({
    super.key,
    required this.name,
    this.currentSelection,
    this.onTapAction,
    required this.itemNo,
  });

  final String? name;
  final int? currentSelection;
  final Future Function(int itemNo)? onTapAction;
  final int? itemNo;

  @override
  State<TabMenuItemWidget> createState() => _TabMenuItemWidgetState();
}

class _TabMenuItemWidgetState extends State<TabMenuItemWidget> {
  late TabMenuItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TabMenuItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        if (widget!.currentSelection == widget!.itemNo) {
          return;
        }

        await widget.onTapAction?.call(
          widget!.itemNo!,
        );
        return;
      },
      child: Container(
        height: 36.0,
        decoration: BoxDecoration(
          color: valueOrDefault<Color>(
            widget!.currentSelection == widget!.itemNo
                ? FlutterFlowTheme.of(context).primaryBackground
                : Colors.transparent,
            FlutterFlowTheme.of(context).primaryforeground,
          ),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
            child: Text(
              valueOrDefault<String>(
                widget!.name,
                'Name',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Geist',
                    color: valueOrDefault<Color>(
                      widget!.currentSelection == widget!.itemNo
                          ? FlutterFlowTheme.of(context).foreground
                          : FlutterFlowTheme.of(context).mutedforeground,
                      FlutterFlowTheme.of(context).primaryText,
                    ),
                    letterSpacing: 0.0,
                    useGoogleFonts: false,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
