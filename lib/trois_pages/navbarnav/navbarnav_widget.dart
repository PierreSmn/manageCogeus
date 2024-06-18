import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'navbarnav_model.dart';
export 'navbarnav_model.dart';

class NavbarnavWidget extends StatefulWidget {
  const NavbarnavWidget({
    super.key,
    int? selectedIndex,
  }) : selectedIndex = selectedIndex ?? 1;

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

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240.0,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).revoBG,
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
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(24.0, 32.0, 0.0, 0.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 300.0,
                height: 90.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).revoWhite,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          'https://pifcxlqwffdrqcwggoqb.supabase.co/storage/v1/object/public/conversations/ffUploads/1714658498448000.png',
                          width: 130.0,
                          height: 100.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ].divide(const SizedBox(height: 24.0)),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).revoWhite,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MouseRegion(
                        opaque: false,
                        cursor: MouseCursor.defer ?? MouseCursor.defer,
                        onEnter: ((event) async {
                          setState(() => _model.mouseRegionHovered1 = true);
                        }),
                        onExit: ((event) async {
                          setState(() => _model.mouseRegionHovered1 = false);
                        }),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('home');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: widget.selectedIndex == 1
                                  ? FlutterFlowTheme.of(context)
                                      .cogeusNavSelected
                                  : FlutterFlowTheme.of(context).revoWhite,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: _model.mouseRegionHovered1
                                    ? FlutterFlowTheme.of(context)
                                        .cogeusHoverPurple
                                    : FlutterFlowTheme.of(context).revoWhite,
                                width: 2.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Icon(
                                      Icons.cottage_outlined,
                                      color: widget.selectedIndex == 1
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .revoCardTextColor,
                                      size: 24.0,
                                    ),
                                  ),
                                  Text(
                                    'Accueil',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          color: widget.selectedIndex == 1
                                              ? FlutterFlowTheme.of(context)
                                                  .primary
                                              : FlutterFlowTheme.of(context)
                                                  .revoCardTextColor,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]
                        .divide(const SizedBox(height: 12.0))
                        .addToStart(const SizedBox(height: 12.0))
                        .addToEnd(const SizedBox(height: 16.0)),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).revoWhite,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MouseRegion(
                        opaque: false,
                        cursor: MouseCursor.defer ?? MouseCursor.defer,
                        onEnter: ((event) async {
                          setState(() => _model.mouseRegionHovered2 = true);
                        }),
                        onExit: ((event) async {
                          setState(() => _model.mouseRegionHovered2 = false);
                        }),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('solution');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: widget.selectedIndex == 10
                                  ? FlutterFlowTheme.of(context)
                                      .cogeusNavSelected
                                  : FlutterFlowTheme.of(context).revoWhite,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: _model.mouseRegionHovered2
                                    ? FlutterFlowTheme.of(context)
                                        .cogeusHoverPurple
                                    : FlutterFlowTheme.of(context).revoWhite,
                                width: 2.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Icon(
                                      Icons.qr_code_rounded,
                                      color: widget.selectedIndex == 10
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .revoCardTextColor,
                                      size: 24.0,
                                    ),
                                  ),
                                  Text(
                                    'Ma solution',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          color: widget.selectedIndex == 10
                                              ? FlutterFlowTheme.of(context)
                                                  .primary
                                              : FlutterFlowTheme.of(context)
                                                  .revoCardTextColor,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      MouseRegion(
                        opaque: false,
                        cursor: MouseCursor.defer ?? MouseCursor.defer,
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
                            context.pushNamed('triage');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: widget.selectedIndex == 4
                                  ? FlutterFlowTheme.of(context)
                                      .cogeusNavSelected
                                  : FlutterFlowTheme.of(context).revoWhite,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: _model.mouseRegionHovered3
                                    ? FlutterFlowTheme.of(context)
                                        .cogeusHoverPurple
                                    : FlutterFlowTheme.of(context).revoWhite,
                                width: 2.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Icon(
                                      Icons.directions_outlined,
                                      color: widget.selectedIndex == 4
                                          ? FlutterFlowTheme.of(context).primary
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
                                          fontFamily: 'Manrope',
                                          color: widget.selectedIndex == 4
                                              ? FlutterFlowTheme.of(context)
                                                  .primary
                                              : FlutterFlowTheme.of(context)
                                                  .revoCardTextColor,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      MouseRegion(
                        opaque: false,
                        cursor: MouseCursor.defer ?? MouseCursor.defer,
                        onEnter: ((event) async {
                          setState(() => _model.mouseRegionHovered4 = true);
                        }),
                        onExit: ((event) async {
                          setState(() => _model.mouseRegionHovered4 = false);
                        }),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('retours');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: widget.selectedIndex == 2
                                  ? FlutterFlowTheme.of(context)
                                      .cogeusNavSelected
                                  : FlutterFlowTheme.of(context).revoWhite,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: _model.mouseRegionHovered4
                                    ? FlutterFlowTheme.of(context)
                                        .cogeusHoverPurple
                                    : FlutterFlowTheme.of(context).revoWhite,
                                width: 2.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Icon(
                                      Icons.checklist_rtl,
                                      color: widget.selectedIndex == 2
                                          ? FlutterFlowTheme.of(context).primary
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
                                          fontFamily: 'Manrope',
                                          color: widget.selectedIndex == 2
                                              ? FlutterFlowTheme.of(context)
                                                  .primary
                                              : FlutterFlowTheme.of(context)
                                                  .revoCardTextColor,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      MouseRegion(
                        opaque: false,
                        cursor: MouseCursor.defer ?? MouseCursor.defer,
                        onEnter: ((event) async {
                          setState(() => _model.mouseRegionHovered5 = true);
                        }),
                        onExit: ((event) async {
                          setState(() => _model.mouseRegionHovered5 = false);
                        }),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              'exports',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: const TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: widget.selectedIndex == 3
                                  ? FlutterFlowTheme.of(context)
                                      .cogeusNavSelected
                                  : FlutterFlowTheme.of(context).revoWhite,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: _model.mouseRegionHovered5
                                    ? FlutterFlowTheme.of(context)
                                        .cogeusHoverPurple
                                    : FlutterFlowTheme.of(context).revoWhite,
                                width: 2.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Icon(
                                      Icons.import_export_outlined,
                                      color: widget.selectedIndex == 3
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .revoCardTextColor,
                                      size: 24.0,
                                    ),
                                  ),
                                  Text(
                                    'Dossiers',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          color: widget.selectedIndex == 3
                                              ? FlutterFlowTheme.of(context)
                                                  .primary
                                              : FlutterFlowTheme.of(context)
                                                  .revoCardTextColor,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]
                        .divide(const SizedBox(height: 12.0))
                        .addToStart(const SizedBox(height: 12.0))
                        .addToEnd(const SizedBox(height: 16.0)),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).revoWhite,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MouseRegion(
                        opaque: false,
                        cursor: MouseCursor.defer ?? MouseCursor.defer,
                        onEnter: ((event) async {
                          setState(() => _model.mouseRegionHovered6 = true);
                        }),
                        onExit: ((event) async {
                          setState(() => _model.mouseRegionHovered6 = false);
                        }),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('hostLibrary');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: widget.selectedIndex == 5
                                  ? FlutterFlowTheme.of(context)
                                      .cogeusNavSelected
                                  : FlutterFlowTheme.of(context).revoWhite,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: _model.mouseRegionHovered6
                                    ? FlutterFlowTheme.of(context)
                                        .cogeusHoverPurple
                                    : FlutterFlowTheme.of(context).revoWhite,
                                width: 2.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Icon(
                                      Icons.filter,
                                      color: widget.selectedIndex == 5
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .revoCardTextColor,
                                      size: 24.0,
                                    ),
                                  ),
                                  Text(
                                    'Assets',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          color: widget.selectedIndex == 5
                                              ? FlutterFlowTheme.of(context)
                                                  .primary
                                              : FlutterFlowTheme.of(context)
                                                  .revoCardTextColor,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      MouseRegion(
                        opaque: false,
                        cursor: MouseCursor.defer ?? MouseCursor.defer,
                        onEnter: ((event) async {
                          setState(() => _model.mouseRegionHovered7 = true);
                        }),
                        onExit: ((event) async {
                          setState(() => _model.mouseRegionHovered7 = false);
                        }),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('widgetsEdit');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: widget.selectedIndex == 7
                                  ? FlutterFlowTheme.of(context)
                                      .cogeusNavSelected
                                  : FlutterFlowTheme.of(context).revoWhite,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: _model.mouseRegionHovered7
                                    ? FlutterFlowTheme.of(context)
                                        .cogeusHoverPurple
                                    : FlutterFlowTheme.of(context).revoWhite,
                                width: 2.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Icon(
                                      Icons.checklist_rtl_rounded,
                                      color: widget.selectedIndex == 7
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .revoCardTextColor,
                                      size: 24.0,
                                    ),
                                  ),
                                  Text(
                                    'Integrations',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          color: widget.selectedIndex == 7
                                              ? FlutterFlowTheme.of(context)
                                                  .primary
                                              : FlutterFlowTheme.of(context)
                                                  .revoCardTextColor,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      MouseRegion(
                        opaque: false,
                        cursor: MouseCursor.defer ?? MouseCursor.defer,
                        onEnter: ((event) async {
                          setState(() => _model.mouseRegionHovered8 = true);
                        }),
                        onExit: ((event) async {
                          setState(() => _model.mouseRegionHovered8 = false);
                        }),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('analytics');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: widget.selectedIndex == 6
                                  ? FlutterFlowTheme.of(context)
                                      .cogeusNavSelected
                                  : FlutterFlowTheme.of(context).revoWhite,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: _model.mouseRegionHovered8
                                    ? FlutterFlowTheme.of(context)
                                        .cogeusHoverPurple
                                    : FlutterFlowTheme.of(context).revoWhite,
                                width: 2.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Icon(
                                      Icons.analytics_outlined,
                                      color: widget.selectedIndex == 6
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .revoCardTextColor,
                                      size: 24.0,
                                    ),
                                  ),
                                  Text(
                                    'Analytics',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          color: widget.selectedIndex == 6
                                              ? FlutterFlowTheme.of(context)
                                                  .primary
                                              : FlutterFlowTheme.of(context)
                                                  .revoCardTextColor,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]
                        .divide(const SizedBox(height: 12.0))
                        .addToStart(const SizedBox(height: 12.0))
                        .addToEnd(const SizedBox(height: 16.0)),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).revoWhite,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 8.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('infos');
                            },
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                'https://picsum.photos/seed/857/600',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Mon compte',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Manrope',
                                    color: FlutterFlowTheme.of(context)
                                        .revoCardTextColor,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                            ),
                          ),
                        ].divide(const SizedBox(width: 16.0)),
                      ),
                    ]
                        .divide(const SizedBox(height: 24.0))
                        .addToStart(const SizedBox(height: 16.0))
                        .addToEnd(const SizedBox(height: 18.0)),
                  ),
                ),
              ),
            ].divide(const SizedBox(height: 16.0)),
          ),
        ),
      ),
    );
  }
}
