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
import 'home_copy2_model.dart';
export 'home_copy2_model.dart';

class HomeCopy2Widget extends StatefulWidget {
  const HomeCopy2Widget({super.key});

  static String routeName = 'homeCopy2';
  static String routePath = '/homesaveneverknow';

  @override
  State<HomeCopy2Widget> createState() => _HomeCopy2WidgetState();
}

class _HomeCopy2WidgetState extends State<HomeCopy2Widget> {
  late HomeCopy2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeCopy2Model());

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
        title: 'homeCopy2',
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
                    future: ClientsTable().querySingleRow(
                      queryFn: (q) => q.eqOrNull(
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
                                selectedIndex: 1,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).revoBG,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      50.0, 32.0, 50.0, 40.0),
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
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Builder(
                                                builder: (context) {
                                                  if ((FFAppState().isBrand ==
                                                          true) &&
                                                      (FFAppState().isBU ==
                                                          false) &&
                                                      (FFAppState().isLoc ==
                                                          false)) {
                                                    return SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          FutureBuilder<
                                                              List<
                                                                  ExperiencesRow>>(
                                                            future:
                                                                ExperiencesTable()
                                                                    .queryRows(
                                                              queryFn: (q) =>
                                                                  q.eqOrNull(
                                                                'client_id',
                                                                FFAppState()
                                                                    .activeClientID,
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
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        SpinKitRing(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          50.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<ExperiencesRow>
                                                                  containerExperiencesRowList =
                                                                  snapshot
                                                                      .data!;

                                                              return Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.7,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: FutureBuilder<
                                                                    List<
                                                                        ExperiencesRow>>(
                                                                  future: ExperiencesTable()
                                                                      .queryRows(
                                                                    queryFn: (q) => q
                                                                        .eqOrNull(
                                                                          'client_id',
                                                                          FFAppState()
                                                                              .activeClientID,
                                                                        )
                                                                        .gtOrNull(
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
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              SpinKitRing(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                50.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<ExperiencesRow>
                                                                        promotExperiencesRowList =
                                                                        snapshot
                                                                            .data!;

                                                                    return Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child: FutureBuilder<
                                                                          List<
                                                                              ExperiencesRow>>(
                                                                        future:
                                                                            ExperiencesTable().queryRows(
                                                                          queryFn: (q) => q
                                                                              .eqOrNull(
                                                                                'client_id',
                                                                                FFAppState().activeClientID,
                                                                              )
                                                                              .ltOrNull(
                                                                                'nps',
                                                                                7,
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
                                                                          List<ExperiencesRow>
                                                                              detracExperiencesRowList =
                                                                              snapshot.data!;

                                                                          return Container(
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                SingleChildScrollView(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Container(
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          'OLDDDDDD',
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
                                                                                        Builder(
                                                                                          builder: (context) => Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
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
                                                                                  Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 0.66,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      borderRadius: BorderRadius.circular(16.0),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsets.all(16.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                            'Score NPS',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'GeistSans',
                                                                                                  color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                                  fontSize: 33.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  useGoogleFonts: false,
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
                                                                                                          fontFamily: 'GeistSans',
                                                                                                          color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                                          fontSize: 30.0,
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
                                                                                        ].divide(SizedBox(height: 12.0)),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: MediaQuery.sizeOf(context).width * 0.32,
                                                                                        height: MediaQuery.sizeOf(context).height * 0.22,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).revoWhite,
                                                                                          borderRadius: BorderRadius.circular(16.0),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsets.all(16.0),
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
                                                                                                                fontFamily: 'GeistSans',
                                                                                                                color: FlutterFlowTheme.of(context).revoSearchTxtColor,
                                                                                                                fontSize: 16.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w300,
                                                                                                                useGoogleFonts: false,
                                                                                                              ),
                                                                                                        ),
                                                                                                        Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            containerExperiencesRowList.length.toString(),
                                                                                                            '0',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'GeistSans',
                                                                                                                color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                                                fontSize: 30.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                useGoogleFonts: false,
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
                                                                                                                fontFamily: 'GeistSans',
                                                                                                                color: FlutterFlowTheme.of(context).revoSearchIconColor,
                                                                                                                fontSize: 16.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w300,
                                                                                                                useGoogleFonts: false,
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
                                                                                                                fontFamily: 'GeistSans',
                                                                                                                color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                                                fontSize: 30.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                useGoogleFonts: false,
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
                                                                                                                fontFamily: 'GeistSans',
                                                                                                                color: FlutterFlowTheme.of(context).revoSearchTxtColor,
                                                                                                                fontSize: 16.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w300,
                                                                                                                useGoogleFonts: false,
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
                                                                                                                fontFamily: 'GeistSans',
                                                                                                                color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                                                fontSize: 30.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                useGoogleFonts: false,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ].divide(SizedBox(width: 20.0)),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                                                                                  child: FFButtonWidget(
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
                                                                                                ),
                                                                                              ].divide(SizedBox(height: 12.0)),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      FutureBuilder<List<ClientsRow>>(
                                                                                        future: ClientsTable().querySingleRow(
                                                                                          queryFn: (q) => q.eqOrNull(
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
                                                                                              padding: EdgeInsets.all(16.0),
                                                                                              child: SingleChildScrollView(
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      'Raisons exprimées',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'GeistSans',
                                                                                                            color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                                            fontSize: 26.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w500,
                                                                                                            useGoogleFonts: false,
                                                                                                          ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 50.0, 0.0),
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
                                                                                                                  fontFamily: 'GeistSans',
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  useGoogleFonts: false,
                                                                                                                ),
                                                                                                          ),
                                                                                                          FutureBuilder<List<ExperiencesRow>>(
                                                                                                            future: ExperiencesTable().queryRows(
                                                                                                              queryFn: (q) => q
                                                                                                                  .eqOrNull(
                                                                                                                    'client_id',
                                                                                                                    FFAppState().activeClientID,
                                                                                                                  )
                                                                                                                  .eqOrNull(
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
                                                                                                                      fontFamily: 'GeistSans',
                                                                                                                      fontSize: 16.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: false,
                                                                                                                    ),
                                                                                                              );
                                                                                                            },
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 50.0, 0.0),
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
                                                                                                                  fontFamily: 'GeistSans',
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  useGoogleFonts: false,
                                                                                                                ),
                                                                                                          ),
                                                                                                          FutureBuilder<List<ExperiencesRow>>(
                                                                                                            future: ExperiencesTable().queryRows(
                                                                                                              queryFn: (q) => q
                                                                                                                  .eqOrNull(
                                                                                                                    'client_id',
                                                                                                                    FFAppState().activeClientID,
                                                                                                                  )
                                                                                                                  .eqOrNull(
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
                                                                                                                      fontFamily: 'GeistSans',
                                                                                                                      fontSize: 16.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: false,
                                                                                                                    ),
                                                                                                              );
                                                                                                            },
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 50.0, 0.0),
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
                                                                                                                  fontFamily: 'GeistSans',
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  useGoogleFonts: false,
                                                                                                                ),
                                                                                                          ),
                                                                                                          FutureBuilder<List<ExperiencesRow>>(
                                                                                                            future: ExperiencesTable().queryRows(
                                                                                                              queryFn: (q) => q
                                                                                                                  .eqOrNull(
                                                                                                                    'client_id',
                                                                                                                    FFAppState().activeClientID,
                                                                                                                  )
                                                                                                                  .eqOrNull(
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
                                                                                                                      fontFamily: 'GeistSans',
                                                                                                                      fontSize: 16.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: false,
                                                                                                                    ),
                                                                                                              );
                                                                                                            },
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 50.0, 0.0),
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
                                                                                                                  fontFamily: 'GeistSans',
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  useGoogleFonts: false,
                                                                                                                ),
                                                                                                          ),
                                                                                                          FutureBuilder<List<ExperiencesRow>>(
                                                                                                            future: ExperiencesTable().queryRows(
                                                                                                              queryFn: (q) => q
                                                                                                                  .eqOrNull(
                                                                                                                    'client_id',
                                                                                                                    FFAppState().activeClientID,
                                                                                                                  )
                                                                                                                  .eqOrNull(
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
                                                                                                                      fontFamily: 'GeistSans',
                                                                                                                      fontSize: 16.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: false,
                                                                                                                    ),
                                                                                                              );
                                                                                                            },
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 50.0, 0.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            'Autre',
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'GeistSans',
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  useGoogleFonts: false,
                                                                                                                ),
                                                                                                          ),
                                                                                                          FutureBuilder<List<ExperiencesRow>>(
                                                                                                            future: ExperiencesTable().queryRows(
                                                                                                              queryFn: (q) => q
                                                                                                                  .eqOrNull(
                                                                                                                    'client_id',
                                                                                                                    FFAppState().activeClientID,
                                                                                                                  )
                                                                                                                  .eqOrNull(
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
                                                                                                                      fontFamily: 'GeistSans',
                                                                                                                      fontSize: 16.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: false,
                                                                                                                    ),
                                                                                                              );
                                                                                                            },
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ].divide(SizedBox(height: 3.0)),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ].divide(SizedBox(width: 24.0)),
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: MediaQuery.sizeOf(context).width * 0.32,
                                                                                        height: MediaQuery.sizeOf(context).height * 0.22,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).revoWhite,
                                                                                          borderRadius: BorderRadius.circular(16.0),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsets.all(16.0),
                                                                                          child: SingleChildScrollView(
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          'Nombre de redirections pour un avis',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'GeistSans',
                                                                                                                color: FlutterFlowTheme.of(context).revoSearchIconColor,
                                                                                                                fontSize: 16.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w300,
                                                                                                                useGoogleFonts: false,
                                                                                                              ),
                                                                                                        ),
                                                                                                        Text(
                                                                                                          containerExperiencesRowList.where((e) => e.reviewDone == true).toList().length.toString(),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'GeistSans',
                                                                                                                color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                                                fontSize: 30.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                useGoogleFonts: false,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          'Nombre de feedback reçu',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'GeistSans',
                                                                                                                color: FlutterFlowTheme.of(context).revoSearchIconColor,
                                                                                                                fontSize: 16.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w300,
                                                                                                                useGoogleFonts: false,
                                                                                                              ),
                                                                                                        ),
                                                                                                        Text(
                                                                                                          containerExperiencesRowList.where((e) => e.feedbackAnswer == true).toList().length.toString(),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'GeistSans',
                                                                                                                color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                                                fontSize: 30.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                useGoogleFonts: false,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ].divide(SizedBox(height: 12.0)),
                                                                                                ),
                                                                                              ].divide(SizedBox(height: 12.0)),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        width: MediaQuery.sizeOf(context).width * 0.32,
                                                                                        height: MediaQuery.sizeOf(context).height * 0.22,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).revoWhite,
                                                                                          borderRadius: BorderRadius.circular(16.0),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 16.0),
                                                                                          child: SingleChildScrollView(
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'Feedbacks (${containerClientsRow?.countFeedbackAnswer?.toString()} participants)',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'GeistSans',
                                                                                                        color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                                        fontSize: 26.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        useGoogleFonts: false,
                                                                                                      ),
                                                                                                ),
                                                                                                Container(
                                                                                                  width: 290.0,
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
                                                                                                          Text(
                                                                                                            '(${formatNumber(
                                                                                                              containerClientsRow?.moyFeedbackGeneral,
                                                                                                              formatType: FormatType.custom,
                                                                                                              format: '0.#',
                                                                                                              locale: '',
                                                                                                            )})',
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'GeistSans',
                                                                                                                  fontSize: 18.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                  useGoogleFonts: false,
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
                                                                                                          Text(
                                                                                                            '(${formatNumber(
                                                                                                              containerClientsRow?.moyFeedback1,
                                                                                                              formatType: FormatType.custom,
                                                                                                              format: '0.#',
                                                                                                              locale: '',
                                                                                                            )})',
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'GeistSans',
                                                                                                                  fontSize: 18.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                  useGoogleFonts: false,
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
                                                                                                          Text(
                                                                                                            '(${formatNumber(
                                                                                                              containerClientsRow?.moyFeedback2,
                                                                                                              formatType: FormatType.custom,
                                                                                                              format: '0.#',
                                                                                                              locale: '',
                                                                                                            )})',
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'GeistSans',
                                                                                                                  fontSize: 18.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                  useGoogleFonts: false,
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
                                                                                                          Text(
                                                                                                            '(${formatNumber(
                                                                                                              containerClientsRow?.moyFeedback3,
                                                                                                              formatType: FormatType.custom,
                                                                                                              format: '0.#',
                                                                                                              locale: '',
                                                                                                            )})',
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'GeistSans',
                                                                                                                  fontSize: 18.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                  useGoogleFonts: false,
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
                                                                                                          Text(
                                                                                                            '(${formatNumber(
                                                                                                              containerClientsRow?.moyFeedback4,
                                                                                                              formatType: FormatType.custom,
                                                                                                              format: '0.#',
                                                                                                              locale: '',
                                                                                                            )})',
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'GeistSans',
                                                                                                                  fontSize: 18.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                  useGoogleFonts: false,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ].divide(SizedBox(width: 6.0)),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ].divide(SizedBox(height: 3.0)),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ].divide(SizedBox(width: 24.0)),
                                                                                  ),
                                                                                ].divide(SizedBox(height: 24.0)),
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
                                                    );
                                                  } else if ((FFAppState()
                                                              .isBrand ==
                                                          false) &&
                                                      (FFAppState().isBU ==
                                                          true) &&
                                                      (FFAppState().isLoc ==
                                                          false)) {
                                                    return SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          FutureBuilder<
                                                              List<
                                                                  ExperiencesRow>>(
                                                            future:
                                                                ExperiencesTable()
                                                                    .queryRows(
                                                              queryFn: (q) =>
                                                                  q.eqOrNull(
                                                                'bu_id',
                                                                FFAppState()
                                                                    .activeClientID,
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
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        SpinKitRing(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          50.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<ExperiencesRow>
                                                                  containerExperiencesRowList =
                                                                  snapshot
                                                                      .data!;

                                                              return Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.7,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: FutureBuilder<
                                                                    List<
                                                                        ExperiencesRow>>(
                                                                  future: ExperiencesTable()
                                                                      .queryRows(
                                                                    queryFn: (q) => q
                                                                        .eqOrNull(
                                                                          'bu_id',
                                                                          FFAppState()
                                                                              .activeClientID,
                                                                        )
                                                                        .gtOrNull(
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
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              SpinKitRing(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                50.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<ExperiencesRow>
                                                                        promotExperiencesRowList =
                                                                        snapshot
                                                                            .data!;

                                                                    return Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child: FutureBuilder<
                                                                          List<
                                                                              ExperiencesRow>>(
                                                                        future:
                                                                            ExperiencesTable().queryRows(
                                                                          queryFn: (q) => q
                                                                              .eqOrNull(
                                                                                'bu_id',
                                                                                FFAppState().activeClientID,
                                                                              )
                                                                              .ltOrNull(
                                                                                'nps',
                                                                                7,
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
                                                                          List<ExperiencesRow>
                                                                              detracExperiencesRowList =
                                                                              snapshot.data!;

                                                                          return Container(
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                SingleChildScrollView(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Container(
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          'Dashboard -',
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
                                                                                        Builder(
                                                                                          builder: (context) => Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
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
                                                                                  Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 0.66,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      borderRadius: BorderRadius.circular(16.0),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsets.all(16.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                            'Score NPS',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'GeistSans',
                                                                                                  color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                                  fontSize: 40.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  useGoogleFonts: false,
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
                                                                                                          fontFamily: 'GeistSans',
                                                                                                          color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                                          fontSize: 30.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          useGoogleFonts: false,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Builder(
                                                                                                builder: (context) => FlutterFlowIconButton(
                                                                                                  borderColor: Colors.transparent,
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
                                                                                        ].divide(SizedBox(height: 12.0)),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: MediaQuery.sizeOf(context).width * 0.32,
                                                                                        height: MediaQuery.sizeOf(context).height * 0.22,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).revoWhite,
                                                                                          borderRadius: BorderRadius.circular(16.0),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsets.all(16.0),
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
                                                                                                                fontFamily: 'GeistSans',
                                                                                                                color: FlutterFlowTheme.of(context).revoSearchTxtColor,
                                                                                                                fontSize: 16.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w300,
                                                                                                                useGoogleFonts: false,
                                                                                                              ),
                                                                                                        ),
                                                                                                        Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            containerExperiencesRowList.length.toString(),
                                                                                                            '0',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'GeistSans',
                                                                                                                color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                                                fontSize: 30.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                useGoogleFonts: false,
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
                                                                                                                fontFamily: 'GeistSans',
                                                                                                                color: FlutterFlowTheme.of(context).revoSearchIconColor,
                                                                                                                fontSize: 16.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w300,
                                                                                                                useGoogleFonts: false,
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
                                                                                                                fontFamily: 'GeistSans',
                                                                                                                color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                                                fontSize: 30.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                useGoogleFonts: false,
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
                                                                                                                fontFamily: 'GeistSans',
                                                                                                                color: FlutterFlowTheme.of(context).revoSearchTxtColor,
                                                                                                                fontSize: 16.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w300,
                                                                                                                useGoogleFonts: false,
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
                                                                                                                fontFamily: 'GeistSans',
                                                                                                                color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                                                fontSize: 30.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                useGoogleFonts: false,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ].divide(SizedBox(width: 20.0)),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                                                                                  child: FFButtonWidget(
                                                                                                    onPressed: () {
                                                                                                      print('Button pressed ...');
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
                                                                                                ),
                                                                                              ].divide(SizedBox(height: 12.0)),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      FutureBuilder<List<ClientsRow>>(
                                                                                        future: ClientsTable().querySingleRow(
                                                                                          queryFn: (q) => q.eqOrNull(
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
                                                                                              padding: EdgeInsets.all(16.0),
                                                                                              child: SingleChildScrollView(
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      'Raisons exprimés',
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
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 50.0, 0.0),
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
                                                                                                                  fontFamily: 'GeistSans',
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  useGoogleFonts: false,
                                                                                                                ),
                                                                                                          ),
                                                                                                          FutureBuilder<List<ExperiencesRow>>(
                                                                                                            future: ExperiencesTable().queryRows(
                                                                                                              queryFn: (q) => q
                                                                                                                  .eqOrNull(
                                                                                                                    'client_id',
                                                                                                                    FFAppState().activeClientID,
                                                                                                                  )
                                                                                                                  .eqOrNull(
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
                                                                                                                      fontFamily: 'GeistSans',
                                                                                                                      fontSize: 16.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: false,
                                                                                                                    ),
                                                                                                              );
                                                                                                            },
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 50.0, 0.0),
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
                                                                                                                  fontFamily: 'GeistSans',
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  useGoogleFonts: false,
                                                                                                                ),
                                                                                                          ),
                                                                                                          FutureBuilder<List<ExperiencesRow>>(
                                                                                                            future: ExperiencesTable().queryRows(
                                                                                                              queryFn: (q) => q
                                                                                                                  .eqOrNull(
                                                                                                                    'client_id',
                                                                                                                    FFAppState().activeClientID,
                                                                                                                  )
                                                                                                                  .eqOrNull(
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
                                                                                                                      fontFamily: 'GeistSans',
                                                                                                                      fontSize: 16.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: false,
                                                                                                                    ),
                                                                                                              );
                                                                                                            },
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 50.0, 0.0),
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
                                                                                                                  fontFamily: 'GeistSans',
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  useGoogleFonts: false,
                                                                                                                ),
                                                                                                          ),
                                                                                                          FutureBuilder<List<ExperiencesRow>>(
                                                                                                            future: ExperiencesTable().queryRows(
                                                                                                              queryFn: (q) => q
                                                                                                                  .eqOrNull(
                                                                                                                    'client_id',
                                                                                                                    FFAppState().activeClientID,
                                                                                                                  )
                                                                                                                  .eqOrNull(
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
                                                                                                                      fontFamily: 'GeistSans',
                                                                                                                      fontSize: 16.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: false,
                                                                                                                    ),
                                                                                                              );
                                                                                                            },
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 50.0, 0.0),
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
                                                                                                                  fontFamily: 'GeistSans',
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  useGoogleFonts: false,
                                                                                                                ),
                                                                                                          ),
                                                                                                          FutureBuilder<List<ExperiencesRow>>(
                                                                                                            future: ExperiencesTable().queryRows(
                                                                                                              queryFn: (q) => q
                                                                                                                  .eqOrNull(
                                                                                                                    'client_id',
                                                                                                                    FFAppState().activeClientID,
                                                                                                                  )
                                                                                                                  .eqOrNull(
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
                                                                                                                      fontFamily: 'GeistSans',
                                                                                                                      fontSize: 16.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: false,
                                                                                                                    ),
                                                                                                              );
                                                                                                            },
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 50.0, 0.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            'Autre',
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'GeistSans',
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  useGoogleFonts: false,
                                                                                                                ),
                                                                                                          ),
                                                                                                          FutureBuilder<List<ExperiencesRow>>(
                                                                                                            future: ExperiencesTable().queryRows(
                                                                                                              queryFn: (q) => q
                                                                                                                  .eqOrNull(
                                                                                                                    'client_id',
                                                                                                                    FFAppState().activeClientID,
                                                                                                                  )
                                                                                                                  .eqOrNull(
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
                                                                                                                      fontFamily: 'GeistSans',
                                                                                                                      fontSize: 16.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: false,
                                                                                                                    ),
                                                                                                              );
                                                                                                            },
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ].divide(SizedBox(height: 3.0)),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ].divide(SizedBox(width: 24.0)),
                                                                                  ),
                                                                                ].divide(SizedBox(height: 24.0)),
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
                                                    );
                                                  } else {
                                                    return SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          FutureBuilder<
                                                              List<
                                                                  ExperiencesRow>>(
                                                            future:
                                                                ExperiencesTable()
                                                                    .queryRows(
                                                              queryFn: (q) =>
                                                                  q.eqOrNull(
                                                                'loc_id',
                                                                FFAppState()
                                                                    .activeClientID,
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
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        SpinKitRing(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          50.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<ExperiencesRow>
                                                                  containerExperiencesRowList =
                                                                  snapshot
                                                                      .data!;

                                                              return Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.7,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: FutureBuilder<
                                                                    List<
                                                                        ExperiencesRow>>(
                                                                  future: ExperiencesTable()
                                                                      .queryRows(
                                                                    queryFn: (q) => q
                                                                        .eqOrNull(
                                                                          'loc_id',
                                                                          FFAppState()
                                                                              .activeClientID,
                                                                        )
                                                                        .gtOrNull(
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
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              SpinKitRing(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                50.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<ExperiencesRow>
                                                                        promotExperiencesRowList =
                                                                        snapshot
                                                                            .data!;

                                                                    return Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child: FutureBuilder<
                                                                          List<
                                                                              ExperiencesRow>>(
                                                                        future:
                                                                            ExperiencesTable().queryRows(
                                                                          queryFn: (q) => q
                                                                              .eqOrNull(
                                                                                'loc_id',
                                                                                FFAppState().activeClientID,
                                                                              )
                                                                              .ltOrNull(
                                                                                'nps',
                                                                                7,
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
                                                                          List<ExperiencesRow>
                                                                              detracExperiencesRowList =
                                                                              snapshot.data!;

                                                                          return Container(
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                SingleChildScrollView(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Container(
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          'Dashboard -',
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
                                                                                        Builder(
                                                                                          builder: (context) => Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
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
                                                                                  Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 0.66,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      borderRadius: BorderRadius.circular(16.0),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsets.all(16.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                            'Score NPS',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'GeistSans',
                                                                                                  color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                                  fontSize: 40.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  useGoogleFonts: false,
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
                                                                                                          fontFamily: 'GeistSans',
                                                                                                          color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                                          fontSize: 30.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          useGoogleFonts: false,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Builder(
                                                                                                builder: (context) => FlutterFlowIconButton(
                                                                                                  borderColor: Colors.transparent,
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
                                                                                        ].divide(SizedBox(height: 12.0)),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: MediaQuery.sizeOf(context).width * 0.32,
                                                                                        height: MediaQuery.sizeOf(context).height * 0.22,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).revoWhite,
                                                                                          borderRadius: BorderRadius.circular(16.0),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsets.all(16.0),
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
                                                                                                                fontFamily: 'GeistSans',
                                                                                                                color: FlutterFlowTheme.of(context).revoSearchTxtColor,
                                                                                                                fontSize: 16.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w300,
                                                                                                                useGoogleFonts: false,
                                                                                                              ),
                                                                                                        ),
                                                                                                        Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            containerExperiencesRowList.length.toString(),
                                                                                                            '0',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'GeistSans',
                                                                                                                color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                                                fontSize: 30.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                useGoogleFonts: false,
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
                                                                                                                fontFamily: 'GeistSans',
                                                                                                                color: FlutterFlowTheme.of(context).revoSearchIconColor,
                                                                                                                fontSize: 16.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w300,
                                                                                                                useGoogleFonts: false,
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
                                                                                                                fontFamily: 'GeistSans',
                                                                                                                color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                                                fontSize: 30.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                useGoogleFonts: false,
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
                                                                                                                fontFamily: 'GeistSans',
                                                                                                                color: FlutterFlowTheme.of(context).revoSearchTxtColor,
                                                                                                                fontSize: 16.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w300,
                                                                                                                useGoogleFonts: false,
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
                                                                                                                fontFamily: 'GeistSans',
                                                                                                                color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                                                fontSize: 30.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                useGoogleFonts: false,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ].divide(SizedBox(width: 20.0)),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                                                                                  child: FFButtonWidget(
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
                                                                                                ),
                                                                                              ].divide(SizedBox(height: 12.0)),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      FutureBuilder<List<ClientsRow>>(
                                                                                        future: ClientsTable().querySingleRow(
                                                                                          queryFn: (q) => q.eqOrNull(
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
                                                                                              padding: EdgeInsets.all(16.0),
                                                                                              child: SingleChildScrollView(
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      'Raisons exprimés',
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
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 50.0, 0.0),
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
                                                                                                                  fontFamily: 'GeistSans',
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  useGoogleFonts: false,
                                                                                                                ),
                                                                                                          ),
                                                                                                          FutureBuilder<List<ExperiencesRow>>(
                                                                                                            future: ExperiencesTable().queryRows(
                                                                                                              queryFn: (q) => q
                                                                                                                  .eqOrNull(
                                                                                                                    'client_id',
                                                                                                                    FFAppState().activeClientID,
                                                                                                                  )
                                                                                                                  .eqOrNull(
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
                                                                                                                      fontFamily: 'GeistSans',
                                                                                                                      fontSize: 16.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: false,
                                                                                                                    ),
                                                                                                              );
                                                                                                            },
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 50.0, 0.0),
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
                                                                                                                  fontFamily: 'GeistSans',
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  useGoogleFonts: false,
                                                                                                                ),
                                                                                                          ),
                                                                                                          FutureBuilder<List<ExperiencesRow>>(
                                                                                                            future: ExperiencesTable().queryRows(
                                                                                                              queryFn: (q) => q
                                                                                                                  .eqOrNull(
                                                                                                                    'client_id',
                                                                                                                    FFAppState().activeClientID,
                                                                                                                  )
                                                                                                                  .eqOrNull(
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
                                                                                                                      fontFamily: 'GeistSans',
                                                                                                                      fontSize: 16.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: false,
                                                                                                                    ),
                                                                                                              );
                                                                                                            },
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 50.0, 0.0),
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
                                                                                                                  fontFamily: 'GeistSans',
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  useGoogleFonts: false,
                                                                                                                ),
                                                                                                          ),
                                                                                                          FutureBuilder<List<ExperiencesRow>>(
                                                                                                            future: ExperiencesTable().queryRows(
                                                                                                              queryFn: (q) => q
                                                                                                                  .eqOrNull(
                                                                                                                    'client_id',
                                                                                                                    FFAppState().activeClientID,
                                                                                                                  )
                                                                                                                  .eqOrNull(
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
                                                                                                                      fontFamily: 'GeistSans',
                                                                                                                      fontSize: 16.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: false,
                                                                                                                    ),
                                                                                                              );
                                                                                                            },
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 50.0, 0.0),
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
                                                                                                                  fontFamily: 'GeistSans',
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  useGoogleFonts: false,
                                                                                                                ),
                                                                                                          ),
                                                                                                          FutureBuilder<List<ExperiencesRow>>(
                                                                                                            future: ExperiencesTable().queryRows(
                                                                                                              queryFn: (q) => q
                                                                                                                  .eqOrNull(
                                                                                                                    'client_id',
                                                                                                                    FFAppState().activeClientID,
                                                                                                                  )
                                                                                                                  .eqOrNull(
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
                                                                                                                      fontFamily: 'GeistSans',
                                                                                                                      fontSize: 16.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: false,
                                                                                                                    ),
                                                                                                              );
                                                                                                            },
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 50.0, 0.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            'Autre',
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'GeistSans',
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  useGoogleFonts: false,
                                                                                                                ),
                                                                                                          ),
                                                                                                          FutureBuilder<List<ExperiencesRow>>(
                                                                                                            future: ExperiencesTable().queryRows(
                                                                                                              queryFn: (q) => q
                                                                                                                  .eqOrNull(
                                                                                                                    'client_id',
                                                                                                                    FFAppState().activeClientID,
                                                                                                                  )
                                                                                                                  .eqOrNull(
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
                                                                                                                      fontFamily: 'GeistSans',
                                                                                                                      fontSize: 16.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: false,
                                                                                                                    ),
                                                                                                              );
                                                                                                            },
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ].divide(SizedBox(height: 3.0)),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ].divide(SizedBox(width: 24.0)),
                                                                                  ),
                                                                                ].divide(SizedBox(height: 24.0)),
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
                                                    );
                                                  }
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
