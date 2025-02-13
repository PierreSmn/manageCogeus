import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'empty_recontact_model.dart';
export 'empty_recontact_model.dart';

class EmptyRecontactWidget extends StatefulWidget {
  const EmptyRecontactWidget({super.key});

  @override
  State<EmptyRecontactWidget> createState() => _EmptyRecontactWidgetState();
}

class _EmptyRecontactWidgetState extends State<EmptyRecontactWidget> {
  late EmptyRecontactModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyRecontactModel());

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
      width: 800.0,
      height: 100.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).revoBG,
        boxShadow: [
          BoxShadow(
            blurRadius: 0.0,
            color: Color(0x33000000),
            offset: Offset(
              0.0,
              -1.0,
            ),
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Vous retrouverez ici les demandes de contact. Vous n\'en avez pas encore reçu.',
          textAlign: TextAlign.start,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'GeistSans',
                fontSize: 21.0,
                letterSpacing: 0.0,
                useGoogleFonts: false,
              ),
        ),
      ),
    );
  }
}
