import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'row_wiget_model.dart';
export 'row_wiget_model.dart';

class RowWigetWidget extends StatefulWidget {
  const RowWigetWidget({
    super.key,
    this.parameter1,
    this.parameter2,
  });

  final List<dynamic>? parameter1;
  final dynamic parameter2;

  @override
  State<RowWigetWidget> createState() => _RowWigetWidgetState();
}

class _RowWigetWidgetState extends State<RowWigetWidget> {
  late RowWigetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RowWigetModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.parameter2 != null,
      child: Builder(
        builder: (context) {
          final tagIdd = widget.parameter1?.toList() ?? [];

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: List.generate(tagIdd.length, (tagIddIndex) {
                final tagIddItem = tagIdd[tagIddIndex];
                return FutureBuilder<List<TagsRow>>(
                  future: FFAppState().usersSpeTags(
                    uniqueQueryKey: tagIddItem.toString(),
                    requestFn: () => TagsTable().querySingleRow(
                      queryFn: (q) => q.eqOrNull(
                        'id',
                        tagIddItem,
                      ),
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
                    List<TagsRow> containerTagsRowList = snapshot.data!;

                    final containerTagsRow = containerTagsRowList.isNotEmpty
                        ? containerTagsRowList.first
                        : null;

                    return Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            containerTagsRow?.name,
                            'Pas de Tag',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'GeistSans',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                    );
                  },
                );
              }).divide(const SizedBox(width: 3.0)),
            ),
          );
        },
      ),
    );
  }
}
