import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/empty_list_widget/empty_list_widget_widget.dart';
import '/trois_pages/navbarnav/navbarnav_widget.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'triage_model.dart';
export 'triage_model.dart';

class TriageWidget extends StatefulWidget {
  const TriageWidget({super.key});

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

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: const BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        wrapWithModel(
                          model: _model.navbarnavModel,
                          updateCallback: () => setState(() {}),
                          child: const NavbarnavWidget(
                            selectedIndex: 4,
                          ),
                        ),
                        Expanded(
                          child: FutureBuilder<List<NewSubsRow>>(
                            future: (_model.requestCompleter ??=
                                    Completer<List<NewSubsRow>>()
                                      ..complete(NewSubsTable().queryRows(
                                        queryFn: (q) => q
                                            .eq(
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
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
                                                          return const EmptyListWidgetWidget();
                                                        }
                                                        return SizedBox(
                                                          width: 700.0,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
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
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          60.0,
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
                                                                          const EdgeInsets.all(
                                                                              32.0),
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
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    RichText(
                                                                                      textScaler: MediaQuery.of(context).textScaler,
                                                                                      text: TextSpan(
                                                                                        children: [
                                                                                          const TextSpan(
                                                                                            text: 'Reste à trier: ',
                                                                                            style: TextStyle(),
                                                                                          ),
                                                                                          TextSpan(
                                                                                            text: containerNewSubsRowList.length.toString(),
                                                                                            style: const TextStyle(
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                          )
                                                                                        ],
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Manrope',
                                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Text(
                                                                                      'Contenu provenant de ',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Manrope',
                                                                                            color: FlutterFlowTheme.of(context).revoCardTextColorUnselected,
                                                                                            fontSize: 16.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w300,
                                                                                          ),
                                                                                    ),
                                                                                    Text(
                                                                                      valueOrDefault<String>(
                                                                                        listSubsItem.submitterName,
                                                                                        'John',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Manrope',
                                                                                            color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                            fontSize: 46.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                    ),
                                                                                    RichText(
                                                                                      textScaler: MediaQuery.of(context).textScaler,
                                                                                      text: TextSpan(
                                                                                        children: [
                                                                                          const TextSpan(
                                                                                            text: 'Repond à la question : \n',
                                                                                            style: TextStyle(),
                                                                                          ),
                                                                                          TextSpan(
                                                                                            text: valueOrDefault<String>(
                                                                                              listSubsItem.question,
                                                                                              'Not set',
                                                                                            ),
                                                                                            style: const TextStyle(
                                                                                              fontWeight: FontWeight.w600,
                                                                                              fontSize: 16.0,
                                                                                            ),
                                                                                          )
                                                                                        ],
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Manrope',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    RatingBarIndicator(
                                                                                      itemBuilder: (context, index) => Icon(
                                                                                        Icons.stars_rounded,
                                                                                        color: FlutterFlowTheme.of(context).buttonRevText,
                                                                                      ),
                                                                                      direction: Axis.horizontal,
                                                                                      rating: valueOrDefault<double>(
                                                                                        listSubsItem.rating?.toDouble(),
                                                                                        0.0,
                                                                                      ),
                                                                                      unratedColor: FlutterFlowTheme.of(context).alternate,
                                                                                      itemCount: 5,
                                                                                      itemSize: 30.0,
                                                                                    ),
                                                                                    Text(
                                                                                      'Transcription',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Manrope',
                                                                                            color: FlutterFlowTheme.of(context).revoCardTextColorUnselected,
                                                                                            fontSize: 24.72,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.normal,
                                                                                          ),
                                                                                    ),
                                                                                    Container(
                                                                                      width: 200.0,
                                                                                      decoration: const BoxDecoration(),
                                                                                      child: SingleChildScrollView(
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            RichText(
                                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                                              text: TextSpan(
                                                                                                children: [
                                                                                                  const TextSpan(
                                                                                                    text: '\"',
                                                                                                    style: TextStyle(),
                                                                                                  ),
                                                                                                  TextSpan(
                                                                                                    text: valueOrDefault<String>(
                                                                                                      listSubsItem.transcription,
                                                                                                      'Indisponible.',
                                                                                                    ),
                                                                                                    style: const TextStyle(),
                                                                                                  ),
                                                                                                  const TextSpan(
                                                                                                    text: '\"',
                                                                                                    style: TextStyle(),
                                                                                                  )
                                                                                                ],
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Manrope',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                              maxLines: 7,
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ].divide(const SizedBox(height: 12.0)),
                                                                                ),
                                                                              ),
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  FlutterFlowVideoPlayer(
                                                                                    path: listSubsItem.mediaLink!,
                                                                                    videoType: VideoType.network,
                                                                                    width: 300.0,
                                                                                    height: 500.0,
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
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children:
                                                                                [
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
                                                                                    'transcriptionJson': listSubsItem.transcriptionJson,
                                                                                    'rating': listSubsItem.rating,
                                                                                    'boolMail': listSubsItem.boolMail,
                                                                                    'question': listSubsItem.question,
                                                                                  });
                                                                                  await NewSubsTable().delete(
                                                                                    matchingRows: (rows) => rows.eq(
                                                                                      'id',
                                                                                      listSubsItem.id,
                                                                                    ),
                                                                                  );
                                                                                  setState(() => _model.requestCompleter = null);
                                                                                  await _model.waitForRequestCompleted();
                                                                                },
                                                                                text: 'Exclure',
                                                                                options: FFButtonOptions(
                                                                                  width: 220.0,
                                                                                  height: 60.0,
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: 'Manrope',
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 18.0,
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
                                                                              FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  await ValidSubsTable().insert({
                                                                                    'created_at': supaSerialize<DateTime>(listSubsItem.createdAt),
                                                                                    'submitter_name': listSubsItem.submitterName,
                                                                                    'media_link': listSubsItem.mediaLink,
                                                                                    'brand_name': listSubsItem.brandName,
                                                                                    'slugDone': listSubsItem.flowDone,
                                                                                    'email': listSubsItem.email,
                                                                                    'submitter_surname': listSubsItem.submitterSurname,
                                                                                    'transcription': listSubsItem.transcription,
                                                                                    'transcriptionJson': listSubsItem.transcriptionJson,
                                                                                    'rating': listSubsItem.rating,
                                                                                    'boolMail': listSubsItem.boolMail,
                                                                                    'question': listSubsItem.question,
                                                                                  });
                                                                                  await NewSubsTable().delete(
                                                                                    matchingRows: (rows) => rows.eq(
                                                                                      'id',
                                                                                      listSubsItem.id,
                                                                                    ),
                                                                                  );
                                                                                  setState(() => _model.requestCompleter = null);
                                                                                  await _model.waitForRequestCompleted();
                                                                                },
                                                                                text: 'Sélectionner',
                                                                                options: FFButtonOptions(
                                                                                  width: 220.0,
                                                                                  height: 60.0,
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: FlutterFlowTheme.of(context).revoCardBlueText,
                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: 'Manrope',
                                                                                        color: FlutterFlowTheme.of(context).revoWhite,
                                                                                        fontSize: 18.0,
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
                                                                            ].divide(const SizedBox(width: 30.0)).around(const SizedBox(width: 30.0)),
                                                                          ),
                                                                        ].divide(const SizedBox(height: 12.0)),
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
