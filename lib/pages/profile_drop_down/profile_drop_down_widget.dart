import '/auth/supabase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'profile_drop_down_model.dart';
export 'profile_drop_down_model.dart';

class ProfileDropDownWidget extends StatefulWidget {
  const ProfileDropDownWidget({super.key});

  @override
  State<ProfileDropDownWidget> createState() => _ProfileDropDownWidgetState();
}

class _ProfileDropDownWidgetState extends State<ProfileDropDownWidget> {
  late ProfileDropDownModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileDropDownModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: 300.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
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
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 0.0, 8.0),
                child: Text(
                  'Account Infos',
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Manrope',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Randy Peterson',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Manrope',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 0.0),
                            child: Text(
                              currentUserEmail,
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Manrope',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 0.0),
                            child: Text(
                              currentUserUid,
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Manrope',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 0.0),
                            child: Text(
                              currentJwtToken,
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Manrope',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).alternate,
              ),
              MouseRegion(
                opaque: false,
                cursor: MouseCursor.defer ?? MouseCursor.defer,
                onEnter: ((event) async {
                  setState(() => _model.mouseRegionHovered1 = true);
                }),
                onExit: ((event) async {
                  setState(() => _model.mouseRegionHovered1 = false);
                }),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  curve: Curves.easeInOut,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: _model.mouseRegionHovered1
                        ? FlutterFlowTheme.of(context).primaryBackground
                        : FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.account_circle_outlined,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 20.0,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'My Account',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Manrope',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              MouseRegion(
                opaque: false,
                cursor: SystemMouseCursors.basic ?? MouseCursor.defer,
                onEnter: ((event) async {
                  setState(() => _model.mouseRegionHovered2 = true);
                }),
                onExit: ((event) async {
                  setState(() => _model.mouseRegionHovered2 = false);
                }),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  curve: Curves.easeInOut,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: _model.mouseRegionHovered2
                        ? FlutterFlowTheme.of(context).primaryBackground
                        : FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.settings_outlined,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 20.0,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Settings',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Manrope',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              MouseRegion(
                opaque: false,
                cursor: SystemMouseCursors.click ?? MouseCursor.defer,
                onEnter: ((event) async {
                  setState(() => _model.mouseRegionHovered3 = true);
                }),
                onExit: ((event) async {
                  setState(() => _model.mouseRegionHovered3 = false);
                }),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    GoRouter.of(context).prepareAuthEvent();
                    await authManager.signOut();
                    GoRouter.of(context).clearRedirectLocation();

                    context.goNamedAuth('signin', context.mounted);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    curve: Curves.easeInOut,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: _model.mouseRegionHovered3
                          ? FlutterFlowTheme.of(context).primaryBackground
                          : FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Icon(
                              Icons.content_cut,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 20.0,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Disconnect',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Manrope',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).alternate,
              ),
              MouseRegion(
                opaque: false,
                cursor: SystemMouseCursors.click ?? MouseCursor.defer,
                onEnter: ((event) async {
                  setState(() => _model.mouseRegionHovered4 = true);
                }),
                onExit: ((event) async {
                  setState(() => _model.mouseRegionHovered4 = false);
                }),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  curve: Curves.easeInOut,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: _model.mouseRegionHovered4
                        ? FlutterFlowTheme.of(context).primaryBackground
                        : FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.login_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 20.0,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Log out',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Manrope',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
