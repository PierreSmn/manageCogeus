import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/b_uchoice_widget.dart';
import '/components/location_choice_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
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
    return FutureBuilder<List<UsersRow>>(
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
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
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
                      context.pushNamed('infos');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).revoWhite,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 8.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 40.0,
                                  height: 40.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    'https://images.unsplash.com/photo-1583243552802-94ccb4200150?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyMXx8cHJvZmlsZXxlbnwwfHx8fDE3MzQzMTAyMTh8MA&ixlib=rb-4.0.3&q=80&w=1080',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'Mon compte',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          color: FlutterFlowTheme.of(context)
                                              .revoCardTextColor,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                  ),
                                ),
                              ].divide(const SizedBox(width: 16.0)),
                            ),
                          ]
                              .divide(const SizedBox(height: 24.0))
                              .addToStart(const SizedBox(height: 16.0))
                              .addToEnd(const SizedBox(height: 18.0)),
                        ),
                      ),
                    ),
                  ),
                  Column(
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
                          List<ClientsRow> containerClientsRowList =
                              snapshot.data!;

                          return Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MouseRegion(
                                    opaque: false,
                                    cursor:
                                        MouseCursor.defer ?? MouseCursor.defer,
                                    onEnter: ((event) async {
                                      safeSetState(() =>
                                          _model.mouseRegionHovered = true);
                                    }),
                                    onExit: ((event) async {
                                      safeSetState(() =>
                                          _model.mouseRegionHovered = false);
                                    }),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: _model.mouseRegionHovered
                                            ? FlutterFlowTheme.of(context)
                                                .cogeHoverFromWhite
                                            : const Color(0x00000000),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          FFAppState().activeSub = true;
                                          FFAppState().isNp1 = false;
                                          FFAppState().activeBrand =
                                              containerUsersRow!.companyName!;
                                          FFAppState().activeClientID =
                                              containerUsersRow.clientId!;
                                          FFAppState().isBrand = true;
                                          FFAppState().isBU = false;
                                          FFAppState().isLoc = false;
                                          safeSetState(() {});

                                          context.pushNamed('home');
                                        },
                                        child: Text(
                                          valueOrDefault<String>(
                                            containerUsersRow?.companyName,
                                            'Brand Name',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Manrope',
                                                fontSize: 24.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) {
                                      final businessUnit =
                                          containerClientsRowList.toList();

                                      return SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children:
                                              List.generate(businessUnit.length,
                                                  (businessUnitIndex) {
                                            final businessUnitItem =
                                                businessUnit[businessUnitIndex];
                                            return Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 0.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(1.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      BUchoiceWidget(
                                                        key: Key(
                                                            'Keyh0c_${businessUnitIndex}_of_${businessUnit.length}'),
                                                        buName: valueOrDefault<
                                                            String>(
                                                          businessUnitItem.name,
                                                          'np1',
                                                        ),
                                                        buId:
                                                            businessUnitItem.id,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: FutureBuilder<
                                                            List<ClientsRow>>(
                                                          future: ClientsTable()
                                                              .queryRows(
                                                            queryFn: (q) => q
                                                                .eqOrNull(
                                                                  'brand_id',
                                                                  businessUnitItem
                                                                      .brandId,
                                                                )
                                                                .eqOrNull(
                                                                  'bu_id',
                                                                  businessUnitItem
                                                                      .id,
                                                                )
                                                                .not(
                                                                  'loc_id',
                                                                  'is',
                                                                  null,
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
                                                            List<ClientsRow>
                                                                containerClientsRowList =
                                                                snapshot.data!;

                                                            return Container(
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final location =
                                                                      containerClientsRowList
                                                                          .toList();

                                                                  return Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: List.generate(
                                                                        location
                                                                            .length,
                                                                        (locationIndex) {
                                                                      final locationItem =
                                                                          location[
                                                                              locationIndex];
                                                                      return LocationChoiceWidget(
                                                                        key: Key(
                                                                            'Keye11_${locationIndex}_of_${location.length}'),
                                                                        locName:
                                                                            valueOrDefault<String>(
                                                                          locationItem
                                                                              .name,
                                                                          'client',
                                                                        ),
                                                                        locId: locationItem
                                                                            .id,
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
                  ),
                ].divide(const SizedBox(height: 16.0)),
              ),
            ),
          ),
        );
      },
    );
  }
}
