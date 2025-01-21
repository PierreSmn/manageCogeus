import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'calendar_date_item_model.dart';
export 'calendar_date_item_model.dart';

class CalendarDateItemWidget extends StatefulWidget {
  const CalendarDateItemWidget({
    super.key,
    required this.day,
    bool? isSelected,
    bool? isDisabled,
    this.onTapAction,
    bool? isCurrentDay,
  })  : this.isSelected = isSelected ?? false,
        this.isDisabled = isDisabled ?? false,
        this.isCurrentDay = isCurrentDay ?? false;

  final DateTime? day;
  final bool isSelected;
  final bool isDisabled;
  final Future Function()? onTapAction;
  final bool isCurrentDay;

  @override
  State<CalendarDateItemWidget> createState() => _CalendarDateItemWidgetState();
}

class _CalendarDateItemWidgetState extends State<CalendarDateItemWidget> {
  late CalendarDateItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarDateItemModel());

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
          width: 36.0,
          height: 36.0,
          decoration: BoxDecoration(
            color: valueOrDefault<Color>(
              () {
                if (widget!.isDisabled) {
                  return FlutterFlowTheme.of(context).background;
                } else if (widget!.isSelected) {
                  return FlutterFlowTheme.of(context).primarycolor;
                } else if (_model.mouseRegionHovered!) {
                  return FlutterFlowTheme.of(context).accent;
                } else if (widget!.isCurrentDay) {
                  return FlutterFlowTheme.of(context).accent;
                } else {
                  return FlutterFlowTheme.of(context).background;
                }
              }(),
              FlutterFlowTheme.of(context).background,
            ),
            borderRadius: BorderRadius.circular(6.0),
          ),
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Text(
              valueOrDefault<String>(
                dateTimeFormat("d", widget!.day),
                '11',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Geist',
                    color: valueOrDefault<Color>(
                      () {
                        if (widget!.isDisabled) {
                          return FlutterFlowTheme.of(context).ring;
                        } else if (widget!.isSelected) {
                          return FlutterFlowTheme.of(context).primaryforeground;
                        } else {
                          return FlutterFlowTheme.of(context).foreground;
                        }
                      }(),
                      FlutterFlowTheme.of(context).foreground,
                    ),
                    letterSpacing: 0.0,
                    useGoogleFonts: false,
                  ),
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
