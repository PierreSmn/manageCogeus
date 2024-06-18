import '/backend/supabase/supabase.dart';
import '/components/choose_hosted_video_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'edit_integration_model.dart';
export 'edit_integration_model.dart';

class EditIntegrationWidget extends StatefulWidget {
  const EditIntegrationWidget({
    super.key,
    required this.integrationEditing,
  });

  final int? integrationEditing;

  @override
  State<EditIntegrationWidget> createState() => _EditIntegrationWidgetState();
}

class _EditIntegrationWidgetState extends State<EditIntegrationWidget> {
  late EditIntegrationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditIntegrationModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<IntegrationsRow>>(
      future: IntegrationsTable().querySingleRow(
        queryFn: (q) => q.eq(
          'id',
          widget.integrationEditing,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: SpinKitRing(
                color: FlutterFlowTheme.of(context).primary,
                size: 50.0,
              ),
            ),
          );
        }
        List<IntegrationsRow> containerIntegrationsRowList = snapshot.data!;
        final containerIntegrationsRow = containerIntegrationsRowList.isNotEmpty
            ? containerIntegrationsRowList.first
            : null;
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
                  'Modifier Integration',
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
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 140.0,
                                    height: 300.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).revoBG,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        if (containerIntegrationsRow?.vid1 ==
                                            null)
                                          Text(
                                            'Selectionnez une vidéo',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        if (containerIntegrationsRow?.vid1 !=
                                            null)
                                          FutureBuilder<List<HostedSubsRow>>(
                                            future: HostedSubsTable()
                                                .querySingleRow(
                                              queryFn: (q) => q.eq(
                                                'id',
                                                containerIntegrationsRow?.vid1,
                                              ),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child: SpinKitRing(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 50.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<HostedSubsRow>
                                                  videoPlayerHostedSubsRowList =
                                                  snapshot.data!;
                                              final videoPlayerHostedSubsRow =
                                                  videoPlayerHostedSubsRowList
                                                          .isNotEmpty
                                                      ? videoPlayerHostedSubsRowList
                                                          .first
                                                      : null;
                                              return FlutterFlowVideoPlayer(
                                                path: videoPlayerHostedSubsRow!
                                                    .mediaLink!,
                                                videoType: VideoType.network,
                                                width: 170.0,
                                                height: 300.0,
                                                autoPlay: false,
                                                looping: true,
                                                showControls: true,
                                                allowFullScreen: true,
                                                allowPlaybackSpeedMenu: false,
                                              );
                                            },
                                          ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (containerIntegrationsRow?.vid1 ==
                                          null)
                                        Builder(
                                          builder: (context) => FFButtonWidget(
                                            onPressed: () async {
                                              FFAppState().choiceID = 0;
                                              setState(() {});
                                              await showDialog(
                                                barrierDismissible: false,
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        const AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: const WebViewAware(
                                                      child: SizedBox(
                                                        height: 500.0,
                                                        width: 800.0,
                                                        child:
                                                            ChooseHostedVideoWidget(),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));

                                              if (FFAppState().choiceID == 0) {
                                                return;
                                              }
                                              await IntegrationsTable().update(
                                                data: {
                                                  'vid1': FFAppState().choiceID,
                                                },
                                                matchingRows: (rows) => rows.eq(
                                                  'id',
                                                  widget.integrationEditing,
                                                ),
                                              );
                                              FFAppState().vid1 =
                                                  FFAppState().choiceID;
                                              setState(() {});
                                            },
                                            text: 'Choisir',
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: const Color(0xFFEEE8FC),
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Manrope',
                                                    color: const Color(0xFF5E35B1),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                              elevation: 0.0,
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 0.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                          ),
                                        ),
                                      if (containerIntegrationsRow?.vid1 !=
                                          null)
                                        Builder(
                                          builder: (context) => FFButtonWidget(
                                            onPressed: () async {
                                              FFAppState().choiceID = 0;
                                              setState(() {});
                                              await showDialog(
                                                barrierDismissible: false,
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        const AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: const WebViewAware(
                                                      child: SizedBox(
                                                        height: 500.0,
                                                        width: 800.0,
                                                        child:
                                                            ChooseHostedVideoWidget(),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));

                                              if (FFAppState().choiceID == 0) {
                                                return;
                                              }
                                              await IntegrationsTable().update(
                                                data: {
                                                  'vid1': FFAppState().choiceID,
                                                },
                                                matchingRows: (rows) => rows.eq(
                                                  'id',
                                                  widget.integrationEditing,
                                                ),
                                              );
                                              FFAppState().vid1 =
                                                  FFAppState().choiceID;
                                              setState(() {});
                                            },
                                            text: 'Changer',
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: const Color(0xFFDBD5E7),
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Manrope',
                                                    color: const Color(0xFF5E35B1),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                              elevation: 0.0,
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 0.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 140.0,
                                    height: 300.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).revoBG,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        if (containerIntegrationsRow?.vid2 ==
                                            null)
                                          Text(
                                            'Selectionnez une vidéo',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        if (containerIntegrationsRow?.vid2 !=
                                            null)
                                          FutureBuilder<List<HostedSubsRow>>(
                                            future: HostedSubsTable()
                                                .querySingleRow(
                                              queryFn: (q) => q.eq(
                                                'id',
                                                containerIntegrationsRow?.vid2,
                                              ),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child: SpinKitRing(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 50.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<HostedSubsRow>
                                                  videoPlayerHostedSubsRowList =
                                                  snapshot.data!;
                                              final videoPlayerHostedSubsRow =
                                                  videoPlayerHostedSubsRowList
                                                          .isNotEmpty
                                                      ? videoPlayerHostedSubsRowList
                                                          .first
                                                      : null;
                                              return FlutterFlowVideoPlayer(
                                                path: videoPlayerHostedSubsRow!
                                                    .mediaLink!,
                                                videoType: VideoType.network,
                                                width: 170.0,
                                                height: 300.0,
                                                autoPlay: false,
                                                looping: true,
                                                showControls: true,
                                                allowFullScreen: true,
                                                allowPlaybackSpeedMenu: false,
                                              );
                                            },
                                          ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (containerIntegrationsRow?.vid2 ==
                                          null)
                                        Builder(
                                          builder: (context) => FFButtonWidget(
                                            onPressed: () async {
                                              FFAppState().choiceID = 0;
                                              setState(() {});
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        const AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: const WebViewAware(
                                                      child: SizedBox(
                                                        height: 500.0,
                                                        width: 800.0,
                                                        child:
                                                            ChooseHostedVideoWidget(),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));

                                              if (FFAppState().choiceID == 0) {
                                                return;
                                              }
                                              await IntegrationsTable().update(
                                                data: {
                                                  'vid2': FFAppState().choiceID,
                                                },
                                                matchingRows: (rows) => rows.eq(
                                                  'id',
                                                  widget.integrationEditing,
                                                ),
                                              );
                                              FFAppState().vid2 =
                                                  FFAppState().choiceID;
                                              setState(() {});
                                            },
                                            text: 'Choisir',
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: const Color(0xFFEEE8FC),
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Manrope',
                                                    color: const Color(0xFF5E35B1),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                              elevation: 0.0,
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 0.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                          ),
                                        ),
                                      if (containerIntegrationsRow?.vid2 !=
                                          null)
                                        Builder(
                                          builder: (context) => FFButtonWidget(
                                            onPressed: () async {
                                              FFAppState().choiceID = 0;
                                              setState(() {});
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        const AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: const WebViewAware(
                                                      child: SizedBox(
                                                        height: 500.0,
                                                        width: 800.0,
                                                        child:
                                                            ChooseHostedVideoWidget(),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));

                                              if (FFAppState().choiceID == 0) {
                                                return;
                                              }
                                              await IntegrationsTable().update(
                                                data: {
                                                  'vid2': FFAppState().choiceID,
                                                },
                                                matchingRows: (rows) => rows.eq(
                                                  'id',
                                                  widget.integrationEditing,
                                                ),
                                              );
                                              FFAppState().vid2 =
                                                  FFAppState().choiceID;
                                              setState(() {});
                                            },
                                            text: 'Changer',
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: const Color(0xFFDBD5E7),
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Manrope',
                                                    color: const Color(0xFF5E35B1),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                              elevation: 0.0,
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 0.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 140.0,
                                    height: 300.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).revoBG,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        if (containerIntegrationsRow?.vid3 ==
                                            null)
                                          Text(
                                            'Selectionnez une vidéo',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        if (containerIntegrationsRow?.vid3 !=
                                            null)
                                          FutureBuilder<List<HostedSubsRow>>(
                                            future: HostedSubsTable()
                                                .querySingleRow(
                                              queryFn: (q) => q.eq(
                                                'id',
                                                containerIntegrationsRow?.vid3,
                                              ),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child: SpinKitRing(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 50.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<HostedSubsRow>
                                                  videoPlayerHostedSubsRowList =
                                                  snapshot.data!;
                                              final videoPlayerHostedSubsRow =
                                                  videoPlayerHostedSubsRowList
                                                          .isNotEmpty
                                                      ? videoPlayerHostedSubsRowList
                                                          .first
                                                      : null;
                                              return FlutterFlowVideoPlayer(
                                                path: videoPlayerHostedSubsRow!
                                                    .mediaLink!,
                                                videoType: VideoType.network,
                                                width: 170.0,
                                                height: 300.0,
                                                autoPlay: false,
                                                looping: true,
                                                showControls: true,
                                                allowFullScreen: true,
                                                allowPlaybackSpeedMenu: false,
                                              );
                                            },
                                          ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (containerIntegrationsRow?.vid3 ==
                                          null)
                                        Builder(
                                          builder: (context) => FFButtonWidget(
                                            onPressed: () async {
                                              FFAppState().choiceID = 0;
                                              setState(() {});
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        const AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: const WebViewAware(
                                                      child: SizedBox(
                                                        height: 500.0,
                                                        width: 800.0,
                                                        child:
                                                            ChooseHostedVideoWidget(),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));

                                              if (FFAppState().choiceID == 0) {
                                                return;
                                              }
                                              await IntegrationsTable().update(
                                                data: {
                                                  'vid3': FFAppState().choiceID,
                                                },
                                                matchingRows: (rows) => rows.eq(
                                                  'id',
                                                  widget.integrationEditing,
                                                ),
                                              );
                                              FFAppState().vid3 =
                                                  FFAppState().choiceID;
                                              setState(() {});
                                            },
                                            text: 'Choisir',
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: const Color(0xFFEEE8FC),
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Manrope',
                                                    color: const Color(0xFF5E35B1),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                              elevation: 0.0,
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 0.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                          ),
                                        ),
                                      if (containerIntegrationsRow?.vid3 !=
                                          null)
                                        Builder(
                                          builder: (context) => FFButtonWidget(
                                            onPressed: () async {
                                              FFAppState().choiceID = 0;
                                              setState(() {});
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        const AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: const WebViewAware(
                                                      child: SizedBox(
                                                        height: 500.0,
                                                        width: 800.0,
                                                        child:
                                                            ChooseHostedVideoWidget(),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));

                                              if (FFAppState().choiceID == 0) {
                                                return;
                                              }
                                              await IntegrationsTable().update(
                                                data: {
                                                  'vid3': FFAppState().choiceID,
                                                },
                                                matchingRows: (rows) => rows.eq(
                                                  'id',
                                                  widget.integrationEditing,
                                                ),
                                              );
                                              FFAppState().vid3 =
                                                  FFAppState().choiceID;
                                              setState(() {});
                                            },
                                            text: 'Changer',
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: const Color(0xFFDBD5E7),
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Manrope',
                                                    color: const Color(0xFF5E35B1),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                              elevation: 0.0,
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 0.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                              if (containerIntegrationsRow?.vid4 != null)
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 140.0,
                                      height: 300.0,
                                      decoration: BoxDecoration(
                                        color:
                                            FlutterFlowTheme.of(context).revoBG,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          if (containerIntegrationsRow?.vid4 ==
                                              null)
                                            Text(
                                              'Selectionnez une vidéo',
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          if (containerIntegrationsRow?.vid4 !=
                                              null)
                                            FutureBuilder<List<HostedSubsRow>>(
                                              future: HostedSubsTable()
                                                  .querySingleRow(
                                                queryFn: (q) => q.eq(
                                                  'id',
                                                  containerIntegrationsRow
                                                      ?.vid4,
                                                ),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child: SpinKitRing(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 50.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<HostedSubsRow>
                                                    videoPlayerHostedSubsRowList =
                                                    snapshot.data!;
                                                final videoPlayerHostedSubsRow =
                                                    videoPlayerHostedSubsRowList
                                                            .isNotEmpty
                                                        ? videoPlayerHostedSubsRowList
                                                            .first
                                                        : null;
                                                return FlutterFlowVideoPlayer(
                                                  path:
                                                      videoPlayerHostedSubsRow!
                                                          .mediaLink!,
                                                  videoType: VideoType.network,
                                                  width: 170.0,
                                                  height: 300.0,
                                                  autoPlay: false,
                                                  looping: true,
                                                  showControls: true,
                                                  allowFullScreen: true,
                                                  allowPlaybackSpeedMenu: false,
                                                );
                                              },
                                            ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (containerIntegrationsRow?.vid4 ==
                                            null)
                                          Builder(
                                            builder: (context) =>
                                                FFButtonWidget(
                                              onPressed: () async {
                                                FFAppState().choiceID = 0;
                                                setState(() {});
                                                await showDialog(
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          const AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: const WebViewAware(
                                                        child: SizedBox(
                                                          height: 500.0,
                                                          width: 800.0,
                                                          child:
                                                              ChooseHostedVideoWidget(),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then(
                                                    (value) => setState(() {}));

                                                if (FFAppState().choiceID ==
                                                    0) {
                                                  return;
                                                }
                                                await IntegrationsTable()
                                                    .update(
                                                  data: {
                                                    'vid4':
                                                        FFAppState().choiceID,
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eq(
                                                    'id',
                                                    widget.integrationEditing,
                                                  ),
                                                );
                                                FFAppState().vid4 =
                                                    FFAppState().choiceID;
                                                setState(() {});
                                              },
                                              text: 'Choisir',
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: const Color(0xFFEEE8FC),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          color:
                                                              const Color(0xFF5E35B1),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                elevation: 0.0,
                                                borderSide: const BorderSide(
                                                  color: Colors.transparent,
                                                  width: 0.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                            ),
                                          ),
                                        if (containerIntegrationsRow?.vid4 !=
                                            null)
                                          Builder(
                                            builder: (context) =>
                                                FFButtonWidget(
                                              onPressed: () async {
                                                FFAppState().choiceID = 0;
                                                setState(() {});
                                                await showDialog(
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          const AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: const WebViewAware(
                                                        child: SizedBox(
                                                          height: 500.0,
                                                          width: 800.0,
                                                          child:
                                                              ChooseHostedVideoWidget(),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then(
                                                    (value) => setState(() {}));

                                                if (FFAppState().choiceID ==
                                                    0) {
                                                  return;
                                                }
                                                await IntegrationsTable()
                                                    .update(
                                                  data: {
                                                    'vid4':
                                                        FFAppState().choiceID,
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eq(
                                                    'id',
                                                    widget.integrationEditing,
                                                  ),
                                                );
                                                FFAppState().vid4 =
                                                    FFAppState().choiceID;
                                                setState(() {});
                                              },
                                              text: 'Changer',
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: const Color(0xFFDBD5E7),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          color:
                                                              const Color(0xFF5E35B1),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                elevation: 0.0,
                                                borderSide: const BorderSide(
                                                  color: Colors.transparent,
                                                  width: 0.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                              if (containerIntegrationsRow?.vid5 != null)
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 140.0,
                                      height: 300.0,
                                      decoration: BoxDecoration(
                                        color:
                                            FlutterFlowTheme.of(context).revoBG,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          if (containerIntegrationsRow?.vid5 ==
                                              null)
                                            Text(
                                              'Selectionnez une vidéo',
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          if (containerIntegrationsRow?.vid5 !=
                                              null)
                                            FutureBuilder<List<HostedSubsRow>>(
                                              future: HostedSubsTable()
                                                  .querySingleRow(
                                                queryFn: (q) => q.eq(
                                                  'id',
                                                  containerIntegrationsRow
                                                      ?.vid5,
                                                ),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child: SpinKitRing(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 50.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<HostedSubsRow>
                                                    videoPlayerHostedSubsRowList =
                                                    snapshot.data!;
                                                final videoPlayerHostedSubsRow =
                                                    videoPlayerHostedSubsRowList
                                                            .isNotEmpty
                                                        ? videoPlayerHostedSubsRowList
                                                            .first
                                                        : null;
                                                return FlutterFlowVideoPlayer(
                                                  path:
                                                      videoPlayerHostedSubsRow!
                                                          .mediaLink!,
                                                  videoType: VideoType.network,
                                                  width: 170.0,
                                                  height: 300.0,
                                                  autoPlay: false,
                                                  looping: true,
                                                  showControls: true,
                                                  allowFullScreen: true,
                                                  allowPlaybackSpeedMenu: false,
                                                );
                                              },
                                            ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (containerIntegrationsRow?.vid5 ==
                                            null)
                                          Builder(
                                            builder: (context) =>
                                                FFButtonWidget(
                                              onPressed: () async {
                                                FFAppState().choiceID = 0;
                                                setState(() {});
                                                await showDialog(
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          const AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: const WebViewAware(
                                                        child: SizedBox(
                                                          height: 500.0,
                                                          width: 800.0,
                                                          child:
                                                              ChooseHostedVideoWidget(),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then(
                                                    (value) => setState(() {}));

                                                if (FFAppState().choiceID ==
                                                    0) {
                                                  return;
                                                }
                                                await IntegrationsTable()
                                                    .update(
                                                  data: {
                                                    'vid5':
                                                        FFAppState().choiceID,
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eq(
                                                    'id',
                                                    widget.integrationEditing,
                                                  ),
                                                );
                                                FFAppState().vid5 =
                                                    FFAppState().choiceID;
                                                setState(() {});
                                              },
                                              text: 'Choisir',
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: const Color(0xFFEEE8FC),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          color:
                                                              const Color(0xFF5E35B1),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                elevation: 0.0,
                                                borderSide: const BorderSide(
                                                  color: Colors.transparent,
                                                  width: 0.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                            ),
                                          ),
                                        if (containerIntegrationsRow?.vid5 !=
                                            null)
                                          Builder(
                                            builder: (context) =>
                                                FFButtonWidget(
                                              onPressed: () async {
                                                FFAppState().choiceID = 0;
                                                setState(() {});
                                                await showDialog(
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          const AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: const WebViewAware(
                                                        child: SizedBox(
                                                          height: 500.0,
                                                          width: 800.0,
                                                          child:
                                                              ChooseHostedVideoWidget(),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then(
                                                    (value) => setState(() {}));

                                                if (FFAppState().choiceID ==
                                                    0) {
                                                  return;
                                                }
                                                await IntegrationsTable()
                                                    .update(
                                                  data: {
                                                    'vid5':
                                                        FFAppState().choiceID,
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eq(
                                                    'id',
                                                    widget.integrationEditing,
                                                  ),
                                                );
                                                FFAppState().vid5 =
                                                    FFAppState().choiceID;
                                                setState(() {});
                                              },
                                              text: 'Changer',
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: const Color(0xFFDBD5E7),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          color:
                                                              const Color(0xFF5E35B1),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                elevation: 0.0,
                                                borderSide: const BorderSide(
                                                  color: Colors.transparent,
                                                  width: 0.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                            ].divide(const SizedBox(width: 24.0)),
                          ),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          await IntegrationsTable().delete(
                            matchingRows: (rows) => rows.eq(
                              'id',
                              widget.integrationEditing,
                            ),
                          );
                          Navigator.pop(context);
                        },
                        text: 'Effacer',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: const Color(0xFFFCE8EA),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Manrope',
                                    color: const Color(0xFFE32C58),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                          elevation: 0.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 0.0,
                          ),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: ((containerIntegrationsRow?.vid1 ==
                                      null) ||
                                  (containerIntegrationsRow?.vid2 == null) ||
                                  (containerIntegrationsRow?.vid3 == null) ||
                                  (containerIntegrationsRow?.vid4 == null) ||
                                  (containerIntegrationsRow?.vid5 == null))
                              ? null
                              : () async {
                                  Navigator.pop(context);
                                },
                          text: 'Valider',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Manrope',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            disabledColor: const Color(0xC55E35B1),
                            disabledTextColor: const Color(0x84FFFFFF),
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
      },
    );
  }
}
