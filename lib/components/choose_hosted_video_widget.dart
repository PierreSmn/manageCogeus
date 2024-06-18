import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'choose_hosted_video_model.dart';
export 'choose_hosted_video_model.dart';

class ChooseHostedVideoWidget extends StatefulWidget {
  const ChooseHostedVideoWidget({super.key});

  @override
  State<ChooseHostedVideoWidget> createState() =>
      _ChooseHostedVideoWidgetState();
}

class _ChooseHostedVideoWidgetState extends State<ChooseHostedVideoWidget> {
  late ChooseHostedVideoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChooseHostedVideoModel());

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

    return FutureBuilder<List<HostedSubsRow>>(
      future: HostedSubsTable().queryRows(
        queryFn: (q) => q
            .eq(
              'brand_name',
              FFAppState().activeBrand,
            )
            .order('id'),
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
        List<HostedSubsRow> containerHostedSubsRowList = snapshot.data!;
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).revoBG,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Builder(
                  builder: (context) {
                    final videos = containerHostedSubsRowList.toList();
                    return Wrap(
                      spacing: 16.0,
                      runSpacing: 16.0,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.start,
                      verticalDirection: VerticalDirection.down,
                      clipBehavior: Clip.none,
                      children: List.generate(videos.length, (videosIndex) {
                        final videosItem = videos[videosIndex];
                        return Container(
                          width: 180.0,
                          height: 380.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).revoWhite,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    videosItem.thumbnail!,
                                    width: double.infinity,
                                    height: 280.0,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 8.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FFButtonWidget(
                                            onPressed: ((FFAppState().vid1 ==
                                                        videosItem.id) ||
                                                    (FFAppState().vid2 ==
                                                        videosItem.id) ||
                                                    (FFAppState().vid3 ==
                                                        videosItem.id) ||
                                                    (FFAppState().vid4 ==
                                                        videosItem.id) ||
                                                    (FFAppState().vid5 ==
                                                        videosItem.id))
                                                ? null
                                                : () async {
                                                    FFAppState().choiceID =
                                                        videosItem.id;
                                                    setState(() {});
                                                    Navigator.pop(context);
                                                  },
                                            text: 'Choose',
                                            icon: const Icon(
                                              Icons.check_circle,
                                              size: 15.0,
                                            ),
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: const Color(0xFFEEE8FC),
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
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
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              disabledColor: const Color(0x7F28174A),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].divide(const SizedBox(width: 8.0)),
                                ),
                              ].divide(const SizedBox(height: 12.0)),
                            ),
                          ),
                        );
                      }),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
