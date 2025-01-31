import '/backend/supabase/supabase.dart';
import '/components/add_founder_widget.dart';
import '/components/creation_choice_widget.dart';
import '/components/edit_integration_widget.dart';
import '/components/edit_story_widget.dart';
import '/components/export_code_widget.dart';
import '/components/export_story_code_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/navbarnav/navbarnav_widget.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
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
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).revoBG,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FutureBuilder<List<HostedSubsRow>>(
                    future: HostedSubsTable().queryRows(
                      queryFn: (q) => q.eqOrNull(
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
                      List<HostedSubsRow> hostedSubsHostedSubsRowList =
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
                              updateCallback: () => safeSetState(() {}),
                              child: const NavbarnavWidget(
                                selectedIndex: 7,
                              ),
                            ),
                            Expanded(
                              child: FutureBuilder<List<IntegrationsRow>>(
                                future: (_model.requestCompleter ??= Completer<
                                        List<IntegrationsRow>>()
                                      ..complete(IntegrationsTable().queryRows(
                                        queryFn: (q) => q
                                            .eqOrNull(
                                              'ownerBrand',
                                              FFAppState().activeBrand,
                                            )
                                            .order('id'),
                                      )))
                                    .future,
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
                                      integrationsIntegrationsRowList =
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
                                                                                  'Widgets de ',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'GeistSans',
                                                                                        color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                        fontSize: 40.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        useGoogleFonts: false,
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  FFAppState().activeBrand,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'GeistSans',
                                                                                        color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                        fontSize: 40.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        useGoogleFonts: false,
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
                                                                                    if (hostedSubsHostedSubsRowList.length < 3) {
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
                                                                                          alignment: const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                          child: WebViewAware(
                                                                                            child: GestureDetector(
                                                                                              onTap: () {
                                                                                                FocusScope.of(dialogContext).unfocus();
                                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                                              },
                                                                                              child: SizedBox(
                                                                                                height: 330.0,
                                                                                                width: 800.0,
                                                                                                child: CreationChoiceWidget(
                                                                                                  assets: hostedSubsHostedSubsRowList.length,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    );

                                                                                    safeSetState(() => _model.requestCompleter = null);
                                                                                    await _model.waitForRequestCompleted();
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
                                                                                          fontFamily: 'GeistSans',
                                                                                          color: const Color(0xFF822CE3),
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          useGoogleFonts: false,
                                                                                        ),
                                                                                    elevation: 0.0,
                                                                                    borderSide: const BorderSide(
                                                                                      color: Colors.transparent,
                                                                                      width: 0.0,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8.0),
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
                                                    integrationsIntegrationsRowList
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
                                                                                      Container(
                                                                                        width: 180.0,
                                                                                        decoration: const BoxDecoration(),
                                                                                        child: Text(
                                                                                          valueOrDefault<String>(
                                                                                            usersIntegrationsItem.name,
                                                                                            'name',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'GeistSans',
                                                                                                color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                                fontSize: 28.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                                useGoogleFonts: false,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Builder(
                                                                                        builder: (context) {
                                                                                          if (usersIntegrationsItem.isStory ?? false) {
                                                                                            return Visibility(
                                                                                              visible: usersIntegrationsItem.isStory ?? true,
                                                                                              child: Container(
                                                                                                width: 450.0,
                                                                                                decoration: const BoxDecoration(),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                  children: [
                                                                                                    FutureBuilder<List<HostedSubsRow>>(
                                                                                                      future: _model.hostedCache(
                                                                                                        uniqueQueryKey: usersIntegrationsItem.title1,
                                                                                                        requestFn: () => HostedSubsTable().querySingleRow(
                                                                                                          queryFn: (q) => q.eqOrNull(
                                                                                                            'id',
                                                                                                            usersIntegrationsItem.vid1,
                                                                                                          ),
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
                                                                                                        List<HostedSubsRow> columnHostedSubsRowList = snapshot.data!;

                                                                                                        final columnHostedSubsRow = columnHostedSubsRowList.isNotEmpty ? columnHostedSubsRowList.first : null;

                                                                                                        return Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            if (usersIntegrationsItem.vid1 != null)
                                                                                                              ClipRRect(
                                                                                                                borderRadius: BorderRadius.circular(100.0),
                                                                                                                child: Image.network(
                                                                                                                  columnHostedSubsRow!.thumbnail!,
                                                                                                                  width: 140.0,
                                                                                                                  height: 140.0,
                                                                                                                  fit: BoxFit.cover,
                                                                                                                ),
                                                                                                              ),
                                                                                                            Container(
                                                                                                              width: 120.0,
                                                                                                              decoration: const BoxDecoration(),
                                                                                                              child: Text(
                                                                                                                valueOrDefault<String>(
                                                                                                                  usersIntegrationsItem.title1,
                                                                                                                  'Titre',
                                                                                                                ),
                                                                                                                textAlign: TextAlign.center,
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'GeistSans',
                                                                                                                      fontSize: 16.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FontWeight.w600,
                                                                                                                      useGoogleFonts: false,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ].divide(const SizedBox(height: 6.0)),
                                                                                                        );
                                                                                                      },
                                                                                                    ),
                                                                                                    FutureBuilder<List<HostedSubsRow>>(
                                                                                                      future: _model.hostedCache(
                                                                                                        uniqueQueryKey: usersIntegrationsItem.title2,
                                                                                                        requestFn: () => HostedSubsTable().querySingleRow(
                                                                                                          queryFn: (q) => q.eqOrNull(
                                                                                                            'id',
                                                                                                            usersIntegrationsItem.vid2,
                                                                                                          ),
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
                                                                                                        List<HostedSubsRow> columnHostedSubsRowList = snapshot.data!;

                                                                                                        final columnHostedSubsRow = columnHostedSubsRowList.isNotEmpty ? columnHostedSubsRowList.first : null;

                                                                                                        return Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            if (usersIntegrationsItem.vid2 != null)
                                                                                                              ClipRRect(
                                                                                                                borderRadius: BorderRadius.circular(100.0),
                                                                                                                child: Image.network(
                                                                                                                  columnHostedSubsRow!.thumbnail!,
                                                                                                                  width: 140.0,
                                                                                                                  height: 140.0,
                                                                                                                  fit: BoxFit.cover,
                                                                                                                ),
                                                                                                              ),
                                                                                                            Container(
                                                                                                              width: 120.0,
                                                                                                              decoration: const BoxDecoration(),
                                                                                                              child: Text(
                                                                                                                valueOrDefault<String>(
                                                                                                                  usersIntegrationsItem.title2,
                                                                                                                  'noTitle',
                                                                                                                ),
                                                                                                                textAlign: TextAlign.center,
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'GeistSans',
                                                                                                                      fontSize: 16.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FontWeight.w600,
                                                                                                                      useGoogleFonts: false,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ].divide(const SizedBox(height: 6.0)),
                                                                                                        );
                                                                                                      },
                                                                                                    ),
                                                                                                    FutureBuilder<List<HostedSubsRow>>(
                                                                                                      future: _model.hostedCache(
                                                                                                        uniqueQueryKey: usersIntegrationsItem.title3,
                                                                                                        requestFn: () => HostedSubsTable().querySingleRow(
                                                                                                          queryFn: (q) => q.eqOrNull(
                                                                                                            'id',
                                                                                                            usersIntegrationsItem.vid3,
                                                                                                          ),
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
                                                                                                        List<HostedSubsRow> columnHostedSubsRowList = snapshot.data!;

                                                                                                        final columnHostedSubsRow = columnHostedSubsRowList.isNotEmpty ? columnHostedSubsRowList.first : null;

                                                                                                        return Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            if (usersIntegrationsItem.vid3 != null)
                                                                                                              ClipRRect(
                                                                                                                borderRadius: BorderRadius.circular(100.0),
                                                                                                                child: Image.network(
                                                                                                                  columnHostedSubsRow!.thumbnail!,
                                                                                                                  width: 140.0,
                                                                                                                  height: 140.0,
                                                                                                                  fit: BoxFit.cover,
                                                                                                                ),
                                                                                                              ),
                                                                                                            Container(
                                                                                                              width: 120.0,
                                                                                                              decoration: const BoxDecoration(),
                                                                                                              child: Text(
                                                                                                                valueOrDefault<String>(
                                                                                                                  usersIntegrationsItem.title3,
                                                                                                                  'noTitle',
                                                                                                                ),
                                                                                                                textAlign: TextAlign.center,
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'GeistSans',
                                                                                                                      fontSize: 16.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FontWeight.w600,
                                                                                                                      useGoogleFonts: false,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ].divide(const SizedBox(height: 6.0)),
                                                                                                        );
                                                                                                      },
                                                                                                    ),
                                                                                                  ].divide(const SizedBox(width: 12.0)),
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          } else if (usersIntegrationsItem.isFounder ?? false) {
                                                                                            return Container(
                                                                                              width: 450.0,
                                                                                              decoration: const BoxDecoration(),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                children: [
                                                                                                  FutureBuilder<List<HostedSubsRow>>(
                                                                                                    future: _model.hostedCache(
                                                                                                      uniqueQueryKey: usersIntegrationsItem.title1,
                                                                                                      requestFn: () => HostedSubsTable().querySingleRow(
                                                                                                        queryFn: (q) => q.eqOrNull(
                                                                                                          'id',
                                                                                                          usersIntegrationsItem.vid1,
                                                                                                        ),
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
                                                                                                      List<HostedSubsRow> columnHostedSubsRowList = snapshot.data!;

                                                                                                      final columnHostedSubsRow = columnHostedSubsRowList.isNotEmpty ? columnHostedSubsRowList.first : null;

                                                                                                      return Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          if (usersIntegrationsItem.vid1 != null)
                                                                                                            ClipRRect(
                                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                                              child: Image.network(
                                                                                                                columnHostedSubsRow!.thumbnail!,
                                                                                                                width: 100.0,
                                                                                                                height: 200.0,
                                                                                                                fit: BoxFit.cover,
                                                                                                              ),
                                                                                                            ),
                                                                                                        ].divide(const SizedBox(height: 6.0)),
                                                                                                      );
                                                                                                    },
                                                                                                  ),
                                                                                                ].divide(const SizedBox(width: 12.0)),
                                                                                              ),
                                                                                            );
                                                                                          } else {
                                                                                            return Visibility(
                                                                                              visible: !usersIntegrationsItem.isStory!,
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                children: [
                                                                                                  if (usersIntegrationsItem.vid1 != null)
                                                                                                    FutureBuilder<List<HostedSubsRow>>(
                                                                                                      future: _model.hostedCache(
                                                                                                        uniqueQueryKey: usersIntegrationsItem.vid1?.toString(),
                                                                                                        requestFn: () => HostedSubsTable().querySingleRow(
                                                                                                          queryFn: (q) => q.eqOrNull(
                                                                                                            'id',
                                                                                                            usersIntegrationsItem.vid1,
                                                                                                          ),
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
                                                                                                            width: 100.0,
                                                                                                            height: 200.0,
                                                                                                            fit: BoxFit.cover,
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                    ),
                                                                                                  if (usersIntegrationsItem.vid2 != null)
                                                                                                    FutureBuilder<List<HostedSubsRow>>(
                                                                                                      future: _model.hostedCache(
                                                                                                        uniqueQueryKey: usersIntegrationsItem.vid2?.toString(),
                                                                                                        requestFn: () => HostedSubsTable().querySingleRow(
                                                                                                          queryFn: (q) => q.eqOrNull(
                                                                                                            'id',
                                                                                                            usersIntegrationsItem.vid2,
                                                                                                          ),
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
                                                                                                            width: 100.0,
                                                                                                            height: 200.0,
                                                                                                            fit: BoxFit.cover,
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                    ),
                                                                                                  if (usersIntegrationsItem.vid3 != null)
                                                                                                    FutureBuilder<List<HostedSubsRow>>(
                                                                                                      future: _model.hostedCache(
                                                                                                        uniqueQueryKey: usersIntegrationsItem.vid3?.toString(),
                                                                                                        requestFn: () => HostedSubsTable().querySingleRow(
                                                                                                          queryFn: (q) => q.eqOrNull(
                                                                                                            'id',
                                                                                                            usersIntegrationsItem.vid3,
                                                                                                          ),
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
                                                                                                            width: 100.0,
                                                                                                            height: 200.0,
                                                                                                            fit: BoxFit.cover,
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                    ),
                                                                                                  if (usersIntegrationsItem.vid4 != null)
                                                                                                    FutureBuilder<List<HostedSubsRow>>(
                                                                                                      future: _model.hostedCache(
                                                                                                        uniqueQueryKey: usersIntegrationsItem.vid4?.toString(),
                                                                                                        requestFn: () => HostedSubsTable().querySingleRow(
                                                                                                          queryFn: (q) => q.eqOrNull(
                                                                                                            'id',
                                                                                                            usersIntegrationsItem.vid4,
                                                                                                          ),
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
                                                                                                            width: 100.0,
                                                                                                            height: 200.0,
                                                                                                            fit: BoxFit.cover,
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                    ),
                                                                                                  if (usersIntegrationsItem.vid5 != null)
                                                                                                    FutureBuilder<List<HostedSubsRow>>(
                                                                                                      future: _model.hostedCache(
                                                                                                        uniqueQueryKey: usersIntegrationsItem.vid5?.toString(),
                                                                                                        requestFn: () => HostedSubsTable().querySingleRow(
                                                                                                          queryFn: (q) => q.eqOrNull(
                                                                                                            'id',
                                                                                                            usersIntegrationsItem.vid5,
                                                                                                          ),
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
                                                                                                            width: 100.0,
                                                                                                            height: 200.0,
                                                                                                            fit: BoxFit.cover,
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                    ),
                                                                                                ].divide(const SizedBox(width: 6.0)),
                                                                                              ),
                                                                                            );
                                                                                          }
                                                                                        },
                                                                                      ),
                                                                                      Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Builder(
                                                                                            builder: (context) => FFButtonWidget(
                                                                                              onPressed: () async {
                                                                                                FFAppState().integrationEdited = usersIntegrationsItem.id;
                                                                                                safeSetState(() {});
                                                                                                if (usersIntegrationsItem.isStory!) {
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
                                                                                                            onTap: () {
                                                                                                              FocusScope.of(dialogContext).unfocus();
                                                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                                                            },
                                                                                                            child: SizedBox(
                                                                                                              height: 330.0,
                                                                                                              width: 550.0,
                                                                                                              child: ExportStoryCodeWidget(
                                                                                                                integrationEditing: usersIntegrationsItem.id,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  );
                                                                                                } else if (usersIntegrationsItem.isFounder!) {
                                                                                                  await Clipboard.setData(ClipboardData(text: ' <script src=\"https://float-video.vercel.app/embed.js\"></script>    <script>      initializeVideoPlayer(\"${FFAppState().integrationEdited.toString()}\");    </script>'));
                                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                                    SnackBar(
                                                                                                      content: Text(
                                                                                                        'Code copié',
                                                                                                        style: TextStyle(
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        ),
                                                                                                      ),
                                                                                                      duration: const Duration(milliseconds: 4000),
                                                                                                      backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                    ),
                                                                                                  );
                                                                                                } else {
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
                                                                                                            onTap: () {
                                                                                                              FocusScope.of(dialogContext).unfocus();
                                                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                                                            },
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
                                                                                                  );
                                                                                                }
                                                                                              },
                                                                                              text: 'Exporter le code',
                                                                                              icon: const Icon(
                                                                                                Icons.content_copy_outlined,
                                                                                                size: 15.0,
                                                                                              ),
                                                                                              options: FFButtonOptions(
                                                                                                width: 170.0,
                                                                                                height: 40.0,
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                color: const Color(0xFFEEE8FC),
                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      fontFamily: 'GeistSans',
                                                                                                      color: const Color(0xFF822CE3),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      useGoogleFonts: false,
                                                                                                    ),
                                                                                                elevation: 0.0,
                                                                                                borderSide: const BorderSide(
                                                                                                  color: Colors.transparent,
                                                                                                  width: 0.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Builder(
                                                                                            builder: (context) => FFButtonWidget(
                                                                                              onPressed: () async {
                                                                                                FFAppState().integrationEdited = usersIntegrationsItem.id;
                                                                                                safeSetState(() {});
                                                                                                if (usersIntegrationsItem.isStory!) {
                                                                                                  FFAppState().vid1 = valueOrDefault<int>(
                                                                                                    usersIntegrationsItem.vid1,
                                                                                                    0,
                                                                                                  );
                                                                                                  FFAppState().vid2 = valueOrDefault<int>(
                                                                                                    usersIntegrationsItem.vid2,
                                                                                                    0,
                                                                                                  );
                                                                                                  FFAppState().vid3 = valueOrDefault<int>(
                                                                                                    usersIntegrationsItem.vid3,
                                                                                                    0,
                                                                                                  );
                                                                                                  safeSetState(() {});
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
                                                                                                            onTap: () {
                                                                                                              FocusScope.of(dialogContext).unfocus();
                                                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                                                            },
                                                                                                            child: SizedBox(
                                                                                                              height: 800.0,
                                                                                                              width: 800.0,
                                                                                                              child: EditStoryWidget(
                                                                                                                integrationEditing: usersIntegrationsItem.id,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  );
                                                                                                } else if (usersIntegrationsItem.isFounder!) {
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
                                                                                                            onTap: () {
                                                                                                              FocusScope.of(dialogContext).unfocus();
                                                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                                                            },
                                                                                                            child: SizedBox(
                                                                                                              height: 800.0,
                                                                                                              width: 800.0,
                                                                                                              child: AddFounderWidget(
                                                                                                                founderId: usersIntegrationsItem.id,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  );
                                                                                                } else {
                                                                                                  if ((usersIntegrationsItem.vid4 == null) && (usersIntegrationsItem.vid5 == null)) {
                                                                                                    FFAppState().vid1 = valueOrDefault<int>(
                                                                                                      usersIntegrationsItem.vid1,
                                                                                                      0,
                                                                                                    );
                                                                                                    FFAppState().vid2 = valueOrDefault<int>(
                                                                                                      usersIntegrationsItem.vid2,
                                                                                                      0,
                                                                                                    );
                                                                                                    FFAppState().vid3 = valueOrDefault<int>(
                                                                                                      usersIntegrationsItem.vid3,
                                                                                                      0,
                                                                                                    );
                                                                                                    safeSetState(() {});
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
                                                                                                              onTap: () {
                                                                                                                FocusScope.of(dialogContext).unfocus();
                                                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                                                              },
                                                                                                              child: SizedBox(
                                                                                                                height: 800.0,
                                                                                                                width: 1280.0,
                                                                                                                child: EditIntegrationWidget(
                                                                                                                  integrationEditing: usersIntegrationsItem.id,
                                                                                                                  only3: true,
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                    );
                                                                                                  } else {
                                                                                                    FFAppState().vid1 = valueOrDefault<int>(
                                                                                                      usersIntegrationsItem.vid1,
                                                                                                      0,
                                                                                                    );
                                                                                                    FFAppState().vid2 = valueOrDefault<int>(
                                                                                                      usersIntegrationsItem.vid2,
                                                                                                      0,
                                                                                                    );
                                                                                                    FFAppState().vid3 = valueOrDefault<int>(
                                                                                                      usersIntegrationsItem.vid3,
                                                                                                      0,
                                                                                                    );
                                                                                                    FFAppState().vid4 = valueOrDefault<int>(
                                                                                                      usersIntegrationsItem.vid4,
                                                                                                      0,
                                                                                                    );
                                                                                                    FFAppState().vid5 = valueOrDefault<int>(
                                                                                                      usersIntegrationsItem.vid5,
                                                                                                      0,
                                                                                                    );
                                                                                                    safeSetState(() {});
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
                                                                                                              onTap: () {
                                                                                                                FocusScope.of(dialogContext).unfocus();
                                                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                                                              },
                                                                                                              child: SizedBox(
                                                                                                                height: 800.0,
                                                                                                                width: 1280.0,
                                                                                                                child: EditIntegrationWidget(
                                                                                                                  integrationEditing: usersIntegrationsItem.id,
                                                                                                                  only3: false,
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                    );
                                                                                                  }
                                                                                                }

                                                                                                safeSetState(() => _model.requestCompleter = null);
                                                                                                await _model.waitForRequestCompleted();
                                                                                              },
                                                                                              text: 'Modifier ',
                                                                                              icon: const Icon(
                                                                                                Icons.edit_rounded,
                                                                                                size: 15.0,
                                                                                              ),
                                                                                              options: FFButtonOptions(
                                                                                                width: 170.0,
                                                                                                height: 40.0,
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                color: const Color(0xFFEEE8FC),
                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      fontFamily: 'GeistSans',
                                                                                                      color: const Color(0xFF822CE3),
                                                                                                      fontSize: 14.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      useGoogleFonts: false,
                                                                                                    ),
                                                                                                elevation: 0.0,
                                                                                                borderSide: const BorderSide(
                                                                                                  color: Colors.transparent,
                                                                                                  width: 0.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(const SizedBox(height: 12.0)),
                                                                                      ),
                                                                                    ].divide(const SizedBox(width: 11.0)),
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
