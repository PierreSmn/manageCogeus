import '/backend/supabase/supabase.dart';
import '/components/change_color_widget.dart';
import '/components/change_question_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/navbarnav/navbarnav_widget.dart';
import 'dart:async';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'harvesters_model.dart';
export 'harvesters_model.dart';

class HarvestersWidget extends StatefulWidget {
  const HarvestersWidget({super.key});

  @override
  State<HarvestersWidget> createState() => _HarvestersWidgetState();
}

class _HarvestersWidgetState extends State<HarvestersWidget> {
  late HarvestersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HarvestersModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'harvesters',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height * 1,
                    decoration: const BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        wrapWithModel(
                          model: _model.navbarnavModel,
                          updateCallback: () => safeSetState(() {}),
                          child: const NavbarnavWidget(
                            selectedIndex: 10,
                          ),
                        ),
                        Expanded(
                          child: FutureBuilder<List<LiveFlowsRow>>(
                            future: (_model.requestCompleter ??=
                                    Completer<List<LiveFlowsRow>>()
                                      ..complete(LiveFlowsTable().queryRows(
                                        queryFn: (q) => q.eq(
                                          'brand_name',
                                          FFAppState().activeBrand,
                                        ),
                                      )))
                                .future,
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: SpinKitRing(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 50,
                                    ),
                                  ),
                                );
                              }
                              List<LiveFlowsRow> containerLiveFlowsRowList =
                                  snapshot.data!;

                              return Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).revoBG,
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      50, 0, 0, 20),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(0, 32, 0, 0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final flows =
                                                        containerLiveFlowsRowList
                                                            .toList();

                                                    return SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                            flows.length,
                                                            (flowsIndex) {
                                                          final flowsItem =
                                                              flows[flowsIndex];
                                                          return Container(
                                                            width: 800,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .revoWhite,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(32),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            380,
                                                                        decoration:
                                                                            const BoxDecoration(),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            Text(
                                                                              valueOrDefault<String>(
                                                                                flowsItem.slug,
                                                                                'noneFound',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    color: FlutterFlowTheme.of(context).revoCardTextColorUnselected,
                                                                                    fontSize: 34.72,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    fontStyle: FontStyle.italic,
                                                                                  ),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                                                                              child: FutureBuilder<List<WebAppActivationsRow>>(
                                                                                future: WebAppActivationsTable().queryRows(
                                                                                  queryFn: (q) => q
                                                                                      .eq(
                                                                                        'brandName',
                                                                                        FFAppState().activeBrand,
                                                                                      )
                                                                                      .eq(
                                                                                        'slug',
                                                                                        flowsItem.slug,
                                                                                      ),
                                                                                ),
                                                                                builder: (context, snapshot) {
                                                                                  // Customize what your widget looks like when it's loading.
                                                                                  if (!snapshot.hasData) {
                                                                                    return Center(
                                                                                      child: SizedBox(
                                                                                        width: 50,
                                                                                        height: 50,
                                                                                        child: SpinKitRing(
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          size: 50,
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  }
                                                                                  List<WebAppActivationsRow> richTextWebAppActivationsRowList = snapshot.data!;

                                                                                  return RichText(
                                                                                    textScaler: MediaQuery.of(context).textScaler,
                                                                                    text: TextSpan(
                                                                                      children: [
                                                                                        const TextSpan(
                                                                                          text: 'Question :',
                                                                                          style: TextStyle(),
                                                                                        ),
                                                                                        TextSpan(
                                                                                          text: flowsItem.expla2!,
                                                                                          style: TextStyle(
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                        )
                                                                                      ],
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Manrope',
                                                                                            fontSize: 18,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ),
                                                                            FutureBuilder<List<WebAppActivationsRow>>(
                                                                              future: WebAppActivationsTable().queryRows(
                                                                                queryFn: (q) => q
                                                                                    .eq(
                                                                                      'brandName',
                                                                                      FFAppState().activeBrand,
                                                                                    )
                                                                                    .eq(
                                                                                      'slug',
                                                                                      flowsItem.slug,
                                                                                    ),
                                                                              ),
                                                                              builder: (context, snapshot) {
                                                                                // Customize what your widget looks like when it's loading.
                                                                                if (!snapshot.hasData) {
                                                                                  return Center(
                                                                                    child: SizedBox(
                                                                                      width: 50,
                                                                                      height: 50,
                                                                                      child: SpinKitRing(
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        size: 50,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }
                                                                                List<WebAppActivationsRow> richTextWebAppActivationsRowList = snapshot.data!;

                                                                                return RichText(
                                                                                  textScaler: MediaQuery.of(context).textScaler,
                                                                                  text: TextSpan(
                                                                                    children: [
                                                                                      const TextSpan(
                                                                                        text: 'Démarrages : ',
                                                                                        style: TextStyle(),
                                                                                      ),
                                                                                      TextSpan(
                                                                                        text: richTextWebAppActivationsRowList.length.toString(),
                                                                                        style: const TextStyle(
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                      )
                                                                                    ],
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Manrope',
                                                                                          fontSize: 18,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ),
                                                                            FutureBuilder<List<SubmittersNewRow>>(
                                                                              future: SubmittersNewTable().queryRows(
                                                                                queryFn: (q) => q
                                                                                    .eq(
                                                                                      'brand_name',
                                                                                      FFAppState().activeBrand,
                                                                                    )
                                                                                    .eq(
                                                                                      'flow_done',
                                                                                      flowsItem.slug,
                                                                                    ),
                                                                              ),
                                                                              builder: (context, snapshot) {
                                                                                // Customize what your widget looks like when it's loading.
                                                                                if (!snapshot.hasData) {
                                                                                  return Center(
                                                                                    child: SizedBox(
                                                                                      width: 50,
                                                                                      height: 50,
                                                                                      child: SpinKitRing(
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        size: 50,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }
                                                                                List<SubmittersNewRow> richTextSubmittersNewRowList = snapshot.data!;

                                                                                return RichText(
                                                                                  textScaler: MediaQuery.of(context).textScaler,
                                                                                  text: TextSpan(
                                                                                    children: [
                                                                                      const TextSpan(
                                                                                        text: 'Vidéos reçues : ',
                                                                                        style: TextStyle(),
                                                                                      ),
                                                                                      TextSpan(
                                                                                        text: richTextSubmittersNewRowList.length.toString(),
                                                                                        style: const TextStyle(
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                      )
                                                                                    ],
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Manrope',
                                                                                          fontSize: 18,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ),
                                                                            Builder(
                                                                              builder: (context) => FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  FFAppState().colorChange = false;
                                                                                  safeSetState(() {});
                                                                                  await showDialog(
                                                                                    context: context,
                                                                                    builder: (dialogContext) {
                                                                                      return Dialog(
                                                                                        elevation: 0,
                                                                                        insetPadding: EdgeInsets.zero,
                                                                                        backgroundColor: Colors.transparent,
                                                                                        alignment: const AlignmentDirectional(0, 0).resolve(Directionality.of(context)),
                                                                                        child: GestureDetector(
                                                                                          onTap: () => FocusScope.of(dialogContext).unfocus(),
                                                                                          child: SizedBox(
                                                                                            height: 830,
                                                                                            width: 1000,
                                                                                            child: ChangeColorWidget(
                                                                                              title: flowsItem.colorTitle!,
                                                                                              text: flowsItem.colorText!,
                                                                                              button: flowsItem.colorButton!,
                                                                                              buttonTxt: flowsItem.colorButtonText!,
                                                                                              background: flowsItem.colorBG,
                                                                                              id: flowsItem.id,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  );

                                                                                  if (FFAppState().colorChange) {
                                                                                    safeSetState(() => _model.requestCompleter = null);
                                                                                    await _model.waitForRequestCompleted();
                                                                                  } else {
                                                                                    return;
                                                                                  }
                                                                                },
                                                                                text: 'Modifier page accueil',
                                                                                icon: const Icon(
                                                                                  Icons.mode_edit,
                                                                                  size: 15,
                                                                                ),
                                                                                options: FFButtonOptions(
                                                                                  height: 40,
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                                                                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                                  color: FlutterFlowTheme.of(context).revoSearchBarBg,
                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: 'Manrope',
                                                                                        color: const Color(0xFF5E35B1),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                  elevation: 0,
                                                                                  borderSide: const BorderSide(
                                                                                    color: Colors.transparent,
                                                                                    width: 0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(16),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Builder(
                                                                              builder: (context) => FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  FFAppState().colorChange = false;
                                                                                  safeSetState(() {});
                                                                                  await showDialog(
                                                                                    context: context,
                                                                                    builder: (dialogContext) {
                                                                                      return Dialog(
                                                                                        elevation: 0,
                                                                                        insetPadding: EdgeInsets.zero,
                                                                                        backgroundColor: Colors.transparent,
                                                                                        alignment: const AlignmentDirectional(0, 0).resolve(Directionality.of(context)),
                                                                                        child: GestureDetector(
                                                                                          onTap: () => FocusScope.of(dialogContext).unfocus(),
                                                                                          child: SizedBox(
                                                                                            height: 770,
                                                                                            width: 750,
                                                                                            child: ChangeQuestionWidget(
                                                                                              id: flowsItem.id,
                                                                                              question: flowsItem.expla2!,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  );

                                                                                  if (FFAppState().colorChange) {
                                                                                    safeSetState(() => _model.requestCompleter = null);
                                                                                    await _model.waitForRequestCompleted();
                                                                                  } else {
                                                                                    return;
                                                                                  }
                                                                                },
                                                                                text: 'Modifier question',
                                                                                icon: const Icon(
                                                                                  Icons.mode_edit,
                                                                                  size: 15,
                                                                                ),
                                                                                options: FFButtonOptions(
                                                                                  height: 40,
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                                                                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                                  color: FlutterFlowTheme.of(context).revoSearchBarBg,
                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: 'Manrope',
                                                                                        color: const Color(0xFF5E35B1),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                  elevation: 0,
                                                                                  borderSide: const BorderSide(
                                                                                    color: Colors.transparent,
                                                                                    width: 0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(16),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ].divide(const SizedBox(height: 12)),
                                                                        ),
                                                                      ),
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          BarcodeWidget(
                                                                            data:
                                                                                valueOrDefault<String>(
                                                                              'app.cogeus.com/home?slug=${flowsItem.slug}',
                                                                              'nocode',
                                                                            ),
                                                                            barcode:
                                                                                Barcode.qrCode(),
                                                                            width:
                                                                                300,
                                                                            height:
                                                                                160,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            errorBuilder: (context, error) =>
                                                                                const SizedBox(
                                                                              width: 300,
                                                                              height: 160,
                                                                            ),
                                                                            drawText:
                                                                                false,
                                                                          ),
                                                                        ].divide(const SizedBox(height: 24)),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ].divide(
                                                                    const SizedBox(
                                                                        height:
                                                                            12)),
                                                              ),
                                                            ),
                                                          );
                                                        }).divide(const SizedBox(
                                                            height: 16)),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
