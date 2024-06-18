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

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).revoWhite,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 28.0, 16.0, 28.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Effacer l\'asset ?',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Manrope',
                        color: FlutterFlowTheme.of(context).revoCardTextColor,
                        fontSize: 36.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
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
                                                  fontFamily: 'Manrope',
                                                  color: const Color(0xFFC31212),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          );
                                        }),
                                      );
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 0.0),
                                    child: Text(
                                      'ATTENTION : Vous devez d\'abord remplacer cette vidéo dans les listes ci-dessus avant de l\'effacer.',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Manrope',
                                            color: const Color(0xFFC31212),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
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
                                        fontFamily: 'Manrope',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                MouseRegion(
                                  opaque: false,
                                  cursor:
                                      MouseCursor.defer ?? MouseCursor.defer,
                                  onEnter: ((event) async {
                                    setState(
                                        () => _model.mouseRegionHovered = true);
                                  }),
                                  onExit: ((event) async {
                                    setState(() =>
                                        _model.mouseRegionHovered = false);
                                  }),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      await HostedSubsTable().delete(
                                        matchingRows: (rows) => rows.eq(
                                          'id',
                                          widget.assetID,
                                        ),
                                      );
                                      Navigator.pop(context);
                                    },
                                    text: 'Effacer',
                                    icon: const Icon(
                                      Icons.delete_outlined,
                                      size: 15.0,
                                    ),
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: _model.mouseRegionHovered
                                          ? FlutterFlowTheme.of(context)
                                              .buttonRevHover
                                          : const Color(0xFFFCE8F0),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Manrope',
                                            color: const Color(0xFFE32C61),
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
                              ],
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ].divide(const SizedBox(height: 12.0)),
            ),
          ),
        ),
      ),
    );
  }
}
