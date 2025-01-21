import '/flutter_flow/flutter_flow_util.dart';
import '/library_components/calendar_date_item/calendar_date_item_widget.dart';
import '/library_components/icon_button/icon_button_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'calendar_model.dart';
export 'calendar_model.dart';

class CalendarWidget extends StatefulWidget {
  /// A date field component that allows users to enter and edit date.
  const CalendarWidget({
    super.key,
    this.onTapAction,
    this.currentSelection,
  });

  final Future Function(DateTime date)? onTapAction;
  final DateTime? currentSelection;

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  late CalendarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
      child: Container(
        width: 280.0,
        height: 308.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).background,
          boxShadow: [
            BoxShadow(
              blurRadius: 6.0,
              color: Color(0x0F000000),
              offset: Offset(
                0.0,
                2.0,
              ),
              spreadRadius: 0.0,
            )
          ],
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).border,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  wrapWithModel(
                    model: _model.iconButtonModel1,
                    updateCallback: () => safeSetState(() {}),
                    child: IconButtonWidget(
                      icon: Icon(
                        Icons.chevron_left_rounded,
                        color: FlutterFlowTheme.of(context).foreground,
                        size: 14.0,
                      ),
                      isSmall: true,
                      isFilled: true,
                      action: () async {
                        _model.month = functions.setMonth(false, () {
                          if (_model.month != null) {
                            return _model.month;
                          } else if (widget!.currentSelection != null) {
                            return widget!.currentSelection;
                          } else {
                            return getCurrentTimestamp;
                          }
                        }());
                        safeSetState(() {});
                      },
                    ),
                  ),
                  Text(
                    valueOrDefault<String>(
                      () {
                        if (_model.month != null) {
                          return valueOrDefault<String>(
                            dateTimeFormat("MMMM y", _model.month),
                            'September 2024',
                          );
                        } else if (widget!.currentSelection != null) {
                          return dateTimeFormat(
                              "MMMM y", widget!.currentSelection);
                        } else {
                          return valueOrDefault<String>(
                            dateTimeFormat("MMMM y", getCurrentTimestamp),
                            'September 2024',
                          );
                        }
                      }(),
                      'September 2024',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Geist',
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: false,
                        ),
                  ),
                  wrapWithModel(
                    model: _model.iconButtonModel2,
                    updateCallback: () => safeSetState(() {}),
                    child: IconButtonWidget(
                      icon: Icon(
                        Icons.chevron_right_rounded,
                        color: FlutterFlowTheme.of(context).foreground,
                        size: 14.0,
                      ),
                      isSmall: true,
                      isFilled: true,
                      action: () async {
                        _model.month = functions.setMonth(true, () {
                          if (_model.month != null) {
                            return _model.month;
                          } else if (widget!.currentSelection != null) {
                            return widget!.currentSelection;
                          } else {
                            return getCurrentTimestamp;
                          }
                        }());
                        safeSetState(() {});
                      },
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            'Su',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Geist',
                                  color: FlutterFlowTheme.of(context)
                                      .mutedforeground,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Mo',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Geist',
                                  color: FlutterFlowTheme.of(context)
                                      .mutedforeground,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Tu',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Geist',
                                  color: FlutterFlowTheme.of(context)
                                      .mutedforeground,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'We',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Geist',
                                  color: FlutterFlowTheme.of(context)
                                      .mutedforeground,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Th',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Geist',
                                  color: FlutterFlowTheme.of(context)
                                      .mutedforeground,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Fr',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Geist',
                                  color: FlutterFlowTheme.of(context)
                                      .mutedforeground,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Sa',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Geist',
                                  color: FlutterFlowTheme.of(context)
                                      .mutedforeground,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Builder(
                        builder: (context) {
                          final day = (functions.returnDays(() {
                                    if (_model.month != null) {
                                      return _model.month;
                                    } else if (widget!.currentSelection !=
                                        null) {
                                      return widget!.currentSelection;
                                    } else {
                                      return getCurrentTimestamp;
                                    }
                                  }())?.toList() ??
                                  [])
                              .take(35)
                              .toList();

                          return GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 7,
                              crossAxisSpacing: 0.0,
                              mainAxisSpacing: 8.0,
                              childAspectRatio: 1.0,
                            ),
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: day.length,
                            itemBuilder: (context, dayIndex) {
                              final dayItem = day[dayIndex];
                              return wrapWithModel(
                                model: _model.calendarDateItemModels.getModel(
                                  dayItem.toString(),
                                  dayIndex,
                                ),
                                updateCallback: () => safeSetState(() {}),
                                child: CalendarDateItemWidget(
                                  key: Key(
                                    'Keyvud_${dayItem.toString()}',
                                  ),
                                  isSelected:
                                      dayItem == widget!.currentSelection,
                                  isDisabled:
                                      !functions.isCurrentMonth(dayItem, () {
                                    if (_model.month != null) {
                                      return _model.month;
                                    } else if (widget!.currentSelection !=
                                        null) {
                                      return widget!.currentSelection;
                                    } else {
                                      return getCurrentTimestamp;
                                    }
                                  }())!,
                                  isCurrentDay:
                                      dayItem == functions.currentDay(),
                                  day: dayItem,
                                  onTapAction: () async {
                                    await widget.onTapAction?.call(
                                      dayItem,
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ].divide(SizedBox(height: 8.0)),
                ),
              ),
            ].divide(SizedBox(height: 14.0)),
          ),
        ),
      ),
    );
  }
}
