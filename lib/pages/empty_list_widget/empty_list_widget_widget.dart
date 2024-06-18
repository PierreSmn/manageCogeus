import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'empty_list_widget_model.dart';
export 'empty_list_widget_model.dart';

class EmptyListWidgetWidget extends StatefulWidget {
  const EmptyListWidgetWidget({super.key});

  @override
  State<EmptyListWidgetWidget> createState() => _EmptyListWidgetWidgetState();
}

class _EmptyListWidgetWidgetState extends State<EmptyListWidgetWidget> {
  late EmptyListWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyListWidgetModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
            child: Text(
              'Pas de nouveau contenu à trier',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Manrope',
                    fontSize: 44.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ),
        FFButtonWidget(
          onPressed: () async {
            context.safePop();
          },
          text: 'Retour',
          options: FFButtonOptions(
            width: 150.0,
            height: 40.0,
            padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
            iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
            color: const Color(0xFFEEE8FC),
            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
      ].divide(const SizedBox(height: 24.0)),
    );
  }
}
