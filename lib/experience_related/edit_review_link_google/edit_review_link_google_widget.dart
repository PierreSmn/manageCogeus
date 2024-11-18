import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'edit_review_link_google_model.dart';
export 'edit_review_link_google_model.dart';

class EditReviewLinkGoogleWidget extends StatefulWidget {
  const EditReviewLinkGoogleWidget({super.key});

  @override
  State<EditReviewLinkGoogleWidget> createState() =>
      _EditReviewLinkGoogleWidgetState();
}

class _EditReviewLinkGoogleWidgetState
    extends State<EditReviewLinkGoogleWidget> {
  late EditReviewLinkGoogleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditReviewLinkGoogleModel());

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

    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).revoBG,
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 28.0, 16.0, 28.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 400.0,
                decoration: const BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.arrow_back,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Editer le lien d\'Avis',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Manrope',
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    lineHeight: 1.2,
                                  ),
                        ),
                        Text(
                          'Trouvez votre lieu avec l\'API Google Maps',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Manrope',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ].divide(const SizedBox(height: 12.0)),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FlutterFlowPlacePicker(
                          iOSGoogleMapsApiKey: '',
                          androidGoogleMapsApiKey: '',
                          webGoogleMapsApiKey:
                              'AIzaSyAHf1wQ4iSLbWeiadjOWPFEiHODsGZcsTQ',
                          onSelect: (place) async {
                            safeSetState(() => _model.placePickerValue = place);
                          },
                          defaultText: 'Trouver mon lieu',
                          icon: Icon(
                            Icons.place,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            size: 16.0,
                          ),
                          buttonOptions: FFButtonOptions(
                            width: 200.0,
                            height: 40.0,
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Manrope',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        if (_model.placePickerValue.address != '')
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  var shouldSetState = false;
                                  _model.apiResultxcr =
                                      await PlaceIdRequestCall.call(
                                    lat: functions.getLongLat(_model
                                        .placePickerValue.latLng
                                        .toString()),
                                  );

                                  shouldSetState = true;
                                  if (!(_model.apiResultxcr?.succeeded ??
                                      true)) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Not worke',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                    if (shouldSetState) safeSetState(() {});
                                    return;
                                  }
                                  await launchURL(
                                      'https://search.google.com/local/writereview?placeid=${PlaceIdRequestCall.placeId(
                                    (_model.apiResultxcr?.jsonBody ?? ''),
                                  )?.first}');
                                  _model.confirmed = true;
                                  safeSetState(() {});
                                  if (shouldSetState) safeSetState(() {});
                                },
                                text: 'Vérifier le lien',
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: const Color(0xFFEEE8FC),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
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
                              if (_model.confirmed)
                                FFButtonWidget(
                                  onPressed: () async {
                                    await ClientsTable().update(
                                      data: {
                                        'review_site': 'Google',
                                        'review_link':
                                            'https://search.google.com/local/writereview?placeid=${PlaceIdRequestCall.placeId(
                                          (_model.apiResultxcr?.jsonBody ?? ''),
                                        )?.first}',
                                      },
                                      matchingRows: (rows) => rows.eq(
                                        'id',
                                        FFAppState().activeClientID,
                                      ),
                                    );
                                    Navigator.pop(context);
                                  },
                                  text: 'Confirmer',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: const Color(0xFFEEE8FC),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
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
                            ].divide(const SizedBox(width: 16.0)),
                          ),
                      ].divide(const SizedBox(height: 24.0)),
                    ),
                  ].divide(const SizedBox(height: 26.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
