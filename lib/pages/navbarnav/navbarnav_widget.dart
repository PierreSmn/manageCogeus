import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/choose_clientor_np/choose_clientor_np_widget.dart';
import '/index.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'navbarnav_model.dart';
export 'navbarnav_model.dart';

class NavbarnavWidget extends StatefulWidget {
  const NavbarnavWidget({
    super.key,
    int? selectedIndex,
  }) : this.selectedIndex = selectedIndex ?? 1;

  final int selectedIndex;

  @override
  State<NavbarnavWidget> createState() => _NavbarnavWidgetState();
}

class _NavbarnavWidgetState extends State<NavbarnavWidget> {
  late NavbarnavModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavbarnavModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 1.0, 0.0),
      child: Container(
        width: 240.0,
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 0.0,
              color: FlutterFlowTheme.of(context).shadcnCardBorderGrey,
              offset: Offset(
                1.0,
                0.0,
              ),
              spreadRadius: 1.0,
            )
          ],
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24.0, 32.0, 0.0, 0.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(HomeWidget.routeName);
                  },
                  child: Container(
                    width: 300.0,
                    height: 90.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              'https://pifcxlqwffdrqcwggoqb.supabase.co/storage/v1/object/public/conversations/ffUploads/1714658498448000.png',
                              width: 130.0,
                              height: 50.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ].divide(SizedBox(height: 24.0)),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Expérience client',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'GeistSans',
                                    color: FlutterFlowTheme.of(context)
                                        .joliGrisPourTexteLeger,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: false,
                                  ),
                        ),
                        MouseRegion(
                          opaque: false,
                          cursor: MouseCursor.defer ?? MouseCursor.defer,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(HomeWidget.routeName);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: () {
                                  if (widget.selectedIndex == 1) {
                                    return Color(0xFFF3EFFF);
                                  } else if (_model.mouseRegionHovered1) {
                                    return FlutterFlowTheme.of(context)
                                        .shadcnCardBorderGrey;
                                  } else {
                                    return FlutterFlowTheme.of(context)
                                        .primaryBackground;
                                  }
                                }(),
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: Colors.transparent,
                                  width: 0.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Icon(
                                        Icons.cottage_outlined,
                                        color: widget.selectedIndex == 1
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .revoCardTextColor,
                                        size: 20.0,
                                      ),
                                    ),
                                    Text(
                                      'Tableau de bord',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'GeistSans',
                                            color: widget.selectedIndex == 1
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : FlutterFlowTheme.of(context)
                                                    .revoCardTextColor,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          onEnter: ((event) async {
                            safeSetState(
                                () => _model.mouseRegionHovered1 = true);
                          }),
                          onExit: ((event) async {
                            safeSetState(
                                () => _model.mouseRegionHovered1 = false);
                          }),
                        ),
                        MouseRegion(
                          opaque: false,
                          cursor: MouseCursor.defer ?? MouseCursor.defer,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(ExperiencesWidget.routeName);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: () {
                                  if (widget.selectedIndex == 6) {
                                    return FlutterFlowTheme.of(context)
                                        .cogeusNavSelected;
                                  } else if (_model.mouseRegionHovered2) {
                                    return FlutterFlowTheme.of(context)
                                        .shadcnCardBorderGrey;
                                  } else {
                                    return FlutterFlowTheme.of(context)
                                        .primaryBackground;
                                  }
                                }(),
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: Colors.transparent,
                                  width: 0.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Icon(
                                        Icons.list_rounded,
                                        color: widget.selectedIndex == 6
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .revoCardTextColor,
                                        size: 24.0,
                                      ),
                                    ),
                                    Text(
                                      'Retours',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'GeistSans',
                                            color: widget.selectedIndex == 6
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : FlutterFlowTheme.of(context)
                                                    .revoCardTextColor,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          onEnter: ((event) async {
                            safeSetState(
                                () => _model.mouseRegionHovered2 = true);
                          }),
                          onExit: ((event) async {
                            safeSetState(
                                () => _model.mouseRegionHovered2 = false);
                          }),
                        ),
                        MouseRegion(
                          opaque: false,
                          cursor: MouseCursor.defer ?? MouseCursor.defer,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(RecontactWidget.routeName);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: () {
                                  if (widget.selectedIndex == 5) {
                                    return FlutterFlowTheme.of(context)
                                        .cogeusNavSelected;
                                  } else if (_model.mouseRegionHovered3) {
                                    return FlutterFlowTheme.of(context)
                                        .shadcnCardBorderGrey;
                                  } else {
                                    return FlutterFlowTheme.of(context)
                                        .primaryBackground;
                                  }
                                }(),
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: Colors.transparent,
                                  width: 0.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Icon(
                                        Icons.phone_enabled,
                                        color: widget.selectedIndex == 5
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .revoCardTextColor,
                                        size: 20.0,
                                      ),
                                    ),
                                    Text(
                                      'Tickets',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'GeistSans',
                                            color: widget.selectedIndex == 5
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : FlutterFlowTheme.of(context)
                                                    .revoCardTextColor,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          onEnter: ((event) async {
                            safeSetState(
                                () => _model.mouseRegionHovered3 = true);
                          }),
                          onExit: ((event) async {
                            safeSetState(
                                () => _model.mouseRegionHovered3 = false);
                          }),
                        ),
                        MouseRegion(
                          opaque: false,
                          cursor: MouseCursor.defer ?? MouseCursor.defer,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(ParamWidget.routeName);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: () {
                                  if (widget.selectedIndex == 3) {
                                    return FlutterFlowTheme.of(context)
                                        .cogeusNavSelected;
                                  } else if (_model.mouseRegionHovered4) {
                                    return FlutterFlowTheme.of(context)
                                        .shadcnCardBorderGrey;
                                  } else {
                                    return FlutterFlowTheme.of(context)
                                        .primaryBackground;
                                  }
                                }(),
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: Colors.transparent,
                                  width: 0.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Icon(
                                        Icons.settings_rounded,
                                        color: widget.selectedIndex == 3
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .revoCardTextColor,
                                        size: 22.0,
                                      ),
                                    ),
                                    Text(
                                      'Paramètres',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'GeistSans',
                                            color: widget.selectedIndex == 3
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : FlutterFlowTheme.of(context)
                                                    .revoCardTextColor,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          onEnter: ((event) async {
                            safeSetState(
                                () => _model.mouseRegionHovered4 = true);
                          }),
                          onExit: ((event) async {
                            safeSetState(
                                () => _model.mouseRegionHovered4 = false);
                          }),
                        ),
                      ]
                          .divide(SizedBox(height: 12.0))
                          .addToStart(SizedBox(height: 12.0))
                          .addToEnd(SizedBox(height: 16.0)),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Vidéos',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'GeistSans',
                                    color: FlutterFlowTheme.of(context)
                                        .joliGrisPourTexteLeger,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: false,
                                  ),
                        ),
                        MouseRegion(
                          opaque: false,
                          cursor: MouseCursor.defer ?? MouseCursor.defer,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(HarvestersWidget.routeName);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: () {
                                  if (widget.selectedIndex == 10) {
                                    return FlutterFlowTheme.of(context)
                                        .cogeusNavSelected;
                                  } else if (_model.mouseRegionHovered5) {
                                    return FlutterFlowTheme.of(context)
                                        .shadcnCardBorderGrey;
                                  } else {
                                    return FlutterFlowTheme.of(context)
                                        .primaryBackground;
                                  }
                                }(),
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: Colors.transparent,
                                  width: 0.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Icon(
                                        Icons.qr_code_rounded,
                                        color: widget.selectedIndex == 10
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .revoCardTextColor,
                                        size: 24.0,
                                      ),
                                    ),
                                    Text(
                                      'Vidéos',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'GeistSans',
                                            color: widget.selectedIndex == 10
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : FlutterFlowTheme.of(context)
                                                    .revoCardTextColor,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          onEnter: ((event) async {
                            safeSetState(
                                () => _model.mouseRegionHovered5 = true);
                          }),
                          onExit: ((event) async {
                            safeSetState(
                                () => _model.mouseRegionHovered5 = false);
                          }),
                        ),
                        MouseRegion(
                          opaque: false,
                          cursor: MouseCursor.defer ?? MouseCursor.defer,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(TriageWidget.routeName);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: () {
                                  if (widget.selectedIndex == 4) {
                                    return FlutterFlowTheme.of(context)
                                        .cogeusNavSelected;
                                  } else if (_model.mouseRegionHovered6) {
                                    return FlutterFlowTheme.of(context)
                                        .shadcnCardBorderGrey;
                                  } else {
                                    return FlutterFlowTheme.of(context)
                                        .primaryBackground;
                                  }
                                }(),
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: Colors.transparent,
                                  width: 0.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Icon(
                                        Icons.directions_outlined,
                                        color: widget.selectedIndex == 4
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .revoCardTextColor,
                                        size: 24.0,
                                      ),
                                    ),
                                    Text(
                                      'Tri',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'GeistSans',
                                            color: widget.selectedIndex == 4
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : FlutterFlowTheme.of(context)
                                                    .revoCardTextColor,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          onEnter: ((event) async {
                            safeSetState(
                                () => _model.mouseRegionHovered6 = true);
                          }),
                          onExit: ((event) async {
                            safeSetState(
                                () => _model.mouseRegionHovered6 = false);
                          }),
                        ),
                        MouseRegion(
                          opaque: false,
                          cursor: MouseCursor.defer ?? MouseCursor.defer,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(RetoursWidget.routeName);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: () {
                                  if (widget.selectedIndex == 2) {
                                    return FlutterFlowTheme.of(context)
                                        .cogeusNavSelected;
                                  } else if (_model.mouseRegionHovered7) {
                                    return FlutterFlowTheme.of(context)
                                        .shadcnCardBorderGrey;
                                  } else {
                                    return FlutterFlowTheme.of(context)
                                        .primaryBackground;
                                  }
                                }(),
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: Colors.transparent,
                                  width: 0.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Icon(
                                        Icons.checklist_rtl,
                                        color: widget.selectedIndex == 2
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .revoCardTextColor,
                                        size: 24.0,
                                      ),
                                    ),
                                    Text(
                                      'Sélection',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'GeistSans',
                                            color: widget.selectedIndex == 2
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : FlutterFlowTheme.of(context)
                                                    .revoCardTextColor,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          onEnter: ((event) async {
                            safeSetState(
                                () => _model.mouseRegionHovered7 = true);
                          }),
                          onExit: ((event) async {
                            safeSetState(
                                () => _model.mouseRegionHovered7 = false);
                          }),
                        ),
                      ]
                          .divide(SizedBox(height: 12.0))
                          .addToStart(SizedBox(height: 12.0))
                          .addToEnd(SizedBox(height: 16.0)),
                    ),
                  ),
                ),
                Builder(
                  builder: (context) => InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await showAlignedDialog(
                        context: context,
                        isGlobal: false,
                        avoidOverflow: true,
                        targetAnchor: AlignmentDirectional(0.0, 0.0)
                            .resolve(Directionality.of(context)),
                        followerAnchor: AlignmentDirectional(0.0, 0.0)
                            .resolve(Directionality.of(context)),
                        builder: (dialogContext) {
                          return Material(
                            color: Colors.transparent,
                            child: WebViewAware(
                              child: ChooseClientorNpWidget(),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 8.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 40.0,
                                  height: 40.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    'https://picsum.photos/seed/857/600',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    valueOrDefault<String>(
                                      FFAppState().activeBrand,
                                      'Mon compte',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'GeistSans',
                                          color: FlutterFlowTheme.of(context)
                                              .revoCardTextColor,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w300,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 16.0)),
                            ),
                          ]
                              .divide(SizedBox(height: 24.0))
                              .addToStart(SizedBox(height: 16.0))
                              .addToEnd(SizedBox(height: 18.0)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
