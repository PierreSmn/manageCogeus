import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:expandable/expandable.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'accordion_model.dart';
export 'accordion_model.dart';

class AccordionWidget extends StatefulWidget {
  const AccordionWidget({
    super.key,
    required this.header,
    required this.content,
  });

  final String? header;
  final String? content;

  @override
  State<AccordionWidget> createState() => _AccordionWidgetState();
}

class _AccordionWidgetState extends State<AccordionWidget> {
  late AccordionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AccordionModel());

    _model.expandableExpandableController =
        ExpandableController(initialExpanded: false);
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
      width: double.infinity,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: double.infinity,
            color: FlutterFlowTheme.of(context).background,
            child: ExpandableNotifier(
              controller: _model.expandableExpandableController,
              child: ExpandablePanel(
                header: MouseRegion(
                  opaque: true,
                  cursor: MouseCursor.defer ?? MouseCursor.defer,
                  child: Container(
                    height: 56.0,
                    decoration: BoxDecoration(),
                    child: Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget!.header,
                          'Accordion Item Header',
                        ),
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Geist',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ),
                  onEnter: ((event) async {
                    safeSetState(() => _model.mouseRegionHovered = true);
                  }),
                  onExit: ((event) async {
                    safeSetState(() => _model.mouseRegionHovered = false);
                  }),
                ),
                collapsed: Container(),
                expanded: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget!.content,
                          'Accordion Item Content',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Geist',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ],
                ),
                theme: ExpandableThemeData(
                  tapHeaderToExpand: true,
                  tapBodyToExpand: false,
                  tapBodyToCollapse: false,
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  hasIcon: true,
                  expandIcon: Icons.keyboard_arrow_down_rounded,
                  collapseIcon: Icons.keyboard_arrow_up_rounded,
                  iconSize: 24.0,
                  iconColor: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
            ),
          ),
          Divider(
            height: 1.0,
            thickness: 1.0,
            color: FlutterFlowTheme.of(context).border,
          ),
        ],
      ),
    );
  }
}
