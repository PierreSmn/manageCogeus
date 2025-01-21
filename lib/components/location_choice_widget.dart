import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'location_choice_model.dart';
export 'location_choice_model.dart';

class LocationChoiceWidget extends StatefulWidget {
  const LocationChoiceWidget({
    super.key,
    this.locName,
    this.locId,
  });

  final String? locName;
  final int? locId;

  @override
  State<LocationChoiceWidget> createState() => _LocationChoiceWidgetState();
}

class _LocationChoiceWidgetState extends State<LocationChoiceWidget> {
  late LocationChoiceModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LocationChoiceModel());

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
              FFAppState().activeBrand = widget.locName!;
              FFAppState().activeClientID = widget.locId!;
              FFAppState().activeSub = true;
              FFAppState().isBrand = false;
              FFAppState().isBU = false;
              FFAppState().isLoc = true;
              safeSetState(() {});

              context.pushNamed('home');
            },
            child: Text(
              widget.locName!,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Manrope',
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
