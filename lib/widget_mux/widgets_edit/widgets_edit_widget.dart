import '/backend/supabase/supabase.dart';
import '/components/add_integration_widget.dart';
import '/components/edit_integration_widget.dart';
import '/components/export_code_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/trois_pages/navbarnav/navbarnav_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'widgets_edit_model.dart';
export 'widgets_edit_model.dart';

class WidgetsEditWidget extends StatefulWidget {
  const WidgetsEditWidget({super.key});

  @override
  State<WidgetsEditWidget> createState() => _WidgetsEditWidgetState();
}

class _WidgetsEditWidgetState extends State<WidgetsEditWidget> {
  late WidgetsEditModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WidgetsEditModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.listSelect = null;
      setState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
        title: 'widgetsEdit',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
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
                            width: 50.0,
                            height: 50.0,
                            child: SpinKitRing(
                              color: FlutterFlowTheme.of(context).primary,
                              size: 50.0,
                            ),
                          ),
                        );
                      }
                      List<HostedSubsRow> containerHostedSubsRowList =
                          snapshot.data!;
                      return Container(
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        decoration: const BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            wrapWithModel(
                              model: _model.navbarnavModel,
                              updateCallback: () => setState(() {}),
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
                                        width: 50.0,
                                        height: 50.0,
                                        child: SpinKitRing(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 50.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<IntegrationsRow>
                                      containerIntegrationsRowList =
                                      snapshot.data!;
                                  return Container(
                                    height:
                                        MediaQuery.sizeOf(context).height * 1.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).revoBG,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 32.0, 0.0, 20.0),
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
                                                              .fromSTEB(
                                                                  50.0,
                                                                  0.0,
                                                                  50.0,
                                                                  40.0),
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
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          1.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .revoWhite,
                                                                        borderRadius:
                                                                            BorderRadius.circular(16.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            28.0,
                                                                            16.0,
                                                                            16.0),
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
                                                                                  'Intégrations de ',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Manrope',
                                                                                        color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                        fontSize: 40.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  FFAppState().activeBrand,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Manrope',
                                                                                        color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                        fontSize: 40.0,
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
                                                                                setState(() => _model.mouseRegionHovered = true);
                                                                              }),
                                                                              onExit: ((event) async {
                                                                                setState(() => _model.mouseRegionHovered = false);
                                                                              }),
                                                                              child: Builder(
                                                                                builder: (context) => FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    if (containerHostedSubsRowList.length < 5) {
                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                        SnackBar(
                                                                                          content: Text(
                                                                                            'Vous devez au moins avoir 5 vidéo pour créer une intégration. ',
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
                                                                                    setState(() {});
                                                                                    await showDialog(
                                                                                      barrierDismissible: false,
                                                                                      context: context,
                                                                                      builder: (dialogContext) {
                                                                                        return Dialog(
                                                                                          elevation: 0,
                                                                                          insetPadding: EdgeInsets.zero,
                                                                                          backgroundColor: Colors.transparent,
                                                                                          alignment: const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                          child: WebViewAware(
                                                                                            child: GestureDetector(
                                                                                              onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                              child: const SizedBox(
                                                                                                height: 700.0,
                                                                                                width: 980.0,
                                                                                                child: AddIntegrationWidget(),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ).then((value) => setState(() {}));
                                                                                  },
                                                                                  text: 'Ajouter une intégration',
                                                                                  icon: const Icon(
                                                                                    Icons.add,
                                                                                    size: 15.0,
                                                                                  ),
                                                                                  options: FFButtonOptions(
                                                                                    height: 40.0,
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: _model.mouseRegionHovered ? const Color(0xFFECE2F5) : const Color(0xFFEDE8FC),
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          fontFamily: 'Manrope',
                                                                                          color: const Color(0xFF822CE3),
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
                                                                              ),
                                                                            ),
                                                                          ].divide(const SizedBox(height: 12.0)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ].divide(const SizedBox(
                                                                      height:
                                                                          24.0)),
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
                                                  spacing: 0.0,
                                                  runSpacing: 0.0,
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
                                                                        50.0,
                                                                        0.0,
                                                                        50.0,
                                                                        40.0),
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
                                                                                MediaQuery.sizeOf(context).width * 1.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).revoWhite,
                                                                              borderRadius: BorderRadius.circular(16.0),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Text(
                                                                                        valueOrDefault<String>(
                                                                                          usersIntegrationsItem.name,
                                                                                          'name',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Manrope',
                                                                                              color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                              fontSize: 40.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Builder(
                                                                                            builder: (context) => FFButtonWidget(
                                                                                              onPressed: () async {
                                                                                                await showDialog(
                                                                                                  context: context,
                                                                                                  builder: (dialogContext) {
                                                                                                    return Dialog(
                                                                                                      elevation: 0,
                                                                                                      insetPadding: EdgeInsets.zero,
                                                                                                      backgroundColor: Colors.transparent,
                                                                                                      alignment: const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                      child: WebViewAware(
                                                                                                        child: GestureDetector(
                                                                                                          onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                          child: SizedBox(
                                                                                                            height: 330.0,
                                                                                                            width: 550.0,
                                                                                                            child: ExportCodeWidget(
                                                                                                              integrationEditing: usersIntegrationsItem.id,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                ).then((value) => setState(() {}));
                                                                                              },
                                                                                              text: 'Exporter le code',
                                                                                              icon: const Icon(
                                                                                                Icons.content_copy_outlined,
                                                                                                size: 15.0,
                                                                                              ),
                                                                                              options: FFButtonOptions(
                                                                                                height: 40.0,
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                color: const Color(0xFFEEE8FC),
                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      fontFamily: 'Manrope',
                                                                                                      color: const Color(0xFF822CE3),
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
                                                                                          ),
                                                                                          Builder(
                                                                                            builder: (context) => FFButtonWidget(
                                                                                              onPressed: () async {
                                                                                                FFAppState().vid1 = usersIntegrationsItem.vid1!;
                                                                                                FFAppState().vid2 = usersIntegrationsItem.vid2!;
                                                                                                FFAppState().vid3 = usersIntegrationsItem.vid3!;
                                                                                                FFAppState().vid4 = usersIntegrationsItem.vid4!;
                                                                                                FFAppState().vid5 = usersIntegrationsItem.vid5!;
                                                                                                setState(() {});
                                                                                                await showDialog(
                                                                                                  context: context,
                                                                                                  builder: (dialogContext) {
                                                                                                    return Dialog(
                                                                                                      elevation: 0,
                                                                                                      insetPadding: EdgeInsets.zero,
                                                                                                      backgroundColor: Colors.transparent,
                                                                                                      alignment: const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                      child: WebViewAware(
                                                                                                        child: GestureDetector(
                                                                                                          onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                          child: SizedBox(
                                                                                                            height: 580.0,
                                                                                                            width: 1080.0,
                                                                                                            child: EditIntegrationWidget(
                                                                                                              integrationEditing: usersIntegrationsItem.id,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                ).then((value) => setState(() {}));
                                                                                              },
                                                                                              text: 'Modifier integration',
                                                                                              icon: const Icon(
                                                                                                Icons.edit_rounded,
                                                                                                size: 15.0,
                                                                                              ),
                                                                                              options: FFButtonOptions(
                                                                                                height: 40.0,
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                color: const Color(0xFFEEE8FC),
                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      fontFamily: 'Manrope',
                                                                                                      color: const Color(0xFF822CE3),
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
                                                                                          ),
                                                                                        ].divide(const SizedBox(width: 16.0)),
                                                                                      ),
                                                                                    ],
                                                                                  ),
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
                                                                                                  width: 50.0,
                                                                                                  height: 50.0,
                                                                                                  child: SpinKitRing(
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    size: 50.0,
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            }
                                                                                            List<HostedSubsRow> imageHostedSubsRowList = snapshot.data!;
                                                                                            final imageHostedSubsRow = imageHostedSubsRowList.isNotEmpty ? imageHostedSubsRowList.first : null;
                                                                                            return ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                              child: Image.network(
                                                                                                imageHostedSubsRow!.thumbnail!,
                                                                                                width: 140.0,
                                                                                                height: 240.0,
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
                                                                                                  width: 50.0,
                                                                                                  height: 50.0,
                                                                                                  child: SpinKitRing(
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    size: 50.0,
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            }
                                                                                            List<HostedSubsRow> imageHostedSubsRowList = snapshot.data!;
                                                                                            final imageHostedSubsRow = imageHostedSubsRowList.isNotEmpty ? imageHostedSubsRowList.first : null;
                                                                                            return ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                              child: Image.network(
                                                                                                imageHostedSubsRow!.thumbnail!,
                                                                                                width: 140.0,
                                                                                                height: 240.0,
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
                                                                                                  width: 50.0,
                                                                                                  height: 50.0,
                                                                                                  child: SpinKitRing(
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    size: 50.0,
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            }
                                                                                            List<HostedSubsRow> imageHostedSubsRowList = snapshot.data!;
                                                                                            final imageHostedSubsRow = imageHostedSubsRowList.isNotEmpty ? imageHostedSubsRowList.first : null;
                                                                                            return ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                              child: Image.network(
                                                                                                imageHostedSubsRow!.thumbnail!,
                                                                                                width: 140.0,
                                                                                                height: 240.0,
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
                                                                                                  width: 50.0,
                                                                                                  height: 50.0,
                                                                                                  child: SpinKitRing(
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    size: 50.0,
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            }
                                                                                            List<HostedSubsRow> imageHostedSubsRowList = snapshot.data!;
                                                                                            final imageHostedSubsRow = imageHostedSubsRowList.isNotEmpty ? imageHostedSubsRowList.first : null;
                                                                                            return ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                              child: Image.network(
                                                                                                imageHostedSubsRow!.thumbnail!,
                                                                                                width: 140.0,
                                                                                                height: 240.0,
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
                                                                                                  width: 50.0,
                                                                                                  height: 50.0,
                                                                                                  child: SpinKitRing(
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    size: 50.0,
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            }
                                                                                            List<HostedSubsRow> imageHostedSubsRowList = snapshot.data!;
                                                                                            final imageHostedSubsRow = imageHostedSubsRowList.isNotEmpty ? imageHostedSubsRowList.first : null;
                                                                                            return ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                              child: Image.network(
                                                                                                imageHostedSubsRow!.thumbnail!,
                                                                                                width: 140.0,
                                                                                                height: 240.0,
                                                                                                fit: BoxFit.cover,
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                    ].divide(const SizedBox(width: 12.0)),
                                                                                  ),
                                                                                ].divide(const SizedBox(height: 12.0)),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ].divide(const SizedBox(height: 24.0)),
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
