import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'selection_item_model.dart';
export 'selection_item_model.dart';

class SelectionItemWidget extends StatefulWidget {
  const SelectionItemWidget({
    super.key,
    required this.text,
    bool? isInFocus,
    required this.onMouseEnterAction,
    this.onTapAction,
    bool? isDisabled,
    bool? isSelected,
    bool? showIndicator,
    this.shortcut,
    bool? isRadioIndicator,
  })  : this.isInFocus = isInFocus ?? false,
        this.isDisabled = isDisabled ?? false,
        this.isSelected = isSelected ?? false,
        this.showIndicator = showIndicator ?? false,
        this.isRadioIndicator = isRadioIndicator ?? false;

  final String? text;
  final bool isInFocus;
  final Future Function()? onMouseEnterAction;
  final Future Function()? onTapAction;
  final bool isDisabled;
  final bool isSelected;
  final bool showIndicator;
  final String? shortcut;
  final bool isRadioIndicator;

  @override
  State<SelectionItemWidget> createState() => _SelectionItemWidgetState();
}

class _SelectionItemWidgetState extends State<SelectionItemWidget> {
  late SelectionItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectionItemModel());

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
          if (widget!.isDisabled) {
            return;
          }

          await widget.onTapAction?.call();
          return;
        },
        child: Container(
          width: double.infinity,
          height: 32.0,
          decoration: BoxDecoration(
            color: valueOrDefault<Color>(
              widget!.isInFocus && !widget!.isDisabled
                  ? FlutterFlowTheme.of(context).accent
                  : FlutterFlowTheme.of(context).popover,
              FlutterFlowTheme.of(context).popover,
            ),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (widget!.showIndicator)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                  child: Container(
                    width: 16.0,
                    height: 16.0,
                    decoration: BoxDecoration(),
                    child: Visibility(
                      visible: valueOrDefault<bool>(
                        widget!.isSelected,
                        false,
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            if (widget!.isRadioIndicator) {
                              return Icon(
                                FFIcons.kdotSolid,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 16.0,
                              );
                            } else {
                              return Icon(
                                FFIcons.kcheck,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 16.0,
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              Expanded(
                child: Text(
                  valueOrDefault<String>(
                    widget!.text,
                    'Item Text',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Geist',
                        color: valueOrDefault<Color>(
                          () {
                            if (widget!.isDisabled) {
                              return FlutterFlowTheme.of(context).ring;
                            } else if (widget!.isInFocus) {
                              return FlutterFlowTheme.of(context)
                                  .accentforeground;
                            } else {
                              return FlutterFlowTheme.of(context)
                                  .popoverforeground;
                            }
                          }(),
                          FlutterFlowTheme.of(context).popoverforeground,
                        ),
                        letterSpacing: 0.0,
                        useGoogleFonts: false,
                      ),
                ),
              ),
              if (valueOrDefault<bool>(
                (widget!.shortcut != null && widget!.shortcut != '') &&
                    !widget!.isDisabled,
                false,
              ))
                Text(
                  valueOrDefault<String>(
                    widget!.shortcut,
                    '⌘ T',
                  ),
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Geist',
                        color: FlutterFlowTheme.of(context).mutedforeground,
                        fontSize: 12.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                        useGoogleFonts: false,
                      ),
                ),
            ].addToStart(SizedBox(width: 8.0)).addToEnd(SizedBox(width: 8.0)),
          ),
        ),
      ),
      onEnter: ((event) async {
        safeSetState(() => _model.mouseRegionHovered = true);
        await widget.onMouseEnterAction?.call();
      }),
      onExit: ((event) async {
        safeSetState(() => _model.mouseRegionHovered = false);
      }),
    );
  }
}
