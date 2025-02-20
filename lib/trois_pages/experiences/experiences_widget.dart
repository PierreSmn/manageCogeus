import '/backend/supabase/supabase.dart';
import '/components/experiencee_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/navbarnav/navbarnav_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'experiences_model.dart';
export 'experiences_model.dart';

class ExperiencesWidget extends StatefulWidget {
  const ExperiencesWidget({super.key});

  static String routeName = 'experiences';
  static String routePath = '/experiences';

  @override
  State<ExperiencesWidget> createState() => _ExperiencesWidgetState();
}

class _ExperiencesWidgetState extends State<ExperiencesWidget> {
  late ExperiencesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExperiencesModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if ((FFAppState().activeClientID == null) ||
          (FFAppState().activeBrand == '') ||
          (FFAppState().activeClientID == 0)) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                title: Text('Attention'),
                content: Text('Vous devez remettre à jour votre profil.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              ),
            );
          },
        );

        context.pushNamed(UpdateProfileWidget.routeName);
      }
    });

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
        title: 'experiences',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).revoBG,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FutureBuilder<List<ClientsRow>>(
                    future: FFAppState().clientQuery(
                      uniqueQueryKey: FFAppState().activeClientID.toString(),
                      requestFn: () => ClientsTable().querySingleRow(
                        queryFn: (q) => q.eqOrNull(
                          'id',
                          FFAppState().activeClientID,
                        ),
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
                      List<ClientsRow> containerClientsRowList = snapshot.data!;

                      final containerClientsRow =
                          containerClientsRowList.isNotEmpty
                              ? containerClientsRowList.first
                              : null;

                      return Container(
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            wrapWithModel(
                              model: _model.navbarnavModel,
                              updateCallback: () => safeSetState(() {}),
                              child: NavbarnavWidget(
                                selectedIndex: 6,
                              ),
                            ),
                            Expanded(
                              child: Stack(
                                children: [
                                  Builder(
                                    builder: (context) {
                                      if ((FFAppState().isBrand == true) &&
                                          (FFAppState().isBU == false) &&
                                          (FFAppState().isLoc == false)) {
                                        return Container(
                                          decoration: BoxDecoration(),
                                          child: FutureBuilder<
                                              List<ExperiencesRow>>(
                                            future:
                                                ExperiencesTable().queryRows(
                                              queryFn: (q) => q
                                                  .eqOrNull(
                                                    'client_id',
                                                    FFAppState().activeClientID,
                                                  )
                                                  .order('created_at'),
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
                                              List<ExperiencesRow>
                                                  containerExperiencesRowList =
                                                  snapshot.data!;

                                              return Container(
                                                decoration: BoxDecoration(),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .revoBG,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                50.0,
                                                                32.0,
                                                                50.0,
                                                                40.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    SingleChildScrollView(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.7,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                SingleChildScrollView(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Text(
                                                                                        'Experiences Globale -',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'GeistSans',
                                                                                              color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                              fontSize: 44.72,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              useGoogleFonts: false,
                                                                                            ),
                                                                                      ),
                                                                                      Text(
                                                                                        FFAppState().activeBrand,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'GeistSans',
                                                                                              color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                              fontSize: 44.72,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              useGoogleFonts: false,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ].divide(SizedBox(height: 24.0)),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Flexible(
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Container(
                                                                                  width: valueOrDefault<double>(
                                                                                    _model.showExperience ? 900.0 : 1000.0,
                                                                                    900.0,
                                                                                  ),
                                                                                  height: 720.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: SingleChildScrollView(
                                                                                    scrollDirection: Axis.horizontal,
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        SingleChildScrollView(
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Container(
                                                                                                height: 50.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).revoBG,
                                                                                                ),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Container(
                                                                                                      width: 50.0,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Text(
                                                                                                        'Score',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'GeistSans',
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: false,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: 100.0,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Text(
                                                                                                        'Date',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'GeistSans',
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: false,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: 150.0,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Text(
                                                                                                        'Raison',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'GeistSans',
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: false,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: 150.0,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Text(
                                                                                                        'Autre raison',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'GeistSans',
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: false,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: 150.0,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Text(
                                                                                                        'Redirection',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'GeistSans',
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: false,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: 150.0,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Text(
                                                                                                        'Feedback',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'GeistSans',
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: false,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ].divide(SizedBox(width: 20.0)).addToStart(SizedBox(width: 10.0)),
                                                                                                ),
                                                                                              ),
                                                                                              Builder(
                                                                                                builder: (context) {
                                                                                                  final experience = containerExperiencesRowList.toList();

                                                                                                  return SingleChildScrollView(
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: List.generate(experience.length, (experienceIndex) {
                                                                                                        final experienceItem = experience[experienceIndex];
                                                                                                        return InkWell(
                                                                                                          splashColor: Colors.transparent,
                                                                                                          focusColor: Colors.transparent,
                                                                                                          hoverColor: Colors.transparent,
                                                                                                          highlightColor: Colors.transparent,
                                                                                                          onTap: () async {
                                                                                                            _model.showExperience = true;
                                                                                                            _model.xid = experienceItem.id;
                                                                                                            _model.t1 = containerClientsRow?.theme1;
                                                                                                            _model.t2 = containerClientsRow?.theme2;
                                                                                                            _model.t3 = containerClientsRow?.theme3;
                                                                                                            _model.t4 = containerClientsRow?.theme4;
                                                                                                            safeSetState(() {});
                                                                                                          },
                                                                                                          child: Container(
                                                                                                            height: 50.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).revoBG,
                                                                                                              boxShadow: [
                                                                                                                BoxShadow(
                                                                                                                  blurRadius: 0.0,
                                                                                                                  color: Color(0x33000000),
                                                                                                                  offset: Offset(
                                                                                                                    0.0,
                                                                                                                    -1.0,
                                                                                                                  ),
                                                                                                                )
                                                                                                              ],
                                                                                                            ),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Container(
                                                                                                                  width: 50.0,
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Container(
                                                                                                                        width: 30.0,
                                                                                                                        height: 30.0,
                                                                                                                        decoration: BoxDecoration(
                                                                                                                          color: () {
                                                                                                                            if (experienceItem.nps! > 8) {
                                                                                                                              return FlutterFlowTheme.of(context).vertSympa;
                                                                                                                            } else if (experienceItem.nps! < 7) {
                                                                                                                              return Color(0xFFB55254);
                                                                                                                            } else {
                                                                                                                              return FlutterFlowTheme.of(context).tertiary;
                                                                                                                            }
                                                                                                                          }(),
                                                                                                                          borderRadius: BorderRadius.circular(100.0),
                                                                                                                        ),
                                                                                                                        child: Column(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                          children: [
                                                                                                                            Text(
                                                                                                                              valueOrDefault<String>(
                                                                                                                                experienceItem.nps?.toString(),
                                                                                                                                'unknown',
                                                                                                                              ),
                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                    fontFamily: 'GeistSans',
                                                                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                    useGoogleFonts: false,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  width: 100.0,
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: Text(
                                                                                                                    dateTimeFormat("d/M H:mm", experienceItem.createdAt),
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'GeistSans',
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          useGoogleFonts: false,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  width: 150.0,
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: Text(
                                                                                                                    valueOrDefault<String>(
                                                                                                                      experienceItem.theme,
                                                                                                                      '-',
                                                                                                                    ),
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'GeistSans',
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          useGoogleFonts: false,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  width: 150.0,
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        valueOrDefault<String>(
                                                                                                                          experienceItem.feedback,
                                                                                                                          '-',
                                                                                                                        ).maybeHandleOverflow(
                                                                                                                          maxChars: 15,
                                                                                                                          replacement: '…',
                                                                                                                        ),
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: 'GeistSans',
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              useGoogleFonts: false,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  width: 150.0,
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: Text(
                                                                                                                    () {
                                                                                                                      if (experienceItem.reviewDone == true) {
                                                                                                                        return 'Avis';
                                                                                                                      } else if (experienceItem.videoDone == true) {
                                                                                                                        return 'Vidéo';
                                                                                                                      } else if (experienceItem.feedbackAnswer == true) {
                                                                                                                        return 'Feedback';
                                                                                                                      } else {
                                                                                                                        return '-';
                                                                                                                      }
                                                                                                                    }(),
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'GeistSans',
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          useGoogleFonts: false,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  width: 150.0,
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        valueOrDefault<String>(
                                                                                                                          experienceItem.feedbackCustomText,
                                                                                                                          '-',
                                                                                                                        ).maybeHandleOverflow(
                                                                                                                          maxChars: 15,
                                                                                                                          replacement: '…',
                                                                                                                        ),
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: 'GeistSans',
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              useGoogleFonts: false,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ].divide(SizedBox(width: 20.0)).addToStart(SizedBox(width: 10.0)),
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      }),
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      } else if ((FFAppState().isBrand ==
                                              false) &&
                                          (FFAppState().isBU == true) &&
                                          (FFAppState().isLoc == false)) {
                                        return Container(
                                          decoration: BoxDecoration(),
                                          child: FutureBuilder<
                                              List<ExperiencesRow>>(
                                            future:
                                                ExperiencesTable().queryRows(
                                              queryFn: (q) => q
                                                  .eqOrNull(
                                                    'bu_id',
                                                    FFAppState().activeClientID,
                                                  )
                                                  .order('created_at'),
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
                                              List<ExperiencesRow>
                                                  containerExperiencesRowList =
                                                  snapshot.data!;

                                              return Container(
                                                decoration: BoxDecoration(),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .revoBG,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                50.0,
                                                                32.0,
                                                                50.0,
                                                                40.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    SingleChildScrollView(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.7,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                SingleChildScrollView(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Text(
                                                                                        'Experiences Globale -',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'GeistSans',
                                                                                              color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                              fontSize: 44.72,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              useGoogleFonts: false,
                                                                                            ),
                                                                                      ),
                                                                                      Text(
                                                                                        FFAppState().activeBrand,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'GeistSans',
                                                                                              color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                              fontSize: 44.72,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              useGoogleFonts: false,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ].divide(SizedBox(height: 24.0)),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Flexible(
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Container(
                                                                                  width: valueOrDefault<double>(
                                                                                    _model.showExperience ? 900.0 : 1000.0,
                                                                                    900.0,
                                                                                  ),
                                                                                  height: 720.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: SingleChildScrollView(
                                                                                    scrollDirection: Axis.horizontal,
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        SingleChildScrollView(
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Container(
                                                                                                height: 50.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).revoBG,
                                                                                                ),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Container(
                                                                                                      width: 50.0,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Text(
                                                                                                        'Score',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'GeistSans',
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: false,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: 100.0,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Text(
                                                                                                        'Date',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'GeistSans',
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: false,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: 150.0,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Text(
                                                                                                        'Raison',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'GeistSans',
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: false,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: 150.0,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Text(
                                                                                                        'Autre raison',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'GeistSans',
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: false,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: 150.0,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Text(
                                                                                                        'Redirection',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'GeistSans',
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: false,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: 150.0,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Text(
                                                                                                        'Feedback',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'GeistSans',
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: false,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ].divide(SizedBox(width: 20.0)).addToStart(SizedBox(width: 10.0)),
                                                                                                ),
                                                                                              ),
                                                                                              Builder(
                                                                                                builder: (context) {
                                                                                                  final experience = containerExperiencesRowList.toList();

                                                                                                  return SingleChildScrollView(
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: List.generate(experience.length, (experienceIndex) {
                                                                                                        final experienceItem = experience[experienceIndex];
                                                                                                        return InkWell(
                                                                                                          splashColor: Colors.transparent,
                                                                                                          focusColor: Colors.transparent,
                                                                                                          hoverColor: Colors.transparent,
                                                                                                          highlightColor: Colors.transparent,
                                                                                                          onTap: () async {
                                                                                                            _model.showExperience = true;
                                                                                                            _model.xid = experienceItem.id;
                                                                                                            _model.t1 = containerClientsRow?.theme1;
                                                                                                            _model.t2 = containerClientsRow?.theme2;
                                                                                                            _model.t3 = containerClientsRow?.theme3;
                                                                                                            _model.t4 = containerClientsRow?.theme4;
                                                                                                            safeSetState(() {});
                                                                                                          },
                                                                                                          child: Container(
                                                                                                            height: 50.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).revoBG,
                                                                                                              boxShadow: [
                                                                                                                BoxShadow(
                                                                                                                  blurRadius: 0.0,
                                                                                                                  color: Color(0x33000000),
                                                                                                                  offset: Offset(
                                                                                                                    0.0,
                                                                                                                    -1.0,
                                                                                                                  ),
                                                                                                                )
                                                                                                              ],
                                                                                                            ),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Container(
                                                                                                                  width: 50.0,
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Container(
                                                                                                                        width: 30.0,
                                                                                                                        height: 30.0,
                                                                                                                        decoration: BoxDecoration(
                                                                                                                          color: () {
                                                                                                                            if (experienceItem.nps! > 8) {
                                                                                                                              return FlutterFlowTheme.of(context).vertSympa;
                                                                                                                            } else if (experienceItem.nps! < 7) {
                                                                                                                              return Color(0xFFB55254);
                                                                                                                            } else {
                                                                                                                              return FlutterFlowTheme.of(context).tertiary;
                                                                                                                            }
                                                                                                                          }(),
                                                                                                                          borderRadius: BorderRadius.circular(100.0),
                                                                                                                        ),
                                                                                                                        child: Column(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                          children: [
                                                                                                                            Text(
                                                                                                                              valueOrDefault<String>(
                                                                                                                                experienceItem.nps?.toString(),
                                                                                                                                'unknown',
                                                                                                                              ),
                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                    fontFamily: 'GeistSans',
                                                                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                    useGoogleFonts: false,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  width: 100.0,
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: Text(
                                                                                                                    dateTimeFormat("d/M H:mm", experienceItem.createdAt),
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'GeistSans',
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          useGoogleFonts: false,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  width: 150.0,
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: Text(
                                                                                                                    valueOrDefault<String>(
                                                                                                                      experienceItem.theme,
                                                                                                                      '-',
                                                                                                                    ),
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'GeistSans',
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          useGoogleFonts: false,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  width: 150.0,
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        valueOrDefault<String>(
                                                                                                                          experienceItem.feedback,
                                                                                                                          '-',
                                                                                                                        ).maybeHandleOverflow(
                                                                                                                          maxChars: 15,
                                                                                                                          replacement: '…',
                                                                                                                        ),
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: 'GeistSans',
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              useGoogleFonts: false,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  width: 150.0,
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: Text(
                                                                                                                    () {
                                                                                                                      if (experienceItem.reviewDone == true) {
                                                                                                                        return 'Avis';
                                                                                                                      } else if (experienceItem.videoDone == true) {
                                                                                                                        return 'Vidéo';
                                                                                                                      } else if (experienceItem.feedbackAnswer == true) {
                                                                                                                        return 'Feedback';
                                                                                                                      } else {
                                                                                                                        return '-';
                                                                                                                      }
                                                                                                                    }(),
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'GeistSans',
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          useGoogleFonts: false,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  width: 150.0,
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        valueOrDefault<String>(
                                                                                                                          experienceItem.feedbackCustomText,
                                                                                                                          '-',
                                                                                                                        ).maybeHandleOverflow(
                                                                                                                          maxChars: 15,
                                                                                                                          replacement: '…',
                                                                                                                        ),
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: 'GeistSans',
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              useGoogleFonts: false,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ].divide(SizedBox(width: 20.0)).addToStart(SizedBox(width: 10.0)),
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      }),
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      } else {
                                        return Container(
                                          decoration: BoxDecoration(),
                                          child: FutureBuilder<
                                              List<ExperiencesRow>>(
                                            future:
                                                ExperiencesTable().queryRows(
                                              queryFn: (q) => q
                                                  .eqOrNull(
                                                    'loc_id',
                                                    FFAppState().activeClientID,
                                                  )
                                                  .order('created_at'),
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
                                              List<ExperiencesRow>
                                                  containerExperiencesRowList =
                                                  snapshot.data!;

                                              return Container(
                                                decoration: BoxDecoration(),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .revoBG,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                50.0,
                                                                32.0,
                                                                50.0,
                                                                40.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    SingleChildScrollView(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.7,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                SingleChildScrollView(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Text(
                                                                                        'Experiences Globale -',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'GeistSans',
                                                                                              color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                              fontSize: 44.72,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              useGoogleFonts: false,
                                                                                            ),
                                                                                      ),
                                                                                      Text(
                                                                                        FFAppState().activeBrand,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'GeistSans',
                                                                                              color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                              fontSize: 44.72,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              useGoogleFonts: false,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ].divide(SizedBox(height: 24.0)),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Flexible(
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Container(
                                                                                  width: valueOrDefault<double>(
                                                                                    _model.showExperience ? 900.0 : 1000.0,
                                                                                    900.0,
                                                                                  ),
                                                                                  height: 720.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: SingleChildScrollView(
                                                                                    scrollDirection: Axis.horizontal,
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        SingleChildScrollView(
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Container(
                                                                                                height: 50.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).revoBG,
                                                                                                ),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Container(
                                                                                                      width: 50.0,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Text(
                                                                                                        'Score',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'GeistSans',
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: false,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: 100.0,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Text(
                                                                                                        'Date',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'GeistSans',
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: false,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: 150.0,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Text(
                                                                                                        'Raison',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'GeistSans',
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: false,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: 150.0,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Text(
                                                                                                        'Autre raison',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'GeistSans',
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: false,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: 150.0,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Text(
                                                                                                        'Redirection',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'GeistSans',
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: false,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: 150.0,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Text(
                                                                                                        'Feedback',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'GeistSans',
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: false,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ].divide(SizedBox(width: 20.0)).addToStart(SizedBox(width: 10.0)),
                                                                                                ),
                                                                                              ),
                                                                                              Builder(
                                                                                                builder: (context) {
                                                                                                  final experience = containerExperiencesRowList.toList();

                                                                                                  return SingleChildScrollView(
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: List.generate(experience.length, (experienceIndex) {
                                                                                                        final experienceItem = experience[experienceIndex];
                                                                                                        return InkWell(
                                                                                                          splashColor: Colors.transparent,
                                                                                                          focusColor: Colors.transparent,
                                                                                                          hoverColor: Colors.transparent,
                                                                                                          highlightColor: Colors.transparent,
                                                                                                          onTap: () async {
                                                                                                            _model.showExperience = true;
                                                                                                            _model.xid = experienceItem.id;
                                                                                                            _model.t1 = containerClientsRow?.theme1;
                                                                                                            _model.t2 = containerClientsRow?.theme2;
                                                                                                            _model.t3 = containerClientsRow?.theme3;
                                                                                                            _model.t4 = containerClientsRow?.theme4;
                                                                                                            safeSetState(() {});
                                                                                                          },
                                                                                                          child: Container(
                                                                                                            height: 50.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).revoBG,
                                                                                                              boxShadow: [
                                                                                                                BoxShadow(
                                                                                                                  blurRadius: 0.0,
                                                                                                                  color: Color(0x33000000),
                                                                                                                  offset: Offset(
                                                                                                                    0.0,
                                                                                                                    -1.0,
                                                                                                                  ),
                                                                                                                )
                                                                                                              ],
                                                                                                            ),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Container(
                                                                                                                  width: 50.0,
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Container(
                                                                                                                        width: 30.0,
                                                                                                                        height: 30.0,
                                                                                                                        decoration: BoxDecoration(
                                                                                                                          color: () {
                                                                                                                            if (experienceItem.nps! > 8) {
                                                                                                                              return FlutterFlowTheme.of(context).vertSympa;
                                                                                                                            } else if (experienceItem.nps! < 7) {
                                                                                                                              return Color(0xFFB55254);
                                                                                                                            } else {
                                                                                                                              return FlutterFlowTheme.of(context).tertiary;
                                                                                                                            }
                                                                                                                          }(),
                                                                                                                          borderRadius: BorderRadius.circular(100.0),
                                                                                                                        ),
                                                                                                                        child: Column(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                          children: [
                                                                                                                            Text(
                                                                                                                              valueOrDefault<String>(
                                                                                                                                experienceItem.nps?.toString(),
                                                                                                                                'unknown',
                                                                                                                              ),
                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                    fontFamily: 'GeistSans',
                                                                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                    useGoogleFonts: false,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  width: 100.0,
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: Text(
                                                                                                                    dateTimeFormat("d/M H:mm", experienceItem.createdAt),
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'GeistSans',
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          useGoogleFonts: false,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  width: 150.0,
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: Text(
                                                                                                                    valueOrDefault<String>(
                                                                                                                      experienceItem.theme,
                                                                                                                      '-',
                                                                                                                    ),
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'GeistSans',
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          useGoogleFonts: false,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  width: 150.0,
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        valueOrDefault<String>(
                                                                                                                          experienceItem.feedback,
                                                                                                                          '-',
                                                                                                                        ).maybeHandleOverflow(
                                                                                                                          maxChars: 15,
                                                                                                                          replacement: '…',
                                                                                                                        ),
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: 'GeistSans',
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              useGoogleFonts: false,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  width: 150.0,
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: Text(
                                                                                                                    () {
                                                                                                                      if (experienceItem.reviewDone == true) {
                                                                                                                        return 'Avis';
                                                                                                                      } else if (experienceItem.videoDone == true) {
                                                                                                                        return 'Vidéo';
                                                                                                                      } else if (experienceItem.feedbackAnswer == true) {
                                                                                                                        return 'Feedback';
                                                                                                                      } else {
                                                                                                                        return '-';
                                                                                                                      }
                                                                                                                    }(),
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'GeistSans',
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          useGoogleFonts: false,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  width: 150.0,
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        valueOrDefault<String>(
                                                                                                                          experienceItem.feedbackCustomText,
                                                                                                                          '-',
                                                                                                                        ).maybeHandleOverflow(
                                                                                                                          maxChars: 15,
                                                                                                                          replacement: '…',
                                                                                                                        ),
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: 'GeistSans',
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              useGoogleFonts: false,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ].divide(SizedBox(width: 20.0)).addToStart(SizedBox(width: 10.0)),
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      }),
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                  if (_model.showExperience)
                                    Align(
                                      alignment: AlignmentDirectional(0.9, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 20.0, 5.0, 5.0),
                                        child: Container(
                                          width: 350.0,
                                          height: 650.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 2.0,
                                                color: Color(0x33000000),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 0.0),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 0.0,
                                                                0.0, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderRadius: 8.0,
                                                      buttonSize: 40.0,
                                                      icon: Icon(
                                                        Icons.close,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        size: 24.0,
                                                      ),
                                                      onPressed: () async {
                                                        _model.showExperience =
                                                            false;
                                                        safeSetState(() {});
                                                      },
                                                    ),
                                                  ),
                                                  wrapWithModel(
                                                    model:
                                                        _model.experienceeModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: ExperienceeWidget(
                                                      xid: _model.xid!,
                                                      t1: _model.t1!,
                                                      t2: _model.t2!,
                                                      t3: _model.t3!,
                                                      t4: _model.t4!,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
