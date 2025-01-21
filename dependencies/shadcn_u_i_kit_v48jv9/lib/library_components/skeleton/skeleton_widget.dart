import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'skeleton_model.dart';
export 'skeleton_model.dart';

class SkeletonWidget extends StatefulWidget {
  const SkeletonWidget({
    super.key,
    bool? isCardVariant,
  }) : this.isCardVariant = isCardVariant ?? false;

  final bool isCardVariant;

  @override
  State<SkeletonWidget> createState() => _SkeletonWidgetState();
}

class _SkeletonWidgetState extends State<SkeletonWidget>
    with TickerProviderStateMixin {
  late SkeletonModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SkeletonModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          TintEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            color: FlutterFlowTheme.of(context).background,
            begin: 0.0,
            end: 0.5,
          ),
        ],
      ),
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
      decoration: BoxDecoration(),
      child: Builder(
        builder: (context) {
          if (widget!.isCardVariant) {
            return Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).accent,
                    shape: BoxShape.circle,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 18.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).accent,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 80.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 18.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).accent,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(height: 6.0)),
                  ),
                ),
              ].divide(SizedBox(width: 16.0)),
            );
          } else {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  height: 120.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).accent,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 18.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).accent,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 80.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 18.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).accent,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 6.0)),
            );
          }
        },
      ),
    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
  }
}
