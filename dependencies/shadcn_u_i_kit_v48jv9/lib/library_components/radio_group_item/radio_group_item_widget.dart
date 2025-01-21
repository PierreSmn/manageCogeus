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
import 'radio_group_item_model.dart';
export 'radio_group_item_model.dart';

class RadioGroupItemWidget extends StatefulWidget {
  const RadioGroupItemWidget({
    super.key,
    bool? isActive,
    required this.option,
    this.onTapAction,
  }) : this.isActive = isActive ?? false;

  final bool isActive;
  final String? option;
  final Future Function(String option)? onTapAction;

  @override
  State<RadioGroupItemWidget> createState() => _RadioGroupItemWidgetState();
}

class _RadioGroupItemWidgetState extends State<RadioGroupItemWidget>
    with TickerProviderStateMixin {
  late RadioGroupItemModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RadioGroupItemModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(1.0, 1.0),
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
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        if (widget!.isActive) {
          return;
        }

        await widget.onTapAction?.call(
          widget!.option!,
        );
        return;
      },
      child: Container(
        decoration: BoxDecoration(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 16.0,
              height: 16.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: FlutterFlowTheme.of(context).primarycolor,
                  width: 1.0,
                ),
              ),
              child: Visibility(
                visible: widget!.isActive,
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: 8.0,
                    height: 8.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primarycolor,
                      shape: BoxShape.circle,
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation']!),
                ),
              ),
            ),
            Text(
              valueOrDefault<String>(
                widget!.option,
                'Option Text',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Geist',
                    letterSpacing: 0.0,
                    useGoogleFonts: false,
                  ),
            ),
          ].divide(SizedBox(width: 8.0)),
        ),
      ),
    );
  }
}
