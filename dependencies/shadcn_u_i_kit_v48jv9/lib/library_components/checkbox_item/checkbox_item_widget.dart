import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'checkbox_item_model.dart';
export 'checkbox_item_model.dart';

class CheckboxItemWidget extends StatefulWidget {
  const CheckboxItemWidget({
    super.key,
    required this.title,
    this.description,
    bool? value,
    this.onToggleOnAction,
    this.onToggleOffAction,
  }) : this.value = value ?? false;

  final String? title;
  final String? description;
  final bool value;
  final Future Function()? onToggleOnAction;
  final Future Function()? onToggleOffAction;

  @override
  State<CheckboxItemWidget> createState() => _CheckboxItemWidgetState();
}

class _CheckboxItemWidgetState extends State<CheckboxItemWidget> {
  late CheckboxItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckboxItemModel());

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
      decoration: BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Theme(
            data: ThemeData(
              checkboxTheme: CheckboxThemeData(
                visualDensity: VisualDensity.compact,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              unselectedWidgetColor:
                  FlutterFlowTheme.of(context).mutedforeground,
            ),
            child: Checkbox(
              value: _model.checkboxValue ??= widget!.value,
              onChanged: (newValue) async {
                safeSetState(() => _model.checkboxValue = newValue!);
                if (newValue!) {
                  await widget.onToggleOnAction?.call();
                } else {
                  await widget.onToggleOffAction?.call();
                }
              },
              side: BorderSide(
                width: 2,
                color: FlutterFlowTheme.of(context).mutedforeground,
              ),
              activeColor: FlutterFlowTheme.of(context).primarycolor,
              checkColor: FlutterFlowTheme.of(context).primaryforeground,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.5, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (widget!.value == true) {
                        await widget.onToggleOffAction?.call();
                        return;
                      } else {
                        await widget.onToggleOnAction?.call();
                        return;
                      }
                    },
                    child: Text(
                      valueOrDefault<String>(
                        widget!.title,
                        'Item Name',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Geist',
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                  if (valueOrDefault<bool>(
                    widget!.description != null && widget!.description != '',
                    false,
                  ))
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget!.description,
                          'Item Description',
                        ),
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'Geist',
                              color:
                                  FlutterFlowTheme.of(context).mutedforeground,
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
