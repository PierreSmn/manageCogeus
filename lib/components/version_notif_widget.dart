import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'version_notif_model.dart';
export 'version_notif_model.dart';

class VersionNotifWidget extends StatefulWidget {
  const VersionNotifWidget({super.key});

  @override
  State<VersionNotifWidget> createState() => _VersionNotifWidgetState();
}

class _VersionNotifWidgetState extends State<VersionNotifWidget> {
  late VersionNotifModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VersionNotifModel());

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
      width: MediaQuery.sizeOf(context).width * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).revoWhite,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 28.0, 16.0, 28.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Nouvelle version disponible !',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'GeistSans',
                          color: FlutterFlowTheme.of(context).revoCardTextColor,
                          fontSize: 30.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: false,
                        ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: Text(
                      'Une mise à jour de la dashboard Cogeus a été faite. Rechargez la page pour en profiter.',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'GeistSans',
                            color: FlutterFlowTheme.of(context)
                                .revoCardTextColorUnselected,
                            fontSize: 24.72,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            FFButtonWidget(
              onPressed: () async {
                await actions.actualizar();
                await UsersTable().update(
                  data: {
                    'up_to_date': true,
                  },
                  matchingRows: (rows) => rows.eqOrNull(
                    'id',
                    currentUserUid,
                  ),
                );
              },
              text: 'Recharger la page',
              icon: Icon(
                Icons.replay,
                size: 15.0,
              ),
              options: FFButtonOptions(
                height: 60.0,
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: Color(0xFFEEE8FC),
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'GeistSans',
                      color: Color(0xFF5E35B1),
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      useGoogleFonts: false,
                    ),
                elevation: 0.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 0.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ].divide(SizedBox(height: 12.0)),
        ),
      ),
    );
  }
}
