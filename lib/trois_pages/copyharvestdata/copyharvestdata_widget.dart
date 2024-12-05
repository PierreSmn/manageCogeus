import '/backend/supabase/supabase.dart';
import '/components/change_color_widget.dart';
import '/components/change_question_widget.dart';
import '/components/choose_title_harvester_widget.dart';
import '/components/duplicate_harvester_widget.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/navbarnav/navbarnav_widget.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'copyharvestdata_model.dart';
export 'copyharvestdata_model.dart';

class CopyharvestdataWidget extends StatefulWidget {
  const CopyharvestdataWidget({super.key});

  @override
  State<CopyharvestdataWidget> createState() => _CopyharvestdataWidgetState();
}

class _CopyharvestdataWidgetState extends State<CopyharvestdataWidget> {
  late CopyharvestdataModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CopyharvestdataModel());

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
        title: 'copyharvestdata',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
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
                            selectedIndex: 10,
                          ),
                        ),
                        Expanded(
                          child: FutureBuilder<List<LiveFlowsRow>>(
                            future: (_model.requestCompleter ??=
                                    Completer<List<LiveFlowsRow>>()
                                      ..complete(LiveFlowsTable().queryRows(
                                        queryFn: (q) => q
                                            .eq(
                                              'brand_name',
                                              FFAppState().activeBrand,
                                            )
                                            .order('created_at'),
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
                              List<LiveFlowsRow> harvesterssLiveFlowsRowList =
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
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 32.0, 0.0, 0.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final flows =
                                                        harvesterssLiveFlowsRowList
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
                                                            width: 800.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .revoWhite,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(
                                                                          32.0),
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
                                                                      FutureBuilder<
                                                                          List<
                                                                              WebAppActivationsRow>>(
                                                                        future:
                                                                            WebAppActivationsTable().queryRows(
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
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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
                                                                          List<WebAppActivationsRow>
                                                                              containerWebAppActivationsRowList =
                                                                              snapshot.data!;

                                                                          return Container(
                                                                            width:
                                                                                380.0,
                                                                            decoration:
                                                                                const BoxDecoration(),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Text(
                                                                                      valueOrDefault<String>(
                                                                                        flowsItem.title,
                                                                                        'Choisir un titre',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Manrope',
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            fontSize: 26.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.normal,
                                                                                          ),
                                                                                    ),
                                                                                    Builder(
                                                                                      builder: (context) => FlutterFlowIconButton(
                                                                                        borderRadius: 8.0,
                                                                                        buttonSize: 40.0,
                                                                                        icon: Icon(
                                                                                          Icons.edit,
                                                                                          color: FlutterFlowTheme.of(context).tertiary,
                                                                                          size: 20.0,
                                                                                        ),
                                                                                        onPressed: () async {
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
                                                                                                    onTap: () => FocusScope.of(dialogContext).unfocus(),
                                                                                                    child: SizedBox(
                                                                                                      height: 250.0,
                                                                                                      width: 250.0,
                                                                                                      child: ChooseTitleHarvesterWidget(
                                                                                                        harbesterID: flowsItem.id,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          );

                                                                                          safeSetState(() => _model.requestCompleter = null);
                                                                                          await _model.waitForRequestCompleted();
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Text(
                                                                                  valueOrDefault<String>(
                                                                                    flowsItem.slug,
                                                                                    'noneFound',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Manrope',
                                                                                        color: FlutterFlowTheme.of(context).revoCardTextColorUnselected,
                                                                                        fontSize: 18.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.normal,
                                                                                        fontStyle: FontStyle.italic,
                                                                                      ),
                                                                                ),
                                                                                RichText(
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
                                                                                          fontSize: 18.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                RichText(
                                                                                  textScaler: MediaQuery.of(context).textScaler,
                                                                                  text: TextSpan(
                                                                                    children: [
                                                                                      const TextSpan(
                                                                                        text: 'Type :',
                                                                                        style: TextStyle(),
                                                                                      ),
                                                                                      TextSpan(
                                                                                        text: flowsItem.isUpload! ? 'Upload' : 'Harvester Cogeus',
                                                                                        style: TextStyle(
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                      )
                                                                                    ],
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Manrope',
                                                                                          fontSize: 18.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                RichText(
                                                                                  textScaler: MediaQuery.of(context).textScaler,
                                                                                  text: TextSpan(
                                                                                    children: [
                                                                                      const TextSpan(
                                                                                        text: 'Démarrages : ',
                                                                                        style: TextStyle(),
                                                                                      ),
                                                                                      TextSpan(
                                                                                        text: containerWebAppActivationsRowList.length.toString(),
                                                                                        style: const TextStyle(
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                      )
                                                                                    ],
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Manrope',
                                                                                          fontSize: 18.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
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
                                                                                          width: 50.0,
                                                                                          height: 50.0,
                                                                                          child: SpinKitRing(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            size: 50.0,
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
                                                                                              fontSize: 18.0,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ),
                                                                                FutureBuilder<List<DailySlugActivationsCompleteRow>>(
                                                                                  future: DailySlugActivationsCompleteTable().queryRows(
                                                                                    queryFn: (q) => q.eq(
                                                                                      'slug',
                                                                                      flowsItem.slug,
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
                                                                                    List<DailySlugActivationsCompleteRow> chartDailySlugActivationsCompleteRowList = snapshot.data!;

                                                                                    return SizedBox(
                                                                                      width: 370.0,
                                                                                      height: 230.0,
                                                                                      child: FlutterFlowBarChart(
                                                                                        barData: [
                                                                                          FFBarChartData(
                                                                                            yData: chartDailySlugActivationsCompleteRowList.map((e) => e.activationCount).withoutNulls.toList(),
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                          )
                                                                                        ],
                                                                                        xLabels: chartDailySlugActivationsCompleteRowList.map((e) => e.activationDate).withoutNulls.toList().map((e) => e.toString()).toList(),
                                                                                        barWidth: 16.0,
                                                                                        barBorderRadius: BorderRadius.circular(8.0),
                                                                                        groupSpace: 8.0,
                                                                                        alignment: BarChartAlignment.spaceAround,
                                                                                        chartStylingInfo: ChartStylingInfo(
                                                                                          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          showBorder: false,
                                                                                        ),
                                                                                        axisBounds: const AxisBounds(),
                                                                                        xAxisLabelInfo: const AxisLabelInfo(
                                                                                          reservedSize: 28.0,
                                                                                        ),
                                                                                        yAxisLabelInfo: const AxisLabelInfo(
                                                                                          showLabels: true,
                                                                                          labelInterval: 10.0,
                                                                                          reservedSize: 42.0,
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ),
                                                                                Builder(
                                                                                  builder: (context) => Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                    child: FFButtonWidget(
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
                                                                                              alignment: const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                              child: WebViewAware(
                                                                                                child: GestureDetector(
                                                                                                  onTap: () => FocusScope.of(dialogContext).unfocus(),
                                                                                                  child: SizedBox(
                                                                                                    height: 750.0,
                                                                                                    width: 1000.0,
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
                                                                                      options: FFButtonOptions(
                                                                                        height: 40.0,
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                        iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: FlutterFlowTheme.of(context).revoSearchBarBg,
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
                                                                                        borderRadius: BorderRadius.circular(16.0),
                                                                                      ),
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
                                                                                            alignment: const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                            child: WebViewAware(
                                                                                              child: GestureDetector(
                                                                                                onTap: () => FocusScope.of(dialogContext).unfocus(),
                                                                                                child: SizedBox(
                                                                                                  height: 700.0,
                                                                                                  width: 750.0,
                                                                                                  child: ChangeQuestionWidget(
                                                                                                    id: flowsItem.id,
                                                                                                    question: flowsItem.expla2!,
                                                                                                  ),
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
                                                                                    options: FFButtonOptions(
                                                                                      height: 40.0,
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      color: FlutterFlowTheme.of(context).revoSearchBarBg,
                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
                                                                                      borderRadius: BorderRadius.circular(16.0),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Builder(
                                                                                  builder: (context) => FFButtonWidget(
                                                                                    onPressed: () async {
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
                                                                                                onTap: () => FocusScope.of(dialogContext).unfocus(),
                                                                                                child: SizedBox(
                                                                                                  height: 695.0,
                                                                                                  width: 750.0,
                                                                                                  child: DuplicateHarvesterWidget(
                                                                                                    id: flowsItem.id,
                                                                                                    question: flowsItem.expla2!,
                                                                                                    slug: flowsItem.slug!,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      );

                                                                                      safeSetState(() => _model.requestCompleter = null);
                                                                                      await _model.waitForRequestCompleted();
                                                                                    },
                                                                                    text: 'Dupliquer',
                                                                                    options: FFButtonOptions(
                                                                                      height: 40.0,
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      color: const Color(0xFFEEE8FC),
                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
                                                                                      borderRadius: BorderRadius.circular(16.0),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(const SizedBox(height: 12.0)),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ].divide(const SizedBox(
                                                                    height:
                                                                        12.0)),
                                                              ),
                                                            ),
                                                          );
                                                        }).divide(const SizedBox(
                                                            height: 16.0)),
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
