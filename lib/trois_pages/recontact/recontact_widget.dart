import '/backend/supabase/supabase.dart';
import '/components/empty_recontact_widget.dart';
import '/components/experiencee_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/navbarnav/navbarnav_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'recontact_model.dart';
export 'recontact_model.dart';

class RecontactWidget extends StatefulWidget {
  const RecontactWidget({super.key});

  @override
  State<RecontactWidget> createState() => _RecontactWidgetState();
}

class _RecontactWidgetState extends State<RecontactWidget> {
  late RecontactModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecontactModel());

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
        title: 'recontact',
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
                            selectedIndex: 5,
                          ),
                        ),
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              if ((FFAppState().isBrand == true) &&
                                  (FFAppState().isBU == false) &&
                                  (FFAppState().isLoc == false)) {
                                return Container(
                                  decoration: const BoxDecoration(),
                                  child: FutureBuilder<List<RecontactRow>>(
                                    future: RecontactTable().queryRows(
                                      queryFn: (q) => q
                                          .eqOrNull(
                                            'client_id',
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 50.0,
                                            ),
                                          ),
                                        );
                                      }
                                      List<RecontactRow>
                                          containerRecontactRowList =
                                          snapshot.data!;

                                      return Container(
                                        decoration: const BoxDecoration(),
                                        child: FutureBuilder<List<ClientsRow>>(
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
                                                    color: FlutterFlowTheme.of(
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .revoBG,
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
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
                                                                        const BoxDecoration(),
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            const BoxDecoration(),
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
                                                                                    'Recontact -',
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
                                                                                ],
                                                                              ),
                                                                            ].divide(const SizedBox(height: 24.0)),
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
                                                                              decoration: const BoxDecoration(),
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
                                                                                            width: 100.0,
                                                                                            decoration: const BoxDecoration(),
                                                                                            child: Text(
                                                                                              'Date',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            width: 100.0,
                                                                                            decoration: const BoxDecoration(),
                                                                                            child: Text(
                                                                                              'Prénom',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            width: 250.0,
                                                                                            decoration: const BoxDecoration(),
                                                                                            child: Text(
                                                                                              'Email',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            width: 150.0,
                                                                                            decoration: const BoxDecoration(),
                                                                                            child: Text(
                                                                                              'Téléphone',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            width: 150.0,
                                                                                            decoration: const BoxDecoration(),
                                                                                            child: Text(
                                                                                              'Recontacté ?',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(const SizedBox(width: 20.0)).addToStart(const SizedBox(width: 10.0)),
                                                                                      ),
                                                                                    ),
                                                                                    Builder(
                                                                                      builder: (context) {
                                                                                        final recontactages = containerRecontactRowList.toList();
                                                                                        if (recontactages.isEmpty) {
                                                                                          return const EmptyRecontactWidget();
                                                                                        }

                                                                                        return SingleChildScrollView(
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: List.generate(recontactages.length, (recontactagesIndex) {
                                                                                              final recontactagesItem = recontactages[recontactagesIndex];
                                                                                              return InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  _model.showExperience = true;
                                                                                                  _model.xid = recontactagesItem.expId;
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
                                                                                                    boxShadow: const [
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
                                                                                                        width: 100.0,
                                                                                                        decoration: const BoxDecoration(),
                                                                                                        child: Text(
                                                                                                          dateTimeFormat("d/M H:mm", recontactagesItem.createdAt),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Manrope',
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Container(
                                                                                                        width: 100.0,
                                                                                                        decoration: const BoxDecoration(),
                                                                                                        child: Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            recontactagesItem.firstName,
                                                                                                            '-',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Manrope',
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Container(
                                                                                                        width: 250.0,
                                                                                                        decoration: const BoxDecoration(),
                                                                                                        child: Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            recontactagesItem.email != null && recontactagesItem.email != '' ? recontactagesItem.email : '-',
                                                                                                            '-',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Manrope',
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Container(
                                                                                                        width: 150.0,
                                                                                                        decoration: const BoxDecoration(),
                                                                                                        child: Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            recontactagesItem.phoneNumber != null && recontactagesItem.phoneNumber != '' ? recontactagesItem.phoneNumber : '-',
                                                                                                            '-',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Manrope',
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Container(
                                                                                                        width: 150.0,
                                                                                                        decoration: const BoxDecoration(),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Theme(
                                                                                                              data: ThemeData(
                                                                                                                checkboxTheme: CheckboxThemeData(
                                                                                                                  visualDensity: VisualDensity.compact,
                                                                                                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                                                  shape: RoundedRectangleBorder(
                                                                                                                    borderRadius: BorderRadius.circular(4.0),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                unselectedWidgetColor: FlutterFlowTheme.of(context).alternate,
                                                                                                              ),
                                                                                                              child: Checkbox(
                                                                                                                value: _model.checkboxValueMap1[recontactagesItem] ??= recontactagesItem.contacted!,
                                                                                                                onChanged: (newValue) async {
                                                                                                                  safeSetState(() => _model.checkboxValueMap1[recontactagesItem] = newValue!);
                                                                                                                  if (newValue!) {
                                                                                                                    await RecontactTable().update(
                                                                                                                      data: {
                                                                                                                        'contacted': true,
                                                                                                                      },
                                                                                                                      matchingRows: (rows) => rows.eqOrNull(
                                                                                                                        'id',
                                                                                                                        recontactagesItem.id,
                                                                                                                      ),
                                                                                                                    );
                                                                                                                  } else {
                                                                                                                    await RecontactTable().update(
                                                                                                                      data: {
                                                                                                                        'contacted': false,
                                                                                                                      },
                                                                                                                      matchingRows: (rows) => rows.eqOrNull(
                                                                                                                        'id',
                                                                                                                        recontactagesItem.id,
                                                                                                                      ),
                                                                                                                    );
                                                                                                                  }
                                                                                                                },
                                                                                                                side: BorderSide(
                                                                                                                  width: 2,
                                                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                                                ),
                                                                                                                activeColor: FlutterFlowTheme.of(context).vertSympa,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ].divide(const SizedBox(width: 20.0)).addToStart(const SizedBox(width: 10.0)),
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
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
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
                                                                              boxShadow: const [
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
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
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
                                                                                    model: _model.experienceeModel1,
                                                                                    updateCallback: () => safeSetState(() {}),
                                                                                    child: ExperienceeWidget(
                                                                                      xid: _model.xid!,
                                                                                      t1: _model.t1!,
                                                                                      t2: _model.t2!,
                                                                                      t3: _model.t3!,
                                                                                      t4: _model.t4!,
                                                                                    ),
                                                                                  ),
                                                                                ].addToStart(const SizedBox(height: 16.0)).addToEnd(const SizedBox(height: 16.0)),
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
                              } else if ((FFAppState().isBrand == false) &&
                                  (FFAppState().isBU == true) &&
                                  (FFAppState().isLoc == false)) {
                                return Container(
                                  decoration: const BoxDecoration(),
                                  child: FutureBuilder<List<RecontactRow>>(
                                    future: RecontactTable().queryRows(
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 50.0,
                                            ),
                                          ),
                                        );
                                      }
                                      List<RecontactRow>
                                          containerRecontactRowList =
                                          snapshot.data!;

                                      return Container(
                                        decoration: const BoxDecoration(),
                                        child: FutureBuilder<List<ClientsRow>>(
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
                                                    color: FlutterFlowTheme.of(
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .revoBG,
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
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
                                                                        const BoxDecoration(),
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            const BoxDecoration(),
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
                                                                                    'Recontact -',
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
                                                                                ],
                                                                              ),
                                                                            ].divide(const SizedBox(height: 24.0)),
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
                                                                              decoration: const BoxDecoration(),
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
                                                                                            width: 100.0,
                                                                                            decoration: const BoxDecoration(),
                                                                                            child: Text(
                                                                                              'Date',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            width: 100.0,
                                                                                            decoration: const BoxDecoration(),
                                                                                            child: Text(
                                                                                              'Prénom',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            width: 250.0,
                                                                                            decoration: const BoxDecoration(),
                                                                                            child: Text(
                                                                                              'Email',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            width: 150.0,
                                                                                            decoration: const BoxDecoration(),
                                                                                            child: Text(
                                                                                              'Téléphone',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            width: 150.0,
                                                                                            decoration: const BoxDecoration(),
                                                                                            child: Text(
                                                                                              'Recontacté ?',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(const SizedBox(width: 20.0)).addToStart(const SizedBox(width: 10.0)),
                                                                                      ),
                                                                                    ),
                                                                                    Builder(
                                                                                      builder: (context) {
                                                                                        final recontactages = containerRecontactRowList.toList();
                                                                                        if (recontactages.isEmpty) {
                                                                                          return const EmptyRecontactWidget();
                                                                                        }

                                                                                        return SingleChildScrollView(
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: List.generate(recontactages.length, (recontactagesIndex) {
                                                                                              final recontactagesItem = recontactages[recontactagesIndex];
                                                                                              return InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  _model.showExperience = true;
                                                                                                  _model.xid = recontactagesItem.expId;
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
                                                                                                    boxShadow: const [
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
                                                                                                        width: 100.0,
                                                                                                        decoration: const BoxDecoration(),
                                                                                                        child: Text(
                                                                                                          dateTimeFormat("d/M H:mm", recontactagesItem.createdAt),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Manrope',
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Container(
                                                                                                        width: 100.0,
                                                                                                        decoration: const BoxDecoration(),
                                                                                                        child: Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            recontactagesItem.firstName,
                                                                                                            '-',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Manrope',
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Container(
                                                                                                        width: 250.0,
                                                                                                        decoration: const BoxDecoration(),
                                                                                                        child: Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            recontactagesItem.email != null && recontactagesItem.email != '' ? recontactagesItem.email : '-',
                                                                                                            '-',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Manrope',
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Container(
                                                                                                        width: 150.0,
                                                                                                        decoration: const BoxDecoration(),
                                                                                                        child: Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            recontactagesItem.phoneNumber != null && recontactagesItem.phoneNumber != '' ? recontactagesItem.phoneNumber : '-',
                                                                                                            '-',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Manrope',
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Container(
                                                                                                        width: 150.0,
                                                                                                        decoration: const BoxDecoration(),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Theme(
                                                                                                              data: ThemeData(
                                                                                                                checkboxTheme: CheckboxThemeData(
                                                                                                                  visualDensity: VisualDensity.compact,
                                                                                                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                                                  shape: RoundedRectangleBorder(
                                                                                                                    borderRadius: BorderRadius.circular(4.0),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                unselectedWidgetColor: FlutterFlowTheme.of(context).alternate,
                                                                                                              ),
                                                                                                              child: Checkbox(
                                                                                                                value: _model.checkboxValueMap2[recontactagesItem] ??= recontactagesItem.contacted!,
                                                                                                                onChanged: (newValue) async {
                                                                                                                  safeSetState(() => _model.checkboxValueMap2[recontactagesItem] = newValue!);
                                                                                                                  if (newValue!) {
                                                                                                                    await RecontactTable().update(
                                                                                                                      data: {
                                                                                                                        'contacted': true,
                                                                                                                      },
                                                                                                                      matchingRows: (rows) => rows.eqOrNull(
                                                                                                                        'id',
                                                                                                                        recontactagesItem.id,
                                                                                                                      ),
                                                                                                                    );
                                                                                                                  } else {
                                                                                                                    await RecontactTable().update(
                                                                                                                      data: {
                                                                                                                        'contacted': false,
                                                                                                                      },
                                                                                                                      matchingRows: (rows) => rows.eqOrNull(
                                                                                                                        'id',
                                                                                                                        recontactagesItem.id,
                                                                                                                      ),
                                                                                                                    );
                                                                                                                  }
                                                                                                                },
                                                                                                                side: BorderSide(
                                                                                                                  width: 2,
                                                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                                                ),
                                                                                                                activeColor: FlutterFlowTheme.of(context).vertSympa,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ].divide(const SizedBox(width: 20.0)).addToStart(const SizedBox(width: 10.0)),
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
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
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
                                                                              boxShadow: const [
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
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
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
                                                                                ].addToStart(const SizedBox(height: 16.0)).addToEnd(const SizedBox(height: 16.0)),
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
                              } else {
                                return Container(
                                  decoration: const BoxDecoration(),
                                  child: FutureBuilder<List<RecontactRow>>(
                                    future: RecontactTable().queryRows(
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 50.0,
                                            ),
                                          ),
                                        );
                                      }
                                      List<RecontactRow>
                                          containerRecontactRowList =
                                          snapshot.data!;

                                      return Container(
                                        decoration: const BoxDecoration(),
                                        child: FutureBuilder<List<ClientsRow>>(
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
                                                    color: FlutterFlowTheme.of(
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .revoBG,
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
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
                                                                        const BoxDecoration(),
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            const BoxDecoration(),
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
                                                                                    'Recontact -',
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
                                                                                ],
                                                                              ),
                                                                            ].divide(const SizedBox(height: 24.0)),
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
                                                                              decoration: const BoxDecoration(),
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
                                                                                            width: 100.0,
                                                                                            decoration: const BoxDecoration(),
                                                                                            child: Text(
                                                                                              'Date',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            width: 100.0,
                                                                                            decoration: const BoxDecoration(),
                                                                                            child: Text(
                                                                                              'Prénom',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            width: 250.0,
                                                                                            decoration: const BoxDecoration(),
                                                                                            child: Text(
                                                                                              'Email',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            width: 150.0,
                                                                                            decoration: const BoxDecoration(),
                                                                                            child: Text(
                                                                                              'Téléphone',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            width: 150.0,
                                                                                            decoration: const BoxDecoration(),
                                                                                            child: Text(
                                                                                              'Recontacté ?',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(const SizedBox(width: 20.0)).addToStart(const SizedBox(width: 10.0)),
                                                                                      ),
                                                                                    ),
                                                                                    Builder(
                                                                                      builder: (context) {
                                                                                        final recontactages = containerRecontactRowList.toList();
                                                                                        if (recontactages.isEmpty) {
                                                                                          return const EmptyRecontactWidget();
                                                                                        }

                                                                                        return SingleChildScrollView(
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: List.generate(recontactages.length, (recontactagesIndex) {
                                                                                              final recontactagesItem = recontactages[recontactagesIndex];
                                                                                              return InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  _model.showExperience = true;
                                                                                                  _model.xid = recontactagesItem.expId;
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
                                                                                                    boxShadow: const [
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
                                                                                                        width: 100.0,
                                                                                                        decoration: const BoxDecoration(),
                                                                                                        child: Text(
                                                                                                          dateTimeFormat("d/M H:mm", recontactagesItem.createdAt),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Manrope',
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Container(
                                                                                                        width: 100.0,
                                                                                                        decoration: const BoxDecoration(),
                                                                                                        child: Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            recontactagesItem.firstName,
                                                                                                            '-',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Manrope',
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Container(
                                                                                                        width: 250.0,
                                                                                                        decoration: const BoxDecoration(),
                                                                                                        child: Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            recontactagesItem.email != null && recontactagesItem.email != '' ? recontactagesItem.email : '-',
                                                                                                            '-',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Manrope',
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Container(
                                                                                                        width: 150.0,
                                                                                                        decoration: const BoxDecoration(),
                                                                                                        child: Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            recontactagesItem.phoneNumber != null && recontactagesItem.phoneNumber != '' ? recontactagesItem.phoneNumber : '-',
                                                                                                            '-',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Manrope',
                                                                                                                letterSpacing: 0.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Container(
                                                                                                        width: 150.0,
                                                                                                        decoration: const BoxDecoration(),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Theme(
                                                                                                              data: ThemeData(
                                                                                                                checkboxTheme: CheckboxThemeData(
                                                                                                                  visualDensity: VisualDensity.compact,
                                                                                                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                                                  shape: RoundedRectangleBorder(
                                                                                                                    borderRadius: BorderRadius.circular(4.0),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                unselectedWidgetColor: FlutterFlowTheme.of(context).alternate,
                                                                                                              ),
                                                                                                              child: Checkbox(
                                                                                                                value: _model.checkboxValueMap3[recontactagesItem] ??= recontactagesItem.contacted!,
                                                                                                                onChanged: (newValue) async {
                                                                                                                  safeSetState(() => _model.checkboxValueMap3[recontactagesItem] = newValue!);
                                                                                                                  if (newValue!) {
                                                                                                                    await RecontactTable().update(
                                                                                                                      data: {
                                                                                                                        'contacted': true,
                                                                                                                      },
                                                                                                                      matchingRows: (rows) => rows.eqOrNull(
                                                                                                                        'id',
                                                                                                                        recontactagesItem.id,
                                                                                                                      ),
                                                                                                                    );
                                                                                                                  } else {
                                                                                                                    await RecontactTable().update(
                                                                                                                      data: {
                                                                                                                        'contacted': false,
                                                                                                                      },
                                                                                                                      matchingRows: (rows) => rows.eqOrNull(
                                                                                                                        'id',
                                                                                                                        recontactagesItem.id,
                                                                                                                      ),
                                                                                                                    );
                                                                                                                  }
                                                                                                                },
                                                                                                                side: BorderSide(
                                                                                                                  width: 2,
                                                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                                                ),
                                                                                                                activeColor: FlutterFlowTheme.of(context).vertSympa,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ].divide(const SizedBox(width: 20.0)).addToStart(const SizedBox(width: 10.0)),
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
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
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
                                                                              boxShadow: const [
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
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
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
                                                                                ].addToStart(const SizedBox(height: 16.0)).addToEnd(const SizedBox(height: 16.0)),
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
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
