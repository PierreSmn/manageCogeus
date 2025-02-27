import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'erase_asset_model.dart';
export 'erase_asset_model.dart';

class EraseAssetWidget extends StatefulWidget {
  const EraseAssetWidget({
    super.key,
    required this.assetID,
  });

  final int? assetID;

  @override
  State<EraseAssetWidget> createState() => _EraseAssetWidgetState();
}

class _EraseAssetWidgetState extends State<EraseAssetWidget> {
  late EraseAssetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EraseAssetModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).revoWhite,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 28.0, 16.0, 28.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Effacer l\'asset ?',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'GeistSans',
                        color: FlutterFlowTheme.of(context).revoCardTextColor,
                        fontSize: 36.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: false,
                      ),
                ),
                FutureBuilder<ApiCallResponse>(
                  future: GetMatchForIdBeforeErasingCall.call(
                    id: widget.assetID,
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
                    final containerGetMatchForIdBeforeErasingResponse =
                        snapshot.data!;

                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (GetMatchForIdBeforeErasingCall.names(
                                    containerGetMatchForIdBeforeErasingResponse
                                        .jsonBody,
                                  ) !=
                                  null &&
                              (GetMatchForIdBeforeErasingCall.names(
                                containerGetMatchForIdBeforeErasingResponse
                                    .jsonBody,
                              ))!
                                  .isNotEmpty)
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'L\'asset est présent dans les intégrations :',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'GeistSans',
                                          color: Color(0xFFC31212),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                  Builder(
                                    builder: (context) {
                                      final listWhere =
                                          GetMatchForIdBeforeErasingCall.names(
                                                containerGetMatchForIdBeforeErasingResponse
                                                    .jsonBody,
                                              )?.toList() ??
                                              [];

                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(
                                            listWhere.length, (listWhereIndex) {
                                          final listWhereItem =
                                              listWhere[listWhereIndex];
                                          return Text(
                                            listWhereItem,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'GeistSans',
                                                  color: Color(0xFFC31212),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts: false,
                                                ),
                                          );
                                        }),
                                      );
                                    },
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 0.0),
                                    child: Text(
                                      'ATTENTION : Vous devez d\'abord vous assurez que l\'asset n\'est utilisé dans aucune intégration active pour l\'effacer.',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'GeistSans',
                                            color: Color(0xFFC31212),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (!(GetMatchForIdBeforeErasingCall.names(
                                    containerGetMatchForIdBeforeErasingResponse
                                        .jsonBody,
                                  ) !=
                                  null &&
                              (GetMatchForIdBeforeErasingCall.names(
                                containerGetMatchForIdBeforeErasingResponse
                                    .jsonBody,
                              ))!
                                  .isNotEmpty))
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Attention : Cette action est définitive. \n',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'GeistSans',
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                ),
                                MouseRegion(
                                  opaque: false,
                                  cursor:
                                      MouseCursor.defer ?? MouseCursor.defer,
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      var _shouldSetState = false;
                                      _model.deleteDone =
                                          await MUXDeleteCall.call(
                                        assetId: widget.assetID?.toString(),
                                      );

                                      _shouldSetState = true;
                                      if (!(_model.deleteDone?.succeeded ??
                                          true)) {
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }
                                      await HostedSubsTable().delete(
                                        matchingRows: (rows) => rows.eqOrNull(
                                          'id',
                                          widget.assetID,
                                        ),
                                      );
                                      Navigator.pop(context);
                                      if (_shouldSetState) safeSetState(() {});
                                    },
                                    text: 'Effacer',
                                    icon: Icon(
                                      Icons.delete_outlined,
                                      size: 15.0,
                                    ),
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: _model.mouseRegionHovered
                                          ? Color(0xFFF5E2E4)
                                          : Color(0xFFFCE8EC),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'GeistSans',
                                            color: Color(0xFFE32C61),
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
                                  onEnter: ((event) async {
                                    safeSetState(
                                        () => _model.mouseRegionHovered = true);
                                  }),
                                  onExit: ((event) async {
                                    safeSetState(() =>
                                        _model.mouseRegionHovered = false);
                                  }),
                                ),
                              ],
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ].divide(SizedBox(height: 8.0)),
            ),
          ),
        ),
      ),
    );
  }
}
