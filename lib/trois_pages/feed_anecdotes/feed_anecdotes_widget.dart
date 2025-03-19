import '';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/navbarnav/navbarnav_widget.dart';
import '/trois_pages/choose_nps_grade/choose_nps_grade_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'feed_anecdotes_model.dart';
export 'feed_anecdotes_model.dart';

class FeedAnecdotesWidget extends StatefulWidget {
  const FeedAnecdotesWidget({super.key});

  static String routeName = 'feedAnecdotes';
  static String routePath = '/feedbacks';

  @override
  State<FeedAnecdotesWidget> createState() => _FeedAnecdotesWidgetState();
}

class _FeedAnecdotesWidgetState extends State<FeedAnecdotesWidget> {
  late FeedAnecdotesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedAnecdotesModel());

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
      if ((FFAppState().isBrand == true) &&
          (FFAppState().isBU == false) &&
          (FFAppState().isLoc == false)) {
        _model.allExp = await ExperiencesTable().queryRows(
          queryFn: (q) => q
              .eqOrNull(
                'client_id',
                FFAppState().activeClientID,
              )
              .eqOrNull(
                'feedback_answer',
                true,
              )
              .order('created_at')
              .order('feedback_answer'),
        );
        _model.supaQuery = _model.allExp!.toList().cast<ExperiencesRow>();
        safeSetState(() {});
      } else if ((FFAppState().isBrand == false) &&
          (FFAppState().isBU == true) &&
          (FFAppState().isLoc == false)) {
        _model.buExp = await ExperiencesTable().queryRows(
          queryFn: (q) => q
              .eqOrNull(
                'bu_id',
                FFAppState().activeClientID,
              )
              .eqOrNull(
                'feedback_answer',
                true,
              )
              .order('created_at'),
        );
        _model.supaQuery = _model.buExp!.toList().cast<ExperiencesRow>();
        safeSetState(() {});
      } else {
        _model.locExp = await ExperiencesTable().queryRows(
          queryFn: (q) => q
              .eqOrNull(
                'loc_id',
                FFAppState().activeClientID,
              )
              .eqOrNull(
                'feedback_answer',
                true,
              )
              .order('created_at'),
        );
        _model.supaQuery = _model.locExp!.toList().cast<ExperiencesRow>();
        safeSetState(() {});
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
        title: 'feedAnecdotes',
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
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Container(
                                      decoration: BoxDecoration(),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .revoBG,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  50.0, 32.0, 50.0, 40.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.7,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      SingleChildScrollView(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              'Feedback-',
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
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Text(
                                                                              '${_model.supaQuery.length.toString()}/${() {
                                                                                if ((FFAppState().isBrand == true) && (FFAppState().isBU == false) && (FFAppState().isLoc == false)) {
                                                                                  return valueOrDefault<String>(
                                                                                    _model.allExp?.length.toString(),
                                                                                    '0',
                                                                                  );
                                                                                } else if ((FFAppState().isBrand == false) && (FFAppState().isBU == true) && (FFAppState().isLoc == false)) {
                                                                                  return valueOrDefault<String>(
                                                                                    _model.buExp?.length.toString(),
                                                                                    '0',
                                                                                  );
                                                                                } else {
                                                                                  return valueOrDefault<String>(
                                                                                    _model.locExp?.length.toString(),
                                                                                    '0',
                                                                                  );
                                                                                }
                                                                              }()} Experiences',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'GeistSans',
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: false,
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
                                                                                        alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                        child: WebViewAware(
                                                                                          child: GestureDetector(
                                                                                            onTap: () {
                                                                                              FocusScope.of(dialogContext).unfocus();
                                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                                            },
                                                                                            child: Container(
                                                                                              height: 500.0,
                                                                                              width: 430.0,
                                                                                              child: ChooseNpsGradeWidget(),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  );

                                                                                  if ((FFAppState().isBrand == true) && (FFAppState().isBU == false) && (FFAppState().isLoc == false)) {
                                                                                    if ((FFAppState().filterNps == 'Tous') && !(FFAppState().filterReason.isNotEmpty) && !FFAppState().filterFeedback) {
                                                                                      _model.filterCli1 = await ExperiencesTable().queryRows(
                                                                                        queryFn: (q) => q
                                                                                            .eqOrNull(
                                                                                              'client_id',
                                                                                              FFAppState().activeClientID,
                                                                                            )
                                                                                            .order('created_at'),
                                                                                      );
                                                                                      _model.supaQuery = _model.filterCli1!.toList().cast<ExperiencesRow>();
                                                                                      safeSetState(() {});
                                                                                    } else if ((FFAppState().filterNps == 'Tous') && !(FFAppState().filterReason.isNotEmpty) && FFAppState().filterFeedback) {
                                                                                      _model.filterCli2 = await ExperiencesTable().queryRows(
                                                                                        queryFn: (q) => q
                                                                                            .eqOrNull(
                                                                                              'client_id',
                                                                                              FFAppState().activeClientID,
                                                                                            )
                                                                                            .gtOrNull(
                                                                                              'feedback_customText',
                                                                                              ' ',
                                                                                            )
                                                                                            .order('created_at'),
                                                                                      );
                                                                                      _model.supaQuery = _model.filterCli2!.toList().cast<ExperiencesRow>();
                                                                                      safeSetState(() {});
                                                                                    } else if ((FFAppState().filterNps == 'Tous') && (FFAppState().filterReason.isNotEmpty) && !FFAppState().filterFeedback) {
                                                                                      _model.filterCli3 = await ExperiencesTable().queryRows(
                                                                                        queryFn: (q) => q
                                                                                            .eqOrNull(
                                                                                              'client_id',
                                                                                              FFAppState().activeClientID,
                                                                                            )
                                                                                            .inFilterOrNull(
                                                                                              'theme',
                                                                                              FFAppState().filterReason,
                                                                                            )
                                                                                            .order('created_at'),
                                                                                      );
                                                                                      _model.supaQuery = _model.filterCli3!.toList().cast<ExperiencesRow>();
                                                                                      safeSetState(() {});
                                                                                    } else if ((FFAppState().filterNps == 'Tous') && (FFAppState().filterReason.isNotEmpty) && FFAppState().filterFeedback) {
                                                                                      _model.filterCli4 = await ExperiencesTable().queryRows(
                                                                                        queryFn: (q) => q
                                                                                            .eqOrNull(
                                                                                              'client_id',
                                                                                              FFAppState().activeClientID,
                                                                                            )
                                                                                            .inFilterOrNull(
                                                                                              'theme',
                                                                                              FFAppState().filterReason,
                                                                                            )
                                                                                            .gtOrNull(
                                                                                              'feedback_customText',
                                                                                              ' ',
                                                                                            )
                                                                                            .order('created_at'),
                                                                                      );
                                                                                      _model.supaQuery = _model.filterCli4!.toList().cast<ExperiencesRow>();
                                                                                      safeSetState(() {});
                                                                                    } else if ((FFAppState().filterNps != 'Tous') && !(FFAppState().filterReason.isNotEmpty) && !FFAppState().filterFeedback) {
                                                                                      _model.filterCli5 = await ExperiencesTable().queryRows(
                                                                                        queryFn: (q) => q
                                                                                            .eqOrNull(
                                                                                          'client_id',
                                                                                          FFAppState().activeClientID,
                                                                                        )
                                                                                            .lteOrNull(
                                                                                          'nps',
                                                                                          () {
                                                                                            if (FFAppState().filterNps == 'Promoteurs') {
                                                                                              return 10;
                                                                                            } else if (FFAppState().filterNps == 'Passifs') {
                                                                                              return 8;
                                                                                            } else {
                                                                                              return 6;
                                                                                            }
                                                                                          }(),
                                                                                        ).gteOrNull(
                                                                                          'nps',
                                                                                          () {
                                                                                            if (FFAppState().filterNps == 'Promoteurs') {
                                                                                              return 9;
                                                                                            } else if (FFAppState().filterNps == 'Passifs') {
                                                                                              return 7;
                                                                                            } else {
                                                                                              return 0;
                                                                                            }
                                                                                          }(),
                                                                                        ).order('created_at'),
                                                                                      );
                                                                                      _model.supaQuery = _model.filterCli5!.toList().cast<ExperiencesRow>();
                                                                                      safeSetState(() {});
                                                                                    } else if ((FFAppState().filterNps != 'Tous') && !(FFAppState().filterReason.isNotEmpty) && FFAppState().filterFeedback) {
                                                                                      _model.filterCli6 = await ExperiencesTable().queryRows(
                                                                                        queryFn: (q) => q
                                                                                            .eqOrNull(
                                                                                              'client_id',
                                                                                              FFAppState().activeClientID,
                                                                                            )
                                                                                            .lteOrNull(
                                                                                              'nps',
                                                                                              () {
                                                                                                if (FFAppState().filterNps == 'Promoteurs') {
                                                                                                  return 10;
                                                                                                } else if (FFAppState().filterNps == 'Passifs') {
                                                                                                  return 8;
                                                                                                } else {
                                                                                                  return 6;
                                                                                                }
                                                                                              }(),
                                                                                            )
                                                                                            .gteOrNull(
                                                                                              'nps',
                                                                                              () {
                                                                                                if (FFAppState().filterNps == 'Promoteurs') {
                                                                                                  return 9;
                                                                                                } else if (FFAppState().filterNps == 'Passifs') {
                                                                                                  return 7;
                                                                                                } else {
                                                                                                  return 0;
                                                                                                }
                                                                                              }(),
                                                                                            )
                                                                                            .gtOrNull(
                                                                                              'feedback_customText',
                                                                                              ' ',
                                                                                            )
                                                                                            .order('created_at'),
                                                                                      );
                                                                                      _model.supaQuery = _model.filterCli6!.toList().cast<ExperiencesRow>();
                                                                                      safeSetState(() {});
                                                                                    } else if ((FFAppState().filterNps != 'Tous') && (FFAppState().filterReason.isNotEmpty) && !FFAppState().filterFeedback) {
                                                                                      _model.filterCli7 = await ExperiencesTable().queryRows(
                                                                                        queryFn: (q) => q
                                                                                            .eqOrNull(
                                                                                              'client_id',
                                                                                              FFAppState().activeClientID,
                                                                                            )
                                                                                            .lteOrNull(
                                                                                              'nps',
                                                                                              () {
                                                                                                if (FFAppState().filterNps == 'Promoteurs') {
                                                                                                  return 10;
                                                                                                } else if (FFAppState().filterNps == 'Passifs') {
                                                                                                  return 8;
                                                                                                } else {
                                                                                                  return 6;
                                                                                                }
                                                                                              }(),
                                                                                            )
                                                                                            .gteOrNull(
                                                                                              'nps',
                                                                                              () {
                                                                                                if (FFAppState().filterNps == 'Promoteurs') {
                                                                                                  return 9;
                                                                                                } else if (FFAppState().filterNps == 'Passifs') {
                                                                                                  return 7;
                                                                                                } else {
                                                                                                  return 0;
                                                                                                }
                                                                                              }(),
                                                                                            )
                                                                                            .inFilterOrNull(
                                                                                              'theme',
                                                                                              FFAppState().filterReason,
                                                                                            )
                                                                                            .order('created_at'),
                                                                                      );
                                                                                      _model.supaQuery = _model.filterCli7!.toList().cast<ExperiencesRow>();
                                                                                      safeSetState(() {});
                                                                                    } else if ((FFAppState().filterNps != 'Tous') && (FFAppState().filterReason.isNotEmpty) && FFAppState().filterFeedback) {
                                                                                      _model.filterCli8 = await ExperiencesTable().queryRows(
                                                                                        queryFn: (q) => q
                                                                                            .eqOrNull(
                                                                                              'client_id',
                                                                                              FFAppState().activeClientID,
                                                                                            )
                                                                                            .lteOrNull(
                                                                                              'nps',
                                                                                              () {
                                                                                                if (FFAppState().filterNps == 'Promoteurs') {
                                                                                                  return 10;
                                                                                                } else if (FFAppState().filterNps == 'Passifs') {
                                                                                                  return 8;
                                                                                                } else {
                                                                                                  return 6;
                                                                                                }
                                                                                              }(),
                                                                                            )
                                                                                            .gteOrNull(
                                                                                              'nps',
                                                                                              () {
                                                                                                if (FFAppState().filterNps == 'Promoteurs') {
                                                                                                  return 9;
                                                                                                } else if (FFAppState().filterNps == 'Passifs') {
                                                                                                  return 7;
                                                                                                } else {
                                                                                                  return 0;
                                                                                                }
                                                                                              }(),
                                                                                            )
                                                                                            .inFilterOrNull(
                                                                                              'theme',
                                                                                              FFAppState().filterReason,
                                                                                            )
                                                                                            .gtOrNull(
                                                                                              'feedback_customText',
                                                                                              ' ',
                                                                                            )
                                                                                            .order('created_at'),
                                                                                      );
                                                                                      _model.supaQuery = _model.filterCli8!.toList().cast<ExperiencesRow>();
                                                                                      safeSetState(() {});
                                                                                    } else {
                                                                                      Navigator.pop(context);
                                                                                    }
                                                                                  } else if ((FFAppState().isBrand == false) && (FFAppState().isBU == true) && (FFAppState().isLoc == false)) {
                                                                                    if ((FFAppState().filterNps == 'Tous') && !(FFAppState().filterReason.isNotEmpty) && !FFAppState().filterFeedback) {
                                                                                      _model.filterBu1 = await ExperiencesTable().queryRows(
                                                                                        queryFn: (q) => q
                                                                                            .eqOrNull(
                                                                                              'bu_id',
                                                                                              FFAppState().activeClientID,
                                                                                            )
                                                                                            .order('created_at'),
                                                                                      );
                                                                                      _model.supaQuery = _model.filterBu1!.toList().cast<ExperiencesRow>();
                                                                                      safeSetState(() {});
                                                                                    } else if ((FFAppState().filterNps == 'Tous') && !(FFAppState().filterReason.isNotEmpty) && FFAppState().filterFeedback) {
                                                                                      _model.filterBu2 = await ExperiencesTable().queryRows(
                                                                                        queryFn: (q) => q
                                                                                            .eqOrNull(
                                                                                              'bu_id',
                                                                                              FFAppState().activeClientID,
                                                                                            )
                                                                                            .gtOrNull(
                                                                                              'feedback_customText',
                                                                                              ' ',
                                                                                            )
                                                                                            .order('created_at'),
                                                                                      );
                                                                                      _model.supaQuery = _model.filterBu2!.toList().cast<ExperiencesRow>();
                                                                                      safeSetState(() {});
                                                                                    } else if ((FFAppState().filterNps == 'Tous') && (FFAppState().filterReason.isNotEmpty) && !FFAppState().filterFeedback) {
                                                                                      _model.filterBu3 = await ExperiencesTable().queryRows(
                                                                                        queryFn: (q) => q
                                                                                            .eqOrNull(
                                                                                              'bu_id',
                                                                                              FFAppState().activeClientID,
                                                                                            )
                                                                                            .inFilterOrNull(
                                                                                              'theme',
                                                                                              FFAppState().filterReason,
                                                                                            )
                                                                                            .order('created_at'),
                                                                                      );
                                                                                      _model.supaQuery = _model.filterBu3!.toList().cast<ExperiencesRow>();
                                                                                      safeSetState(() {});
                                                                                    } else if ((FFAppState().filterNps == 'Tous') && (FFAppState().filterReason.isNotEmpty) && FFAppState().filterFeedback) {
                                                                                      _model.filterBu4 = await ExperiencesTable().queryRows(
                                                                                        queryFn: (q) => q
                                                                                            .eqOrNull(
                                                                                              'bu_id',
                                                                                              FFAppState().activeClientID,
                                                                                            )
                                                                                            .inFilterOrNull(
                                                                                              'theme',
                                                                                              FFAppState().filterReason,
                                                                                            )
                                                                                            .gtOrNull(
                                                                                              'feedback_customText',
                                                                                              ' ',
                                                                                            )
                                                                                            .order('created_at'),
                                                                                      );
                                                                                      _model.supaQuery = _model.filterBu4!.toList().cast<ExperiencesRow>();
                                                                                      safeSetState(() {});
                                                                                    } else if ((FFAppState().filterNps != 'Tous') && !(FFAppState().filterReason.isNotEmpty) && !FFAppState().filterFeedback) {
                                                                                      _model.filterBu5 = await ExperiencesTable().queryRows(
                                                                                        queryFn: (q) => q
                                                                                            .eqOrNull(
                                                                                          'bu_id',
                                                                                          FFAppState().activeClientID,
                                                                                        )
                                                                                            .lteOrNull(
                                                                                          'nps',
                                                                                          () {
                                                                                            if (FFAppState().filterNps == 'Promoteurs') {
                                                                                              return 10;
                                                                                            } else if (FFAppState().filterNps == 'Passifs') {
                                                                                              return 8;
                                                                                            } else {
                                                                                              return 6;
                                                                                            }
                                                                                          }(),
                                                                                        ).gteOrNull(
                                                                                          'nps',
                                                                                          () {
                                                                                            if (FFAppState().filterNps == 'Promoteurs') {
                                                                                              return 9;
                                                                                            } else if (FFAppState().filterNps == 'Passifs') {
                                                                                              return 7;
                                                                                            } else {
                                                                                              return 0;
                                                                                            }
                                                                                          }(),
                                                                                        ).order('created_at'),
                                                                                      );
                                                                                      _model.supaQuery = _model.filterBu5!.toList().cast<ExperiencesRow>();
                                                                                      safeSetState(() {});
                                                                                    } else if ((FFAppState().filterNps != 'Tous') && !(FFAppState().filterReason.isNotEmpty) && FFAppState().filterFeedback) {
                                                                                      _model.filterBu6 = await ExperiencesTable().queryRows(
                                                                                        queryFn: (q) => q
                                                                                            .eqOrNull(
                                                                                              'bu_id',
                                                                                              FFAppState().activeClientID,
                                                                                            )
                                                                                            .lteOrNull(
                                                                                              'nps',
                                                                                              () {
                                                                                                if (FFAppState().filterNps == 'Promoteurs') {
                                                                                                  return 10;
                                                                                                } else if (FFAppState().filterNps == 'Passifs') {
                                                                                                  return 8;
                                                                                                } else {
                                                                                                  return 6;
                                                                                                }
                                                                                              }(),
                                                                                            )
                                                                                            .gteOrNull(
                                                                                              'nps',
                                                                                              () {
                                                                                                if (FFAppState().filterNps == 'Promoteurs') {
                                                                                                  return 9;
                                                                                                } else if (FFAppState().filterNps == 'Passifs') {
                                                                                                  return 7;
                                                                                                } else {
                                                                                                  return 0;
                                                                                                }
                                                                                              }(),
                                                                                            )
                                                                                            .gtOrNull(
                                                                                              'feedback_customText',
                                                                                              ' ',
                                                                                            )
                                                                                            .order('created_at'),
                                                                                      );
                                                                                      _model.supaQuery = _model.filterBu6!.toList().cast<ExperiencesRow>();
                                                                                      safeSetState(() {});
                                                                                    } else if ((FFAppState().filterNps != 'Tous') && (FFAppState().filterReason.isNotEmpty) && !FFAppState().filterFeedback) {
                                                                                      _model.filterBu7 = await ExperiencesTable().queryRows(
                                                                                        queryFn: (q) => q
                                                                                            .eqOrNull(
                                                                                              'bu_id',
                                                                                              FFAppState().activeClientID,
                                                                                            )
                                                                                            .lteOrNull(
                                                                                              'nps',
                                                                                              () {
                                                                                                if (FFAppState().filterNps == 'Promoteurs') {
                                                                                                  return 10;
                                                                                                } else if (FFAppState().filterNps == 'Passifs') {
                                                                                                  return 8;
                                                                                                } else {
                                                                                                  return 6;
                                                                                                }
                                                                                              }(),
                                                                                            )
                                                                                            .gteOrNull(
                                                                                              'nps',
                                                                                              () {
                                                                                                if (FFAppState().filterNps == 'Promoteurs') {
                                                                                                  return 9;
                                                                                                } else if (FFAppState().filterNps == 'Passifs') {
                                                                                                  return 7;
                                                                                                } else {
                                                                                                  return 0;
                                                                                                }
                                                                                              }(),
                                                                                            )
                                                                                            .inFilterOrNull(
                                                                                              'theme',
                                                                                              FFAppState().filterReason,
                                                                                            )
                                                                                            .order('created_at'),
                                                                                      );
                                                                                      _model.supaQuery = _model.filterBu7!.toList().cast<ExperiencesRow>();
                                                                                      safeSetState(() {});
                                                                                    } else if ((FFAppState().filterNps != 'Tous') && (FFAppState().filterReason.isNotEmpty) && FFAppState().filterFeedback) {
                                                                                      _model.filterBu8 = await ExperiencesTable().queryRows(
                                                                                        queryFn: (q) => q
                                                                                            .eqOrNull(
                                                                                              'bu_id',
                                                                                              FFAppState().activeClientID,
                                                                                            )
                                                                                            .lteOrNull(
                                                                                              'nps',
                                                                                              () {
                                                                                                if (FFAppState().filterNps == 'Promoteurs') {
                                                                                                  return 10;
                                                                                                } else if (FFAppState().filterNps == 'Passifs') {
                                                                                                  return 8;
                                                                                                } else {
                                                                                                  return 6;
                                                                                                }
                                                                                              }(),
                                                                                            )
                                                                                            .gteOrNull(
                                                                                              'nps',
                                                                                              () {
                                                                                                if (FFAppState().filterNps == 'Promoteurs') {
                                                                                                  return 9;
                                                                                                } else if (FFAppState().filterNps == 'Passifs') {
                                                                                                  return 7;
                                                                                                } else {
                                                                                                  return 0;
                                                                                                }
                                                                                              }(),
                                                                                            )
                                                                                            .inFilterOrNull(
                                                                                              'theme',
                                                                                              FFAppState().filterReason,
                                                                                            )
                                                                                            .gtOrNull(
                                                                                              'feedback_customText',
                                                                                              ' ',
                                                                                            )
                                                                                            .order('created_at'),
                                                                                      );
                                                                                      _model.supaQuery = _model.filterBu8!.toList().cast<ExperiencesRow>();
                                                                                      safeSetState(() {});
                                                                                    } else {
                                                                                      Navigator.pop(context);
                                                                                    }
                                                                                  } else {
                                                                                    if ((FFAppState().filterNps == 'Tous') && !(FFAppState().filterReason.isNotEmpty) && !FFAppState().filterFeedback) {
                                                                                      _model.filterLoc1 = await ExperiencesTable().queryRows(
                                                                                        queryFn: (q) => q
                                                                                            .eqOrNull(
                                                                                              'loc_id',
                                                                                              FFAppState().activeClientID,
                                                                                            )
                                                                                            .order('created_at'),
                                                                                      );
                                                                                      _model.supaQuery = _model.filterLoc1!.toList().cast<ExperiencesRow>();
                                                                                      safeSetState(() {});
                                                                                    } else if ((FFAppState().filterNps == 'Tous') && !(FFAppState().filterReason.isNotEmpty) && FFAppState().filterFeedback) {
                                                                                      _model.filterLoc2 = await ExperiencesTable().queryRows(
                                                                                        queryFn: (q) => q
                                                                                            .eqOrNull(
                                                                                              'loc_id',
                                                                                              FFAppState().activeClientID,
                                                                                            )
                                                                                            .gtOrNull(
                                                                                              'feedback_customText',
                                                                                              ' ',
                                                                                            )
                                                                                            .order('created_at'),
                                                                                      );
                                                                                      _model.supaQuery = _model.filterLoc2!.toList().cast<ExperiencesRow>();
                                                                                      safeSetState(() {});
                                                                                    } else if ((FFAppState().filterNps == 'Tous') && (FFAppState().filterReason.isNotEmpty) && !FFAppState().filterFeedback) {
                                                                                      _model.filterLoc3 = await ExperiencesTable().queryRows(
                                                                                        queryFn: (q) => q
                                                                                            .eqOrNull(
                                                                                              'loc_id',
                                                                                              FFAppState().activeClientID,
                                                                                            )
                                                                                            .inFilterOrNull(
                                                                                              'theme',
                                                                                              FFAppState().filterReason,
                                                                                            )
                                                                                            .order('created_at'),
                                                                                      );
                                                                                      _model.supaQuery = _model.filterLoc3!.toList().cast<ExperiencesRow>();
                                                                                      safeSetState(() {});
                                                                                    } else if ((FFAppState().filterNps == 'Tous') && (FFAppState().filterReason.isNotEmpty) && FFAppState().filterFeedback) {
                                                                                      _model.filterLoc4 = await ExperiencesTable().queryRows(
                                                                                        queryFn: (q) => q
                                                                                            .eqOrNull(
                                                                                              'loc_id',
                                                                                              FFAppState().activeClientID,
                                                                                            )
                                                                                            .inFilterOrNull(
                                                                                              'theme',
                                                                                              FFAppState().filterReason,
                                                                                            )
                                                                                            .gtOrNull(
                                                                                              'feedback_customText',
                                                                                              ' ',
                                                                                            )
                                                                                            .order('created_at'),
                                                                                      );
                                                                                      _model.supaQuery = _model.filterLoc4!.toList().cast<ExperiencesRow>();
                                                                                      safeSetState(() {});
                                                                                    } else if ((FFAppState().filterNps != 'Tous') && !(FFAppState().filterReason.isNotEmpty) && !FFAppState().filterFeedback) {
                                                                                      _model.filterLoc5 = await ExperiencesTable().queryRows(
                                                                                        queryFn: (q) => q
                                                                                            .eqOrNull(
                                                                                          'loc_id',
                                                                                          FFAppState().activeClientID,
                                                                                        )
                                                                                            .lteOrNull(
                                                                                          'nps',
                                                                                          () {
                                                                                            if (FFAppState().filterNps == 'Promoteurs') {
                                                                                              return 10;
                                                                                            } else if (FFAppState().filterNps == 'Passifs') {
                                                                                              return 8;
                                                                                            } else {
                                                                                              return 6;
                                                                                            }
                                                                                          }(),
                                                                                        ).gteOrNull(
                                                                                          'nps',
                                                                                          () {
                                                                                            if (FFAppState().filterNps == 'Promoteurs') {
                                                                                              return 9;
                                                                                            } else if (FFAppState().filterNps == 'Passifs') {
                                                                                              return 7;
                                                                                            } else {
                                                                                              return 0;
                                                                                            }
                                                                                          }(),
                                                                                        ).order('created_at'),
                                                                                      );
                                                                                      _model.supaQuery = _model.filterLoc5!.toList().cast<ExperiencesRow>();
                                                                                      safeSetState(() {});
                                                                                    } else if ((FFAppState().filterNps != 'Tous') && !(FFAppState().filterReason.isNotEmpty) && FFAppState().filterFeedback) {
                                                                                      _model.filterLoc6 = await ExperiencesTable().queryRows(
                                                                                        queryFn: (q) => q
                                                                                            .eqOrNull(
                                                                                              'loc_id',
                                                                                              FFAppState().activeClientID,
                                                                                            )
                                                                                            .lteOrNull(
                                                                                              'nps',
                                                                                              () {
                                                                                                if (FFAppState().filterNps == 'Promoteurs') {
                                                                                                  return 10;
                                                                                                } else if (FFAppState().filterNps == 'Passifs') {
                                                                                                  return 8;
                                                                                                } else {
                                                                                                  return 6;
                                                                                                }
                                                                                              }(),
                                                                                            )
                                                                                            .gteOrNull(
                                                                                              'nps',
                                                                                              () {
                                                                                                if (FFAppState().filterNps == 'Promoteurs') {
                                                                                                  return 9;
                                                                                                } else if (FFAppState().filterNps == 'Passifs') {
                                                                                                  return 7;
                                                                                                } else {
                                                                                                  return 0;
                                                                                                }
                                                                                              }(),
                                                                                            )
                                                                                            .gtOrNull(
                                                                                              'feedback_customText',
                                                                                              ' ',
                                                                                            )
                                                                                            .order('created_at'),
                                                                                      );
                                                                                      _model.supaQuery = _model.filterLoc6!.toList().cast<ExperiencesRow>();
                                                                                      safeSetState(() {});
                                                                                    } else if ((FFAppState().filterNps != 'Tous') && (FFAppState().filterReason.isNotEmpty) && !FFAppState().filterFeedback) {
                                                                                      _model.filterLoc7 = await ExperiencesTable().queryRows(
                                                                                        queryFn: (q) => q
                                                                                            .eqOrNull(
                                                                                              'loc_id',
                                                                                              FFAppState().activeClientID,
                                                                                            )
                                                                                            .lteOrNull(
                                                                                              'nps',
                                                                                              () {
                                                                                                if (FFAppState().filterNps == 'Promoteurs') {
                                                                                                  return 10;
                                                                                                } else if (FFAppState().filterNps == 'Passifs') {
                                                                                                  return 8;
                                                                                                } else {
                                                                                                  return 6;
                                                                                                }
                                                                                              }(),
                                                                                            )
                                                                                            .gteOrNull(
                                                                                              'nps',
                                                                                              () {
                                                                                                if (FFAppState().filterNps == 'Promoteurs') {
                                                                                                  return 9;
                                                                                                } else if (FFAppState().filterNps == 'Passifs') {
                                                                                                  return 7;
                                                                                                } else {
                                                                                                  return 0;
                                                                                                }
                                                                                              }(),
                                                                                            )
                                                                                            .inFilterOrNull(
                                                                                              'theme',
                                                                                              FFAppState().filterReason,
                                                                                            )
                                                                                            .order('created_at'),
                                                                                      );
                                                                                      _model.supaQuery = _model.filterLoc7!.toList().cast<ExperiencesRow>();
                                                                                      safeSetState(() {});
                                                                                    } else if ((FFAppState().filterNps != 'Tous') && (FFAppState().filterReason.isNotEmpty) && FFAppState().filterFeedback) {
                                                                                      _model.filterLoc8 = await ExperiencesTable().queryRows(
                                                                                        queryFn: (q) => q
                                                                                            .eqOrNull(
                                                                                              'loc_id',
                                                                                              FFAppState().activeClientID,
                                                                                            )
                                                                                            .lteOrNull(
                                                                                              'nps',
                                                                                              () {
                                                                                                if (FFAppState().filterNps == 'Promoteurs') {
                                                                                                  return 10;
                                                                                                } else if (FFAppState().filterNps == 'Passifs') {
                                                                                                  return 8;
                                                                                                } else {
                                                                                                  return 6;
                                                                                                }
                                                                                              }(),
                                                                                            )
                                                                                            .gteOrNull(
                                                                                              'nps',
                                                                                              () {
                                                                                                if (FFAppState().filterNps == 'Promoteurs') {
                                                                                                  return 9;
                                                                                                } else if (FFAppState().filterNps == 'Passifs') {
                                                                                                  return 7;
                                                                                                } else {
                                                                                                  return 0;
                                                                                                }
                                                                                              }(),
                                                                                            )
                                                                                            .inFilterOrNull(
                                                                                              'theme',
                                                                                              FFAppState().filterReason,
                                                                                            )
                                                                                            .gtOrNull(
                                                                                              'feedback_customText',
                                                                                              ' ',
                                                                                            )
                                                                                            .order('created_at'),
                                                                                      );
                                                                                      _model.supaQuery = _model.filterLoc8!.toList().cast<ExperiencesRow>();
                                                                                      safeSetState(() {});
                                                                                    } else {
                                                                                      Navigator.pop(context);
                                                                                    }
                                                                                  }

                                                                                  safeSetState(() {});
                                                                                },
                                                                                text: 'Filtrer',
                                                                                icon: Icon(
                                                                                  Icons.filter_alt,
                                                                                  size: 15.0,
                                                                                ),
                                                                                options: FFButtonOptions(
                                                                                  height: 40.0,
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: Color(0x00FFFFFF),
                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: 'GeistSans',
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.normal,
                                                                                        useGoogleFonts: false,
                                                                                      ),
                                                                                  elevation: 0.0,
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                showLoadingIndicator: false,
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 16.0)),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 24.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Builder(
                                                              builder:
                                                                  (context) {
                                                                final listFeedz =
                                                                    _model
                                                                        .supaQuery
                                                                        .toList();

                                                                return ListView
                                                                    .separated(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount:
                                                                      listFeedz
                                                                          .length,
                                                                  separatorBuilder: (_,
                                                                          __) =>
                                                                      SizedBox(
                                                                          height:
                                                                              12.0),
                                                                  itemBuilder:
                                                                      (context,
                                                                          listFeedzIndex) {
                                                                    final listFeedzItem =
                                                                        listFeedz[
                                                                            listFeedzIndex];
                                                                    return Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.27,
                                                                      height:
                                                                          150.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).shadcnCardBorderGrey,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(16.0),
                                                                        child:
                                                                            SingleChildScrollView(
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
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                                                                    child: Container(
                                                                                      width: 440.0,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Text(
                                                                                                'Note Globale',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'GeistSans',
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: false,
                                                                                                    ),
                                                                                              ),
                                                                                              Container(
                                                                                                width: 160.0,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                    Stack(
                                                                                                      children: [
                                                                                                        Container(
                                                                                                          width: 100.0,
                                                                                                          height: 6.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).shadcnCardBorderGrey,
                                                                                                            borderRadius: BorderRadius.circular(16.0),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: valueOrDefault<double>(
                                                                                                            20 * (listFeedzItem.feedbackGeneral!.toDouble()),
                                                                                                            0.0,
                                                                                                          ),
                                                                                                          height: 6.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                            borderRadius: BorderRadius.circular(16.0),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    Text(
                                                                                                      formatNumber(
                                                                                                        listFeedzItem.feedbackGeneral!,
                                                                                                        formatType: FormatType.custom,
                                                                                                        format: '0.#',
                                                                                                        locale: '',
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'GeistSans',
                                                                                                            fontSize: 14.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w500,
                                                                                                            useGoogleFonts: false,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ].divide(SizedBox(width: 12.0)),
                                                                                                ),
                                                                                              ),
                                                                                            ].divide(SizedBox(width: 6.0)),
                                                                                          ),
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Text(
                                                                                                valueOrDefault<String>(
                                                                                                  containerClientsRow?.theme1,
                                                                                                  'Theme1',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'GeistSans',
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: false,
                                                                                                    ),
                                                                                              ),
                                                                                              Flexible(
                                                                                                child: Container(
                                                                                                  width: 160.0,
                                                                                                  decoration: BoxDecoration(),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                    children: [
                                                                                                      Stack(
                                                                                                        children: [
                                                                                                          Container(
                                                                                                            width: 100.0,
                                                                                                            height: 6.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).shadcnCardBorderGrey,
                                                                                                              borderRadius: BorderRadius.circular(16.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Container(
                                                                                                            width: valueOrDefault<double>(
                                                                                                              20 * (listFeedzItem.feedback1!.toDouble()),
                                                                                                              0.0,
                                                                                                            ),
                                                                                                            height: 6.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                              borderRadius: BorderRadius.circular(16.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                      Text(
                                                                                                        formatNumber(
                                                                                                          listFeedzItem.feedback1!,
                                                                                                          formatType: FormatType.custom,
                                                                                                          format: '0.#',
                                                                                                          locale: '',
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'GeistSans',
                                                                                                              fontSize: 14.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.w500,
                                                                                                              useGoogleFonts: false,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ].divide(SizedBox(width: 12.0)),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ].divide(SizedBox(width: 6.0)),
                                                                                          ),
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Text(
                                                                                                valueOrDefault<String>(
                                                                                                  containerClientsRow?.theme2,
                                                                                                  'Theme2',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'GeistSans',
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: false,
                                                                                                    ),
                                                                                              ),
                                                                                              Container(
                                                                                                width: 160.0,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                    Stack(
                                                                                                      children: [
                                                                                                        Container(
                                                                                                          width: 100.0,
                                                                                                          height: 6.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).shadcnCardBorderGrey,
                                                                                                            borderRadius: BorderRadius.circular(16.0),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: valueOrDefault<double>(
                                                                                                            20 * (listFeedzItem.feedback2!.toDouble()),
                                                                                                            0.0,
                                                                                                          ),
                                                                                                          height: 6.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                            borderRadius: BorderRadius.circular(16.0),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    Text(
                                                                                                      formatNumber(
                                                                                                        listFeedzItem.feedback2!,
                                                                                                        formatType: FormatType.custom,
                                                                                                        format: '0.#',
                                                                                                        locale: '',
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'GeistSans',
                                                                                                            fontSize: 14.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w500,
                                                                                                            useGoogleFonts: false,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ].divide(SizedBox(width: 12.0)),
                                                                                                ),
                                                                                              ),
                                                                                            ].divide(SizedBox(width: 6.0)),
                                                                                          ),
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Text(
                                                                                                valueOrDefault<String>(
                                                                                                  containerClientsRow?.theme3,
                                                                                                  'Theme3',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'GeistSans',
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: false,
                                                                                                    ),
                                                                                              ),
                                                                                              Container(
                                                                                                width: 160.0,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                    Stack(
                                                                                                      children: [
                                                                                                        Container(
                                                                                                          width: 100.0,
                                                                                                          height: 6.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).shadcnCardBorderGrey,
                                                                                                            borderRadius: BorderRadius.circular(16.0),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: valueOrDefault<double>(
                                                                                                            20 * (listFeedzItem.feedback3!.toDouble()),
                                                                                                            0.0,
                                                                                                          ),
                                                                                                          height: 6.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                            borderRadius: BorderRadius.circular(16.0),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    Text(
                                                                                                      formatNumber(
                                                                                                        listFeedzItem.feedback3!,
                                                                                                        formatType: FormatType.custom,
                                                                                                        format: '0.#',
                                                                                                        locale: '',
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'GeistSans',
                                                                                                            fontSize: 14.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w500,
                                                                                                            useGoogleFonts: false,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ].divide(SizedBox(width: 12.0)),
                                                                                                ),
                                                                                              ),
                                                                                            ].divide(SizedBox(width: 6.0)),
                                                                                          ),
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Text(
                                                                                                valueOrDefault<String>(
                                                                                                  containerClientsRow?.theme4,
                                                                                                  'Theme4',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'GeistSans',
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: false,
                                                                                                    ),
                                                                                              ),
                                                                                              Container(
                                                                                                width: 160.0,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                    Stack(
                                                                                                      children: [
                                                                                                        Container(
                                                                                                          width: 100.0,
                                                                                                          height: 6.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).shadcnCardBorderGrey,
                                                                                                            borderRadius: BorderRadius.circular(16.0),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: valueOrDefault<double>(
                                                                                                            20 * (listFeedzItem.feedback4!.toDouble()),
                                                                                                            0.0,
                                                                                                          ),
                                                                                                          height: 6.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                            borderRadius: BorderRadius.circular(16.0),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    Text(
                                                                                                      formatNumber(
                                                                                                        listFeedzItem.feedback4!,
                                                                                                        formatType: FormatType.custom,
                                                                                                        format: '0.#',
                                                                                                        locale: '',
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'GeistSans',
                                                                                                            fontSize: 14.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w500,
                                                                                                            useGoogleFonts: false,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ].divide(SizedBox(width: 12.0)),
                                                                                                ),
                                                                                              ),
                                                                                            ].divide(SizedBox(width: 6.0)),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  if (listFeedzItem.feedbackCustomText != ' ')
                                                                                    Container(
                                                                                      width: MediaQuery.sizeOf(context).width * 0.29,
                                                                                      height: 100.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                        border: Border.all(
                                                                                          color: FlutterFlowTheme.of(context).shadcnCardBorderGrey,
                                                                                        ),
                                                                                      ),
                                                                                      child: SingleChildScrollView(
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsets.all(12.0),
                                                                                              child: Text(
                                                                                                valueOrDefault<String>(
                                                                                                  listFeedzItem.feedbackCustomText,
                                                                                                  'none',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'GeistSans',
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: false,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                ].divide(SizedBox(width: 24.0)),
                                                                              ),
                                                                              Text(
                                                                                valueOrDefault<String>(
                                                                                  listFeedzItem.firstName,
                                                                                  'none',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'GeistSans',
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: false,
                                                                                    ),
                                                                              ),
                                                                            ].divide(SizedBox(height: 0.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              },
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
