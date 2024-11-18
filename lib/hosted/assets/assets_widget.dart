import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/erase_asset/erase_asset_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/hosted/modify_video_title/modify_video_title_widget.dart';
import '/hosted/play_video/play_video_widget.dart';
import '/hosted/video_title/video_title_widget.dart';
import '/pages/navbarnav/navbarnav_widget.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'assets_model.dart';
export 'assets_model.dart';

class AssetsWidget extends StatefulWidget {
  const AssetsWidget({super.key});

  @override
  State<AssetsWidget> createState() => _AssetsWidgetState();
}

class _AssetsWidgetState extends State<AssetsWidget> {
  late AssetsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AssetsModel());

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

    return FutureBuilder<List<HostedSubsRow>>(
      future: (_model.requestCompleter ??= Completer<List<HostedSubsRow>>()
            ..complete(HostedSubsTable().queryRows(
              queryFn: (q) => q
                  .eq(
                    'brand_name',
                    FFAppState().activeBrand,
                  )
                  .order('id'),
            )))
          .future,
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).revoBG,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitRing(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<HostedSubsRow> assetsHostedSubsRowList = snapshot.data!;

        return Title(
            title: 'assets',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).revoBG,
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
                          children: [
                            wrapWithModel(
                              model: _model.navbarnavModel,
                              updateCallback: () => safeSetState(() {}),
                              child: const NavbarnavWidget(
                                selectedIndex: 5,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).revoBG,
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 32.0, 0.0, 20.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            50.0, 0.0, 50.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.9,
                                          decoration: const BoxDecoration(),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .revoWhite,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16.0,
                                                                28.0,
                                                                16.0,
                                                                16.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Assets',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Manrope',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .revoCardTextColor,
                                                                fontSize: 40.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                        MouseRegion(
                                                          opaque: false,
                                                          cursor: MouseCursor
                                                                  .defer ??
                                                              MouseCursor.defer,
                                                          onEnter:
                                                              ((event) async {
                                                            safeSetState(() =>
                                                                _model.mouseRegionHovered =
                                                                    true);
                                                          }),
                                                          onExit:
                                                              ((event) async {
                                                            safeSetState(() =>
                                                                _model.mouseRegionHovered =
                                                                    false);
                                                          }),
                                                          child: Builder(
                                                            builder: (context) =>
                                                                FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                var shouldSetState =
                                                                    false;
                                                                safeSetState(
                                                                    () {
                                                                  _model.isDataUploading =
                                                                      false;
                                                                  _model.uploadedLocalFile =
                                                                      FFUploadedFile(
                                                                          bytes:
                                                                              Uint8List.fromList([]));
                                                                  _model.uploadedFileUrl =
                                                                      '';
                                                                });

                                                                final selectedMedia =
                                                                    await selectMedia(
                                                                  storageFolderPath:
                                                                      currentUserUid,
                                                                  isVideo: true,
                                                                  mediaSource:
                                                                      MediaSource
                                                                          .videoGallery,
                                                                  multiImage:
                                                                      false,
                                                                );
                                                                if (selectedMedia !=
                                                                        null &&
                                                                    selectedMedia.every((m) =>
                                                                        validateFileFormat(
                                                                            m.storagePath,
                                                                            context))) {
                                                                  safeSetState(() =>
                                                                      _model.isDataUploading =
                                                                          true);
                                                                  var selectedUploadedFiles =
                                                                      <FFUploadedFile>[];

                                                                  var downloadUrls =
                                                                      <String>[];
                                                                  try {
                                                                    selectedUploadedFiles = selectedMedia
                                                                        .map((m) => FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                            ))
                                                                        .toList();

                                                                    downloadUrls =
                                                                        await uploadSupabaseStorageFiles(
                                                                      bucketName:
                                                                          'hosting',
                                                                      selectedFiles:
                                                                          selectedMedia,
                                                                    );
                                                                  } finally {
                                                                    _model.isDataUploading =
                                                                        false;
                                                                  }
                                                                  if (selectedUploadedFiles
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length &&
                                                                      downloadUrls
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length) {
                                                                    safeSetState(
                                                                        () {
                                                                      _model.uploadedLocalFile =
                                                                          selectedUploadedFiles
                                                                              .first;
                                                                      _model.uploadedFileUrl =
                                                                          downloadUrls
                                                                              .first;
                                                                    });
                                                                  } else {
                                                                    safeSetState(
                                                                        () {});
                                                                    return;
                                                                  }
                                                                }

                                                                if (!(_model.uploadedFileUrl !=
                                                                        '')) {
                                                                  if (shouldSetState) {
                                                                    safeSetState(
                                                                        () {});
                                                                  }
                                                                  return;
                                                                }
                                                                FFAppState()
                                                                    .videoTitle = '';
                                                                safeSetState(
                                                                    () {});
                                                                await showDialog(
                                                                  barrierDismissible:
                                                                      false,
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (dialogContext) {
                                                                    return Dialog(
                                                                      elevation:
                                                                          0,
                                                                      insetPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      alignment: const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap: () =>
                                                                            FocusScope.of(dialogContext).unfocus(),
                                                                        child:
                                                                            const SizedBox(
                                                                          height:
                                                                              250.0,
                                                                          width:
                                                                              500.0,
                                                                          child:
                                                                              VideoTitleWidget(),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );

                                                                _model.apiResultUpload =
                                                                    await PostToMuxThroughFastgenCall
                                                                        .call(
                                                                  link: valueOrDefault<
                                                                      String>(
                                                                    _model
                                                                        .uploadedFileUrl,
                                                                    'none',
                                                                  ),
                                                                );

                                                                shouldSetState =
                                                                    true;
                                                                if ((_model
                                                                        .apiResultUpload
                                                                        ?.succeeded ??
                                                                    true)) {
                                                                  await HostedSubsTable()
                                                                      .insert({
                                                                    'media_link':
                                                                        _model
                                                                            .uploadedFileUrl,
                                                                    'brand_name':
                                                                        FFAppState()
                                                                            .activeBrand,
                                                                    'owner':
                                                                        currentUserUid,
                                                                    'thumbnail':
                                                                        'https://image.mux.com/${PostToMuxThroughFastgenCall.muxId(
                                                                      (_model.apiResultUpload
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )}/animated.webp?start=2&fps=20&end=4',
                                                                    'playback_id':
                                                                        PostToMuxThroughFastgenCall
                                                                            .muxId(
                                                                      (_model.apiResultUpload
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ),
                                                                    'title':
                                                                        FFAppState()
                                                                            .videoTitle,
                                                                    'asset_id':
                                                                        PostToMuxThroughFastgenCall
                                                                            .assetId(
                                                                      (_model.apiResultUpload
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ).toString(),
                                                                    'client_id':
                                                                        valueOrDefault<
                                                                            int>(
                                                                      FFAppState()
                                                                          .activeClientID,
                                                                      0,
                                                                    ),
                                                                  });
                                                                }
                                                                safeSetState(() =>
                                                                    _model.requestCompleter =
                                                                        null);
                                                                await _model
                                                                    .waitForRequestCompleted();
                                                                if (shouldSetState) {
                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              },
                                                              text:
                                                                  'Upload video',
                                                              icon: const Icon(
                                                                Icons
                                                                    .upload_rounded,
                                                                size: 15.0,
                                                              ),
                                                              options:
                                                                  FFButtonOptions(
                                                                height: 40.0,
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0),
                                                                iconPadding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color: const Color(
                                                                    0xFFEEE8FC),
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Manrope',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                                elevation: 0.0,
                                                                borderSide:
                                                                    const BorderSide(
                                                                  color: Colors
                                                                      .transparent,
                                                                  width: 0.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(const SizedBox(
                                                          height: 12.0)),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(const SizedBox(height: 24.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  50.0, 0.0, 50.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Flexible(
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.9,
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      12.0,
                                                                      0.0,
                                                                      0.0),
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final hostedVideos =
                                                                        assetsHostedSubsRowList
                                                                            .toList();

                                                                    return Wrap(
                                                                      spacing:
                                                                          16.0,
                                                                      runSpacing:
                                                                          8.0,
                                                                      alignment:
                                                                          WrapAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          WrapCrossAlignment
                                                                              .start,
                                                                      direction:
                                                                          Axis.horizontal,
                                                                      runAlignment:
                                                                          WrapAlignment
                                                                              .start,
                                                                      verticalDirection:
                                                                          VerticalDirection
                                                                              .down,
                                                                      clipBehavior:
                                                                          Clip.none,
                                                                      children: List.generate(
                                                                          hostedVideos
                                                                              .length,
                                                                          (hostedVideosIndex) {
                                                                        final hostedVideosItem =
                                                                            hostedVideos[hostedVideosIndex];
                                                                        return Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 1.0,
                                                                          height:
                                                                              98.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).revoWhite,
                                                                            borderRadius:
                                                                                BorderRadius.circular(4.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                0.0,
                                                                                12.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Flexible(
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).tertiary,
                                                                                      borderRadius: BorderRadius.circular(1.0),
                                                                                    ),
                                                                                    child: Builder(
                                                                                      builder: (context) => InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          await showDialog(
                                                                                            context: context,
                                                                                            builder: (dialogContext) {
                                                                                              return Dialog(
                                                                                                elevation: 0,
                                                                                                insetPadding: EdgeInsets.zero,
                                                                                                backgroundColor: Colors.transparent,
                                                                                                alignment: const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                child: GestureDetector(
                                                                                                  onTap: () => FocusScope.of(dialogContext).unfocus(),
                                                                                                  child: SizedBox(
                                                                                                    height: 630.0,
                                                                                                    width: 300.0,
                                                                                                    child: PlayVideoWidget(
                                                                                                      videoAdress: hostedVideosItem.mediaLink!,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          );
                                                                                        },
                                                                                        child: ClipRRect(
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                          child: Image.network(
                                                                                            'https://image.mux.com/${hostedVideosItem.playbackId}/thumbnail.png?width=240&height=330&time=5',
                                                                                            width: 110.0,
                                                                                            height: 80.0,
                                                                                            fit: BoxFit.contain,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  width: 400.0,
                                                                                  decoration: const BoxDecoration(),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Flexible(
                                                                                        child: Text(
                                                                                          valueOrDefault<String>(
                                                                                            hostedVideosItem.title,
                                                                                            'no',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Manrope',
                                                                                                fontSize: 16.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w600,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Builder(
                                                                                        builder: (context) => FlutterFlowIconButton(
                                                                                          borderRadius: 8.0,
                                                                                          buttonSize: 40.0,
                                                                                          icon: Icon(
                                                                                            Icons.mode_edit,
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            size: 16.0,
                                                                                          ),
                                                                                          onPressed: () async {
                                                                                            await showDialog(
                                                                                              context: context,
                                                                                              builder: (dialogContext) {
                                                                                                return Dialog(
                                                                                                  elevation: 0,
                                                                                                  insetPadding: EdgeInsets.zero,
                                                                                                  backgroundColor: Colors.transparent,
                                                                                                  alignment: const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                  child: GestureDetector(
                                                                                                    onTap: () => FocusScope.of(dialogContext).unfocus(),
                                                                                                    child: SizedBox(
                                                                                                      height: 250.0,
                                                                                                      width: 500.0,
                                                                                                      child: ModifyVideoTitleWidget(
                                                                                                        assetId: hostedVideosItem.id,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            );

                                                                                            safeSetState(() => _model.requestCompleter = null);
                                                                                            await _model.waitForRequestCompleted();
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                    ].divide(const SizedBox(width: 6.0)),
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  dateTimeFormat("d/M h:mm a", hostedVideosItem.createdAt),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Manrope',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                                Flexible(
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                    child: Container(
                                                                                      width: 140.0,
                                                                                      decoration: const BoxDecoration(),
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
                                                                                                  child: GestureDetector(
                                                                                                    onTap: () => FocusScope.of(dialogContext).unfocus(),
                                                                                                    child: SizedBox(
                                                                                                      height: 275.0,
                                                                                                      width: 400.0,
                                                                                                      child: EraseAssetWidget(
                                                                                                        assetID: hostedVideosItem.id,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            );
                                                                                          },
                                                                                          text: 'Effacer',
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
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(const SizedBox(width: 16.0)),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }),
                                                                    );
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
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
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
