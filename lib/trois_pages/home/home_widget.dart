import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/experience_related/edit_engagement/edit_engagement_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/navbarnav/navbarnav_widget.dart';
import '/trois_pages/infos_nps/infos_nps_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  static String routeName = 'home';
  static String routePath = '/home';

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

    return FutureBuilder<List<ClientsRow>>(
      future: ClientsTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'id',
          FFAppState().activeClientID,
        ),
      ),
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
        List<ClientsRow> homeClientsRowList = snapshot.data!;

        final homeClientsRow =
            homeClientsRowList.isNotEmpty ? homeClientsRowList.first : null;

        return Title(
            title: 'home',
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
                      FutureBuilder<ApiCallResponse>(
                        future: GetDashboardDataCall.call(
                          activeId: FFAppState().activeClientID,
                          levelId: () {
                            if (!FFAppState().isBrand &&
                                !FFAppState().isBU &&
                                FFAppState().isLoc) {
                              return 'loc_id';
                            } else if (!FFAppState().isBrand &&
                                FFAppState().isBU &&
                                !FFAppState().isLoc) {
                              return 'bu_id';
                            } else {
                              return 'client_id';
                            }
                          }(),
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
                          final containerGetDashboardDataResponse =
                              snapshot.data!;

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
                                    selectedIndex: 1,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).revoBG,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
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
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.7,
                                                  decoration: BoxDecoration(),
                                                  child: Container(
                                                    decoration: BoxDecoration(),
                                                    child: Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    'Dashboard -',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'GeistSans',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).revoCardTextColor,
                                                                          fontSize:
                                                                              28.72,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    FFAppState()
                                                                        .activeBrand,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'GeistSans',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).revoCardTextColor,
                                                                          fontSize:
                                                                              28.72,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                  Builder(
                                                                    builder:
                                                                        (context) =>
                                                                            Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          FlutterFlowIconButton(
                                                                        borderColor:
                                                                            Colors.transparent,
                                                                        borderRadius:
                                                                            8.0,
                                                                        buttonSize:
                                                                            40.0,
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).cogeusButtonBG,
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .edit,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                        onPressed:
                                                                            () async {
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (dialogContext) {
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
                                                                                    child: EditEngagementWidget(),
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
                                                            ),
                                                            if (GetDashboardDataCall
                                                                    .countnps(
                                                                  containerGetDashboardDataResponse
                                                                      .jsonBody,
                                                                )! >
                                                                0)
                                                              SingleChildScrollView(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
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
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.34,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).shadcnCardBorderGrey,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(16.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  'Score NPS',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'GeistSans',
                                                                                        color: FlutterFlowTheme.of(context).joliGrisPourTexteLeger,
                                                                                        fontSize: 16.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w300,
                                                                                        useGoogleFonts: false,
                                                                                      ),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        if (GetDashboardDataCall.npsscore(
                                                                                              containerGetDashboardDataResponse.jsonBody,
                                                                                            ) !=
                                                                                            null)
                                                                                          Text(
                                                                                            formatNumber(
                                                                                              (GetDashboardDataCall.npsscore(
                                                                                                    containerGetDashboardDataResponse.jsonBody,
                                                                                                  )!) *
                                                                                                  100,
                                                                                              formatType: FormatType.custom,
                                                                                              format: '00',
                                                                                              locale: '',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'GeistSans',
                                                                                                  color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                                  fontSize: 26.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  useGoogleFonts: false,
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
                                                                                                alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                child: WebViewAware(
                                                                                                  child: GestureDetector(
                                                                                                    onTap: () {
                                                                                                      FocusScope.of(dialogContext).unfocus();
                                                                                                      FocusManager.instance.primaryFocus?.unfocus();
                                                                                                    },
                                                                                                    child: Container(
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
                                                                                  ].divide(SizedBox(width: 16.0)),
                                                                                ),
                                                                              ].divide(SizedBox(height: 0.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.34,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).shadcnCardBorderGrey,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(16.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      'Participations complètes',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'GeistSans',
                                                                                            color: FlutterFlowTheme.of(context).joliGrisPourTexteLeger,
                                                                                            fontSize: 16.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w300,
                                                                                            useGoogleFonts: false,
                                                                                          ),
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        if (GetDashboardDataCall.raisonconnu(
                                                                                              containerGetDashboardDataResponse.jsonBody,
                                                                                            ) !=
                                                                                            null)
                                                                                          Text(
                                                                                            valueOrDefault<String>(
                                                                                              GetDashboardDataCall.raisonconnu(
                                                                                                containerGetDashboardDataResponse.jsonBody,
                                                                                              )?.toString(),
                                                                                              '0',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'GeistSans',
                                                                                                  color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                                  fontSize: 26.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  useGoogleFonts: false,
                                                                                                ),
                                                                                          ),
                                                                                        if (GetDashboardDataCall.countnps(
                                                                                              containerGetDashboardDataResponse.jsonBody,
                                                                                            ) !=
                                                                                            null)
                                                                                          Text(
                                                                                            'Sur ${GetDashboardDataCall.countnps(
                                                                                              containerGetDashboardDataResponse.jsonBody,
                                                                                            )?.toString()} réponses au NPS.',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'GeistSans',
                                                                                                  color: FlutterFlowTheme.of(context).joliGrisPourTexteLeger,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: false,
                                                                                                ),
                                                                                          ),
                                                                                      ].divide(SizedBox(width: 16.0)),
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 0.0)),
                                                                                ),
                                                                                FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    context.pushNamed(ExperiencesWidget.routeName);
                                                                                  },
                                                                                  text: 'Voir les retours',
                                                                                  options: FFButtonOptions(
                                                                                    height: 40.0,
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: Color(0xFFEEE8FC),
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          fontFamily: 'GeistSans',
                                                                                          color: Color(0xFF5E35B1),
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
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.22,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).shadcnCardBorderGrey,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(16.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  'Promoteurs',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'GeistSans',
                                                                                        color: FlutterFlowTheme.of(context).joliGrisPourTexteLeger,
                                                                                        fontSize: 16.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w300,
                                                                                        useGoogleFonts: false,
                                                                                      ),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children: [
                                                                                    if (GetDashboardDataCall.repartpromot(
                                                                                          containerGetDashboardDataResponse.jsonBody,
                                                                                        ) !=
                                                                                        null)
                                                                                      Text(
                                                                                        valueOrDefault<String>(
                                                                                          formatNumber(
                                                                                            GetDashboardDataCall.repartpromot(
                                                                                              containerGetDashboardDataResponse.jsonBody,
                                                                                            ),
                                                                                            formatType: FormatType.percent,
                                                                                          ),
                                                                                          '0',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'GeistSans',
                                                                                              color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                              fontSize: 26.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              useGoogleFonts: false,
                                                                                            ),
                                                                                      ),
                                                                                    if (GetDashboardDataCall.countpromoteurs(
                                                                                          containerGetDashboardDataResponse.jsonBody,
                                                                                        ) !=
                                                                                        null)
                                                                                      Text(
                                                                                        'Soit ${GetDashboardDataCall.countpromoteurs(
                                                                                          containerGetDashboardDataResponse.jsonBody,
                                                                                        )?.toString()} participants.',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'GeistSans',
                                                                                              color: FlutterFlowTheme.of(context).joliGrisPourTexteLeger,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: false,
                                                                                            ),
                                                                                      ),
                                                                                  ].divide(SizedBox(width: 16.0)),
                                                                                ),
                                                                              ].divide(SizedBox(height: 0.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.22,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).shadcnCardBorderGrey,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(16.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  'Passifs',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'GeistSans',
                                                                                        color: FlutterFlowTheme.of(context).joliGrisPourTexteLeger,
                                                                                        fontSize: 16.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w300,
                                                                                        useGoogleFonts: false,
                                                                                      ),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children: [
                                                                                    if (GetDashboardDataCall.repartindif(
                                                                                          containerGetDashboardDataResponse.jsonBody,
                                                                                        ) !=
                                                                                        null)
                                                                                      Text(
                                                                                        valueOrDefault<String>(
                                                                                          formatNumber(
                                                                                            GetDashboardDataCall.repartindif(
                                                                                              containerGetDashboardDataResponse.jsonBody,
                                                                                            ),
                                                                                            formatType: FormatType.percent,
                                                                                          ),
                                                                                          '0',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'GeistSans',
                                                                                              color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                              fontSize: 26.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              useGoogleFonts: false,
                                                                                            ),
                                                                                      ),
                                                                                    if (GetDashboardDataCall.countindifferent(
                                                                                          containerGetDashboardDataResponse.jsonBody,
                                                                                        ) !=
                                                                                        null)
                                                                                      Text(
                                                                                        'Soit ${GetDashboardDataCall.countindifferent(
                                                                                          containerGetDashboardDataResponse.jsonBody,
                                                                                        )?.toString()} participants.',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'GeistSans',
                                                                                              color: FlutterFlowTheme.of(context).joliGrisPourTexteLeger,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: false,
                                                                                            ),
                                                                                      ),
                                                                                  ].divide(SizedBox(width: 16.0)),
                                                                                ),
                                                                              ].divide(SizedBox(height: 0.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.22,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).shadcnCardBorderGrey,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(16.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  'Détracteurs',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'GeistSans',
                                                                                        color: FlutterFlowTheme.of(context).joliGrisPourTexteLeger,
                                                                                        fontSize: 16.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w300,
                                                                                        useGoogleFonts: false,
                                                                                      ),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children: [
                                                                                    if (GetDashboardDataCall.repartdetrac(
                                                                                          containerGetDashboardDataResponse.jsonBody,
                                                                                        ) !=
                                                                                        null)
                                                                                      Text(
                                                                                        valueOrDefault<String>(
                                                                                          formatNumber(
                                                                                            GetDashboardDataCall.repartdetrac(
                                                                                              containerGetDashboardDataResponse.jsonBody,
                                                                                            ),
                                                                                            formatType: FormatType.percent,
                                                                                          ),
                                                                                          '0',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'GeistSans',
                                                                                              color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                              fontSize: 26.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              useGoogleFonts: false,
                                                                                            ),
                                                                                      ),
                                                                                    if (GetDashboardDataCall.countdettracteurs(
                                                                                          containerGetDashboardDataResponse.jsonBody,
                                                                                        ) !=
                                                                                        null)
                                                                                      Text(
                                                                                        'Soit ${GetDashboardDataCall.countdettracteurs(
                                                                                          containerGetDashboardDataResponse.jsonBody,
                                                                                        )?.toString()} participants.',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'GeistSans',
                                                                                              color: FlutterFlowTheme.of(context).joliGrisPourTexteLeger,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: false,
                                                                                            ),
                                                                                      ),
                                                                                  ].divide(SizedBox(width: 16.0)),
                                                                                ),
                                                                              ].divide(SizedBox(height: 0.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          [
                                                                        Text(
                                                                          'Raisons',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'GeistSans',
                                                                                fontSize: 18.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                useGoogleFonts: false,
                                                                              ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            if (GetDashboardDataCall.totalpromoters(
                                                                                  containerGetDashboardDataResponse.jsonBody,
                                                                                ) !=
                                                                                0)
                                                                              Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.22,
                                                                                height: 250.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).shadcnCardBorderGrey,
                                                                                  ),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsets.all(16.0),
                                                                                  child: SingleChildScrollView(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          'Raisons des promoteurs',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'GeistSans',
                                                                                                color: FlutterFlowTheme.of(context).joliGrisPourTexteLeger,
                                                                                                fontSize: 16.0,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: false,
                                                                                              ),
                                                                                        ),
                                                                                        Text(
                                                                                          '${GetDashboardDataCall.totalpromoters(
                                                                                            containerGetDashboardDataResponse.jsonBody,
                                                                                          )?.toString()} réponses.',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'GeistSans',
                                                                                                color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                                fontSize: 14.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.normal,
                                                                                                useGoogleFonts: false,
                                                                                              ),
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Stack(
                                                                                              children: [
                                                                                                Container(
                                                                                                  width: valueOrDefault<double>(
                                                                                                    220 *
                                                                                                        (((GetDashboardDataCall.promotraison1count(
                                                                                                              containerGetDashboardDataResponse.jsonBody,
                                                                                                            )!) /
                                                                                                            (GetDashboardDataCall.totalpromoters(
                                                                                                              containerGetDashboardDataResponse.jsonBody,
                                                                                                            )!))),
                                                                                                    220.0,
                                                                                                  ),
                                                                                                  height: 28.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: Color(0xFFCAFBC4),
                                                                                                    borderRadius: BorderRadius.circular(2.0),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 6.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      homeClientsRow?.theme1,
                                                                                                      'them1',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'GeistSans',
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: false,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Text(
                                                                                              valueOrDefault<String>(
                                                                                                GetDashboardDataCall.promotraison1count(
                                                                                                  containerGetDashboardDataResponse.jsonBody,
                                                                                                )?.toString(),
                                                                                                '0',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'GeistSans',
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: false,
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Stack(
                                                                                              children: [
                                                                                                Container(
                                                                                                  width: valueOrDefault<double>(
                                                                                                    220 *
                                                                                                        (((GetDashboardDataCall.promotraison2count(
                                                                                                              containerGetDashboardDataResponse.jsonBody,
                                                                                                            )!) /
                                                                                                            (GetDashboardDataCall.totalpromoters(
                                                                                                              containerGetDashboardDataResponse.jsonBody,
                                                                                                            )!))),
                                                                                                    220.0,
                                                                                                  ),
                                                                                                  height: 28.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: Color(0xFFCAFBC4),
                                                                                                    borderRadius: BorderRadius.circular(2.0),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 6.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      homeClientsRow?.theme2,
                                                                                                      'them2',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'GeistSans',
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: false,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Text(
                                                                                              valueOrDefault<String>(
                                                                                                GetDashboardDataCall.promotraison2count(
                                                                                                  containerGetDashboardDataResponse.jsonBody,
                                                                                                )?.toString(),
                                                                                                '0',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'GeistSans',
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: false,
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Stack(
                                                                                              children: [
                                                                                                Container(
                                                                                                  width: valueOrDefault<double>(
                                                                                                    220 *
                                                                                                        (((GetDashboardDataCall.promotraison3count(
                                                                                                              containerGetDashboardDataResponse.jsonBody,
                                                                                                            )!) /
                                                                                                            (GetDashboardDataCall.totalpromoters(
                                                                                                              containerGetDashboardDataResponse.jsonBody,
                                                                                                            )!))),
                                                                                                    220.0,
                                                                                                  ),
                                                                                                  height: 28.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: Color(0xFFCAFBC4),
                                                                                                    borderRadius: BorderRadius.circular(2.0),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 6.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      homeClientsRow?.theme3,
                                                                                                      'them1',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'GeistSans',
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: false,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Text(
                                                                                              valueOrDefault<String>(
                                                                                                GetDashboardDataCall.promotraison3count(
                                                                                                  containerGetDashboardDataResponse.jsonBody,
                                                                                                )?.toString(),
                                                                                                '0',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'GeistSans',
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: false,
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Stack(
                                                                                              children: [
                                                                                                Container(
                                                                                                  width: valueOrDefault<double>(
                                                                                                    220 *
                                                                                                        (((GetDashboardDataCall.promotraison4count(
                                                                                                              containerGetDashboardDataResponse.jsonBody,
                                                                                                            )!) /
                                                                                                            (GetDashboardDataCall.totalpromoters(
                                                                                                              containerGetDashboardDataResponse.jsonBody,
                                                                                                            )!))),
                                                                                                    220.0,
                                                                                                  ),
                                                                                                  height: 28.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: Color(0xFFCAFBC4),
                                                                                                    borderRadius: BorderRadius.circular(2.0),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 6.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      homeClientsRow?.theme4,
                                                                                                      'them4',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'GeistSans',
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: false,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Text(
                                                                                              valueOrDefault<String>(
                                                                                                GetDashboardDataCall.promotraison4count(
                                                                                                  containerGetDashboardDataResponse.jsonBody,
                                                                                                )?.toString(),
                                                                                                '0',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'GeistSans',
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: false,
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Stack(
                                                                                              children: [
                                                                                                Container(
                                                                                                  width: valueOrDefault<double>(
                                                                                                    220 *
                                                                                                        (((GetDashboardDataCall.promotraison5count(
                                                                                                              containerGetDashboardDataResponse.jsonBody,
                                                                                                            )!) /
                                                                                                            (GetDashboardDataCall.totalpromoters(
                                                                                                              containerGetDashboardDataResponse.jsonBody,
                                                                                                            )!))),
                                                                                                    220.0,
                                                                                                  ),
                                                                                                  height: 28.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: Color(0xFFCAFBC4),
                                                                                                    borderRadius: BorderRadius.circular(2.0),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 6.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    'Autre',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'GeistSans',
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: false,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Text(
                                                                                              valueOrDefault<String>(
                                                                                                GetDashboardDataCall.promotraison5count(
                                                                                                  containerGetDashboardDataResponse.jsonBody,
                                                                                                )?.toString(),
                                                                                                '0',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'GeistSans',
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: false,
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 6.0)),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            if (GetDashboardDataCall.totalindifferent(
                                                                                  containerGetDashboardDataResponse.jsonBody,
                                                                                ) !=
                                                                                0)
                                                                              Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.22,
                                                                                height: 250.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).shadcnCardBorderGrey,
                                                                                  ),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsets.all(16.0),
                                                                                  child: SingleChildScrollView(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          'Raisons des passifs',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'GeistSans',
                                                                                                color: FlutterFlowTheme.of(context).joliGrisPourTexteLeger,
                                                                                                fontSize: 16.0,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: false,
                                                                                              ),
                                                                                        ),
                                                                                        Text(
                                                                                          '${GetDashboardDataCall.totalindifferent(
                                                                                            containerGetDashboardDataResponse.jsonBody,
                                                                                          )?.toString()} réponses.',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'GeistSans',
                                                                                                color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                                fontSize: 14.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.normal,
                                                                                                useGoogleFonts: false,
                                                                                              ),
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Stack(
                                                                                              children: [
                                                                                                Container(
                                                                                                  width: valueOrDefault<double>(
                                                                                                    220 *
                                                                                                        (((GetDashboardDataCall.passiveraison2count(
                                                                                                              containerGetDashboardDataResponse.jsonBody,
                                                                                                            )!) /
                                                                                                            (GetDashboardDataCall.totalindifferent(
                                                                                                              containerGetDashboardDataResponse.jsonBody,
                                                                                                            )!))),
                                                                                                    220.0,
                                                                                                  ),
                                                                                                  height: 28.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).shadcnCardBorderGrey,
                                                                                                    borderRadius: BorderRadius.circular(2.0),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 6.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      homeClientsRow?.theme1,
                                                                                                      'them1',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'GeistSans',
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: false,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Text(
                                                                                              valueOrDefault<String>(
                                                                                                GetDashboardDataCall.passiveraison1count(
                                                                                                  containerGetDashboardDataResponse.jsonBody,
                                                                                                )?.toString(),
                                                                                                '0',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'GeistSans',
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: false,
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Stack(
                                                                                              children: [
                                                                                                Container(
                                                                                                  width: valueOrDefault<double>(
                                                                                                    220 *
                                                                                                        (((GetDashboardDataCall.passiveraison2count(
                                                                                                              containerGetDashboardDataResponse.jsonBody,
                                                                                                            )!) /
                                                                                                            (GetDashboardDataCall.totalindifferent(
                                                                                                              containerGetDashboardDataResponse.jsonBody,
                                                                                                            )!))),
                                                                                                    220.0,
                                                                                                  ),
                                                                                                  height: 28.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).shadcnCardBorderGrey,
                                                                                                    borderRadius: BorderRadius.circular(2.0),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 6.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      homeClientsRow?.theme2,
                                                                                                      'them2',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'GeistSans',
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: false,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Text(
                                                                                              valueOrDefault<String>(
                                                                                                GetDashboardDataCall.passiveraison2count(
                                                                                                  containerGetDashboardDataResponse.jsonBody,
                                                                                                )?.toString(),
                                                                                                '0',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'GeistSans',
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: false,
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Stack(
                                                                                              children: [
                                                                                                Container(
                                                                                                  width: valueOrDefault<double>(
                                                                                                    220 *
                                                                                                        (((GetDashboardDataCall.passiveraison3count(
                                                                                                              containerGetDashboardDataResponse.jsonBody,
                                                                                                            )!) /
                                                                                                            (GetDashboardDataCall.totalindifferent(
                                                                                                              containerGetDashboardDataResponse.jsonBody,
                                                                                                            )!))),
                                                                                                    220.0,
                                                                                                  ),
                                                                                                  height: 28.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).shadcnCardBorderGrey,
                                                                                                    borderRadius: BorderRadius.circular(2.0),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 6.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      homeClientsRow?.theme3,
                                                                                                      'them1',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'GeistSans',
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: false,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Text(
                                                                                              valueOrDefault<String>(
                                                                                                GetDashboardDataCall.passiveraison3count(
                                                                                                  containerGetDashboardDataResponse.jsonBody,
                                                                                                )?.toString(),
                                                                                                '0',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'GeistSans',
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: false,
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Stack(
                                                                                              children: [
                                                                                                Container(
                                                                                                  width: valueOrDefault<double>(
                                                                                                    220 *
                                                                                                        (((GetDashboardDataCall.passiveraison4count(
                                                                                                              containerGetDashboardDataResponse.jsonBody,
                                                                                                            )!) /
                                                                                                            (GetDashboardDataCall.totalindifferent(
                                                                                                              containerGetDashboardDataResponse.jsonBody,
                                                                                                            )!))),
                                                                                                    220.0,
                                                                                                  ),
                                                                                                  height: 28.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).shadcnCardBorderGrey,
                                                                                                    borderRadius: BorderRadius.circular(2.0),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 6.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      homeClientsRow?.theme4,
                                                                                                      'them4',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'GeistSans',
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: false,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Text(
                                                                                              valueOrDefault<String>(
                                                                                                GetDashboardDataCall.passiveraison4count(
                                                                                                  containerGetDashboardDataResponse.jsonBody,
                                                                                                )?.toString(),
                                                                                                '0',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'GeistSans',
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: false,
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Stack(
                                                                                              children: [
                                                                                                Container(
                                                                                                  width: valueOrDefault<double>(
                                                                                                    220 *
                                                                                                        (((GetDashboardDataCall.passiveraison5count(
                                                                                                              containerGetDashboardDataResponse.jsonBody,
                                                                                                            )!) /
                                                                                                            (GetDashboardDataCall.totalindifferent(
                                                                                                              containerGetDashboardDataResponse.jsonBody,
                                                                                                            )!))),
                                                                                                    220.0,
                                                                                                  ),
                                                                                                  height: 28.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).shadcnCardBorderGrey,
                                                                                                    borderRadius: BorderRadius.circular(2.0),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 6.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    'Autre',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'GeistSans',
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: false,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Text(
                                                                                              valueOrDefault<String>(
                                                                                                GetDashboardDataCall.passiveraison5count(
                                                                                                  containerGetDashboardDataResponse.jsonBody,
                                                                                                )?.toString(),
                                                                                                '0',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'GeistSans',
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: false,
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 6.0)),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            if (GetDashboardDataCall.totaldetractors(
                                                                                  containerGetDashboardDataResponse.jsonBody,
                                                                                ) !=
                                                                                0)
                                                                              Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.22,
                                                                                height: 250.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).shadcnCardBorderGrey,
                                                                                  ),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsets.all(16.0),
                                                                                  child: SingleChildScrollView(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          'Raisons des detracteurs',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'GeistSans',
                                                                                                color: FlutterFlowTheme.of(context).joliGrisPourTexteLeger,
                                                                                                fontSize: 16.0,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: false,
                                                                                              ),
                                                                                        ),
                                                                                        Text(
                                                                                          '${GetDashboardDataCall.totaldetractors(
                                                                                            containerGetDashboardDataResponse.jsonBody,
                                                                                          )?.toString()} réponses.',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'GeistSans',
                                                                                                color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                                fontSize: 14.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.normal,
                                                                                                useGoogleFonts: false,
                                                                                              ),
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Stack(
                                                                                              children: [
                                                                                                Container(
                                                                                                  width: valueOrDefault<double>(
                                                                                                    220 *
                                                                                                        (((GetDashboardDataCall.detracraison1count(
                                                                                                              containerGetDashboardDataResponse.jsonBody,
                                                                                                            )!) /
                                                                                                            (GetDashboardDataCall.totaldetractors(
                                                                                                              containerGetDashboardDataResponse.jsonBody,
                                                                                                            )!))),
                                                                                                    220.0,
                                                                                                  ),
                                                                                                  height: 28.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: Color(0xFFFBC4C4),
                                                                                                    borderRadius: BorderRadius.circular(2.0),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 6.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      homeClientsRow?.theme1,
                                                                                                      'them1',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'GeistSans',
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: false,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Text(
                                                                                              valueOrDefault<String>(
                                                                                                GetDashboardDataCall.detracraison1count(
                                                                                                  containerGetDashboardDataResponse.jsonBody,
                                                                                                )?.toString(),
                                                                                                '0',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'GeistSans',
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: false,
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Stack(
                                                                                              children: [
                                                                                                Container(
                                                                                                  width: valueOrDefault<double>(
                                                                                                    220 *
                                                                                                        (((GetDashboardDataCall.detracraison2count(
                                                                                                              containerGetDashboardDataResponse.jsonBody,
                                                                                                            )!) /
                                                                                                            (GetDashboardDataCall.totaldetractors(
                                                                                                              containerGetDashboardDataResponse.jsonBody,
                                                                                                            )!))),
                                                                                                    220.0,
                                                                                                  ),
                                                                                                  height: 28.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: Color(0xFFFBC4C4),
                                                                                                    borderRadius: BorderRadius.circular(2.0),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 6.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      homeClientsRow?.theme2,
                                                                                                      'them2',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'GeistSans',
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: false,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Text(
                                                                                              valueOrDefault<String>(
                                                                                                GetDashboardDataCall.detracraison2count(
                                                                                                  containerGetDashboardDataResponse.jsonBody,
                                                                                                )?.toString(),
                                                                                                '0',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'GeistSans',
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: false,
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Stack(
                                                                                              children: [
                                                                                                Container(
                                                                                                  width: valueOrDefault<double>(
                                                                                                    220 *
                                                                                                        (((GetDashboardDataCall.detracraison3count(
                                                                                                              containerGetDashboardDataResponse.jsonBody,
                                                                                                            )!) /
                                                                                                            (GetDashboardDataCall.totaldetractors(
                                                                                                              containerGetDashboardDataResponse.jsonBody,
                                                                                                            )!))),
                                                                                                    220.0,
                                                                                                  ),
                                                                                                  height: 28.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: Color(0xFFFBC4C4),
                                                                                                    borderRadius: BorderRadius.circular(2.0),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 6.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      homeClientsRow?.theme3,
                                                                                                      'them1',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'GeistSans',
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: false,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Text(
                                                                                              valueOrDefault<String>(
                                                                                                GetDashboardDataCall.detracraison3count(
                                                                                                  containerGetDashboardDataResponse.jsonBody,
                                                                                                )?.toString(),
                                                                                                '0',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'GeistSans',
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: false,
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Stack(
                                                                                              children: [
                                                                                                Container(
                                                                                                  width: valueOrDefault<double>(
                                                                                                    220 *
                                                                                                        (((GetDashboardDataCall.detracraison4count(
                                                                                                              containerGetDashboardDataResponse.jsonBody,
                                                                                                            )!) /
                                                                                                            (GetDashboardDataCall.totaldetractors(
                                                                                                              containerGetDashboardDataResponse.jsonBody,
                                                                                                            )!))),
                                                                                                    220.0,
                                                                                                  ),
                                                                                                  height: 28.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: Color(0xFFFBC4C4),
                                                                                                    borderRadius: BorderRadius.circular(2.0),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 6.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      homeClientsRow?.theme4,
                                                                                                      'them4',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'GeistSans',
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: false,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Text(
                                                                                              valueOrDefault<String>(
                                                                                                GetDashboardDataCall.detracraison4count(
                                                                                                  containerGetDashboardDataResponse.jsonBody,
                                                                                                )?.toString(),
                                                                                                '0',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'GeistSans',
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: false,
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Stack(
                                                                                              children: [
                                                                                                Container(
                                                                                                  width: valueOrDefault<double>(
                                                                                                    220 *
                                                                                                        (((GetDashboardDataCall.detracraison5count(
                                                                                                              containerGetDashboardDataResponse.jsonBody,
                                                                                                            )!) /
                                                                                                            (GetDashboardDataCall.totaldetractors(
                                                                                                              containerGetDashboardDataResponse.jsonBody,
                                                                                                            )!))),
                                                                                                    220.0,
                                                                                                  ),
                                                                                                  height: 28.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: Color(0xFFFBC4C4),
                                                                                                    borderRadius: BorderRadius.circular(2.0),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 6.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    'Autre',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'GeistSans',
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: false,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Text(
                                                                                              valueOrDefault<String>(
                                                                                                GetDashboardDataCall.detracraison5count(
                                                                                                  containerGetDashboardDataResponse.jsonBody,
                                                                                                )?.toString(),
                                                                                                '0',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'GeistSans',
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: false,
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 6.0)),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 8.0)),
                                                                    ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          [
                                                                        Text(
                                                                          'Insights',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'GeistSans',
                                                                                fontSize: 18.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                useGoogleFonts: false,
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
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                if (GetDashboardDataCall.countfeedbackanswer(
                                                                                      containerGetDashboardDataResponse.jsonBody,
                                                                                    )! >
                                                                                    0)
                                                                                  Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 0.34,
                                                                                    height: 210.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                      border: Border.all(
                                                                                        color: FlutterFlowTheme.of(context).shadcnCardBorderGrey,
                                                                                      ),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsets.all(16.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                            'Feeback récoltés',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'GeistSans',
                                                                                                  color: FlutterFlowTheme.of(context).joliGrisPourTexteLeger,
                                                                                                  fontSize: 16.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w300,
                                                                                                  useGoogleFonts: false,
                                                                                                ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                                                              children: [
                                                                                                Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    GetDashboardDataCall.countfeedbackanswer(
                                                                                                      containerGetDashboardDataResponse.jsonBody,
                                                                                                    )?.toString(),
                                                                                                    '0',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'GeistSans',
                                                                                                        color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                                        fontSize: 26.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        useGoogleFonts: false,
                                                                                                      ),
                                                                                                ),
                                                                                              ].divide(SizedBox(width: 16.0)),
                                                                                            ),
                                                                                          ),
                                                                                          SingleChildScrollView(
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                                                                                                          20 *
                                                                                                                              ((GetDashboardDataCall.moyfeedbackgeneral(
                                                                                                                                containerGetDashboardDataResponse.jsonBody,
                                                                                                                              )!)),
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
                                                                                                                      GetDashboardDataCall.moyfeedbackgeneral(
                                                                                                                        containerGetDashboardDataResponse.jsonBody,
                                                                                                                      ),
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
                                                                                                                homeClientsRow?.theme1,
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
                                                                                                                            20 *
                                                                                                                                ((GetDashboardDataCall.moyfeedback1(
                                                                                                                                  containerGetDashboardDataResponse.jsonBody,
                                                                                                                                )!)),
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
                                                                                                                        GetDashboardDataCall.moyfeedback1(
                                                                                                                          containerGetDashboardDataResponse.jsonBody,
                                                                                                                        ),
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
                                                                                                                homeClientsRow?.theme2,
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
                                                                                                                          20 *
                                                                                                                              ((GetDashboardDataCall.moyfeedback2(
                                                                                                                                containerGetDashboardDataResponse.jsonBody,
                                                                                                                              )!)),
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
                                                                                                                      GetDashboardDataCall.moyfeedback2(
                                                                                                                        containerGetDashboardDataResponse.jsonBody,
                                                                                                                      ),
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
                                                                                                                homeClientsRow?.theme3,
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
                                                                                                                          20 *
                                                                                                                              ((GetDashboardDataCall.moyfeedback3(
                                                                                                                                containerGetDashboardDataResponse.jsonBody,
                                                                                                                              )!)),
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
                                                                                                                      GetDashboardDataCall.moyfeedback3(
                                                                                                                        containerGetDashboardDataResponse.jsonBody,
                                                                                                                      ),
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
                                                                                                                homeClientsRow?.theme4,
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
                                                                                                                          20 *
                                                                                                                              ((GetDashboardDataCall.moyfeedback4(
                                                                                                                                containerGetDashboardDataResponse.jsonBody,
                                                                                                                              )!)),
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
                                                                                                                      GetDashboardDataCall.moyfeedback4(
                                                                                                                        containerGetDashboardDataResponse.jsonBody,
                                                                                                                      ),
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
                                                                                              ].divide(SizedBox(height: 3.0)),
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(height: 0.0)),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                              ].divide(SizedBox(height: 16.0)),
                                                                            ),
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                if (GetDashboardDataCall.countreviewdone(
                                                                                      containerGetDashboardDataResponse.jsonBody,
                                                                                    ) !=
                                                                                    null)
                                                                                  Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 0.34,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                      border: Border.all(
                                                                                        color: FlutterFlowTheme.of(context).shadcnCardBorderGrey,
                                                                                      ),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsets.all(16.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                            'Redirections avis',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'GeistSans',
                                                                                                  color: FlutterFlowTheme.of(context).joliGrisPourTexteLeger,
                                                                                                  fontSize: 16.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  useGoogleFonts: false,
                                                                                                ),
                                                                                          ),
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.end,
                                                                                            children: [
                                                                                              Text(
                                                                                                valueOrDefault<String>(
                                                                                                  GetDashboardDataCall.countreviewdone(
                                                                                                    containerGetDashboardDataResponse.jsonBody,
                                                                                                  )?.toString(),
                                                                                                  '0',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'GeistSans',
                                                                                                      color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                                      fontSize: 26.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      useGoogleFonts: false,
                                                                                                    ),
                                                                                              ),
                                                                                            ].divide(SizedBox(width: 16.0)),
                                                                                          ),
                                                                                        ].divide(SizedBox(height: 0.0)),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.34,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).shadcnCardBorderGrey,
                                                                                    ),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets.all(16.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          'Demandes de contact',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'GeistSans',
                                                                                                color: FlutterFlowTheme.of(context).joliGrisPourTexteLeger,
                                                                                                fontSize: 16.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.normal,
                                                                                                useGoogleFonts: false,
                                                                                              ),
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.end,
                                                                                          children: [
                                                                                            FFButtonWidget(
                                                                                              onPressed: () async {
                                                                                                context.pushNamed(RecontactWidget.routeName);
                                                                                              },
                                                                                              text: 'Voir les demandes',
                                                                                              options: FFButtonOptions(
                                                                                                height: 40.0,
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                color: Color(0xFFEEE8FC),
                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      fontFamily: 'GeistSans',
                                                                                                      color: Color(0xFF5E35B1),
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
                                                                                          ].divide(SizedBox(width: 16.0)),
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 10.0)),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(height: 16.0)),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 8.0)),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          24.0)),
                                                                ),
                                                              ),
                                                            if ((GetDashboardDataCall
                                                                        .countnps(
                                                                      containerGetDashboardDataResponse
                                                                          .jsonBody,
                                                                    ) ==
                                                                    null) ||
                                                                (GetDashboardDataCall
                                                                        .countnps(
                                                                      containerGetDashboardDataResponse
                                                                          .jsonBody,
                                                                    ) ==
                                                                    0))
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    height:
                                                                        180.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .shadcnCardBorderGrey,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              16.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              Text(
                                                                                'Vous n\'avez pas encore de retours à visualiser !',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'GeistSans',
                                                                                      fontSize: 24.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      useGoogleFonts: false,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                'Commencez à envoyer des invitations de participation. \nVous pouvez le faire par mail avec notre code Html, ou grâce au lien à envoyer par tout autre moyen.',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'GeistSans',
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: false,
                                                                                    ),
                                                                              ),
                                                                            ].divide(SizedBox(height: 8.0)),
                                                                          ),
                                                                          FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              context.pushNamed(RedirectionsWidget.routeName);
                                                                            },
                                                                            text:
                                                                                'Finir le setup ',
                                                                            icon:
                                                                                Icon(
                                                                              Icons.settings_sharp,
                                                                              size: 15.0,
                                                                            ),
                                                                            options:
                                                                                FFButtonOptions(
                                                                              width: double.infinity,
                                                                              height: 40.0,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              color: Color(0xFFEEE8FC),
                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: 'GeistSans',
                                                                                    color: Color(0xFF5E35B1),
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.normal,
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
                                                                ],
                                                              ),
                                                          ].divide(SizedBox(
                                                              height: 24.0)),
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
                                    ),
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
      },
    );
  }
}
