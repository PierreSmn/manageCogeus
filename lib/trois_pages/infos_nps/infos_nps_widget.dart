import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'infos_nps_model.dart';
export 'infos_nps_model.dart';

class InfosNpsWidget extends StatefulWidget {
  const InfosNpsWidget({super.key});

  @override
  State<InfosNpsWidget> createState() => _InfosNpsWidgetState();
}

class _InfosNpsWidgetState extends State<InfosNpsWidget> {
  late InfosNpsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InfosNpsModel());

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
      width: 500.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        boxShadow: const [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(
              0.0,
              2.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 20.0,
              borderWidth: 1.0,
              buttonSize: 40.0,
              hoverColor: FlutterFlowTheme.of(context).primaryBackground,
              icon: Icon(
                Icons.close_rounded,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 24.0,
              ),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Que signifie votre NPS ?',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'GeistSans',
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                            ),
                      ),
                    ].divide(const SizedBox(width: 8.0)),
                  ),
                  RichText(
                    textScaler: MediaQuery.of(context).textScaler,
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text:
                              'Le Net Promoter Score (NPS) est largement utilisée pour mesurer la fidélité et la satisfaction des clients, basée sur leur volonté de recommander un produit ou un service.\n\n',
                          style: TextStyle(),
                        ),
                        const TextSpan(
                          text:
                              'Le score varie de -100 (uniquement des détracteurs) à +100 (uniquement des promoteurs). \nUn score positif est généralement considéré comme bon, et un score supérieur à 50 est excellent.\n\n',
                          style: TextStyle(),
                        ),
                        TextSpan(
                          text: 'Référentiel général :\n',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                          ),
                        ),
                        const TextSpan(
                          text:
                              'En dessous de 0 : Mauvais (nécessite une attention immédiate)\nDe 0 à 30 : Moyen (des améliorations sont nécessaires)\nDe 31 à 50 : Bon (bonne performance)\nDe 51 à 70 : Excellent (base de clients très fidèles)\nDe 71 à 100 : Classe mondiale (fidélité et promotion exceptionnelles)',
                          style: TextStyle(),
                        )
                      ],
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'GeistSans',
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ].divide(const SizedBox(height: 4.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
