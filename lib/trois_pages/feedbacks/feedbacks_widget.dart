import '';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/navbarnav/navbarnav_widget.dart';
import '/trois_pages/experiencee/experiencee_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'feedbacks_model.dart';
export 'feedbacks_model.dart';

class FeedbacksWidget extends StatefulWidget {
  const FeedbacksWidget({super.key});

  static String routeName = 'feedbacks';
  static String routePath = '/feedbacks';

  @override
  State<FeedbacksWidget> createState() => _FeedbacksWidgetState();
}

class _FeedbacksWidgetState extends State<FeedbacksWidget> {
  late FeedbacksModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedbacksModel());

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
        title: 'feedbacks',
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
                                selectedIndex: 6,
                              ),
                            ),
                            Expanded(
                              child: Builder(
                                builder: (context) {
                                  if ((FFAppState().isBrand == true) &&
                                      (FFAppState().isBU == false) &&
                                      (FFAppState().isLoc == false)) {
                                    return Container(
                                      decoration: BoxDecoration(),
                                      child:
                                          FutureBuilder<List<ExperiencesRow>>(
                                        future: ExperiencesTable().queryRows(
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
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child: SpinKitRing(
                                                  color: FlutterFlowTheme.of(
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .revoBG,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        50.0, 32.0, 50.0, 40.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
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
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Text(
                                                                                    'Insights -',
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
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Flexible(
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Container(
                                                                              width: valueOrDefault<double>(
                                                                                _model.showExperience ? 700.0 : 850.0,
                                                                                700.0,
                                                                              ),
                                                                              height: 720.0,
                                                                              decoration: BoxDecoration(),
                                                                              child: SingleChildScrollView(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Builder(
                                                                                      builder: (context) {
                                                                                        final experience = containerExperiencesRowList.where((e) => e.feedback != null && e.feedback != '').toList();

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
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                if (experienceItem.nps! > 8)
                                                                                                                  Container(
                                                                                                                    height: 28.0,
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      borderRadius: BorderRadius.circular(16.0),
                                                                                                                      border: Border.all(
                                                                                                                        color: FlutterFlowTheme.of(context).vertSympa,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsets.all(4.0),
                                                                                                                      child: Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          Icon(
                                                                                                                            Icons.thumb_up_outlined,
                                                                                                                            color: FlutterFlowTheme.of(context).vertSympa,
                                                                                                                            size: 18.0,
                                                                                                                          ),
                                                                                                                          Text(
                                                                                                                            'Promoteur',
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  fontFamily: 'GeistSans',
                                                                                                                                  color: FlutterFlowTheme.of(context).vertSympa,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  useGoogleFonts: false,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ].divide(SizedBox(width: 4.0)).around(SizedBox(width: 4.0)),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                if (experienceItem.nps! < 7)
                                                                                                                  Container(
                                                                                                                    height: 28.0,
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      borderRadius: BorderRadius.circular(16.0),
                                                                                                                      border: Border.all(
                                                                                                                        color: Color(0xFFCA3A31),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsets.all(4.0),
                                                                                                                      child: Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          Icon(
                                                                                                                            Icons.thumb_down_outlined,
                                                                                                                            color: Color(0xFFCA3A31),
                                                                                                                            size: 18.0,
                                                                                                                          ),
                                                                                                                          Text(
                                                                                                                            'Detracteur',
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  fontFamily: 'GeistSans',
                                                                                                                                  color: Color(0xFFCA3A31),
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  useGoogleFonts: false,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ].divide(SizedBox(width: 4.0)).around(SizedBox(width: 4.0)),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                if ((experienceItem.nps == 8) || (experienceItem.nps == 7))
                                                                                                                  Container(
                                                                                                                    height: 28.0,
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      borderRadius: BorderRadius.circular(16.0),
                                                                                                                      border: Border.all(
                                                                                                                        color: Color(0xFFC18D30),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsets.all(4.0),
                                                                                                                      child: Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          Text(
                                                                                                                            '- Passif',
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  fontFamily: 'GeistSans',
                                                                                                                                  color: Color(0xFFC18D30),
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  useGoogleFonts: false,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ].divide(SizedBox(width: 4.0)).around(SizedBox(width: 4.0)),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                              ],
                                                                                                            ),
                                                                                                            Container(
                                                                                                              height: 28.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: Color(0xFFF4F4F5),
                                                                                                                borderRadius: BorderRadius.circular(16.0),
                                                                                                              ),
                                                                                                              child: Padding(
                                                                                                                padding: EdgeInsets.all(4.0),
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    Text(
                                                                                                                      'Score: ${experienceItem.nps?.toString()}',
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: 'GeistSans',
                                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            fontWeight: FontWeight.w500,
                                                                                                                            useGoogleFonts: false,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ].divide(SizedBox(width: 4.0)).around(SizedBox(width: 4.0)),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ].divide(SizedBox(width: 10.0)),
                                                                                                        ),
                                                                                                        Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              'Feedback complementaire',
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'GeistSans',
                                                                                                                    color: FlutterFlowTheme.of(context).joliGrisPourTexteLeger,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    useGoogleFonts: false,
                                                                                                                  ),
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                                              child: Container(
                                                                                                                width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                  boxShadow: [
                                                                                                                    BoxShadow(
                                                                                                                      color: FlutterFlowTheme.of(context).vertSympa,
                                                                                                                      offset: Offset(-2.0, 0.0),
                                                                                                                    )
                                                                                                                  ],
                                                                                                                  border: Border.all(
                                                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                  ),
                                                                                                                ),
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                                  child: Text(
                                                                                                                    valueOrDefault<String>(
                                                                                                                      experienceItem.feedbackCustomText,
                                                                                                                      '-',
                                                                                                                    ),
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'GeistSans',
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          useGoogleFonts: false,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ].divide(SizedBox(height: 8.0)),
                                                                                                        ),
                                                                                                      ].divide(SizedBox(height: 6.0)),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            }).divide(SizedBox(height: 16.0)),
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
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          if (_model
                                                              .showExperience)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          20.0,
                                                                          5.0,
                                                                          5.0),
                                                              child: Container(
                                                                width: 350.0,
                                                                height: 620.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius:
                                                                          2.0,
                                                                      color: Color(
                                                                          0x33000000),
                                                                    )
                                                                  ],
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                ),
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
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            20.0,
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
                                                                          icon:
                                                                              Icon(
                                                                            Icons.close,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                          onPressed:
                                                                              () async {
                                                                            _model.showExperience =
                                                                                false;
                                                                            safeSetState(() {});
                                                                          },
                                                                        ),
                                                                      ),
                                                                      wrapWithModel(
                                                                        model: _model
                                                                            .experienceeModel1,
                                                                        updateCallback:
                                                                            () =>
                                                                                safeSetState(() {}),
                                                                        child:
                                                                            ExperienceeWidget(
                                                                          xid: _model
                                                                              .xid!,
                                                                          t1: _model
                                                                              .t1!,
                                                                          t2: _model
                                                                              .t2!,
                                                                          t3: _model
                                                                              .t3!,
                                                                          t4: _model
                                                                              .t4!,
                                                                        ),
                                                                      ),
                                                                    ]
                                                                        .addToStart(SizedBox(
                                                                            height:
                                                                                16.0))
                                                                        .addToEnd(SizedBox(
                                                                            height:
                                                                                16.0)),
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
                                          );
                                        },
                                      ),
                                    );
                                  } else if ((FFAppState().isBrand == false) &&
                                      (FFAppState().isBU == true) &&
                                      (FFAppState().isLoc == false)) {
                                    return Container(
                                      decoration: BoxDecoration(),
                                      child:
                                          FutureBuilder<List<ExperiencesRow>>(
                                        future: ExperiencesTable().queryRows(
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
                                                  color: FlutterFlowTheme.of(
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
                                            child:
                                                FutureBuilder<List<ClientsRow>>(
                                              future:
                                                  ClientsTable().querySingleRow(
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 50.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<ClientsRow>
                                                    containerClientsRowList =
                                                    snapshot.data!;

                                                final containerClientsRow =
                                                    containerClientsRowList
                                                            .isNotEmpty
                                                        ? containerClientsRowList
                                                            .first
                                                        : null;

                                                return Container(
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
                                                                                        'Experiences -',
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
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Container(
                                                                                  width: valueOrDefault<double>(
                                                                                    _model.showExperience ? 700.0 : 850.0,
                                                                                    700.0,
                                                                                  ),
                                                                                  height: 720.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: SingleChildScrollView(
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
                                                                                                  'Recontact',
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
                                                                                                            child: Text(
                                                                                                              experienceItem.wantsContact == true ? 'Demande' : '-',
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
                                                                                                  );
                                                                                                }),
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
                                                                          if (_model
                                                                              .showExperience)
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 5.0, 5.0),
                                                                              child: Container(
                                                                                width: 350.0,
                                                                                height: 620.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 2.0,
                                                                                      color: Color(0x33000000),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.circular(16.0),
                                                                                ),
                                                                                child: SingleChildScrollView(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                                                                        child: FlutterFlowIconButton(
                                                                                          borderColor: Colors.transparent,
                                                                                          borderRadius: 8.0,
                                                                                          buttonSize: 40.0,
                                                                                          icon: Icon(
                                                                                            Icons.close,
                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                            size: 24.0,
                                                                                          ),
                                                                                          onPressed: () async {
                                                                                            _model.showExperience = false;
                                                                                            safeSetState(() {});
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                      wrapWithModel(
                                                                                        model: _model.experienceeModel2,
                                                                                        updateCallback: () => safeSetState(() {}),
                                                                                        child: ExperienceeWidget(
                                                                                          xid: _model.xid!,
                                                                                          t1: _model.t1!,
                                                                                          t2: _model.t2!,
                                                                                          t3: _model.t3!,
                                                                                          t4: _model.t4!,
                                                                                        ),
                                                                                      ),
                                                                                    ].addToStart(SizedBox(height: 16.0)).addToEnd(SizedBox(height: 16.0)),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                      if (_model
                                                                          .showExperience)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              20.0,
                                                                              20.0,
                                                                              5.0,
                                                                              5.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                350.0,
                                                                            height:
                                                                                620.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              boxShadow: [
                                                                                BoxShadow(
                                                                                  blurRadius: 2.0,
                                                                                  color: Color(0x33000000),
                                                                                )
                                                                              ],
                                                                              borderRadius: BorderRadius.circular(16.0),
                                                                            ),
                                                                            child:
                                                                                SingleChildScrollView(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                                                                    child: FlutterFlowIconButton(
                                                                                      borderColor: Colors.transparent,
                                                                                      borderRadius: 8.0,
                                                                                      buttonSize: 40.0,
                                                                                      icon: Icon(
                                                                                        Icons.close,
                                                                                        color: FlutterFlowTheme.of(context).secondary,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                      onPressed: () async {
                                                                                        _model.showExperience = false;
                                                                                        safeSetState(() {});
                                                                                      },
                                                                                    ),
                                                                                  ),
                                                                                  wrapWithModel(
                                                                                    model: _model.experienceeModel3,
                                                                                    updateCallback: () => safeSetState(() {}),
                                                                                    child: ExperienceeWidget(
                                                                                      xid: _model.xid!,
                                                                                      t1: _model.t1!,
                                                                                      t2: _model.t2!,
                                                                                      t3: _model.t3!,
                                                                                      t4: _model.t4!,
                                                                                    ),
                                                                                  ),
                                                                                ].addToStart(SizedBox(height: 16.0)).addToEnd(SizedBox(height: 16.0)),
                                                                              ),
                                                                            ),
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
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  } else {
                                    return Container(
                                      decoration: BoxDecoration(),
                                      child:
                                          FutureBuilder<List<ExperiencesRow>>(
                                        future: ExperiencesTable().queryRows(
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
                                                  color: FlutterFlowTheme.of(
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
                                            child:
                                                FutureBuilder<List<ClientsRow>>(
                                              future:
                                                  ClientsTable().querySingleRow(
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 50.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<ClientsRow>
                                                    containerClientsRowList =
                                                    snapshot.data!;

                                                final containerClientsRow =
                                                    containerClientsRowList
                                                            .isNotEmpty
                                                        ? containerClientsRowList
                                                            .first
                                                        : null;

                                                return Container(
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
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Container(
                                                                                  width: valueOrDefault<double>(
                                                                                    _model.showExperience ? 700.0 : 850.0,
                                                                                    700.0,
                                                                                  ),
                                                                                  height: 720.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: SingleChildScrollView(
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
                                                                                                  'Redirection',
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
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          if (_model
                                                                              .showExperience)
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 5.0, 5.0),
                                                                              child: Container(
                                                                                width: 350.0,
                                                                                height: 560.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 2.0,
                                                                                      color: Color(0x33000000),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.circular(16.0),
                                                                                ),
                                                                                child: SingleChildScrollView(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                                                                        child: FlutterFlowIconButton(
                                                                                          borderColor: Colors.transparent,
                                                                                          borderRadius: 8.0,
                                                                                          buttonSize: 40.0,
                                                                                          icon: Icon(
                                                                                            Icons.close,
                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                            size: 24.0,
                                                                                          ),
                                                                                          onPressed: () async {
                                                                                            _model.showExperience = false;
                                                                                            safeSetState(() {});
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                      wrapWithModel(
                                                                                        model: _model.experienceeModel4,
                                                                                        updateCallback: () => safeSetState(() {}),
                                                                                        child: ExperienceeWidget(
                                                                                          xid: _model.xid!,
                                                                                          t1: _model.t1!,
                                                                                          t2: _model.t2!,
                                                                                          t3: _model.t3!,
                                                                                          t4: _model.t4!,
                                                                                        ),
                                                                                      ),
                                                                                    ].addToStart(SizedBox(height: 16.0)),
                                                                                  ),
                                                                                ),
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
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  }
                                },
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
