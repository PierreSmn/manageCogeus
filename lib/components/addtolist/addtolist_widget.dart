import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'addtolist_model.dart';
export 'addtolist_model.dart';

class AddtolistWidget extends StatefulWidget {
  const AddtolistWidget({
    super.key,
    required this.vidId,
  });

  final int? vidId;

  @override
  State<AddtolistWidget> createState() => _AddtolistWidgetState();
}

class _AddtolistWidgetState extends State<AddtolistWidget> {
  late AddtolistModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddtolistModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.selected = null;
      setState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<ListsRow>>(
      future: ListsTable().queryRows(
        queryFn: (q) => q.eq(
          'uuid',
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
        List<ListsRow> containerListsRowList = snapshot.data!;
        return Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
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
                  'Ajouter à un dossier',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Manrope',
                        color: FlutterFlowTheme.of(context).revoCardTextColor,
                        fontSize: 36.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Builder(
                  builder: (context) {
                    final containerVar = containerListsRowList.toList();
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(containerVar.length,
                            (containerVarIndex) {
                          final containerVarItem =
                              containerVar[containerVarIndex];
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.selected = containerVarItem.name;
                              _model.idSelected = containerVarItem.id;
                              setState(() {});
                            },
                            child: Text(
                              valueOrDefault<String>(
                                containerVarItem.name,
                                'nonnn',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Manrope',
                                    color:
                                        _model.selected == containerVarItem.name
                                            ? FlutterFlowTheme.of(context)
                                                .revoCardBlueText
                                            : FlutterFlowTheme.of(context)
                                                .revoSearchIconColor,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          );
                        }),
                      ),
                    );
                  },
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    MouseRegion(
                      opaque: false,
                      cursor: MouseCursor.defer ?? MouseCursor.defer,
                      onEnter: ((event) async {
                        setState(() => _model.mouseRegionHovered = true);
                      }),
                      onExit: ((event) async {
                        setState(() => _model.mouseRegionHovered = false);
                      }),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            var shouldSetState = false;
                            if (_model.selected != null &&
                                _model.selected != '') {
                              _model.listGet = await GetListCall.call(
                                id: _model.idSelected,
                              );
                              shouldSetState = true;
                              FFAppState().userSelection = GetListCall.select(
                                (_model.listGet?.jsonBody ?? ''),
                              )!
                                  .toList()
                                  .cast<int>();
                              setState(() {});
                              FFAppState().addToUserSelection(widget.vidId!);
                              setState(() {});
                            } else {
                              if (shouldSetState) setState(() {});
                              return;
                            }

                            await ListsTable().update(
                              data: {
                                'selection': FFAppState().userSelection,
                              },
                              matchingRows: (rows) => rows.eq(
                                'id',
                                _model.idSelected,
                              ),
                            );
                            Navigator.pop(context);
                            if (shouldSetState) setState(() {});
                          },
                          text: 'Ajouter',
                          icon: const Icon(
                            Icons.add,
                            size: 15.0,
                          ),
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: _model.mouseRegionHovered
                                ? FlutterFlowTheme.of(context).buttonRevHover
                                : FlutterFlowTheme.of(context).buttonRevBG,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
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
                  ],
                ),
              ].divide(const SizedBox(height: 12.0)),
            ),
          ),
        );
      },
    );
  }
}
