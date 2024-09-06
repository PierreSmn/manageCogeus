import '/components/add_integration_widget.dart';
import '/components/add_story_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'creation_choice_model.dart';
export 'creation_choice_model.dart';

class CreationChoiceWidget extends StatefulWidget {
  const CreationChoiceWidget({
    super.key,
    required this.assets,
  });

  final int? assets;

  @override
  State<CreationChoiceWidget> createState() => _CreationChoiceWidgetState();
}

class _CreationChoiceWidgetState extends State<CreationChoiceWidget> {
  late CreationChoiceModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreationChoiceModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.vidsby3 = true;
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
      width: MediaQuery.sizeOf(context).width * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).revoWhite,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 28.0, 16.0, 28.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Créer une intégration',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Manrope',
                    color: FlutterFlowTheme.of(context).revoCardTextColor,
                    fontSize: 40.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.vidsby3 = true;
                                safeSetState(() {});
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 30.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 50.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: _model.vidsby3
                                                ? FlutterFlowTheme.of(context)
                                                    .alternate
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(100.0),
                                          ),
                                        ),
                                        Container(
                                          width: 50.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: _model.vidsby3
                                                ? FlutterFlowTheme.of(context)
                                                    .alternate
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(100.0),
                                          ),
                                        ),
                                        Container(
                                          width: 50.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: _model.vidsby3
                                                ? FlutterFlowTheme.of(context)
                                                    .alternate
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(100.0),
                                          ),
                                        ),
                                      ].divide(const SizedBox(width: 6.0)),
                                    ),
                                  ),
                                  Text(
                                    'Stories',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          fontSize:
                                              _model.vidsby3 ? 18.0 : 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ].divide(const SizedBox(height: 16.0)),
                              ),
                            ),
                            if (widget.assets! >= 5)
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.vidsby3 = false;
                                  safeSetState(() {});
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 50.0,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: _model.vidsby3
                                                ? FlutterFlowTheme.of(context)
                                                    .secondaryBackground
                                                : FlutterFlowTheme.of(context)
                                                    .alternate,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        Container(
                                          width: 50.0,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: _model.vidsby3
                                                ? FlutterFlowTheme.of(context)
                                                    .secondaryBackground
                                                : FlutterFlowTheme.of(context)
                                                    .alternate,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        Container(
                                          width: 50.0,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: _model.vidsby3
                                                ? FlutterFlowTheme.of(context)
                                                    .secondaryBackground
                                                : FlutterFlowTheme.of(context)
                                                    .alternate,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        Container(
                                          width: 50.0,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: _model.vidsby3
                                                ? FlutterFlowTheme.of(context)
                                                    .secondaryBackground
                                                : FlutterFlowTheme.of(context)
                                                    .alternate,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        Container(
                                          width: 50.0,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: _model.vidsby3
                                                ? FlutterFlowTheme.of(context)
                                                    .secondaryBackground
                                                : FlutterFlowTheme.of(context)
                                                    .alternate,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ].divide(const SizedBox(width: 6.0)),
                                    ),
                                    Text(
                                      'Carousel',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Manrope',
                                            fontSize:
                                                _model.vidsby3 ? 14.0 : 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ].divide(const SizedBox(height: 16.0)),
                                ),
                              ),
                          ].divide(const SizedBox(width: 50.0)),
                        ),
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) => FFButtonWidget(
                      onPressed: () async {
                        if (_model.vidsby3 == true) {
                          Navigator.pop(context);
                          await showDialog(
                            context: context,
                            builder: (dialogContext) {
                              return Dialog(
                                elevation: 0,
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                alignment: const AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                child: const SizedBox(
                                  height: 790.0,
                                  width: 770.0,
                                  child: AddStoryWidget(),
                                ),
                              );
                            },
                          );
                        } else {
                          Navigator.pop(context);
                          await showDialog(
                            context: context,
                            builder: (dialogContext) {
                              return Dialog(
                                elevation: 0,
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                alignment: const AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                child: const SizedBox(
                                  height: 800.0,
                                  width: 1280.0,
                                  child: AddIntegrationWidget(),
                                ),
                              );
                            },
                          );
                        }
                      },
                      text: 'Commencer',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: const Color(0xFFEEE8FC),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Manrope',
                                  color: const Color(0xFF5E35B1),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                        elevation: 0.0,
                        borderSide: const BorderSide(
                          width: 0.0,
                        ),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ].divide(const SizedBox(height: 12.0)),
        ),
      ),
    );
  }
}
