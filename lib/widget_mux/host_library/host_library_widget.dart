import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/erase_asset/erase_asset_widget.dart';
import '/components/play_video_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/trois_pages/navbarnav/navbarnav_widget.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'host_library_model.dart';
export 'host_library_model.dart';

class HostLibraryWidget extends StatefulWidget {
  const HostLibraryWidget({super.key});

  @override
  State<HostLibraryWidget> createState() => _HostLibraryWidgetState();
}

class _HostLibraryWidgetState extends State<HostLibraryWidget> {
  late HostLibraryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HostLibraryModel());

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

    return FutureBuilder<List<HostedSubsRow>>(
      future: HostedSubsTable().queryRows(
        queryFn: (q) => q
            .eq(
              'brand_name',
              FFAppState().activeBrand,
            )
            .order('id'),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
        List<HostedSubsRow> hostLibraryHostedSubsRowList = snapshot.data!;
        return Title(
            title: 'hostLibrary',
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
                          children: [
                            wrapWithModel(
                              model: _model.navbarnavModel,
                              updateCallback: () => setState(() {}),
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
                                            100.0, 0.0, 100.0, 0.0),
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
                                                            setState(() => _model
                                                                    .mouseRegionHovered =
                                                                true);
                                                          }),
                                                          onExit:
                                                              ((event) async {
                                                            setState(() => _model
                                                                    .mouseRegionHovered =
                                                                false);
                                                          }),
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              var shouldSetState =
                                                                  false;
                                                              setState(() {
                                                                _model.isDataUploading =
                                                                    false;
                                                                _model.uploadedLocalFile =
                                                                    FFUploadedFile(
                                                                        bytes: Uint8List.fromList(
                                                                            []));
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
                                                                setState(() =>
                                                                    _model.isDataUploading =
                                                                        true);
                                                                var selectedUploadedFiles =
                                                                    <FFUploadedFile>[];

                                                                var downloadUrls =
                                                                    <String>[];
                                                                try {
                                                                  selectedUploadedFiles =
                                                                      selectedMedia
                                                                          .map((m) =>
                                                                              FFUploadedFile(
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
                                                                  setState(() {
                                                                    _model.uploadedLocalFile =
                                                                        selectedUploadedFiles
                                                                            .first;
                                                                    _model.uploadedFileUrl =
                                                                        downloadUrls
                                                                            .first;
                                                                  });
                                                                } else {
                                                                  setState(
                                                                      () {});
                                                                  return;
                                                                }
                                                              }

                                                              if (!(_model.uploadedFileUrl !=
                                                                      '')) {
                                                                if (shouldSetState) {
                                                                  setState(
                                                                      () {});
                                                                }
                                                                return;
                                                              }
                                                              _model.apiResultUpload =
                                                                  await PostToMuxThroughFastgenCall
                                                                      .call(
                                                                link:
                                                                    valueOrDefault<
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
                                                                  'created_at':
                                                                      supaSerialize<
                                                                              DateTime>(
                                                                          getCurrentTimestamp),
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
                                                                  )}/animated.gif?width=320',
                                                                  'playback_id':
                                                                      PostToMuxThroughFastgenCall
                                                                          .muxId(
                                                                    (_model.apiResultUpload
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ),
                                                                  'title':
                                                                      'Video d\'un client de ${FFAppState().activeBrand}',
                                                                });
                                                              }
                                                              if (shouldSetState) {
                                                                setState(() {});
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
                                                              padding:
                                                                  const EdgeInsetsDirectional
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
                                                              color: _model
                                                                      .mouseRegionHovered
                                                                  ? const Color(
                                                                      0xFFECE2F5)
                                                                  : const Color(
                                                                      0xFFF2E8FC),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Manrope',
                                                                        color: const Color(
                                                                            0xFF822CE3),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
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
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Flexible(
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.8,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    16.0,
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
                                                                      hostLibraryHostedSubsRowList
                                                                          .toList();
                                                                  return Wrap(
                                                                    spacing:
                                                                        16.0,
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
                                                                        hostedVideos
                                                                            .length,
                                                                        (hostedVideosIndex) {
                                                                      final hostedVideosItem =
                                                                          hostedVideos[
                                                                              hostedVideosIndex];
                                                                      return Container(
                                                                        width:
                                                                            250.0,
                                                                        height:
                                                                            410.0,
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
                                                                                    Flexible(
                                                                                      child: Builder(
                                                                                        builder: (context) => InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            await showAlignedDialog(
                                                                                              context: context,
                                                                                              isGlobal: false,
                                                                                              avoidOverflow: false,
                                                                                              targetAnchor: const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                              followerAnchor: const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                              builder: (dialogContext) {
                                                                                                return Material(
                                                                                                  color: Colors.transparent,
                                                                                                  child: WebViewAware(
                                                                                                    child: GestureDetector(
                                                                                                      onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                      child: SizedBox(
                                                                                                        height: 680.0,
                                                                                                        width: 330.0,
                                                                                                        child: PlayVideoWidget(
                                                                                                          videoAdress: hostedVideosItem.mediaLink!,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            ).then((value) => setState(() {}));
                                                                                          },
                                                                                          child: ClipRRect(
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                            child: Image.network(
                                                                                              hostedVideosItem.thumbnail!,
                                                                                              width: 237.0,
                                                                                              height: double.infinity,
                                                                                              fit: BoxFit.cover,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
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
                                                                                              child: WebViewAware(
                                                                                                child: GestureDetector(
                                                                                                  onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                  child: SizedBox(
                                                                                                    height: 275.0,
                                                                                                    width: 400.0,
                                                                                                    child: EraseAssetWidget(
                                                                                                      assetID: hostedVideosItem.id,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ).then((value) => setState(() {}));
                                                                                      },
                                                                                      text: 'Effacer l\'asset',
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
                                                                            ].divide(const SizedBox(height: 12.0)),
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
