import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/b_uchoice_widget.dart';
import '/components/location_choice_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'choose_clientor_np_model.dart';
export 'choose_clientor_np_model.dart';

class ChooseClientorNpWidget extends StatefulWidget {
  const ChooseClientorNpWidget({super.key});

  @override
  State<ChooseClientorNpWidget> createState() => _ChooseClientorNpWidgetState();
}

class _ChooseClientorNpWidgetState extends State<ChooseClientorNpWidget> {
  late ChooseClientorNpModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChooseClientorNpModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.0),
      child: Container(
        decoration: BoxDecoration(),
        child: FutureBuilder<List<UsersRow>>(
          future: UsersTable().querySingleRow(
            queryFn: (q) => q.eqOrNull(
              'id',
              currentUserUid,
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
            List<UsersRow> containerUsersRowList = snapshot.data!;

            final containerUsersRow = containerUsersRowList.isNotEmpty
                ? containerUsersRowList.first
                : null;

            return Container(
              width: 340.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
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
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(InfosWidget.routeName);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).revoWhite,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context)
                                  .shadcnCardBorderGrey,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 8.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.person,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 34.0,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Mon compte',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'GeistSans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .revoCardTextColor,
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 16.0)),
                                ),
                              ]
                                  .divide(SizedBox(height: 24.0))
                                  .addToStart(SizedBox(height: 16.0))
                                  .addToEnd(SizedBox(height: 18.0)),
                            ),
                          ),
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          if ((containerUsersRow?.limitedToBu == false) &&
                              (containerUsersRow?.limitedToLoc == true)) {
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FutureBuilder<List<ClientsRow>>(
                                  future: ClientsTable().queryRows(
                                    queryFn: (q) => q
                                        .eqOrNull(
                                          'brand_id',
                                          containerUsersRow?.clientId,
                                        )
                                        .not(
                                          'bu_id',
                                          'is',
                                          null,
                                        )
                                        .isFilter(
                                          'loc_id',
                                          null,
                                        )
                                        .order('id', ascending: true),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: SpinKitRing(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 50.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<ClientsRow> containerClientsRowList =
                                        snapshot.data!;

                                    return Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            MouseRegion(
                                              opaque: false,
                                              cursor: MouseCursor.defer ??
                                                  MouseCursor.defer,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: _model
                                                          .mouseRegionHovered1
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .cogeHoverFromWhite
                                                      : Color(0x00000000),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    FFAppState().activeSub =
                                                        true;
                                                    FFAppState().isNp1 = false;
                                                    FFAppState().activeBrand =
                                                        containerUsersRow!
                                                            .companyName!;
                                                    FFAppState()
                                                            .activeClientID =
                                                        containerUsersRow
                                                            .clientId!;
                                                    FFAppState().isBrand =
                                                        false;
                                                    FFAppState().isBU = false;
                                                    FFAppState().isLoc = true;
                                                    safeSetState(() {});

                                                    context.pushNamed(
                                                        HomeWidget.routeName);
                                                  },
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      containerUsersRow
                                                          ?.companyName,
                                                      'Brand Name',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'GeistSans',
                                                          fontSize: 24.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              onEnter: ((event) async {
                                                safeSetState(() =>
                                                    _model.mouseRegionHovered1 =
                                                        true);
                                              }),
                                              onExit: ((event) async {
                                                safeSetState(() =>
                                                    _model.mouseRegionHovered1 =
                                                        false);
                                              }),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            );
                          } else if ((containerUsersRow?.limitedToBu == true) &&
                              (containerUsersRow?.limitedToLoc == false)) {
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FutureBuilder<List<ClientsRow>>(
                                  future: ClientsTable().queryRows(
                                    queryFn: (q) => q
                                        .eqOrNull(
                                          'bu_id',
                                          containerUsersRow?.clientId,
                                        )
                                        .isFilter(
                                          'loc_id',
                                          null,
                                        )
                                        .order('id', ascending: true),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: SpinKitRing(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 50.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<ClientsRow> containerClientsRowList =
                                        snapshot.data!;

                                    return Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Builder(
                                              builder: (context) {
                                                final businessUnit =
                                                    containerClientsRowList
                                                        .toList();

                                                return SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: List.generate(
                                                        businessUnit.length,
                                                        (businessUnitIndex) {
                                                      final businessUnitItem =
                                                          businessUnit[
                                                              businessUnitIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    1.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                BUchoiceWidget(
                                                                  key: Key(
                                                                      'Keyvwd_${businessUnitIndex}_of_${businessUnit.length}'),
                                                                  buName:
                                                                      valueOrDefault<
                                                                          String>(
                                                                    businessUnitItem
                                                                        .name,
                                                                    'np1',
                                                                  ),
                                                                  buId:
                                                                      businessUnitItem
                                                                          .id,
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: FutureBuilder<
                                                                      List<
                                                                          ClientsRow>>(
                                                                    future: ClientsTable()
                                                                        .queryRows(
                                                                      queryFn: (q) => q
                                                                          .eqOrNull(
                                                                            'brand_id',
                                                                            businessUnitItem.brandId,
                                                                          )
                                                                          .eqOrNull(
                                                                            'bu_id',
                                                                            businessUnitItem.id,
                                                                          )
                                                                          .not(
                                                                            'loc_id',
                                                                            'is',
                                                                            null,
                                                                          )
                                                                          .order('id', ascending: true),
                                                                    ),
                                                                    builder:
                                                                        (context,
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
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: 50.0,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      List<ClientsRow>
                                                                          containerClientsRowList =
                                                                          snapshot
                                                                              .data!;

                                                                      return Container(
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final location =
                                                                                containerClientsRowList.toList();

                                                                            return Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: List.generate(location.length, (locationIndex) {
                                                                                final locationItem = location[locationIndex];
                                                                                return LocationChoiceWidget(
                                                                                  key: Key('Keyu1o_${locationIndex}_of_${location.length}'),
                                                                                  locName: valueOrDefault<String>(
                                                                                    locationItem.name,
                                                                                    'client',
                                                                                  ),
                                                                                  locId: locationItem.id,
                                                                                );
                                                                              }),
                                                                            );
                                                                          },
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
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
                                    );
                                  },
                                ),
                              ],
                            );
                          } else {
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FutureBuilder<List<ClientsRow>>(
                                  future: ClientsTable().queryRows(
                                    queryFn: (q) => q
                                        .eqOrNull(
                                          'brand_id',
                                          containerUsersRow?.clientId,
                                        )
                                        .not(
                                          'bu_id',
                                          'is',
                                          null,
                                        )
                                        .isFilter(
                                          'loc_id',
                                          null,
                                        )
                                        .order('id', ascending: true),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: SpinKitRing(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 50.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<ClientsRow> containerClientsRowList =
                                        snapshot.data!;

                                    return Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .shadcnCardBorderGrey,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            MouseRegion(
                                              opaque: false,
                                              cursor: MouseCursor.defer ??
                                                  MouseCursor.defer,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: _model
                                                          .mouseRegionHovered2
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .cogeHoverFromWhite
                                                      : Color(0x00000000),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    FFAppState().activeSub =
                                                        true;
                                                    FFAppState().isNp1 = false;
                                                    FFAppState().activeBrand =
                                                        containerUsersRow!
                                                            .companyName!;
                                                    FFAppState()
                                                            .activeClientID =
                                                        containerUsersRow
                                                            .clientId!;
                                                    FFAppState().isBrand = true;
                                                    FFAppState().isBU = false;
                                                    FFAppState().isLoc = false;
                                                    safeSetState(() {});

                                                    context.pushNamed(
                                                        HomeWidget.routeName);
                                                  },
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      containerUsersRow
                                                          ?.companyName,
                                                      'Brand Name',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'GeistSans',
                                                          fontSize: 24.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              onEnter: ((event) async {
                                                safeSetState(() =>
                                                    _model.mouseRegionHovered2 =
                                                        true);
                                              }),
                                              onExit: ((event) async {
                                                safeSetState(() =>
                                                    _model.mouseRegionHovered2 =
                                                        false);
                                              }),
                                            ),
                                            Builder(
                                              builder: (context) {
                                                final businessUnit =
                                                    containerClientsRowList
                                                        .toList();

                                                return SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: List.generate(
                                                        businessUnit.length,
                                                        (businessUnitIndex) {
                                                      final businessUnitItem =
                                                          businessUnit[
                                                              businessUnitIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    1.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                BUchoiceWidget(
                                                                  key: Key(
                                                                      'Keys4r_${businessUnitIndex}_of_${businessUnit.length}'),
                                                                  buName:
                                                                      valueOrDefault<
                                                                          String>(
                                                                    businessUnitItem
                                                                        .name,
                                                                    'np1',
                                                                  ),
                                                                  buId:
                                                                      businessUnitItem
                                                                          .id,
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: FutureBuilder<
                                                                      List<
                                                                          ClientsRow>>(
                                                                    future: ClientsTable()
                                                                        .queryRows(
                                                                      queryFn: (q) => q
                                                                          .eqOrNull(
                                                                            'brand_id',
                                                                            businessUnitItem.brandId,
                                                                          )
                                                                          .eqOrNull(
                                                                            'bu_id',
                                                                            businessUnitItem.id,
                                                                          )
                                                                          .not(
                                                                            'loc_id',
                                                                            'is',
                                                                            null,
                                                                          )
                                                                          .order('id', ascending: true),
                                                                    ),
                                                                    builder:
                                                                        (context,
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
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: 50.0,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      List<ClientsRow>
                                                                          containerClientsRowList =
                                                                          snapshot
                                                                              .data!;

                                                                      return Container(
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final location =
                                                                                containerClientsRowList.toList();

                                                                            return Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: List.generate(location.length, (locationIndex) {
                                                                                final locationItem = location[locationIndex];
                                                                                return LocationChoiceWidget(
                                                                                  key: Key('Keyvu5_${locationIndex}_of_${location.length}'),
                                                                                  locName: valueOrDefault<String>(
                                                                                    locationItem.name,
                                                                                    'client',
                                                                                  ),
                                                                                  locId: locationItem.id,
                                                                                );
                                                                              }),
                                                                            );
                                                                          },
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
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
                                    );
                                  },
                                ),
                              ],
                            );
                          }
                        },
                      ),
                    ].divide(SizedBox(height: 16.0)),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
