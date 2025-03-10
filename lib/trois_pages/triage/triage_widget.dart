import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/empty_list_widget/empty_list_widget_widget.dart';
import '/pages/navbarnav/navbarnav_widget.dart';
import '/tags/choose_muti_tag/choose_muti_tag_widget.dart';
import '/index.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'triage_model.dart';
export 'triage_model.dart';

class TriageWidget extends StatefulWidget {
  const TriageWidget({super.key});

  static String routeName = 'triage';
  static String routePath = '/triage';

  @override
  State<TriageWidget> createState() => _TriageWidgetState();
}

class _TriageWidgetState extends State<TriageWidget> {
  late TriageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TriageModel());

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
        title: 'triage',
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
                  Container(
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        wrapWithModel(
                          model: _model.navbarnavModel,
                          updateCallback: () => safeSetState(() {}),
                          child: NavbarnavWidget(
                            selectedIndex: 4,
                          ),
                        ),
                        Expanded(
                          child: FutureBuilder<List<NewSubsRow>>(
                            future: (_model.requestCompleter ??=
                                    Completer<List<NewSubsRow>>()
                                      ..complete(NewSubsTable().queryRows(
                                        queryFn: (q) => q
                                            .eqOrNull(
                                              'brand_name',
                                              FFAppState().activeBrand,
                                            )
                                            .order('id', ascending: true),
                                      )))
                                .future,
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: SpinKitRing(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 50.0,
                                    ),
                                  ),
                                );
                              }
                              List<NewSubsRow> containerNewSubsRowList =
                                  snapshot.data!;

                              return Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).revoBG,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      50.0, 0.0, 0.0, 20.0),
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
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Flexible(
                                                    child: Builder(
                                                      builder: (context) {
                                                        final listSubs =
                                                            containerNewSubsRowList
                                                                .toList();
                                                        if (listSubs.isEmpty) {
                                                          return EmptyListWidgetWidget();
                                                        }

                                                        return Container(
                                                          width: 700.0,
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        40.0),
                                                            child: PageView
                                                                .builder(
                                                              physics:
                                                                  const NeverScrollableScrollPhysics(),
                                                              controller: _model
                                                                      .pageViewController ??=
                                                                  PageController(
                                                                      initialPage: max(
                                                                          0,
                                                                          min(0,
                                                                              listSubs.length - 1))),
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              itemCount:
                                                                  listSubs
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  listSubsIndex) {
                                                                final listSubsItem =
                                                                    listSubs[
                                                                        listSubsIndex];
                                                                return Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          20.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        800.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .revoWhite,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              16.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              32.0),
                                                                      child:
                                                                          SingleChildScrollView(
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Container(
                                                                                  width: 300.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        RichText(
                                                                                          textScaler: MediaQuery.of(context).textScaler,
                                                                                          text: TextSpan(
                                                                                            children: [
                                                                                              TextSpan(
                                                                                                text: 'Reste à trier: ',
                                                                                                style: TextStyle(),
                                                                                              ),
                                                                                              TextSpan(
                                                                                                text: containerNewSubsRowList.length >= 1000 ? '+ de 1000' : containerNewSubsRowList.length.toString(),
                                                                                                style: TextStyle(
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                              )
                                                                                            ],
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'GeistSans',
                                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: false,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Text(
                                                                                          'Contenu provenant de ',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'GeistSans',
                                                                                                color: FlutterFlowTheme.of(context).revoCardTextColorUnselected,
                                                                                                fontSize: 16.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w300,
                                                                                                useGoogleFonts: false,
                                                                                              ),
                                                                                        ),
                                                                                        Text(
                                                                                          valueOrDefault<String>(
                                                                                            listSubsItem.submitterName,
                                                                                            'John',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'GeistSans',
                                                                                                color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                                fontSize: 46.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                                useGoogleFonts: false,
                                                                                              ),
                                                                                        ),
                                                                                        Text(
                                                                                          'Transcription',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'GeistSans',
                                                                                                color: FlutterFlowTheme.of(context).revoCardTextColorUnselected,
                                                                                                fontSize: 24.72,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.normal,
                                                                                                useGoogleFonts: false,
                                                                                              ),
                                                                                        ),
                                                                                        Container(
                                                                                          width: 200.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: SingleChildScrollView(
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                RichText(
                                                                                                  textScaler: MediaQuery.of(context).textScaler,
                                                                                                  text: TextSpan(
                                                                                                    children: [
                                                                                                      TextSpan(
                                                                                                        text: '\"',
                                                                                                        style: TextStyle(),
                                                                                                      ),
                                                                                                      TextSpan(
                                                                                                        text: valueOrDefault<String>(
                                                                                                          listSubsItem.transcription,
                                                                                                          'Indisponible.',
                                                                                                        ),
                                                                                                        style: TextStyle(),
                                                                                                      ),
                                                                                                      TextSpan(
                                                                                                        text: '\"',
                                                                                                        style: TextStyle(),
                                                                                                      )
                                                                                                    ],
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'GeistSans',
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: false,
                                                                                                        ),
                                                                                                  ),
                                                                                                  maxLines: 7,
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 12.0)),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    FlutterFlowVideoPlayer(
                                                                                      path: listSubsItem.mediaLink!,
                                                                                      videoType: VideoType.network,
                                                                                      width: 270.0,
                                                                                      height: 470.0,
                                                                                      autoPlay: false,
                                                                                      looping: true,
                                                                                      showControls: true,
                                                                                      allowFullScreen: true,
                                                                                      allowPlaybackSpeedMenu: false,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      await RejectedSubsTable().insert({
                                                                                        'created_at': supaSerialize<DateTime>(listSubsItem.createdAt),
                                                                                        'submitter_name': listSubsItem.submitterName,
                                                                                        'media_link': listSubsItem.mediaLink,
                                                                                        'brand_name': listSubsItem.brandName,
                                                                                        'slugDone': listSubsItem.flowDone,
                                                                                        'email': listSubsItem.email,
                                                                                        'submitter_surname': listSubsItem.submitterSurname,
                                                                                        'transcription': listSubsItem.transcription,
                                                                                        'rating': listSubsItem.rating,
                                                                                        'boolMail': listSubsItem.boolMail,
                                                                                        'question': listSubsItem.question,
                                                                                        'club_rugby': listSubsItem.clubRugby,
                                                                                        'instagram': listSubsItem.instagram,
                                                                                      });
                                                                                      await NewSubsTable().delete(
                                                                                        matchingRows: (rows) => rows.eqOrNull(
                                                                                          'id',
                                                                                          listSubsItem.id,
                                                                                        ),
                                                                                      );
                                                                                      safeSetState(() => _model.requestCompleter = null);
                                                                                      await _model.waitForRequestCompleted();
                                                                                    },
                                                                                    text: 'Exclure',
                                                                                    options: FFButtonOptions(
                                                                                      width: 220.0,
                                                                                      height: 60.0,
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            fontFamily: 'GeistSans',
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            fontSize: 18.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                            useGoogleFonts: false,
                                                                                          ),
                                                                                      elevation: 0.0,
                                                                                      borderSide: BorderSide(
                                                                                        color: Colors.transparent,
                                                                                        width: 0.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(16.0),
                                                                                    ),
                                                                                  ),
                                                                                  Builder(
                                                                                    builder: (context) => FFButtonWidget(
                                                                                      onPressed: () async {
                                                                                        FFAppState().tagList = [];
                                                                                        safeSetState(() {});
                                                                                        await showDialog(
                                                                                          context: context,
                                                                                          builder: (dialogContext) {
                                                                                            return Dialog(
                                                                                              elevation: 0,
                                                                                              insetPadding: EdgeInsets.zero,
                                                                                              backgroundColor: Colors.transparent,
                                                                                              alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                              child: WebViewAware(
                                                                                                child: GestureDetector(
                                                                                                  onTap: () {
                                                                                                    FocusScope.of(dialogContext).unfocus();
                                                                                                    FocusManager.instance.primaryFocus?.unfocus();
                                                                                                  },
                                                                                                  child: Container(
                                                                                                    height: 435.0,
                                                                                                    width: 245.0,
                                                                                                    child: ChooseMutiTagWidget(),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        );

                                                                                        await ValidSubsTable().insert({
                                                                                          'created_at': supaSerialize<DateTime>(listSubsItem.createdAt),
                                                                                          'submitter_name': listSubsItem.submitterName,
                                                                                          'media_link': listSubsItem.mediaLink,
                                                                                          'brand_name': listSubsItem.brandName,
                                                                                          'slugDone': listSubsItem.flowDone,
                                                                                          'email': listSubsItem.email,
                                                                                          'submitter_surname': listSubsItem.submitterSurname,
                                                                                          'transcription': listSubsItem.transcription,
                                                                                          'rating': listSubsItem.rating,
                                                                                          'boolMail': listSubsItem.boolMail,
                                                                                          'question': listSubsItem.question,
                                                                                          'tagId': FFAppState().tagList,
                                                                                          'club_rugby': listSubsItem.clubRugby,
                                                                                          'instagram': listSubsItem.instagram,
                                                                                        });
                                                                                        await NewSubsTable().delete(
                                                                                          matchingRows: (rows) => rows.eqOrNull(
                                                                                            'id',
                                                                                            listSubsItem.id,
                                                                                          ),
                                                                                        );
                                                                                        safeSetState(() => _model.requestCompleter = null);
                                                                                        await _model.waitForRequestCompleted();
                                                                                      },
                                                                                      text: 'Sélectionner',
                                                                                      options: FFButtonOptions(
                                                                                        width: 220.0,
                                                                                        height: 60.0,
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: FlutterFlowTheme.of(context).revoCardBlueText,
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              fontFamily: 'GeistSans',
                                                                                              color: FlutterFlowTheme.of(context).revoWhite,
                                                                                              fontSize: 18.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                              useGoogleFonts: false,
                                                                                            ),
                                                                                        elevation: 0.0,
                                                                                        borderSide: BorderSide(
                                                                                          color: Colors.transparent,
                                                                                          width: 0.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(16.0),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 30.0)).around(SizedBox(width: 30.0)),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(height: 12.0)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      context.pushNamed(
                                                          RetoursATrierWidget
                                                              .routeName);
                                                    },
                                                    text:
                                                        'Acceder à la vue d\'ensemble',
                                                    options: FFButtonOptions(
                                                      height: 40.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: Color(0xFFEEE8FC),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'GeistSans',
                                                                color: Color(
                                                                    0xFF5E35B1),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                      elevation: 0.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 0.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ],
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
