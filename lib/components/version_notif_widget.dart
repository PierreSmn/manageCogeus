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
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).revoWhite,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 28, 16, 28),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(6, 0, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Nouvelle version disponible !',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Manrope',
                          color: FlutterFlowTheme.of(context).revoCardTextColor,
                          fontSize: 30,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                    child: Text(
                      'Une mise à jour de la dashboard Cogeus a été faite. Rechargez la page pour en profiter.',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            color: FlutterFlowTheme.of(context)
                                .revoCardTextColorUnselected,
                            fontSize: 24.72,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
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
                  matchingRows: (rows) => rows.eq(
                    'id',
                    currentUserUid,
                  ),
                );
              },
              text: 'Recharger la page',
              icon: const Icon(
                Icons.replay,
                size: 15,
              ),
              options: FFButtonOptions(
                height: 60,
                padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                color: const Color(0xFFEEE8FC),
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Manrope',
                      color: const Color(0xFF5E35B1),
                      fontSize: 18,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
                elevation: 0,
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 0,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ].divide(const SizedBox(height: 12)),
        ),
      ),
    );
  }
}
