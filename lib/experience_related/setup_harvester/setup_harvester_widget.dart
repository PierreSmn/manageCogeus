import '/backend/supabase/supabase.dart';
import '/experience_related/harvester_choice_option/harvester_choice_option_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'setup_harvester_model.dart';
export 'setup_harvester_model.dart';

class SetupHarvesterWidget extends StatefulWidget {
  const SetupHarvesterWidget({
    super.key,
    required this.id,
  });

  final int? id;

  @override
  State<SetupHarvesterWidget> createState() => _SetupHarvesterWidgetState();
}

class _SetupHarvesterWidgetState extends State<SetupHarvesterWidget> {
  late SetupHarvesterModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SetupHarvesterModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

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

        final containerClientsRow = containerClientsRowList.isNotEmpty
            ? containerClientsRowList.first
            : null;

        return Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 1.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).revoBG,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 28.0, 16.0, 28.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Choix du Harvester',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Manrope',
                                    fontSize: 19.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    lineHeight: 1.2,
                                  ),
                            ),
                          ].divide(const SizedBox(height: 12.0)),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FutureBuilder<List<LiveFlowsRow>>(
                              future: LiveFlowsTable().queryRows(
                                queryFn: (q) => q
                                    .eqOrNull(
                                      'brand_name',
                                      FFAppState().activeBrand,
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
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 50.0,
                                      ),
                                    ),
                                  );
                                }
                                List<LiveFlowsRow> containerLiveFlowsRowList =
                                    snapshot.data!;

                                return Container(
                                  width: double.infinity,
                                  height: 270.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).revoWhite,
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Builder(
                                      builder: (context) {
                                        final containerVar =
                                            containerLiveFlowsRowList.toList();

                                        return SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: List.generate(
                                                containerVar.length,
                                                (containerVarIndex) {
                                              final containerVarItem =
                                                  containerVar[
                                                      containerVarIndex];
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await ClientsTable().update(
                                                    data: {
                                                      'slug_harvester':
                                                          containerVarItem.slug,
                                                    },
                                                    matchingRows: (rows) =>
                                                        rows.eqOrNull(
                                                      'id',
                                                      widget.id,
                                                    ),
                                                  );
                                                  Navigator.pop(context);
                                                },
                                                child:
                                                    HarvesterChoiceOptionWidget(
                                                  key: Key(
                                                      'Keyx90_${containerVarIndex}_of_${containerVar.length}'),
                                                  parameter1:
                                                      valueOrDefault<String>(
                                                    containerVarItem.slug,
                                                    'harvesterName',
                                                  ),
                                                ),
                                              );
                                            }).divide(const SizedBox(height: 16.0)),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          ].divide(const SizedBox(height: 16.0)),
                        ),
                      ),
                    ),
                  ].divide(const SizedBox(height: 26.0)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
