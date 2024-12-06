import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/experience_related/edit_engagement/edit_engagement_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/navbarnav/navbarnav_widget.dart';
import '/trois_pages/infos_nps/infos_nps_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

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
                title: const Text('Attention'),
                content: const Text('Vous devez remettre à jour votre profil.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: const Text('Ok'),
                  ),
                ],
              ),
            );
          },
        );

        context.pushNamed('updateProfile');
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
        title: 'home',
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
                            selectedIndex: 1,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).revoBG,
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  50.0, 32.0, 50.0, 40.0),
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
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                FutureBuilder<
                                                    List<ExperiencesRow>>(
                                                  future: ExperiencesTable()
                                                      .queryRows(
                                                    queryFn: (q) => q.eq(
                                                      'client_id',
                                                      FFAppState()
                                                          .activeClientID,
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.7,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: FutureBuilder<
                                                          List<ExperiencesRow>>(
                                                        future:
                                                            ExperiencesTable()
                                                                .queryRows(
                                                          queryFn: (q) => q
                                                              .eq(
                                                                'client_id',
                                                                FFAppState()
                                                                    .activeClientID,
                                                              )
                                                              .gt(
                                                                'nps',
                                                                8,
                                                              ),
                                                        ),
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
                                                          List<ExperiencesRow>
                                                              promotExperiencesRowList =
                                                              snapshot.data!;

                                                          return Container(
                                                            decoration:
                                                                const BoxDecoration(),
                                                            child: FutureBuilder<
                                                                List<
                                                                    ExperiencesRow>>(
                                                              future:
                                                                  ExperiencesTable()
                                                                      .queryRows(
                                                                queryFn: (q) =>
                                                                    q
                                                                        .eq(
                                                                          'client_id',
                                                                          FFAppState()
                                                                              .activeClientID,
                                                                        )
                                                                        .lt(
                                                                          'nps',
                                                                          7,
                                                                        ),
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      child:
                                                                          SpinKitRing(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            50.0,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<ExperiencesRow>
                                                                    detracExperiencesRowList =
                                                                    snapshot
                                                                        .data!;

                                                                return Container(
                                                                  decoration:
                                                                      const BoxDecoration(),
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
                                                                              'Dashboard -',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                    fontSize: 44.72,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              FFAppState().activeBrand,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                    fontSize: 44.72,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                  ),
                                                                            ),
                                                                            Builder(
                                                                              builder: (context) => Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                child: FlutterFlowIconButton(
                                                                                  borderColor: Colors.transparent,
                                                                                  borderRadius: 8.0,
                                                                                  buttonSize: 40.0,
                                                                                  fillColor: FlutterFlowTheme.of(context).cogeusButtonBG,
                                                                                  icon: Icon(
                                                                                    Icons.edit,
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    size: 24.0,
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
                                                                                              child: const EditEngagementWidget(),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Builder(
                                                                          builder:
                                                                              (context) {
                                                                            if (FFAppState().activeSub) {
                                                                              return Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.66,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                  borderRadius: BorderRadius.circular(16.0),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(16.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        'Score NPS',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Manrope',
                                                                                              color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                              fontSize: 40.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Text(
                                                                                                valueOrDefault<String>(
                                                                                                  formatNumber(
                                                                                                    ((promotExperiencesRowList.length / containerExperiencesRowList.length) * 100) - ((detracExperiencesRowList.length / containerExperiencesRowList.length) * 100),
                                                                                                    formatType: FormatType.custom,
                                                                                                    format: '00',
                                                                                                    locale: '',
                                                                                                  ),
                                                                                                  '0',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Manrope',
                                                                                                      color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                                      fontSize: 30.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Builder(
                                                                                            builder: (context) => FlutterFlowIconButton(
                                                                                              borderRadius: 8.0,
                                                                                              buttonSize: 40.0,
                                                                                              icon: Icon(
                                                                                                Icons.info_outline,
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                size: 24.0,
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
                                                                                                          child: const SizedBox(
                                                                                                            height: 400.0,
                                                                                                            width: 490.0,
                                                                                                            child: InfosNpsWidget(),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(const SizedBox(width: 16.0)),
                                                                                      ),
                                                                                    ].divide(const SizedBox(height: 12.0)),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            } else {
                                                                              return Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.66,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).revoWhite,
                                                                                  borderRadius: BorderRadius.circular(16.0),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(16.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        'Votre abonnement n\'est pas actif !',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Manrope',
                                                                                              color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                              fontSize: 40.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                      ),
                                                                                      Text(
                                                                                        'Vous devez être abonné pour accéder à vos données !\nSi vous l\'êtes déjà, mettez à jour le système en cliquant en dessous.',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Manrope',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                                                                        child: FFButtonWidget(
                                                                                          onPressed: () async {
                                                                                            _model.userRow = await UsersTable().queryRows(
                                                                                              queryFn: (q) => q.eq(
                                                                                                'id',
                                                                                                currentUserUid,
                                                                                              ),
                                                                                            );
                                                                                            if (_model.userRow!.first.activeSub!) {
                                                                                              FFAppState().activeSub = true;
                                                                                              safeSetState(() {});

                                                                                              context.pushNamed('home');
                                                                                            } else {
                                                                                              _model.clientRow = await ClientsTable().queryRows(
                                                                                                queryFn: (q) => q.eq(
                                                                                                  'id',
                                                                                                  _model.userRow?.first.clientId,
                                                                                                ),
                                                                                              );
                                                                                              await launchURL('${_model.clientRow?.first.stripeLink != null && _model.clientRow?.first.stripeLink != '' ? _model.clientRow?.first.stripeLink : 'https://buy.stripe.com/4gwbIObk258E2kM7su'}?prefilled_email=$currentUserEmail');
                                                                                            }

                                                                                            safeSetState(() {});
                                                                                          },
                                                                                          text: 'Mettre à jour',
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
                                                                                ),
                                                                              );
                                                                            }
                                                                          },
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.32,
                                                                              height: MediaQuery.sizeOf(context).height * 0.22,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).revoWhite,
                                                                                borderRadius: BorderRadius.circular(16.0),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(16.0),
                                                                                child: SingleChildScrollView(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Text(
                                                                                                'Participants',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Manrope',
                                                                                                      color: FlutterFlowTheme.of(context).revoSearchTxtColor,
                                                                                                      fontSize: 16.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w300,
                                                                                                    ),
                                                                                              ),
                                                                                              Text(
                                                                                                valueOrDefault<String>(
                                                                                                  containerExperiencesRowList.length.toString(),
                                                                                                  '0',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Manrope',
                                                                                                      color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                                      fontSize: 30.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Text(
                                                                                                'Promoters %',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Manrope',
                                                                                                      color: FlutterFlowTheme.of(context).revoSearchIconColor,
                                                                                                      fontSize: 16.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w300,
                                                                                                    ),
                                                                                              ),
                                                                                              Text(
                                                                                                valueOrDefault<String>(
                                                                                                  formatNumber(
                                                                                                    (promotExperiencesRowList.length / containerExperiencesRowList.length),
                                                                                                    formatType: FormatType.percent,
                                                                                                  ),
                                                                                                  '0',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Manrope',
                                                                                                      color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                                      fontSize: 30.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Text(
                                                                                                'Detracteurs %',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Manrope',
                                                                                                      color: FlutterFlowTheme.of(context).revoSearchTxtColor,
                                                                                                      fontSize: 16.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w300,
                                                                                                    ),
                                                                                              ),
                                                                                              Text(
                                                                                                valueOrDefault<String>(
                                                                                                  formatNumber(
                                                                                                    (detracExperiencesRowList.length / containerExperiencesRowList.length),
                                                                                                    formatType: FormatType.percent,
                                                                                                  ),
                                                                                                  '0',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Manrope',
                                                                                                      color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                                      fontSize: 30.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ].divide(const SizedBox(width: 20.0)),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                                                                        child: FFButtonWidget(
                                                                                          onPressed: () async {
                                                                                            context.pushNamed('experiences');
                                                                                          },
                                                                                          text: 'Voir les retours',
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
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            FutureBuilder<List<ClientsRow>>(
                                                                              future: ClientsTable().querySingleRow(
                                                                                queryFn: (q) => q.eq(
                                                                                  'id',
                                                                                  FFAppState().activeClientID,
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

                                                                                final containerClientsRow = containerClientsRowList.isNotEmpty ? containerClientsRowList.first : null;

                                                                                return Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.32,
                                                                                  height: MediaQuery.sizeOf(context).height * 0.22,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).revoWhite,
                                                                                    borderRadius: BorderRadius.circular(16.0),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsets.all(16.0),
                                                                                    child: SingleChildScrollView(
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                            'Raisons exprimés',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Manrope',
                                                                                                  color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                                  fontSize: 40.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 50.0, 0.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    containerClientsRow?.theme1,
                                                                                                    'Theme 1 non défini',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Manrope',
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                                FutureBuilder<List<ExperiencesRow>>(
                                                                                                  future: ExperiencesTable().queryRows(
                                                                                                    queryFn: (q) => q
                                                                                                        .eq(
                                                                                                          'client_id',
                                                                                                          FFAppState().activeClientID,
                                                                                                        )
                                                                                                        .eq(
                                                                                                          'theme',
                                                                                                          containerClientsRow?.theme1,
                                                                                                        ),
                                                                                                  ),
                                                                                                  builder: (context, snapshot) {
                                                                                                    // Customize what your widget looks like when it's loading.
                                                                                                    if (!snapshot.hasData) {
                                                                                                      return Center(
                                                                                                        child: SizedBox(
                                                                                                          width: 14.0,
                                                                                                          height: 14.0,
                                                                                                          child: CircularProgressIndicator(
                                                                                                            valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                              FlutterFlowTheme.of(context).primary,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    }
                                                                                                    List<ExperiencesRow> textExperiencesRowList = snapshot.data!;

                                                                                                    return Text(
                                                                                                      valueOrDefault<String>(
                                                                                                        textExperiencesRowList.length.toString(),
                                                                                                        '0',
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Manrope',
                                                                                                            fontSize: 16.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 50.0, 0.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    containerClientsRow?.theme2,
                                                                                                    'Theme 2 non défini',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Manrope',
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                                FutureBuilder<List<ExperiencesRow>>(
                                                                                                  future: ExperiencesTable().queryRows(
                                                                                                    queryFn: (q) => q
                                                                                                        .eq(
                                                                                                          'client_id',
                                                                                                          FFAppState().activeClientID,
                                                                                                        )
                                                                                                        .eq(
                                                                                                          'theme',
                                                                                                          containerClientsRow?.theme2,
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
                                                                                                    List<ExperiencesRow> textExperiencesRowList = snapshot.data!;

                                                                                                    return Text(
                                                                                                      valueOrDefault<String>(
                                                                                                        textExperiencesRowList.length.toString(),
                                                                                                        '0',
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Manrope',
                                                                                                            fontSize: 16.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 50.0, 0.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    containerClientsRow?.theme3,
                                                                                                    'Theme 3 non défini',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Manrope',
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                                FutureBuilder<List<ExperiencesRow>>(
                                                                                                  future: ExperiencesTable().queryRows(
                                                                                                    queryFn: (q) => q
                                                                                                        .eq(
                                                                                                          'client_id',
                                                                                                          FFAppState().activeClientID,
                                                                                                        )
                                                                                                        .eq(
                                                                                                          'theme',
                                                                                                          containerClientsRow?.theme3,
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
                                                                                                    List<ExperiencesRow> textExperiencesRowList = snapshot.data!;

                                                                                                    return Text(
                                                                                                      valueOrDefault<String>(
                                                                                                        textExperiencesRowList.length.toString(),
                                                                                                        '0',
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Manrope',
                                                                                                            fontSize: 16.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 50.0, 0.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    containerClientsRow?.theme4,
                                                                                                    'Theme 4 non défini',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Manrope',
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                                FutureBuilder<List<ExperiencesRow>>(
                                                                                                  future: ExperiencesTable().queryRows(
                                                                                                    queryFn: (q) => q
                                                                                                        .eq(
                                                                                                          'client_id',
                                                                                                          FFAppState().activeClientID,
                                                                                                        )
                                                                                                        .eq(
                                                                                                          'theme',
                                                                                                          containerClientsRow?.theme4,
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
                                                                                                    List<ExperiencesRow> textExperiencesRowList = snapshot.data!;

                                                                                                    return Text(
                                                                                                      valueOrDefault<String>(
                                                                                                        textExperiencesRowList.length.toString(),
                                                                                                        '0',
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Manrope',
                                                                                                            fontSize: 16.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 50.0, 0.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'Autre',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Manrope',
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                                FutureBuilder<List<ExperiencesRow>>(
                                                                                                  future: ExperiencesTable().queryRows(
                                                                                                    queryFn: (q) => q
                                                                                                        .eq(
                                                                                                          'client_id',
                                                                                                          FFAppState().activeClientID,
                                                                                                        )
                                                                                                        .eq(
                                                                                                          'theme',
                                                                                                          'Autre',
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
                                                                                                    List<ExperiencesRow> textExperiencesRowList = snapshot.data!;

                                                                                                    return Text(
                                                                                                      valueOrDefault<String>(
                                                                                                        textExperiencesRowList.length.toString(),
                                                                                                        '0',
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Manrope',
                                                                                                            fontSize: 16.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(const SizedBox(height: 3.0)),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ),
                                                                          ].divide(const SizedBox(width: 24.0)),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.32,
                                                                              height: MediaQuery.sizeOf(context).height * 0.18,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).revoWhite,
                                                                                borderRadius: BorderRadius.circular(16.0),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(16.0),
                                                                                child: SingleChildScrollView(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        'Vidéos',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Manrope',
                                                                                              color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                              fontSize: 40.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ].divide(const SizedBox(width: 24.0)),
                                                                        ),
                                                                      ].divide(const SizedBox(
                                                                              height: 24.0)),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          );
                                                        },
                                                      ),
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
