import '';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/navbarnav/navbarnav_widget.dart';
import '/tags/choose_muti_tag/choose_muti_tag_widget.dart';
import '/index.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'retours_a_trier_model.dart';
export 'retours_a_trier_model.dart';

class RetoursATrierWidget extends StatefulWidget {
  const RetoursATrierWidget({super.key});

  static String routeName = 'retoursATrier';
  static String routePath = '/retoursatrier';

  @override
  State<RetoursATrierWidget> createState() => _RetoursATrierWidgetState();
}

class _RetoursATrierWidgetState extends State<RetoursATrierWidget> {
  late RetoursATrierModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RetoursATrierModel());

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

    return FutureBuilder<ApiCallResponse>(
      future: (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
            ..complete(GetToBeDeterminedSubsCall.call(
              brand: FFAppState().activeBrand,
              limit: FFAppState().listQuantitySHow,
              offset: (_model.pageselect!) * FFAppState().listQuantitySHow,
            )))
          .future,
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).revoBG,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitRing(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        final retoursATrierGetToBeDeterminedSubsResponse = snapshot.data!;

        return Title(
            title: 'retoursATrier',
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
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
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
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
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.9,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        SingleChildScrollView(
                                                                      controller:
                                                                          _model
                                                                              .columnController2,
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children:
                                                                            [
                                                                          Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 1.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).revoWhite,
                                                                              borderRadius: BorderRadius.circular(16.0),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 28.0, 16.0, 28.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Text(
                                                                                    'Retours à trier',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'GeistSans',
                                                                                          color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                          fontSize: 40.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          useGoogleFonts: false,
                                                                                        ),
                                                                                  ),
                                                                                  FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      context.pushNamed(TriageWidget.routeName);
                                                                                    },
                                                                                    text: 'Interface de tri',
                                                                                    options: FFButtonOptions(
                                                                                      height: 26.0,
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      color: Color(0xFFD2D2D2),
                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            fontFamily: 'GeistSans',
                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            useGoogleFonts: false,
                                                                                          ),
                                                                                      elevation: 0.0,
                                                                                      borderSide: BorderSide(
                                                                                        color: Colors.transparent,
                                                                                        width: 0.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(height: 24.0)),
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
                                                  Expanded(
                                                    flex: 12,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  50.0,
                                                                  0.0,
                                                                  50.0,
                                                                  0.0),
                                                      child:
                                                          SingleChildScrollView(
                                                        controller:
                                                            _model.scroll1,
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
                                                            Builder(
                                                              builder:
                                                                  (context) {
                                                                final validItem =
                                                                    retoursATrierGetToBeDeterminedSubsResponse
                                                                        .jsonBody
                                                                        .toList();

                                                                return Wrap(
                                                                  spacing: 16.0,
                                                                  runSpacing:
                                                                      16.0,
                                                                  alignment:
                                                                      WrapAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      WrapCrossAlignment
                                                                          .start,
                                                                  direction: Axis
                                                                      .horizontal,
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
                                                                        validItem[
                                                                            validItemIndex];
                                                                    return Container(
                                                                      width:
                                                                          330.0,
                                                                      height:
                                                                          530.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .revoWhite,
                                                                        borderRadius:
                                                                            BorderRadius.circular(16.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            16.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children:
                                                                              [
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
                                                                                    height: 430.0,
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
                                                                              decoration: BoxDecoration(),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  RichText(
                                                                                    textScaler: MediaQuery.of(context).textScaler,
                                                                                    text: TextSpan(
                                                                                      children: [
                                                                                        TextSpan(
                                                                                          text: 'Projet concerné : \n',
                                                                                          style: TextStyle(),
                                                                                        ),
                                                                                        TextSpan(
                                                                                          text: getJsonField(
                                                                                            validItemItem,
                                                                                            r'''$.flow_done''',
                                                                                          ).toString(),
                                                                                          style: TextStyle(
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
                                                                                ].divide(SizedBox(height: 12.0)).addToStart(SizedBox(height: 12.0)),
                                                                              ),
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
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
                                                                                              'tagId': FFAppState().tagList,
                                                                                            });
                                                                                            await NewSubsTable().delete(
                                                                                              matchingRows: (rows) => rows.eqOrNull(
                                                                                                'id',
                                                                                                getJsonField(
                                                                                                  validItemItem,
                                                                                                  r'''$.id''',
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                            safeSetState(() => _model.apiRequestCompleter = null);
                                                                                            await _model.waitForApiRequestCompleted();
                                                                                          },
                                                                                          text: 'Valider',
                                                                                          icon: Icon(
                                                                                            Icons.check_sharp,
                                                                                            size: 15.0,
                                                                                          ),
                                                                                          options: FFButtonOptions(
                                                                                            width: 200.0,
                                                                                            height: 25.0,
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                            color: Color(0xFFEAFCE8),
                                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                  fontFamily: 'GeistSans',
                                                                                                  color: Color(0xFF67E32C),
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  useGoogleFonts: false,
                                                                                                ),
                                                                                            elevation: 0.0,
                                                                                            borderSide: BorderSide(
                                                                                              color: Colors.transparent,
                                                                                              width: 0.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
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
                                                                                          await NewSubsTable().delete(
                                                                                            matchingRows: (rows) => rows.eqOrNull(
                                                                                              'id',
                                                                                              getJsonField(
                                                                                                validItemItem,
                                                                                                r'''$.id''',
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                          safeSetState(() => _model.apiRequestCompleter = null);
                                                                                          await _model.waitForApiRequestCompleted();
                                                                                        },
                                                                                        text: 'Exclure',
                                                                                        icon: Icon(
                                                                                          Icons.close_sharp,
                                                                                          size: 15.0,
                                                                                        ),
                                                                                        options: FFButtonOptions(
                                                                                          width: 200.0,
                                                                                          height: 25.0,
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                          color: Color(0xFFD2D2D2),
                                                                                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                fontFamily: 'GeistSans',
                                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                                fontSize: 14.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                                useGoogleFonts: false,
                                                                                              ),
                                                                                          elevation: 0.0,
                                                                                          borderSide: BorderSide(
                                                                                            color: Colors.transparent,
                                                                                            width: 0.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                      ),
                                                                                    ].divide(SizedBox(height: 8.0)).addToEnd(SizedBox(height: 16.0)),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 8.0)),
                                                                            ),
                                                                          ].divide(SizedBox(height: 12.0)),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }),
                                                                );
                                                              },
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
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
                                                                                _model.pageselect! + -1;
                                                                            safeSetState(() {});
                                                                            await _model.scroll1?.animateTo(
                                                                              0,
                                                                              duration: Duration(milliseconds: 1),
                                                                              curve: Curves.ease,
                                                                            );
                                                                            safeSetState(() =>
                                                                                _model.apiRequestCompleter = null);
                                                                            await _model.waitForApiRequestCompleted();
                                                                          },
                                                                          text:
                                                                              'Page précedente',
                                                                          options:
                                                                              FFButtonOptions(
                                                                            height:
                                                                                40.0,
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                24.0,
                                                                                0.0,
                                                                                24.0,
                                                                                0.0),
                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            color:
                                                                                Color(0xFFEEE8FC),
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: 'GeistSans',
                                                                                  color: Color(0xFF5E35B1),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                            elevation:
                                                                                0.0,
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Colors.transparent,
                                                                              width: 0.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                        ),
                                                                      FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          _model.pageselect =
                                                                              _model.pageselect! + 1;
                                                                          safeSetState(
                                                                              () {});
                                                                          await _model
                                                                              .scroll1
                                                                              ?.animateTo(
                                                                            0,
                                                                            duration:
                                                                                Duration(milliseconds: 1),
                                                                            curve:
                                                                                Curves.ease,
                                                                          );
                                                                          safeSetState(() =>
                                                                              _model.apiRequestCompleter = null);
                                                                          await _model
                                                                              .waitForApiRequestCompleted();
                                                                        },
                                                                        text:
                                                                            'Page suivante',
                                                                        options:
                                                                            FFButtonOptions(
                                                                          height:
                                                                              40.0,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              24.0,
                                                                              0.0,
                                                                              24.0,
                                                                              0.0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              Color(0xFFEEE8FC),
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: 'GeistSans',
                                                                                color: Color(0xFF5E35B1),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                useGoogleFonts: false,
                                                                              ),
                                                                          elevation:
                                                                              0.0,
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                0.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            16.0)),
                                                                  ),
                                                                ),
                                                                Row(
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
                                                                            _model.apiRequestCompleter =
                                                                                null);
                                                                        await _model
                                                                            .waitForApiRequestCompleted();
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
                                                                          color:
                                                                              FlutterFlowTheme.of(context).revoWhite,
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
                                                                              textAlign: TextAlign.start,
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
                                                                        FFAppState().listQuantitySHow =
                                                                            18;
                                                                        safeSetState(
                                                                            () {});
                                                                        safeSetState(() =>
                                                                            _model.apiRequestCompleter =
                                                                                null);
                                                                        await _model
                                                                            .waitForApiRequestCompleted();
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
                                                                          color:
                                                                              FlutterFlowTheme.of(context).revoWhite,
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
                                                                              textAlign: TextAlign.start,
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
                                                                        FFAppState().listQuantitySHow =
                                                                            36;
                                                                        safeSetState(
                                                                            () {});
                                                                        safeSetState(() =>
                                                                            _model.apiRequestCompleter =
                                                                                null);
                                                                        await _model
                                                                            .waitForApiRequestCompleted();
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
                                                                          color:
                                                                              FlutterFlowTheme.of(context).revoWhite,
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
                                                                              textAlign: TextAlign.start,
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
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          6.0)),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(
                                                    SizedBox(height: 16.0)),
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
      },
    );
  }
}
