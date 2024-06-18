import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'erase_list_model.dart';
export 'erase_list_model.dart';

class EraseListWidget extends StatefulWidget {
  const EraseListWidget({
    super.key,
    required this.listId,
  });

  final String? listId;

  @override
  State<EraseListWidget> createState() => _EraseListWidgetState();
}

class _EraseListWidgetState extends State<EraseListWidget> {
  late EraseListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EraseListModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ListsRow>>(
      future: ListsTable().querySingleRow(
        queryFn: (q) => q
            .eq(
              'name',
              widget.listId,
            )
            .eq(
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
        final containerListsRow = containerListsRowList.isNotEmpty
            ? containerListsRowList.first
            : null;
        return Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).revoWhite,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 28.0, 16.0, 28.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Effacer du dossier ?',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Manrope',
                        color: FlutterFlowTheme.of(context).revoCardTextColor,
                        fontSize: 36.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: RichText(
                    textScaler: MediaQuery.of(context).textScaler,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: valueOrDefault<String>(
                            containerListsRow?.name,
                            'noList',
                          ),
                          style: const TextStyle(),
                        ),
                        const TextSpan(
                          text: ' ne pourra pas être récuperer. ',
                          style: TextStyle(),
                        )
                      ],
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
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
                            await ListsTable().delete(
                              matchingRows: (rows) => rows.eq(
                                'id',
                                containerListsRow?.id,
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
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: _model.mouseRegionHovered
                                ? FlutterFlowTheme.of(context).buttonRevHover
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
