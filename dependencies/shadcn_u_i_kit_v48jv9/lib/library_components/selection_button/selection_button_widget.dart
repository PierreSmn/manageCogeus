import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'selection_button_model.dart';
export 'selection_button_model.dart';

class SelectionButtonWidget extends StatefulWidget {
  const SelectionButtonWidget({
    super.key,
    String? promptText,
    this.currentSelection,
    double? width,
    this.onTapAction,
    bool? showTrailingIcon,
    this.leadingIconDefault,
    this.leadingIconHover,
  })  : this.promptText = promptText ?? 'Please select...',
        this.width = width ?? 200.0,
        this.showTrailingIcon = showTrailingIcon ?? true;

  final String promptText;
  final String? currentSelection;
  final double width;
  final Future Function()? onTapAction;
  final bool showTrailingIcon;
  final Widget? leadingIconDefault;
  final Widget? leadingIconHover;

  @override
  State<SelectionButtonWidget> createState() => _SelectionButtonWidgetState();
}

class _SelectionButtonWidgetState extends State<SelectionButtonWidget> {
  late SelectionButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectionButtonModel());

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
          await widget.onTapAction?.call();
        },
        child: Container(
          width: widget!.width,
          height: 40.0,
          decoration: BoxDecoration(
            color: valueOrDefault<Color>(
              _model.mouseRegionHovered!
                  ? FlutterFlowTheme.of(context).accent
                  : FlutterFlowTheme.of(context).background,
              FlutterFlowTheme.of(context).background,
            ),
            borderRadius: BorderRadius.circular(6.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).border,
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (valueOrDefault<bool>(
                            widget!.leadingIconDefault != null,
                            false,
                          ) &&
                          valueOrDefault<bool>(
                            widget!.leadingIconHover != null,
                            false,
                          ))
                        Builder(
                          builder: (context) {
                            if (_model.mouseRegionHovered ?? false) {
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 8.0, 0.0),
                                child: widget!.leadingIconHover!,
                              );
                            } else {
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 8.0, 0.0),
                                child: widget!.leadingIconDefault!,
                              );
                            }
                          },
                        ),
                      Text(
                        valueOrDefault<String>(
                          widget!.currentSelection != null &&
                                  widget!.currentSelection != ''
                              ? widget!.currentSelection
                              : widget!.promptText,
                          'Please select...',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Geist',
                              color: valueOrDefault<Color>(
                                _model.mouseRegionHovered!
                                    ? FlutterFlowTheme.of(context)
                                        .accentforeground
                                    : FlutterFlowTheme.of(context).foreground,
                                FlutterFlowTheme.of(context).foreground,
                              ),
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                            ),
                      ),
                    ],
                  ),
                ),
                if (widget!.showTrailingIcon)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: valueOrDefault<Color>(
                        _model.mouseRegionHovered!
                            ? FlutterFlowTheme.of(context).accentforeground
                            : FlutterFlowTheme.of(context).ring,
                        FlutterFlowTheme.of(context).ring,
                      ),
                      size: 16.0,
                    ),
                  ),
              ],
            ),
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
