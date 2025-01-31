import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'harvester_choice_option_model.dart';
export 'harvester_choice_option_model.dart';

class HarvesterChoiceOptionWidget extends StatefulWidget {
  const HarvesterChoiceOptionWidget({
    super.key,
    this.parameter1,
  });

  final String? parameter1;

  @override
  State<HarvesterChoiceOptionWidget> createState() =>
      _HarvesterChoiceOptionWidgetState();
}

class _HarvesterChoiceOptionWidgetState
    extends State<HarvesterChoiceOptionWidget> {
  late HarvesterChoiceOptionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HarvesterChoiceOptionModel());

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
        width: double.infinity,
        height: 30.0,
        decoration: BoxDecoration(
          color: _model.mouseRegionHovered
              ? FlutterFlowTheme.of(context).revoNavSelected
              : FlutterFlowTheme.of(context).revoWhite,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            widget.parameter1!,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'GeistSans',
                  letterSpacing: 0.0,
                  useGoogleFonts: false,
                ),
          ),
        ),
      ),
    );
  }
}
