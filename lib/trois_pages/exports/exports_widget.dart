import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/addlist/addlist_widget.dart';
import '/components/erase_list/erase_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/trois_pages/navbarnav/navbarnav_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'exports_model.dart';
export 'exports_model.dart';

class ExportsWidget extends StatefulWidget {
  const ExportsWidget({super.key});

  @override
  State<ExportsWidget> createState() => _ExportsWidgetState();
}

class _ExportsWidgetState extends State<ExportsWidget> {
  late ExportsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExportsModel());

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
        title: 'exports',
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
                  Container(
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
                            selectedIndex: 3,
                          ),
                        ),
                        Expanded(
                          child: FutureBuilder<List<ListsRow>>(
                            future: ListsTable().queryRows(
                              queryFn: (q) => q.eq(
                                'uuid',
                                currentUserUid,
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
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 50.0,
                                    ),
                                  ),
                                );
                              }
                              List<ListsRow> containerListsRowList =
                                  snapshot.data!;
                              return Container(
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).revoBG,
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 32.0, 0.0, 0.0),
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
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(50.0, 0.0, 50.0,
                                                          40.0),
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width:
                                                              MediaQuery.sizeOf(
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
                                                                          .width *
                                                                      1.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .revoWhite,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            28.0,
                                                                            16.0,
                                                                            16.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          [
                                                                        Text(
                                                                          'Mes dossiers',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Manrope',
                                                                                color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                fontSize: 40.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            MouseRegion(
                                                                              opaque: false,
                                                                              cursor: MouseCursor.defer ?? MouseCursor.defer,
                                                                              onEnter: ((event) async {
                                                                                setState(() => _model.mouseRegionHovered1 = true);
                                                                              }),
                                                                              onExit: ((event) async {
                                                                                setState(() => _model.mouseRegionHovered1 = false);
                                                                              }),
                                                                              child: Builder(
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
                                                                                              child: const SizedBox(
                                                                                                height: 250.0,
                                                                                                width: 500.0,
                                                                                                child: AddlistWidget(),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ).then((value) => setState(() {}));
                                                                                  },
                                                                                  text: 'Nouveau',
                                                                                  icon: const Icon(
                                                                                    Icons.add,
                                                                                    size: 15.0,
                                                                                  ),
                                                                                  options: FFButtonOptions(
                                                                                    height: 40.0,
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: _model.mouseRegionHovered1 ? const Color(0xFFE8E2F5) : const Color(0xFFEEE8FC),
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          fontFamily: 'Manrope',
                                                                                          color: const Color(0xFF5E35B1),
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
                                                                            if (_model.listSelect != null &&
                                                                                _model.listSelect != '')
                                                                              MouseRegion(
                                                                                opaque: false,
                                                                                cursor: MouseCursor.defer ?? MouseCursor.defer,
                                                                                onEnter: ((event) async {
                                                                                  setState(() => _model.mouseRegionHovered2 = true);
                                                                                }),
                                                                                onExit: ((event) async {
                                                                                  setState(() => _model.mouseRegionHovered2 = false);
                                                                                }),
                                                                                child: Builder(
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
                                                                                                child: EraseListWidget(
                                                                                                  listId: _model.listSelect!,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ).then((value) => setState(() {}));
                                                                                    },
                                                                                    text: 'Effacer',
                                                                                    icon: const Icon(
                                                                                      Icons.delete_outlined,
                                                                                      size: 15.0,
                                                                                    ),
                                                                                    options: FFButtonOptions(
                                                                                      height: 40.0,
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      color: _model.mouseRegionHovered2 ? const Color(0xFFE8E2F5) : const Color(0xFFEEE8FC),
                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            fontFamily: 'Manrope',
                                                                                            color: const Color(0xFFE32C6B),
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
                                                                          ].divide(const SizedBox(width: 16.0)),
                                                                        ),
                                                                        Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final containerVar =
                                                                                containerListsRowList.toList();
                                                                            return Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: List.generate(containerVar.length, (containerVarIndex) {
                                                                                final containerVarItem = containerVar[containerVarIndex];
                                                                                return InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    _model.listSelect = containerVarItem.name;
                                                                                    setState(() {});
                                                                                  },
                                                                                  child: Text(
                                                                                    valueOrDefault<String>(
                                                                                      containerVarItem.name,
                                                                                      'UNKNWOS',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Manrope',
                                                                                          color: containerVarItem.name == _model.listSelect ? FlutterFlowTheme.of(context).revoCardBlueText : FlutterFlowTheme.of(context).revoSearchIconColor,
                                                                                          fontSize: 14.72,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.normal,
                                                                                        ),
                                                                                  ),
                                                                                );
                                                                              }),
                                                                            );
                                                                          },
                                                                        ),
                                                                      ].divide(const SizedBox(
                                                                              height: 12.0)),
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
                                        Flexible(
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 0.0),
                                            child:
                                                FutureBuilder<List<ListsRow>>(
                                              future:
                                                  ListsTable().querySingleRow(
                                                queryFn: (q) => q.eq(
                                                  'name',
                                                  _model.listSelect,
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 50.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<ListsRow>
                                                    columnListsRowList =
                                                    snapshot.data!;
                                                final columnListsRow =
                                                    columnListsRowList
                                                            .isNotEmpty
                                                        ? columnListsRowList
                                                            .first
                                                        : null;
                                                return SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      if (_model.listSelect !=
                                                              null &&
                                                          _model.listSelect !=
                                                              '')
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      32.0),
                                                          child: Builder(
                                                            builder: (context) {
                                                              final validItem =
                                                                  columnListsRow
                                                                          ?.selection
                                                                          .toList() ??
                                                                      [];
                                                              return Wrap(
                                                                spacing: 16.0,
                                                                runSpacing:
                                                                    16.0,
                                                                alignment:
                                                                    WrapAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    WrapCrossAlignment
                                                                        .start,
                                                                direction: Axis
                                                                    .horizontal,
                                                                runAlignment:
                                                                    WrapAlignment
                                                                        .start,
                                                                verticalDirection:
                                                                    VerticalDirection
                                                                        .down,
                                                                clipBehavior:
                                                                    Clip.none,
                                                                children: List.generate(
                                                                    validItem
                                                                        .length,
                                                                    (validItemIndex) {
                                                                  final validItemItem =
                                                                      validItem[
                                                                          validItemIndex];
                                                                  return FutureBuilder<
                                                                      List<
                                                                          ValidSubsRow>>(
                                                                    future: ValidSubsTable()
                                                                        .querySingleRow(
                                                                      queryFn:
                                                                          (q) =>
                                                                              q.eq(
                                                                        'id',
                                                                        validItemItem,
                                                                      ),
                                                                    ),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                50.0,
                                                                            height:
                                                                                50.0,
                                                                            child:
                                                                                SpinKitRing(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: 50.0,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      List<ValidSubsRow>
                                                                          containerValidSubsRowList =
                                                                          snapshot
                                                                              .data!;
                                                                      final containerValidSubsRow = containerValidSubsRowList
                                                                              .isNotEmpty
                                                                          ? containerValidSubsRowList
                                                                              .first
                                                                          : null;
                                                                      return Container(
                                                                        width:
                                                                            360.0,
                                                                        height:
                                                                            660.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).revoWhite,
                                                                          borderRadius:
                                                                              BorderRadius.circular(16.0),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              16.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children:
                                                                                [
                                                                              Flexible(
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    FlutterFlowVideoPlayer(
                                                                                      path: containerValidSubsRow!.mediaLink!,
                                                                                      videoType: VideoType.network,
                                                                                      width: 280.0,
                                                                                      height: 430.0,
                                                                                      autoPlay: false,
                                                                                      looping: true,
                                                                                      showControls: true,
                                                                                      allowFullScreen: true,
                                                                                      allowPlaybackSpeedMenu: false,
                                                                                      lazyLoad: false,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: 300.0,
                                                                                decoration: const BoxDecoration(),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      valueOrDefault<String>(
                                                                                        containerValidSubsRow.submitterName,
                                                                                        'John',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Manrope',
                                                                                            fontSize: 18.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                    ),
                                                                                    RichText(
                                                                                      textScaler: MediaQuery.of(context).textScaler,
                                                                                      text: TextSpan(
                                                                                        children: [
                                                                                          const TextSpan(
                                                                                            text: 'Repond à la question : \n',
                                                                                            style: TextStyle(),
                                                                                          ),
                                                                                          TextSpan(
                                                                                            text: valueOrDefault<String>(
                                                                                              containerValidSubsRow.question,
                                                                                              'Not set',
                                                                                            ),
                                                                                            style: const TextStyle(
                                                                                              fontWeight: FontWeight.w600,
                                                                                              fontSize: 16.0,
                                                                                            ),
                                                                                          )
                                                                                        ],
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Manrope',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Text(
                                                                                      valueOrDefault<String>(
                                                                                        containerValidSubsRow.transcription,
                                                                                        'transcirptUnavail',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Manrope',
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  ].divide(const SizedBox(height: 12.0)).addToStart(const SizedBox(height: 12.0)),
                                                                                ),
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        FFButtonWidget(
                                                                                          onPressed: () async {
                                                                                            FFAppState().userSelection = columnListsRow!.selection.toList().cast<int>();
                                                                                            setState(() {});
                                                                                            FFAppState().removeAtIndexFromUserSelection(validItemIndex);
                                                                                            setState(() {});
                                                                                            await ListsTable().update(
                                                                                              data: {
                                                                                                'selection': FFAppState().userSelection,
                                                                                              },
                                                                                              matchingRows: (rows) => rows.eq(
                                                                                                'id',
                                                                                                columnListsRow.id,
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                          text: 'Retirer de la selection',
                                                                                          options: FFButtonOptions(
                                                                                            height: 40.0,
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                            iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                            color: const Color(0xFFEEE8FC),
                                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                  fontFamily: 'Manrope',
                                                                                                  color: const Color(0xFF5E35B1),
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
                                                                                        FFButtonWidget(
                                                                                          onPressed: () async {
                                                                                            await launchURL('${containerValidSubsRow.mediaLink}?download');
                                                                                          },
                                                                                          text: 'Télécharger',
                                                                                          icon: const Icon(
                                                                                            Icons.download_rounded,
                                                                                            size: 15.0,
                                                                                          ),
                                                                                          options: FFButtonOptions(
                                                                                            height: 40.0,
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                            iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                            color: const Color(0xFFEDFCE8),
                                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                  fontFamily: 'Manrope',
                                                                                                  color: const Color(0xFF4CB135),
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
                                                                                      ].divide(const SizedBox(height: 16.0)),
                                                                                    ),
                                                                                  ),
                                                                                ].divide(const SizedBox(width: 8.0)),
                                                                              ),
                                                                            ].divide(const SizedBox(height: 12.0)),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                }),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
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
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
