import '/backend/supabase/supabase.dart';
import '/components/creation_choice_widget.dart';
import '/components/edit_integration_widget.dart';
import '/components/edit_story_widget.dart';
import '/components/export_code_widget.dart';
import '/components/export_story_code_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/navbarnav/navbarnav_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'widgets_model.dart';
export 'widgets_model.dart';

class WidgetsWidget extends StatefulWidget {
  const WidgetsWidget({super.key});

  @override
  State<WidgetsWidget> createState() => _WidgetsWidgetState();
}

class _WidgetsWidgetState extends State<WidgetsWidget> {
  late WidgetsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WidgetsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.listSelect = null;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'widgets',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FutureBuilder<List<HostedSubsRow>>(
                    future: HostedSubsTable().queryRows(
                      queryFn: (q) => q.eq(
                        'brand_name',
                        FFAppState().activeBrand,
                      ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: SpinKitRing(
                              color: FlutterFlowTheme.of(context).primary,
                              size: 50,
                            ),
                          ),
                        );
                      }
                      List<HostedSubsRow> containerHostedSubsRowList =
                          snapshot.data!;

                      return Container(
                        height: MediaQuery.sizeOf(context).height * 1,
                        decoration: const BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            wrapWithModel(
                              model: _model.navbarnavModel,
                              updateCallback: () => safeSetState(() {}),
                              child: const NavbarnavWidget(
                                selectedIndex: 7,
                              ),
                            ),
                            Expanded(
                              child: FutureBuilder<List<IntegrationsRow>>(
                                future: IntegrationsTable().queryRows(
                                  queryFn: (q) => q
                                      .eq(
                                        'ownerBrand',
                                        FFAppState().activeBrand,
                                      )
                                      .order('id'),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: SpinKitRing(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 50,
                                        ),
                                      ),
                                    );
                                  }
                                  List<IntegrationsRow>
                                      containerIntegrationsRowList =
                                      snapshot.data!;

                                  return Container(
                                    height:
                                        MediaQuery.sizeOf(context).height * 1,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).revoBG,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0, 32, 0, 20),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Flexible(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(50, 0,
                                                                  50, 40),
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.9,
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              child:
                                                                  SingleChildScrollView(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Container(
                                                                      width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .revoWhite,
                                                                        borderRadius:
                                                                            BorderRadius.circular(16),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            16,
                                                                            28,
                                                                            16,
                                                                            16),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Text(
                                                                                  'Widgets de ',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Manrope',
                                                                                        color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                        fontSize: 40,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  FFAppState().activeBrand,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Manrope',
                                                                                        color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                        fontSize: 40,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            MouseRegion(
                                                                              opaque: false,
                                                                              cursor: MouseCursor.defer ?? MouseCursor.defer,
                                                                              onEnter: ((event) async {
                                                                                safeSetState(() => _model.mouseRegionHovered = true);
                                                                              }),
                                                                              onExit: ((event) async {
                                                                                safeSetState(() => _model.mouseRegionHovered = false);
                                                                              }),
                                                                              child: Builder(
                                                                                builder: (context) => FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    if (containerHostedSubsRowList.length < 3) {
                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                        SnackBar(
                                                                                          content: Text(
                                                                                            'Vous devez au moins avoir 3 vidéo pour créer une intégration. ',
                                                                                            style: TextStyle(
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                            ),
                                                                                          ),
                                                                                          duration: const Duration(milliseconds: 4000),
                                                                                          backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                        ),
                                                                                      );
                                                                                      return;
                                                                                    }
                                                                                    FFAppState().integrationEdited = 0;
                                                                                    FFAppState().integrationCreated = false;
                                                                                    safeSetState(() {});
                                                                                    await showDialog(
                                                                                      context: context,
                                                                                      builder: (dialogContext) {
                                                                                        return Dialog(
                                                                                          elevation: 0,
                                                                                          insetPadding: EdgeInsets.zero,
                                                                                          backgroundColor: Colors.transparent,
                                                                                          alignment: const AlignmentDirectional(0, 0).resolve(Directionality.of(context)),
                                                                                          child: GestureDetector(
                                                                                            onTap: () => FocusScope.of(dialogContext).unfocus(),
                                                                                            child: SizedBox(
                                                                                              height: 330,
                                                                                              width: 550,
                                                                                              child: CreationChoiceWidget(
                                                                                                assets: containerHostedSubsRowList.length,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                  text: 'Ajouter une intégration',
                                                                                  icon: const Icon(
                                                                                    Icons.add,
                                                                                    size: 15,
                                                                                  ),
                                                                                  options: FFButtonOptions(
                                                                                    height: 40,
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                                                                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                                    color: _model.mouseRegionHovered ? const Color(0xFFECE2F5) : const Color(0xFFEDE8FC),
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          fontFamily: 'Manrope',
                                                                                          color: const Color(0xFF822CE3),
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
                                                                              ),
                                                                            ),
                                                                          ].divide(const SizedBox(height: 12)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ].divide(const SizedBox(
                                                                      height:
                                                                          24)),
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
                                            Builder(
                                              builder: (context) {
                                                final usersIntegrations =
                                                    containerIntegrationsRowList
                                                        .toList();

                                                return Wrap(
                                                  spacing: 0,
                                                  runSpacing: 0,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.start,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: List.generate(
                                                      usersIntegrations.length,
                                                      (usersIntegrationsIndex) {
                                                    final usersIntegrationsItem =
                                                        usersIntegrations[
                                                            usersIntegrationsIndex];
                                                    return Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        50,
                                                                        0,
                                                                        50,
                                                                        40),
                                                            child:
                                                                SingleChildScrollView(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.9,
                                                                    decoration:
                                                                        const BoxDecoration(),
                                                                    child:
                                                                        SingleChildScrollView(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children:
                                                                            [
                                                                          Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).revoWhite,
                                                                              borderRadius: BorderRadius.circular(16),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 180,
                                                                                        decoration: const BoxDecoration(),
                                                                                        child: Text(
                                                                                          valueOrDefault<String>(
                                                                                            usersIntegrationsItem.name,
                                                                                            'name',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Manrope',
                                                                                                color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                                fontSize: 28,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w600,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      if (usersIntegrationsItem.isStory ?? true)
                                                                                        Container(
                                                                                          width: 450,
                                                                                          decoration: const BoxDecoration(),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                            children: [
                                                                                              FutureBuilder<List<HostedSubsRow>>(
                                                                                                future: HostedSubsTable().querySingleRow(
                                                                                                  queryFn: (q) => q.eq(
                                                                                                    'id',
                                                                                                    usersIntegrationsItem.vid1,
                                                                                                  ),
                                                                                                ),
                                                                                                builder: (context, snapshot) {
                                                                                                  // Customize what your widget looks like when it's loading.
                                                                                                  if (!snapshot.hasData) {
                                                                                                    return Center(
                                                                                                      child: SizedBox(
                                                                                                        width: 50,
                                                                                                        height: 50,
                                                                                                        child: SpinKitRing(
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          size: 50,
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  }
                                                                                                  List<HostedSubsRow> columnHostedSubsRowList = snapshot.data!;

                                                                                                  final columnHostedSubsRow = columnHostedSubsRowList.isNotEmpty ? columnHostedSubsRowList.first : null;

                                                                                                  return Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      if (usersIntegrationsItem.vid1 != null)
                                                                                                        ClipRRect(
                                                                                                          borderRadius: BorderRadius.circular(100),
                                                                                                          child: Image.network(
                                                                                                            columnHostedSubsRow!.thumbnail!,
                                                                                                            width: 140,
                                                                                                            height: 140,
                                                                                                            fit: BoxFit.cover,
                                                                                                          ),
                                                                                                        ),
                                                                                                      Container(
                                                                                                        width: 120,
                                                                                                        decoration: const BoxDecoration(),
                                                                                                        child: Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            usersIntegrationsItem.title1,
                                                                                                            'noTitle',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Manrope',
                                                                                                                fontSize: 16,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ].divide(const SizedBox(height: 6)),
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                              FutureBuilder<List<HostedSubsRow>>(
                                                                                                future: HostedSubsTable().querySingleRow(
                                                                                                  queryFn: (q) => q.eq(
                                                                                                    'id',
                                                                                                    usersIntegrationsItem.vid2,
                                                                                                  ),
                                                                                                ),
                                                                                                builder: (context, snapshot) {
                                                                                                  // Customize what your widget looks like when it's loading.
                                                                                                  if (!snapshot.hasData) {
                                                                                                    return Center(
                                                                                                      child: SizedBox(
                                                                                                        width: 50,
                                                                                                        height: 50,
                                                                                                        child: SpinKitRing(
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          size: 50,
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  }
                                                                                                  List<HostedSubsRow> columnHostedSubsRowList = snapshot.data!;

                                                                                                  final columnHostedSubsRow = columnHostedSubsRowList.isNotEmpty ? columnHostedSubsRowList.first : null;

                                                                                                  return Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      if (usersIntegrationsItem.vid2 != null)
                                                                                                        ClipRRect(
                                                                                                          borderRadius: BorderRadius.circular(100),
                                                                                                          child: Image.network(
                                                                                                            columnHostedSubsRow!.thumbnail!,
                                                                                                            width: 140,
                                                                                                            height: 140,
                                                                                                            fit: BoxFit.cover,
                                                                                                          ),
                                                                                                        ),
                                                                                                      Container(
                                                                                                        width: 120,
                                                                                                        decoration: const BoxDecoration(),
                                                                                                        child: Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            usersIntegrationsItem.title2,
                                                                                                            'noTitle',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Manrope',
                                                                                                                fontSize: 16,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ].divide(const SizedBox(height: 6)),
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                              FutureBuilder<List<HostedSubsRow>>(
                                                                                                future: HostedSubsTable().querySingleRow(
                                                                                                  queryFn: (q) => q.eq(
                                                                                                    'id',
                                                                                                    usersIntegrationsItem.vid3,
                                                                                                  ),
                                                                                                ),
                                                                                                builder: (context, snapshot) {
                                                                                                  // Customize what your widget looks like when it's loading.
                                                                                                  if (!snapshot.hasData) {
                                                                                                    return Center(
                                                                                                      child: SizedBox(
                                                                                                        width: 50,
                                                                                                        height: 50,
                                                                                                        child: SpinKitRing(
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          size: 50,
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  }
                                                                                                  List<HostedSubsRow> columnHostedSubsRowList = snapshot.data!;

                                                                                                  final columnHostedSubsRow = columnHostedSubsRowList.isNotEmpty ? columnHostedSubsRowList.first : null;

                                                                                                  return Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      if (usersIntegrationsItem.vid3 != null)
                                                                                                        ClipRRect(
                                                                                                          borderRadius: BorderRadius.circular(100),
                                                                                                          child: Image.network(
                                                                                                            columnHostedSubsRow!.thumbnail!,
                                                                                                            width: 140,
                                                                                                            height: 140,
                                                                                                            fit: BoxFit.cover,
                                                                                                          ),
                                                                                                        ),
                                                                                                      Container(
                                                                                                        width: 120,
                                                                                                        decoration: const BoxDecoration(),
                                                                                                        child: Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            usersIntegrationsItem.title3,
                                                                                                            'noTitle',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Manrope',
                                                                                                                fontSize: 16,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ].divide(const SizedBox(height: 6)),
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            ].divide(const SizedBox(width: 12)),
                                                                                          ),
                                                                                        ),
                                                                                      if (!usersIntegrationsItem.isStory!)
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            if (usersIntegrationsItem.vid1 != null)
                                                                                              FutureBuilder<List<HostedSubsRow>>(
                                                                                                future: HostedSubsTable().querySingleRow(
                                                                                                  queryFn: (q) => q.eq(
                                                                                                    'id',
                                                                                                    usersIntegrationsItem.vid1,
                                                                                                  ),
                                                                                                ),
                                                                                                builder: (context, snapshot) {
                                                                                                  // Customize what your widget looks like when it's loading.
                                                                                                  if (!snapshot.hasData) {
                                                                                                    return Center(
                                                                                                      child: SizedBox(
                                                                                                        width: 50,
                                                                                                        height: 50,
                                                                                                        child: SpinKitRing(
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          size: 50,
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  }
                                                                                                  List<HostedSubsRow> imageHostedSubsRowList = snapshot.data!;

                                                                                                  final imageHostedSubsRow = imageHostedSubsRowList.isNotEmpty ? imageHostedSubsRowList.first : null;

                                                                                                  return ClipRRect(
                                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                                    child: Image.network(
                                                                                                      imageHostedSubsRow!.thumbnail!,
                                                                                                      width: 100,
                                                                                                      height: 200,
                                                                                                      fit: BoxFit.cover,
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            if (usersIntegrationsItem.vid2 != null)
                                                                                              FutureBuilder<List<HostedSubsRow>>(
                                                                                                future: HostedSubsTable().querySingleRow(
                                                                                                  queryFn: (q) => q.eq(
                                                                                                    'id',
                                                                                                    usersIntegrationsItem.vid2,
                                                                                                  ),
                                                                                                ),
                                                                                                builder: (context, snapshot) {
                                                                                                  // Customize what your widget looks like when it's loading.
                                                                                                  if (!snapshot.hasData) {
                                                                                                    return Center(
                                                                                                      child: SizedBox(
                                                                                                        width: 50,
                                                                                                        height: 50,
                                                                                                        child: SpinKitRing(
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          size: 50,
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  }
                                                                                                  List<HostedSubsRow> imageHostedSubsRowList = snapshot.data!;

                                                                                                  final imageHostedSubsRow = imageHostedSubsRowList.isNotEmpty ? imageHostedSubsRowList.first : null;

                                                                                                  return ClipRRect(
                                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                                    child: Image.network(
                                                                                                      imageHostedSubsRow!.thumbnail!,
                                                                                                      width: 100,
                                                                                                      height: 200,
                                                                                                      fit: BoxFit.cover,
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            if (usersIntegrationsItem.vid3 != null)
                                                                                              FutureBuilder<List<HostedSubsRow>>(
                                                                                                future: HostedSubsTable().querySingleRow(
                                                                                                  queryFn: (q) => q.eq(
                                                                                                    'id',
                                                                                                    usersIntegrationsItem.vid3,
                                                                                                  ),
                                                                                                ),
                                                                                                builder: (context, snapshot) {
                                                                                                  // Customize what your widget looks like when it's loading.
                                                                                                  if (!snapshot.hasData) {
                                                                                                    return Center(
                                                                                                      child: SizedBox(
                                                                                                        width: 50,
                                                                                                        height: 50,
                                                                                                        child: SpinKitRing(
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          size: 50,
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  }
                                                                                                  List<HostedSubsRow> imageHostedSubsRowList = snapshot.data!;

                                                                                                  final imageHostedSubsRow = imageHostedSubsRowList.isNotEmpty ? imageHostedSubsRowList.first : null;

                                                                                                  return ClipRRect(
                                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                                    child: Image.network(
                                                                                                      imageHostedSubsRow!.thumbnail!,
                                                                                                      width: 100,
                                                                                                      height: 200,
                                                                                                      fit: BoxFit.cover,
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            if (usersIntegrationsItem.vid4 != null)
                                                                                              FutureBuilder<List<HostedSubsRow>>(
                                                                                                future: HostedSubsTable().querySingleRow(
                                                                                                  queryFn: (q) => q.eq(
                                                                                                    'id',
                                                                                                    usersIntegrationsItem.vid4,
                                                                                                  ),
                                                                                                ),
                                                                                                builder: (context, snapshot) {
                                                                                                  // Customize what your widget looks like when it's loading.
                                                                                                  if (!snapshot.hasData) {
                                                                                                    return Center(
                                                                                                      child: SizedBox(
                                                                                                        width: 50,
                                                                                                        height: 50,
                                                                                                        child: SpinKitRing(
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          size: 50,
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  }
                                                                                                  List<HostedSubsRow> imageHostedSubsRowList = snapshot.data!;

                                                                                                  final imageHostedSubsRow = imageHostedSubsRowList.isNotEmpty ? imageHostedSubsRowList.first : null;

                                                                                                  return ClipRRect(
                                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                                    child: Image.network(
                                                                                                      imageHostedSubsRow!.thumbnail!,
                                                                                                      width: 100,
                                                                                                      height: 200,
                                                                                                      fit: BoxFit.cover,
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            if (usersIntegrationsItem.vid5 != null)
                                                                                              FutureBuilder<List<HostedSubsRow>>(
                                                                                                future: HostedSubsTable().querySingleRow(
                                                                                                  queryFn: (q) => q.eq(
                                                                                                    'id',
                                                                                                    usersIntegrationsItem.vid5,
                                                                                                  ),
                                                                                                ),
                                                                                                builder: (context, snapshot) {
                                                                                                  // Customize what your widget looks like when it's loading.
                                                                                                  if (!snapshot.hasData) {
                                                                                                    return Center(
                                                                                                      child: SizedBox(
                                                                                                        width: 50,
                                                                                                        height: 50,
                                                                                                        child: SpinKitRing(
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          size: 50,
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  }
                                                                                                  List<HostedSubsRow> imageHostedSubsRowList = snapshot.data!;

                                                                                                  final imageHostedSubsRow = imageHostedSubsRowList.isNotEmpty ? imageHostedSubsRowList.first : null;

                                                                                                  return ClipRRect(
                                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                                    child: Image.network(
                                                                                                      imageHostedSubsRow!.thumbnail!,
                                                                                                      width: 100,
                                                                                                      height: 200,
                                                                                                      fit: BoxFit.cover,
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                          ].divide(const SizedBox(width: 6)),
                                                                                        ),
                                                                                      Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Builder(
                                                                                            builder: (context) => FFButtonWidget(
                                                                                              onPressed: () async {
                                                                                                if (usersIntegrationsItem.isStory!) {
                                                                                                  await showDialog(
                                                                                                    context: context,
                                                                                                    builder: (dialogContext) {
                                                                                                      return Dialog(
                                                                                                        elevation: 0,
                                                                                                        insetPadding: EdgeInsets.zero,
                                                                                                        backgroundColor: Colors.transparent,
                                                                                                        alignment: const AlignmentDirectional(0, 0).resolve(Directionality.of(context)),
                                                                                                        child: GestureDetector(
                                                                                                          onTap: () => FocusScope.of(dialogContext).unfocus(),
                                                                                                          child: SizedBox(
                                                                                                            height: 330,
                                                                                                            width: 550,
                                                                                                            child: ExportStoryCodeWidget(
                                                                                                              integrationEditing: usersIntegrationsItem.id,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  );
                                                                                                } else {
                                                                                                  await showDialog(
                                                                                                    context: context,
                                                                                                    builder: (dialogContext) {
                                                                                                      return Dialog(
                                                                                                        elevation: 0,
                                                                                                        insetPadding: EdgeInsets.zero,
                                                                                                        backgroundColor: Colors.transparent,
                                                                                                        alignment: const AlignmentDirectional(0, 0).resolve(Directionality.of(context)),
                                                                                                        child: GestureDetector(
                                                                                                          onTap: () => FocusScope.of(dialogContext).unfocus(),
                                                                                                          child: SizedBox(
                                                                                                            height: 330,
                                                                                                            width: 550,
                                                                                                            child: ExportCodeWidget(
                                                                                                              integrationEditing: usersIntegrationsItem.id,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  );
                                                                                                }
                                                                                              },
                                                                                              text: 'Exporter le code',
                                                                                              icon: const Icon(
                                                                                                Icons.content_copy_outlined,
                                                                                                size: 15,
                                                                                              ),
                                                                                              options: FFButtonOptions(
                                                                                                width: 170,
                                                                                                height: 40,
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                                                                                                iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                                                color: const Color(0xFFEEE8FC),
                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      fontFamily: 'Manrope',
                                                                                                      color: const Color(0xFF822CE3),
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
                                                                                          ),
                                                                                          Builder(
                                                                                            builder: (context) => FFButtonWidget(
                                                                                              onPressed: () async {
                                                                                                if (usersIntegrationsItem.isStory!) {
                                                                                                  FFAppState().vid1 = usersIntegrationsItem.vid1!;
                                                                                                  FFAppState().vid2 = usersIntegrationsItem.vid2!;
                                                                                                  FFAppState().vid3 = usersIntegrationsItem.vid3!;
                                                                                                  safeSetState(() {});
                                                                                                  await showDialog(
                                                                                                    context: context,
                                                                                                    builder: (dialogContext) {
                                                                                                      return Dialog(
                                                                                                        elevation: 0,
                                                                                                        insetPadding: EdgeInsets.zero,
                                                                                                        backgroundColor: Colors.transparent,
                                                                                                        alignment: const AlignmentDirectional(0, 0).resolve(Directionality.of(context)),
                                                                                                        child: GestureDetector(
                                                                                                          onTap: () => FocusScope.of(dialogContext).unfocus(),
                                                                                                          child: SizedBox(
                                                                                                            height: 800,
                                                                                                            width: 800,
                                                                                                            child: EditStoryWidget(
                                                                                                              integrationEditing: usersIntegrationsItem.id,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  );
                                                                                                } else {
                                                                                                  FFAppState().vid1 = usersIntegrationsItem.vid1!;
                                                                                                  FFAppState().vid2 = usersIntegrationsItem.vid2!;
                                                                                                  FFAppState().vid3 = usersIntegrationsItem.vid3!;
                                                                                                  FFAppState().vid4 = usersIntegrationsItem.vid4!;
                                                                                                  FFAppState().vid5 = usersIntegrationsItem.vid5!;
                                                                                                  safeSetState(() {});
                                                                                                  await showDialog(
                                                                                                    context: context,
                                                                                                    builder: (dialogContext) {
                                                                                                      return Dialog(
                                                                                                        elevation: 0,
                                                                                                        insetPadding: EdgeInsets.zero,
                                                                                                        backgroundColor: Colors.transparent,
                                                                                                        alignment: const AlignmentDirectional(0, 0).resolve(Directionality.of(context)),
                                                                                                        child: GestureDetector(
                                                                                                          onTap: () => FocusScope.of(dialogContext).unfocus(),
                                                                                                          child: SizedBox(
                                                                                                            height: 800,
                                                                                                            width: 1280,
                                                                                                            child: EditIntegrationWidget(
                                                                                                              integrationEditing: usersIntegrationsItem.id,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  );
                                                                                                }
                                                                                              },
                                                                                              text: 'Modifier ',
                                                                                              icon: const Icon(
                                                                                                Icons.edit_rounded,
                                                                                                size: 15,
                                                                                              ),
                                                                                              options: FFButtonOptions(
                                                                                                width: 170,
                                                                                                height: 40,
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                                                                                                iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                                                color: const Color(0xFFEEE8FC),
                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      fontFamily: 'Manrope',
                                                                                                      color: const Color(0xFF822CE3),
                                                                                                      fontSize: 14,
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
                                                                                          ),
                                                                                        ].divide(const SizedBox(height: 12)),
                                                                                      ),
                                                                                    ].divide(const SizedBox(width: 11)),
                                                                                  ),
                                                                                ].divide(const SizedBox(height: 12)),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ].divide(const SizedBox(height: 24)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  }),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
