import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/add_founder_widget.dart';
import '/components/add_integration_widget.dart';
import '/components/add_story_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
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
      _model.isStory = true;
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
    context.watch<FFAppState>();

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
                    fontFamily: 'GeistSans',
                    color: FlutterFlowTheme.of(context).revoCardTextColor,
                    fontSize: 40.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                    useGoogleFonts: false,
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
                            if (widget.assets! >= 1)
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.isVidFounder = true;
                                  _model.isStory = false;
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
                                          height: 70.0,
                                          decoration: BoxDecoration(
                                            color: (_model.isStory == false) &&
                                                    (_model.isVidFounder ==
                                                        true)
                                                ? FlutterFlowTheme.of(context)
                                                    .alternate
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ].divide(const SizedBox(width: 6.0)),
                                    ),
                                    Text(
                                      'Mot du foundateur',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'GeistSans',
                                            fontSize: _model.isVidFounder
                                                ? 18.0
                                                : 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ].divide(const SizedBox(height: 16.0)),
                                ),
                              ),
                            if (widget.assets == 0)
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Vous devez ajouter des vidéos à vos assets pour créer des intégrations.',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'GeistSans',
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          fontSize:
                                              _model.isVidFounder ? 18.0 : 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ].divide(const SizedBox(height: 16.0)),
                              ),
                            if (widget.assets! >= 3)
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.isStory = true;
                                  _model.isVidFounder = false;
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
                                              color: (_model.isStory == true) &&
                                                      (_model.isVidFounder ==
                                                          false)
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
                                              color: (_model.isStory == true) &&
                                                      (_model.isVidFounder ==
                                                          false)
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
                                              color: (_model.isStory == true) &&
                                                      (_model.isVidFounder ==
                                                          false)
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
                                            fontFamily: 'GeistSans',
                                            fontSize:
                                                _model.isStory ? 18.0 : 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
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
                                  _model.isStory = false;
                                  _model.isVidFounder = false;
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
                                            color: (_model.isStory == false) &&
                                                    (_model.isVidFounder ==
                                                        false)
                                                ? FlutterFlowTheme.of(context)
                                                    .alternate
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        Container(
                                          width: 50.0,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: (_model.isStory == false) &&
                                                    (_model.isVidFounder ==
                                                        false)
                                                ? FlutterFlowTheme.of(context)
                                                    .alternate
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        Container(
                                          width: 50.0,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: (_model.isStory == false) &&
                                                    (_model.isVidFounder ==
                                                        false)
                                                ? FlutterFlowTheme.of(context)
                                                    .alternate
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        Container(
                                          width: 50.0,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: (_model.isStory == false) &&
                                                    (_model.isVidFounder ==
                                                        false)
                                                ? FlutterFlowTheme.of(context)
                                                    .alternate
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        Container(
                                          width: 50.0,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: (_model.isStory == false) &&
                                                    (_model.isVidFounder ==
                                                        false)
                                                ? FlutterFlowTheme.of(context)
                                                    .alternate
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
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
                                            fontFamily: 'GeistSans',
                                            fontSize: !_model.isStory &&
                                                    !_model.isVidFounder
                                                ? 14.0
                                                : 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
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
                        if ((_model.isStory == true) &&
                            (_model.isVidFounder == false)) {
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
                                child: const WebViewAware(
                                  child: SizedBox(
                                    height: 790.0,
                                    width: 770.0,
                                    child: AddStoryWidget(),
                                  ),
                                ),
                              );
                            },
                          );
                        } else if ((_model.isStory == false) &&
                            (_model.isVidFounder == true)) {
                          Navigator.pop(context);
                          _model.founderCreated =
                              await IntegrationsTable().insert({
                            'uuid': currentUserUid,
                            'ownerBrand': FFAppState().activeBrand,
                            'is_story': false,
                            'is_founder': true,
                            'name': 'Mot du foundateur',
                          });
                          FFAppState().integrationEdited =
                              _model.founderCreated!.id;
                          safeSetState(() {});
                          await showDialog(
                            context: context,
                            builder: (dialogContext) {
                              return Dialog(
                                elevation: 0,
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                alignment: const AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                child: WebViewAware(
                                  child: SizedBox(
                                    height: 790.0,
                                    width: 770.0,
                                    child: AddFounderWidget(
                                      founderId: _model.founderCreated!.id,
                                    ),
                                  ),
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
                                child: const WebViewAware(
                                  child: SizedBox(
                                    height: 800.0,
                                    width: 1280.0,
                                    child: AddIntegrationWidget(),
                                  ),
                                ),
                              );
                            },
                          );
                        }

                        safeSetState(() {});
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
                                  fontFamily: 'GeistSans',
                                  color: const Color(0xFF5E35B1),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: false,
                                ),
                        elevation: 0.0,
                        borderSide: const BorderSide(
                          width: 0.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
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
