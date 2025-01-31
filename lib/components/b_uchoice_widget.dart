import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'b_uchoice_model.dart';
export 'b_uchoice_model.dart';

class BUchoiceWidget extends StatefulWidget {
  const BUchoiceWidget({
    super.key,
    this.buName,
    this.buId,
  });

  final String? buName;
  final int? buId;

  @override
  State<BUchoiceWidget> createState() => _BUchoiceWidgetState();
}

class _BUchoiceWidgetState extends State<BUchoiceWidget> {
  late BUchoiceModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BUchoiceModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      opaque: false,
      cursor: MouseCursor.defer ?? MouseCursor.defer,
      onEnter: ((event) async {
        safeSetState(() => _model.mouseRegionHovered = true);
      }),
      onExit: ((event) async {
        safeSetState(() => _model.mouseRegionHovered = false);
      }),
      child: Container(
        decoration: BoxDecoration(
          color: _model.mouseRegionHovered
              ? FlutterFlowTheme.of(context).cogeHoverFromWhite
              : const Color(0x00000000),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              FFAppState().activeSub = true;
              FFAppState().isNp1 = false;
              FFAppState().activeBrand = widget.buName!;
              FFAppState().isBrand = false;
              FFAppState().isBU = true;
              FFAppState().isLoc = false;
              FFAppState().activeClientID = widget.buId!;
              safeSetState(() {});

              context.pushNamed('home');
            },
            child: Text(
              widget.buName!,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'GeistSans',
                    fontSize: 20.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                    useGoogleFonts: false,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
