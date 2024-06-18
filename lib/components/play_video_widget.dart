import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'package:flutter/material.dart';
import 'play_video_model.dart';
export 'play_video_model.dart';

class PlayVideoWidget extends StatefulWidget {
  const PlayVideoWidget({
    super.key,
    required this.videoAdress,
  });

  final String? videoAdress;

  @override
  State<PlayVideoWidget> createState() => _PlayVideoWidgetState();
}

class _PlayVideoWidgetState extends State<PlayVideoWidget> {
  late PlayVideoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlayVideoModel());

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlutterFlowVideoPlayer(
                        path: widget.videoAdress!,
                        videoType: VideoType.network,
                        width: 290.0,
                        height: 620.0,
                        autoPlay: false,
                        looping: true,
                        showControls: true,
                        allowFullScreen: true,
                        allowPlaybackSpeedMenu: false,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ].divide(const SizedBox(height: 12.0)),
        ),
      ),
    );
  }
}
