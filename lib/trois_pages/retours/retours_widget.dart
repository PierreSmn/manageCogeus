import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/row_wiget_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/navbarnav/navbarnav_widget.dart';
import '/tags/choose_muti_tag/choose_muti_tag_widget.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'retours_model.dart';
export 'retours_model.dart';

class RetoursWidget extends StatefulWidget {
  const RetoursWidget({super.key});

  @override
  State<RetoursWidget> createState() => _RetoursWidgetState();
}

class _RetoursWidgetState extends State<RetoursWidget> {
  late RetoursModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RetoursModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.tagId = null;
      safeSetState(() {});
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
        title: 'retours',
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
                    decoration: const BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        wrapWithModel(
                          model: _model.navbarnavModel,
                          updateCallback: () => safeSetState(() {}),
                          child: const NavbarnavWidget(
                            selectedIndex: 2,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).revoBG,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 32.0, 0.0, 20.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Flexible(
                                                flex: 3,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    50.0,
                                                                    0.0,
                                                                    50.0,
                                                                    0.0),
                                                        child:
                                                            SingleChildScrollView(
                                                          controller: _model
                                                              .columnController1,
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.9,
                                                                decoration:
                                                                    const BoxDecoration(),
                                                                child:
                                                                    SingleChildScrollView(
                                                                  controller: _model
                                                                      .columnController2,
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
                                                                            1.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).revoWhite,
                                                                          borderRadius:
                                                                              BorderRadius.circular(16.0),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              16.0,
                                                                              16.0,
                                                                              12.0),
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
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Text(
                                                                                    'Retours sélectionnés',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'GeistSans',
                                                                                          color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                          fontSize: 40.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          useGoogleFonts: false,
                                                                                        ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 0.0, 0.0),
                                                                                    child: FFButtonWidget(
                                                                                      onPressed: () async {
                                                                                        context.pushNamed('invalids');
                                                                                      },
                                                                                      text: 'Voir les vidéos exclues',
                                                                                      options: FFButtonOptions(
                                                                                        height: 26.0,
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                        iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: const Color(0xFFD2D2D2),
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              fontFamily: 'GeistSans',
                                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              useGoogleFonts: false,
                                                                                            ),
                                                                                        elevation: 0.0,
                                                                                        borderSide: const BorderSide(
                                                                                          color: Colors.transparent,
                                                                                          width: 0.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(16.0),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              FutureBuilder<List<TagsRow>>(
                                                                                future: TagsTable().queryRows(
                                                                                  queryFn: (q) => q.eqOrNull(
                                                                                    'brand_name',
                                                                                    FFAppState().activeBrand,
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
                                                                                  List<TagsRow> containerTagsRowList = snapshot.data!;

                                                                                  return Container(
                                                                                    decoration: const BoxDecoration(),
                                                                                    child: SingleChildScrollView(
                                                                                      scrollDirection: Axis.horizontal,
                                                                                      controller: _model.rowController1,
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                            child: InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                _model.tagId = null;
                                                                                                _model.pageselect = 0;
                                                                                                safeSetState(() {});
                                                                                                safeSetState(() => _model.apiRequestCompleter1 = null);
                                                                                                await _model.waitForApiRequestCompleted1();
                                                                                              },
                                                                                              child: Container(
                                                                                                width: 80.0,
                                                                                                height: 36.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: _model.tagId == null ? FlutterFlowTheme.of(context).secondaryBackground : FlutterFlowTheme.of(context).primaryBackground,
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      'Tous',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'GeistSans',
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: false,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Builder(
                                                                                            builder: (context) {
                                                                                              final tags = containerTagsRowList.toList();

                                                                                              return SingleChildScrollView(
                                                                                                scrollDirection: Axis.horizontal,
                                                                                                controller: _model.rowController2,
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: List.generate(tags.length, (tagsIndex) {
                                                                                                    final tagsItem = tags[tagsIndex];
                                                                                                    return InkWell(
                                                                                                      splashColor: Colors.transparent,
                                                                                                      focusColor: Colors.transparent,
                                                                                                      hoverColor: Colors.transparent,
                                                                                                      highlightColor: Colors.transparent,
                                                                                                      onTap: () async {
                                                                                                        _model.tagId = tagsItem.id;
                                                                                                        _model.pageselect = 0;
                                                                                                        safeSetState(() {});
                                                                                                        safeSetState(() => _model.apiRequestCompleter2 = null);
                                                                                                        await _model.waitForApiRequestCompleted2();
                                                                                                      },
                                                                                                      child: Container(
                                                                                                        width: 80.0,
                                                                                                        height: 36.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: _model.tagId == tagsItem.id ? FlutterFlowTheme.of(context).secondaryBackground : FlutterFlowTheme.of(context).primaryBackground,
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                        ),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              valueOrDefault<String>(
                                                                                                                tagsItem.name,
                                                                                                                'name',
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
                                                                                                    );
                                                                                                  }).divide(const SizedBox(width: 12.0)),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                            child: InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                _model.tagId = 0;
                                                                                                _model.pageselect = 0;
                                                                                                safeSetState(() {});
                                                                                                safeSetState(() => _model.apiRequestCompleter2 = null);
                                                                                                await _model.waitForApiRequestCompleted2();
                                                                                              },
                                                                                              child: Container(
                                                                                                width: 80.0,
                                                                                                height: 36.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: _model.tagId == 0 ? FlutterFlowTheme.of(context).secondaryBackground : FlutterFlowTheme.of(context).primaryBackground,
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      'Non taggé',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'GeistSans',
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: false,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ].divide(const SizedBox(height: 6.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ].divide(const SizedBox(
                                                                        height:
                                                                            24.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              if (_model.tagId != null)
                                                Expanded(
                                                  flex: 12,
                                                  child: SingleChildScrollView(
                                                    controller: _model.loadTags,
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        FutureBuilder<
                                                            ApiCallResponse>(
                                                          future: (_model
                                                                      .apiRequestCompleter2 ??=
                                                                  Completer<
                                                                      ApiCallResponse>()
                                                                    ..complete(
                                                                        GetTagzzzCall
                                                                            .call(
                                                                      brand: FFAppState()
                                                                          .activeBrand,
                                                                      limit: FFAppState()
                                                                          .listQuantitySHow,
                                                                      offset: (_model
                                                                              .pageselect!) *
                                                                          FFAppState()
                                                                              .listQuantitySHow,
                                                                      tagid: _model
                                                                          .tagId,
                                                                    )))
                                                              .future,
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      SpinKitRing(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 50.0,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            final loadTagsGetTagzzzResponse =
                                                                snapshot.data!;

                                                            return Container(
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              child: Padding(
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        50.0,
                                                                        0.0,
                                                                        50.0,
                                                                        0.0),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final validItem =
                                                                        loadTagsGetTagzzzResponse
                                                                            .jsonBody
                                                                            .toList();

                                                                    return Wrap(
                                                                      spacing:
                                                                          16.0,
                                                                      runSpacing:
                                                                          16.0,
                                                                      alignment:
                                                                          WrapAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          WrapCrossAlignment
                                                                              .start,
                                                                      direction:
                                                                          Axis.horizontal,
                                                                      runAlignment:
                                                                          WrapAlignment
                                                                              .start,
                                                                      verticalDirection:
                                                                          VerticalDirection
                                                                              .down,
                                                                      clipBehavior:
                                                                          Clip.none,
                                                                      children: List.generate(
                                                                          validItem
                                                                              .length,
                                                                          (validItemIndex) {
                                                                        final validItemItem =
                                                                            validItem[validItemIndex];
                                                                        return Container(
                                                                          width:
                                                                              330.0,
                                                                          height:
                                                                              530.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).revoWhite,
                                                                            borderRadius:
                                                                                BorderRadius.circular(16.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                16.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Flexible(
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      FlutterFlowVideoPlayer(
                                                                                        path: getJsonField(
                                                                                          validItemItem,
                                                                                          r'''$.media_link''',
                                                                                        ).toString(),
                                                                                        videoType: VideoType.network,
                                                                                        width: 230.0,
                                                                                        height: 200.0,
                                                                                        autoPlay: false,
                                                                                        looping: true,
                                                                                        showControls: true,
                                                                                        allowFullScreen: true,
                                                                                        allowPlaybackSpeedMenu: false,
                                                                                        lazyLoad: false,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  width: 300.0,
                                                                                  decoration: const BoxDecoration(),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                            getJsonField(
                                                                                              validItemItem,
                                                                                              r'''$.submitter_name''',
                                                                                            ).toString(),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'GeistSans',
                                                                                                  fontSize: 16.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                  useGoogleFonts: false,
                                                                                                ),
                                                                                          ),
                                                                                          SelectionArea(
                                                                                              child: Text(
                                                                                            getJsonField(
                                                                                              validItemItem,
                                                                                              r'''$.email''',
                                                                                            ).toString(),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'GeistSans',
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w300,
                                                                                                  useGoogleFonts: false,
                                                                                                ),
                                                                                          )),
                                                                                        ],
                                                                                      ),
                                                                                      if (_model.tagId != null)
                                                                                        Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            RichText(
                                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                                              text: TextSpan(
                                                                                                children: const [
                                                                                                  TextSpan(
                                                                                                    text: 'Tags',
                                                                                                    style: TextStyle(),
                                                                                                  )
                                                                                                ],
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'GeistSans',
                                                                                                      fontSize: 12.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: false,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            RowWigetWidget(
                                                                                              key: Key('Keybbq_${validItemIndex}_of_${validItem.length}'),
                                                                                              parameter1: getJsonField(
                                                                                                validItemItem,
                                                                                                r'''$.tagId''',
                                                                                                true,
                                                                                              ),
                                                                                              parameter2: getJsonField(
                                                                                                validItemItem,
                                                                                                r'''$.tagId''',
                                                                                              ),
                                                                                            ),
                                                                                            Builder(
                                                                                              builder: (context) => Padding(
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 0.0, 0.0),
                                                                                                child: FFButtonWidget(
                                                                                                  onPressed: () async {
                                                                                                    FFAppState().tagList = [];
                                                                                                    safeSetState(() {});
                                                                                                    FFAppState().tagList = getJsonField(
                                                                                                      validItemItem,
                                                                                                      r'''$.tagId''',
                                                                                                      true,
                                                                                                    )!
                                                                                                        .toList()
                                                                                                        .cast<int>();
                                                                                                    safeSetState(() {});
                                                                                                    await showDialog(
                                                                                                      context: context,
                                                                                                      builder: (dialogContext) {
                                                                                                        return Dialog(
                                                                                                          elevation: 0,
                                                                                                          insetPadding: EdgeInsets.zero,
                                                                                                          backgroundColor: Colors.transparent,
                                                                                                          alignment: const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                          child: WebViewAware(
                                                                                                            child: GestureDetector(
                                                                                                              onTap: () {
                                                                                                                FocusScope.of(dialogContext).unfocus();
                                                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                                                              },
                                                                                                              child: const SizedBox(
                                                                                                                height: 435.0,
                                                                                                                width: 245.0,
                                                                                                                child: ChooseMutiTagWidget(),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                    );

                                                                                                    await ValidSubsTable().update(
                                                                                                      data: {
                                                                                                        'tagId': FFAppState().tagList,
                                                                                                      },
                                                                                                      matchingRows: (rows) => rows.eqOrNull(
                                                                                                        'id',
                                                                                                        getJsonField(
                                                                                                          validItemItem,
                                                                                                          r'''$.id''',
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                    FFAppState().clearUsersSpeTagsCacheKey(getJsonField(
                                                                                                      validItemItem,
                                                                                                      r'''$.tagId''',
                                                                                                    ).toString());
                                                                                                    safeSetState(() => _model.apiRequestCompleter2 = null);
                                                                                                    await _model.waitForApiRequestCompleted2();
                                                                                                  },
                                                                                                  text: 'Ajouter un Tag',
                                                                                                  options: FFButtonOptions(
                                                                                                    height: 26.0,
                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                    color: const Color(0xFFEEE8FC),
                                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                          fontFamily: 'GeistSans',
                                                                                                          color: const Color(0xFF5E35B1),
                                                                                                          fontSize: 15.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          useGoogleFonts: false,
                                                                                                        ),
                                                                                                    elevation: 0.0,
                                                                                                    borderSide: const BorderSide(
                                                                                                      color: Colors.transparent,
                                                                                                      width: 0.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ].divide(const SizedBox(height: 4.0)),
                                                                                        ),
                                                                                      Builder(
                                                                                        builder: (context) => InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            await showDialog(
                                                                                              context: context,
                                                                                              builder: (dialogContext) {
                                                                                                return Dialog(
                                                                                                  elevation: 0,
                                                                                                  insetPadding: EdgeInsets.zero,
                                                                                                  backgroundColor: Colors.transparent,
                                                                                                  alignment: const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                  child: WebViewAware(
                                                                                                    child: GestureDetector(
                                                                                                      onTap: () {
                                                                                                        FocusScope.of(dialogContext).unfocus();
                                                                                                        FocusManager.instance.primaryFocus?.unfocus();
                                                                                                      },
                                                                                                      child: const ChooseMutiTagWidget(),
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            );
                                                                                          },
                                                                                          child: RichText(
                                                                                            textScaler: MediaQuery.of(context).textScaler,
                                                                                            text: TextSpan(
                                                                                              children: [
                                                                                                const TextSpan(
                                                                                                  text: 'Projet concerné : \n',
                                                                                                  style: TextStyle(),
                                                                                                ),
                                                                                                TextSpan(
                                                                                                  text: getJsonField(
                                                                                                    validItemItem,
                                                                                                    r'''$.slugDone''',
                                                                                                  ).toString(),
                                                                                                  style: const TextStyle(
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                    fontSize: 14.0,
                                                                                                  ),
                                                                                                )
                                                                                              ],
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'GeistSans',
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: false,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      SelectionArea(
                                                                                          child: Text(
                                                                                        getJsonField(
                                                                                          validItemItem,
                                                                                          r'''$.transcription''',
                                                                                        ).toString(),
                                                                                        maxLines: 4,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'GeistSans',
                                                                                              fontSize: 12.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: false,
                                                                                            ),
                                                                                      )),
                                                                                    ].divide(const SizedBox(height: 12.0)).addToStart(const SizedBox(height: 12.0)),
                                                                                  ),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          FFButtonWidget(
                                                                                            onPressed: () async {
                                                                                              await launchURL('${getJsonField(
                                                                                                validItemItem,
                                                                                                r'''$.media_link''',
                                                                                              ).toString()}?download=${getJsonField(
                                                                                                validItemItem,
                                                                                                r'''$.slugDone''',
                                                                                              ).toString()}.mp4');
                                                                                            },
                                                                                            text: 'Télécharger',
                                                                                            icon: const Icon(
                                                                                              Icons.download_rounded,
                                                                                              size: 15.0,
                                                                                            ),
                                                                                            options: FFButtonOptions(
                                                                                              width: 200.0,
                                                                                              height: 30.0,
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                              color: FlutterFlowTheme.of(context).cogeusNavSelected,
                                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                    fontFamily: 'GeistSans',
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    useGoogleFonts: false,
                                                                                                  ),
                                                                                              elevation: 0.0,
                                                                                              borderSide: const BorderSide(
                                                                                                color: Colors.transparent,
                                                                                                width: 0.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                          ),
                                                                                          FFButtonWidget(
                                                                                            onPressed: () async {
                                                                                              await RejectedSubsTable().insert({
                                                                                                'submitter_name': getJsonField(
                                                                                                  validItemItem,
                                                                                                  r'''$.submitter_name''',
                                                                                                ).toString(),
                                                                                                'media_link': getJsonField(
                                                                                                  validItemItem,
                                                                                                  r'''$.media_link''',
                                                                                                ).toString(),
                                                                                                'brand_name': getJsonField(
                                                                                                  validItemItem,
                                                                                                  r'''$.brand_name''',
                                                                                                ).toString(),
                                                                                                'slugDone': getJsonField(
                                                                                                  validItemItem,
                                                                                                  r'''$.slugDone''',
                                                                                                ).toString(),
                                                                                                'email': getJsonField(
                                                                                                  validItemItem,
                                                                                                  r'''$.email''',
                                                                                                ).toString(),
                                                                                                'submitter_surname': getJsonField(
                                                                                                  validItemItem,
                                                                                                  r'''$.submitter_name''',
                                                                                                ).toString(),
                                                                                                'transcription': getJsonField(
                                                                                                  validItemItem,
                                                                                                  r'''$.transcription''',
                                                                                                ).toString(),
                                                                                                'rating': getJsonField(
                                                                                                  validItemItem,
                                                                                                  r'''$.rating''',
                                                                                                ),
                                                                                                'boolMail': getJsonField(
                                                                                                  validItemItem,
                                                                                                  r'''$.boolMail''',
                                                                                                ),
                                                                                                'question': getJsonField(
                                                                                                  validItemItem,
                                                                                                  r'''$.question''',
                                                                                                ).toString(),
                                                                                              });
                                                                                              await ValidSubsTable().delete(
                                                                                                matchingRows: (rows) => rows.eqOrNull(
                                                                                                  'id',
                                                                                                  getJsonField(
                                                                                                    validItemItem,
                                                                                                    r'''$.id''',
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                              safeSetState(() => _model.apiRequestCompleter2 = null);
                                                                                              await _model.waitForApiRequestCompleted2();
                                                                                            },
                                                                                            text: 'Exclure',
                                                                                            icon: const Icon(
                                                                                              Icons.close_sharp,
                                                                                              size: 15.0,
                                                                                            ),
                                                                                            options: FFButtonOptions(
                                                                                              width: 200.0,
                                                                                              height: 25.0,
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                              color: const Color(0xFFD2D2D2),
                                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                    fontFamily: 'GeistSans',
                                                                                                    color: FlutterFlowTheme.of(context).secondary,
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    useGoogleFonts: false,
                                                                                                  ),
                                                                                              elevation: 0.0,
                                                                                              borderSide: const BorderSide(
                                                                                                color: Colors.transparent,
                                                                                                width: 0.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(const SizedBox(height: 8.0)).addToEnd(const SizedBox(height: 16.0)),
                                                                                      ),
                                                                                    ),
                                                                                  ].divide(const SizedBox(width: 8.0)),
                                                                                ),
                                                                              ].divide(const SizedBox(height: 12.0)),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          16.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  if (_model
                                                                          .pageselect !=
                                                                      0)
                                                                    FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        _model.pageselect =
                                                                            _model.pageselect! +
                                                                                -1;
                                                                        safeSetState(
                                                                            () {});
                                                                        await _model
                                                                            .loadTags
                                                                            ?.animateTo(
                                                                          0,
                                                                          duration:
                                                                              const Duration(milliseconds: 1),
                                                                          curve:
                                                                              Curves.ease,
                                                                        );
                                                                        safeSetState(() =>
                                                                            _model.apiRequestCompleter2 =
                                                                                null);
                                                                        await _model
                                                                            .waitForApiRequestCompleted2();
                                                                      },
                                                                      text:
                                                                          'Page précedente',
                                                                      options:
                                                                          FFButtonOptions(
                                                                        height:
                                                                            40.0,
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            24.0,
                                                                            0.0,
                                                                            24.0,
                                                                            0.0),
                                                                        iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: const Color(
                                                                            0xFFEEE8FC),
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: 'GeistSans',
                                                                              color: const Color(0xFF5E35B1),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                        elevation:
                                                                            0.0,
                                                                        borderSide:
                                                                            const BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                          width:
                                                                              0.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                  FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      _model.pageselect =
                                                                          _model.pageselect! +
                                                                              1;
                                                                      safeSetState(
                                                                          () {});
                                                                      await _model
                                                                          .loadTags
                                                                          ?.animateTo(
                                                                        0,
                                                                        duration:
                                                                            const Duration(milliseconds: 1),
                                                                        curve: Curves
                                                                            .ease,
                                                                      );
                                                                      safeSetState(() =>
                                                                          _model.apiRequestCompleter2 =
                                                                              null);
                                                                      await _model
                                                                          .waitForApiRequestCompleted2();
                                                                    },
                                                                    text:
                                                                        'Page suivante',
                                                                    options:
                                                                        FFButtonOptions(
                                                                      height:
                                                                          40.0,
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: const Color(
                                                                          0xFFEEE8FC),
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'GeistSans',
                                                                            color:
                                                                                const Color(0xFF5E35B1),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                      elevation:
                                                                          0.0,
                                                                      borderSide:
                                                                          const BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            0.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                ].divide(const SizedBox(
                                                                    width:
                                                                        16.0)),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          50.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    'Affichage par : ',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'GeistSans',
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      FFAppState()
                                                                          .listQuantitySHow = 9;
                                                                      safeSetState(
                                                                          () {});
                                                                      safeSetState(() =>
                                                                          _model.apiRequestCompleter2 =
                                                                              null);
                                                                      await _model
                                                                          .waitForApiRequestCompleted2();
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: FFAppState().listQuantitySHow ==
                                                                              9
                                                                          ? 50.0
                                                                          : 25.0,
                                                                      height:
                                                                          30.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .revoWhite,
                                                                        borderRadius:
                                                                            BorderRadius.circular(16.0),
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            '9',
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'GeistSans',
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      FFAppState()
                                                                          .listQuantitySHow = 18;
                                                                      safeSetState(
                                                                          () {});
                                                                      safeSetState(() =>
                                                                          _model.apiRequestCompleter2 =
                                                                              null);
                                                                      await _model
                                                                          .waitForApiRequestCompleted2();
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: FFAppState().listQuantitySHow ==
                                                                              18
                                                                          ? 50.0
                                                                          : 25.0,
                                                                      height:
                                                                          30.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .revoWhite,
                                                                        borderRadius:
                                                                            BorderRadius.circular(16.0),
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            '18',
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'GeistSans',
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      FFAppState()
                                                                          .listQuantitySHow = 36;
                                                                      safeSetState(
                                                                          () {});
                                                                      safeSetState(() =>
                                                                          _model.apiRequestCompleter2 =
                                                                              null);
                                                                      await _model
                                                                          .waitForApiRequestCompleted2();
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: FFAppState().listQuantitySHow ==
                                                                              36
                                                                          ? 50.0
                                                                          : 25.0,
                                                                      height:
                                                                          30.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .revoWhite,
                                                                        borderRadius:
                                                                            BorderRadius.circular(16.0),
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            '36',
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'GeistSans',
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ].divide(const SizedBox(
                                                                    width:
                                                                        6.0)),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              if (_model.tagId == null)
                                                Expanded(
                                                  flex: 12,
                                                  child: SingleChildScrollView(
                                                    controller: _model.loadall,
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        FutureBuilder<
                                                            ApiCallResponse>(
                                                          future: (_model
                                                                      .apiRequestCompleter1 ??=
                                                                  Completer<
                                                                      ApiCallResponse>()
                                                                    ..complete(
                                                                        GetValidSubsCall
                                                                            .call(
                                                                      brand: FFAppState()
                                                                          .activeBrand,
                                                                      limit: FFAppState()
                                                                          .listQuantitySHow,
                                                                      offset: (_model
                                                                              .pageselect!) *
                                                                          FFAppState()
                                                                              .listQuantitySHow,
                                                                    )))
                                                              .future,
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      SpinKitRing(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 50.0,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            final loadAllGetValidSubsResponse =
                                                                snapshot.data!;

                                                            return Container(
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              child: Padding(
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        50.0,
                                                                        0.0,
                                                                        50.0,
                                                                        0.0),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final validItem =
                                                                        loadAllGetValidSubsResponse
                                                                            .jsonBody
                                                                            .toList();

                                                                    return Wrap(
                                                                      spacing:
                                                                          16.0,
                                                                      runSpacing:
                                                                          16.0,
                                                                      alignment:
                                                                          WrapAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          WrapCrossAlignment
                                                                              .start,
                                                                      direction:
                                                                          Axis.horizontal,
                                                                      runAlignment:
                                                                          WrapAlignment
                                                                              .start,
                                                                      verticalDirection:
                                                                          VerticalDirection
                                                                              .down,
                                                                      clipBehavior:
                                                                          Clip.none,
                                                                      children: List.generate(
                                                                          validItem
                                                                              .length,
                                                                          (validItemIndex) {
                                                                        final validItemItem =
                                                                            validItem[validItemIndex];
                                                                        return Container(
                                                                          width:
                                                                              330.0,
                                                                          height:
                                                                              530.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).revoWhite,
                                                                            borderRadius:
                                                                                BorderRadius.circular(16.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                16.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Flexible(
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      FlutterFlowVideoPlayer(
                                                                                        path: getJsonField(
                                                                                          validItemItem,
                                                                                          r'''$.media_link''',
                                                                                        ).toString(),
                                                                                        videoType: VideoType.network,
                                                                                        width: 260.0,
                                                                                        height: 200.0,
                                                                                        autoPlay: false,
                                                                                        looping: true,
                                                                                        showControls: true,
                                                                                        allowFullScreen: true,
                                                                                        allowPlaybackSpeedMenu: false,
                                                                                        lazyLoad: false,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  width: 300.0,
                                                                                  decoration: const BoxDecoration(),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                            getJsonField(
                                                                                              validItemItem,
                                                                                              r'''$.submitter_name''',
                                                                                            ).toString(),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'GeistSans',
                                                                                                  fontSize: 16.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                  useGoogleFonts: false,
                                                                                                ),
                                                                                          ),
                                                                                          SelectionArea(
                                                                                              child: Text(
                                                                                            getJsonField(
                                                                                              validItemItem,
                                                                                              r'''$.email''',
                                                                                            ).toString(),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'GeistSans',
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w300,
                                                                                                  useGoogleFonts: false,
                                                                                                ),
                                                                                          )),
                                                                                        ],
                                                                                      ),
                                                                                      Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          RichText(
                                                                                            textScaler: MediaQuery.of(context).textScaler,
                                                                                            text: TextSpan(
                                                                                              children: const [
                                                                                                TextSpan(
                                                                                                  text: 'Tags',
                                                                                                  style: TextStyle(),
                                                                                                )
                                                                                              ],
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'GeistSans',
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: false,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          RowWigetWidget(
                                                                                            key: Key('Keyxb3_${validItemIndex}_of_${validItem.length}'),
                                                                                            parameter1: getJsonField(
                                                                                              validItemItem,
                                                                                              r'''$.tagId''',
                                                                                              true,
                                                                                            ),
                                                                                            parameter2: getJsonField(
                                                                                              validItemItem,
                                                                                              r'''$.tagId''',
                                                                                            ),
                                                                                          ),
                                                                                          Builder(
                                                                                            builder: (context) => Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 0.0, 0.0),
                                                                                              child: FFButtonWidget(
                                                                                                onPressed: () async {
                                                                                                  if (getJsonField(
                                                                                                        validItemItem,
                                                                                                        r'''$.tagId''',
                                                                                                      ) !=
                                                                                                      null) {
                                                                                                    FFAppState().tagList = getJsonField(
                                                                                                      validItemItem,
                                                                                                      r'''$.tagId''',
                                                                                                      true,
                                                                                                    )!
                                                                                                        .toList()
                                                                                                        .cast<int>();
                                                                                                    safeSetState(() {});
                                                                                                  } else {
                                                                                                    FFAppState().tagList = [];
                                                                                                    safeSetState(() {});
                                                                                                  }

                                                                                                  await showDialog(
                                                                                                    context: context,
                                                                                                    builder: (dialogContext) {
                                                                                                      return Dialog(
                                                                                                        elevation: 0,
                                                                                                        insetPadding: EdgeInsets.zero,
                                                                                                        backgroundColor: Colors.transparent,
                                                                                                        alignment: const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                        child: WebViewAware(
                                                                                                          child: GestureDetector(
                                                                                                            onTap: () {
                                                                                                              FocusScope.of(dialogContext).unfocus();
                                                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                                                            },
                                                                                                            child: const SizedBox(
                                                                                                              height: 435.0,
                                                                                                              width: 245.0,
                                                                                                              child: ChooseMutiTagWidget(),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  );

                                                                                                  if (!(FFAppState().tagChoosen != null)) {
                                                                                                    var confirmDialogResponse = await showDialog<bool>(
                                                                                                          context: context,
                                                                                                          builder: (alertDialogContext) {
                                                                                                            return WebViewAware(
                                                                                                              child: AlertDialog(
                                                                                                                title: const Text('Erreur'),
                                                                                                                content: const Text('Vous devez choisir un Tag pour continuer'),
                                                                                                                actions: [
                                                                                                                  TextButton(
                                                                                                                    onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                                    child: const Text('Retour'),
                                                                                                                  ),
                                                                                                                  TextButton(
                                                                                                                    onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                                    child: const Text('Confirmer'),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            );
                                                                                                          },
                                                                                                        ) ??
                                                                                                        false;
                                                                                                    return;
                                                                                                  }
                                                                                                  await ValidSubsTable().update(
                                                                                                    data: {
                                                                                                      'tagId': FFAppState().tagList,
                                                                                                    },
                                                                                                    matchingRows: (rows) => rows.eqOrNull(
                                                                                                      'id',
                                                                                                      getJsonField(
                                                                                                        validItemItem,
                                                                                                        r'''$.id''',
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                  FFAppState().clearUsersSpeTagsCacheKey(getJsonField(
                                                                                                    validItemItem,
                                                                                                    r'''$.tagId''',
                                                                                                  ).toString());
                                                                                                  safeSetState(() => _model.apiRequestCompleter1 = null);
                                                                                                  await _model.waitForApiRequestCompleted1();
                                                                                                },
                                                                                                text: 'Changer de Tag',
                                                                                                options: FFButtonOptions(
                                                                                                  height: 26.0,
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                  color: const Color(0xFFEEE8FC),
                                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                        fontFamily: 'GeistSans',
                                                                                                        color: const Color(0xFF5E35B1),
                                                                                                        fontSize: 15.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        useGoogleFonts: false,
                                                                                                      ),
                                                                                                  elevation: 0.0,
                                                                                                  borderSide: const BorderSide(
                                                                                                    color: Colors.transparent,
                                                                                                    width: 0.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(const SizedBox(height: 4.0)),
                                                                                      ),
                                                                                      RichText(
                                                                                        textScaler: MediaQuery.of(context).textScaler,
                                                                                        text: TextSpan(
                                                                                          children: [
                                                                                            const TextSpan(
                                                                                              text: 'Projet concerné : \n',
                                                                                              style: TextStyle(),
                                                                                            ),
                                                                                            TextSpan(
                                                                                              text: getJsonField(
                                                                                                validItemItem,
                                                                                                r'''$.slugDone''',
                                                                                              ).toString(),
                                                                                              style: const TextStyle(
                                                                                                fontWeight: FontWeight.w600,
                                                                                                fontSize: 14.0,
                                                                                              ),
                                                                                            )
                                                                                          ],
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'GeistSans',
                                                                                                fontSize: 12.0,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: false,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      SelectionArea(
                                                                                          child: Text(
                                                                                        getJsonField(
                                                                                          validItemItem,
                                                                                          r'''$.transcription''',
                                                                                        ).toString(),
                                                                                        maxLines: 4,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'GeistSans',
                                                                                              fontSize: 12.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: false,
                                                                                            ),
                                                                                      )),
                                                                                    ].divide(const SizedBox(height: 12.0)).addToStart(const SizedBox(height: 12.0)),
                                                                                  ),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          FFButtonWidget(
                                                                                            onPressed: () async {
                                                                                              await launchURL('${getJsonField(
                                                                                                validItemItem,
                                                                                                r'''$.media_link''',
                                                                                              ).toString()}?download=${getJsonField(
                                                                                                validItemItem,
                                                                                                r'''$.slugDone''',
                                                                                              ).toString()}.mp4');
                                                                                            },
                                                                                            text: 'Télécharger',
                                                                                            icon: const Icon(
                                                                                              Icons.download_rounded,
                                                                                              size: 15.0,
                                                                                            ),
                                                                                            options: FFButtonOptions(
                                                                                              width: 200.0,
                                                                                              height: 30.0,
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                              color: FlutterFlowTheme.of(context).cogeusNavSelected,
                                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                    fontFamily: 'GeistSans',
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    useGoogleFonts: false,
                                                                                                  ),
                                                                                              elevation: 0.0,
                                                                                              borderSide: const BorderSide(
                                                                                                color: Colors.transparent,
                                                                                                width: 0.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                          ),
                                                                                          FFButtonWidget(
                                                                                            onPressed: () async {
                                                                                              await RejectedSubsTable().insert({
                                                                                                'submitter_name': getJsonField(
                                                                                                  validItemItem,
                                                                                                  r'''$.submitter_name''',
                                                                                                ).toString(),
                                                                                                'media_link': getJsonField(
                                                                                                  validItemItem,
                                                                                                  r'''$.media_link''',
                                                                                                ).toString(),
                                                                                                'brand_name': getJsonField(
                                                                                                  validItemItem,
                                                                                                  r'''$.brand_name''',
                                                                                                ).toString(),
                                                                                                'slugDone': getJsonField(
                                                                                                  validItemItem,
                                                                                                  r'''$.slugDone''',
                                                                                                ).toString(),
                                                                                                'email': getJsonField(
                                                                                                  validItemItem,
                                                                                                  r'''$.email''',
                                                                                                ).toString(),
                                                                                                'submitter_surname': getJsonField(
                                                                                                  validItemItem,
                                                                                                  r'''$.submitter_name''',
                                                                                                ).toString(),
                                                                                                'transcription': getJsonField(
                                                                                                  validItemItem,
                                                                                                  r'''$.transcription''',
                                                                                                ).toString(),
                                                                                                'rating': getJsonField(
                                                                                                  validItemItem,
                                                                                                  r'''$.rating''',
                                                                                                ),
                                                                                                'boolMail': getJsonField(
                                                                                                  validItemItem,
                                                                                                  r'''$.boolMail''',
                                                                                                ),
                                                                                                'question': getJsonField(
                                                                                                  validItemItem,
                                                                                                  r'''$.question''',
                                                                                                ).toString(),
                                                                                              });
                                                                                              await ValidSubsTable().delete(
                                                                                                matchingRows: (rows) => rows.eqOrNull(
                                                                                                  'id',
                                                                                                  getJsonField(
                                                                                                    validItemItem,
                                                                                                    r'''$.id''',
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                              safeSetState(() => _model.apiRequestCompleter1 = null);
                                                                                              await _model.waitForApiRequestCompleted1();
                                                                                            },
                                                                                            text: 'Exclure',
                                                                                            icon: const Icon(
                                                                                              Icons.close_sharp,
                                                                                              size: 15.0,
                                                                                            ),
                                                                                            options: FFButtonOptions(
                                                                                              width: 200.0,
                                                                                              height: 25.0,
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                              color: const Color(0xFFD2D2D2),
                                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                    fontFamily: 'GeistSans',
                                                                                                    color: FlutterFlowTheme.of(context).secondary,
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    useGoogleFonts: false,
                                                                                                  ),
                                                                                              elevation: 0.0,
                                                                                              borderSide: const BorderSide(
                                                                                                color: Colors.transparent,
                                                                                                width: 0.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(const SizedBox(height: 8.0)).addToEnd(const SizedBox(height: 16.0)),
                                                                                      ),
                                                                                    ),
                                                                                  ].divide(const SizedBox(width: 8.0)),
                                                                                ),
                                                                              ].divide(const SizedBox(height: 12.0)),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          16.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  if (_model
                                                                          .pageselect !=
                                                                      0)
                                                                    FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        _model.pageselect =
                                                                            _model.pageselect! +
                                                                                -1;
                                                                        safeSetState(
                                                                            () {});
                                                                        await _model
                                                                            .loadall
                                                                            ?.animateTo(
                                                                          0,
                                                                          duration:
                                                                              const Duration(milliseconds: 1),
                                                                          curve:
                                                                              Curves.ease,
                                                                        );
                                                                        safeSetState(() =>
                                                                            _model.apiRequestCompleter1 =
                                                                                null);
                                                                        await _model
                                                                            .waitForApiRequestCompleted1();
                                                                      },
                                                                      text:
                                                                          'Page précedente',
                                                                      options:
                                                                          FFButtonOptions(
                                                                        height:
                                                                            40.0,
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            24.0,
                                                                            0.0,
                                                                            24.0,
                                                                            0.0),
                                                                        iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: const Color(
                                                                            0xFFEEE8FC),
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: 'GeistSans',
                                                                              color: const Color(0xFF5E35B1),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                        elevation:
                                                                            0.0,
                                                                        borderSide:
                                                                            const BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                          width:
                                                                              0.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                  FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      _model.pageselect =
                                                                          _model.pageselect! +
                                                                              1;
                                                                      safeSetState(
                                                                          () {});
                                                                      await _model
                                                                          .loadall
                                                                          ?.animateTo(
                                                                        0,
                                                                        duration:
                                                                            const Duration(milliseconds: 1),
                                                                        curve: Curves
                                                                            .ease,
                                                                      );
                                                                      safeSetState(() =>
                                                                          _model.apiRequestCompleter1 =
                                                                              null);
                                                                      await _model
                                                                          .waitForApiRequestCompleted1();
                                                                    },
                                                                    text:
                                                                        'Page suivante',
                                                                    options:
                                                                        FFButtonOptions(
                                                                      height:
                                                                          40.0,
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: const Color(
                                                                          0xFFEEE8FC),
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'GeistSans',
                                                                            color:
                                                                                const Color(0xFF5E35B1),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                      elevation:
                                                                          0.0,
                                                                      borderSide:
                                                                          const BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            0.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                ].divide(const SizedBox(
                                                                    width:
                                                                        16.0)),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          50.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    'Affichage par : ',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'GeistSans',
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      FFAppState()
                                                                          .listQuantitySHow = 9;
                                                                      safeSetState(
                                                                          () {});
                                                                      safeSetState(() =>
                                                                          _model.apiRequestCompleter1 =
                                                                              null);
                                                                      await _model
                                                                          .waitForApiRequestCompleted1();
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: FFAppState().listQuantitySHow ==
                                                                              9
                                                                          ? 50.0
                                                                          : 25.0,
                                                                      height:
                                                                          30.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .revoWhite,
                                                                        borderRadius:
                                                                            BorderRadius.circular(16.0),
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            '9',
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'GeistSans',
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      FFAppState()
                                                                          .listQuantitySHow = 18;
                                                                      safeSetState(
                                                                          () {});
                                                                      safeSetState(() =>
                                                                          _model.apiRequestCompleter1 =
                                                                              null);
                                                                      await _model
                                                                          .waitForApiRequestCompleted1();
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: FFAppState().listQuantitySHow ==
                                                                              18
                                                                          ? 50.0
                                                                          : 25.0,
                                                                      height:
                                                                          30.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .revoWhite,
                                                                        borderRadius:
                                                                            BorderRadius.circular(16.0),
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            '18',
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'GeistSans',
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      FFAppState()
                                                                          .listQuantitySHow = 36;
                                                                      safeSetState(
                                                                          () {});
                                                                      safeSetState(() =>
                                                                          _model.apiRequestCompleter1 =
                                                                              null);
                                                                      await _model
                                                                          .waitForApiRequestCompleted1();
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: FFAppState().listQuantitySHow ==
                                                                              36
                                                                          ? 50.0
                                                                          : 25.0,
                                                                      height:
                                                                          30.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .revoWhite,
                                                                        borderRadius:
                                                                            BorderRadius.circular(16.0),
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            '36',
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'GeistSans',
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ].divide(const SizedBox(
                                                                    width:
                                                                        6.0)),
                                                              ),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              height: 6.0)),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                            ].divide(const SizedBox(height: 16.0)),
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
