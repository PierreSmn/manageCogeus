import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'slider_model.dart';
export 'slider_model.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({
    super.key,
    double? min,
    double? max,
    double? initialValue,
    double? stepSize,
    this.onSlideAction,
    required this.width,
  })  : this.min = min ?? 0.0,
        this.max = max ?? 10.0,
        this.initialValue = initialValue ?? 5.0,
        this.stepSize = stepSize ?? 1.0;

  final double min;
  final double max;
  final double initialValue;
  final double stepSize;
  final Future Function(double value)? onSlideAction;
  final double? width;

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  late SliderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SliderModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.activeWidth = valueOrDefault<double>(
        (widget!.initialValue / widget!.max) * (widget!.width!),
        20.0,
      );
      safeSetState(() {});
    });

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
      width: widget!.width,
      height: 30.0,
      decoration: BoxDecoration(),
      child: Stack(
        alignment: AlignmentDirectional(0.0, 0.0),
        children: [
          Container(
            width: double.infinity,
            height: 8.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).accent,
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Container(
              width: _model.activeWidth,
              constraints: BoxConstraints(
                minWidth: 20.0,
              ),
              decoration: BoxDecoration(),
              child: Stack(
                alignment: AlignmentDirectional(-1.0, 0.0),
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: 8.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primarycolor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(0.0),
                        ),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).primarycolor,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.0, 0.0),
                    child: Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).background,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).primarycolor,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onHorizontalDragDown: (details) async {
              _model.activeWidth = details.localPosition.dx + 10;
              safeSetState(() {});
              await widget.onSlideAction?.call(
                () {
                  if (((_model.activeWidth / (widget!.width!)) * widget!.max) >=
                      widget!.max) {
                    return widget!.max;
                  } else if (((_model.activeWidth / (widget!.width!)) *
                          widget!.max) <=
                      widget!.min) {
                    return widget!.min;
                  } else {
                    return ((_model.activeWidth / (widget!.width!)) *
                        widget!.max);
                  }
                }(),
              );
            },
            onHorizontalDragUpdate: (details) async {
              if ((details.localPosition.dx > widget!.width!) ||
                  (details.localPosition.dx < 0.0)) {
                _model.activeWidth = () {
                  if (details.localPosition.dx <= 0.0) {
                    return 0.0;
                  } else if (details.localPosition.dx >= widget!.width!) {
                    return widget!.width!;
                  } else {
                    return details.localPosition.dx;
                  }
                }();
                safeSetState(() {});
                await widget.onSlideAction?.call(
                  (_model.activeWidth / (widget!.width!)) * widget!.max,
                );
                return;
              } else {
                _model.activeWidth = () {
                  if ((_model.activeWidth + details.delta.dx) <= 0.0) {
                    return 0.0;
                  } else if ((_model.activeWidth + details.delta.dx) >=
                      widget!.width!) {
                    return widget!.width!;
                  } else {
                    return (_model.activeWidth + details.delta.dx);
                  }
                }();
                safeSetState(() {});
                await widget.onSlideAction?.call(
                  (_model.activeWidth / (widget!.width!)) * widget!.max,
                );
                return;
              }
            },
            child: Container(
              width: double.infinity,
              height: 8.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
