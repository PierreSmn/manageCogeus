import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'change_question_model.dart';
export 'change_question_model.dart';

class ChangeQuestionWidget extends StatefulWidget {
  const ChangeQuestionWidget({
    super.key,
    required this.id,
    required this.question,
  });

  final int? id;
  final String? question;

  @override
  State<ChangeQuestionWidget> createState() => _ChangeQuestionWidgetState();
}

class _ChangeQuestionWidgetState extends State<ChangeQuestionWidget> {
  late ChangeQuestionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChangeQuestionModel());

    _model.colorTitleTextController ??=
        TextEditingController(text: widget.question);
    _model.colorTitleFocusNode ??= FocusNode();

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
      width: MediaQuery.sizeOf(context).width * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).revoWhite,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 28.0, 16.0, 28.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          width: 300.0,
                          child: TextFormField(
                            controller: _model.colorTitleTextController,
                            focusNode: _model.colorTitleFocusNode,
                            onFieldSubmitted: (_) async {
                              _model.state =
                                  _model.colorTitleTextController.text;
                              safeSetState(() {});
                            },
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Question',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'GeistSans',
                                    color: FlutterFlowTheme.of(context)
                                        .inputTitleGrey,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                              hintText: '#0E0E10',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'GeistSans',
                                    color: FlutterFlowTheme.of(context)
                                        .inputTitleGrey,
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFFE4E5E6),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .inputNoGoodClicked,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .inputNoGoodClicked,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 8.0, 16.0, 8.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'GeistSans',
                                  color: FlutterFlowTheme.of(context)
                                      .revoCardTextColor,
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                            maxLines: 10,
                            validator: _model.colorTitleTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Container(
                          width: 310.0,
                          height: 540.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondary,
                            borderRadius: BorderRadius.circular(40.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).primaryText,
                              width: 5.0,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 24.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Stack(
                                        alignment:
                                            const AlignmentDirectional(0.0, 1.0),
                                        children: [
                                          Stack(
                                            alignment:
                                                const AlignmentDirectional(0.0, -1.0),
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Material(
                                                    color: Colors.transparent,
                                                    elevation: 0.0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                    ),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: 470.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                      ),
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
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                FlutterFlowIconButton(
                                                                  borderColor:
                                                                      Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      20.0,
                                                                  borderWidth:
                                                                      1.0,
                                                                  buttonSize:
                                                                      40.0,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .close_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    size: 24.0,
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    print(
                                                                        'IconButton pressed ...');
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0),
                                                            child: Text(
                                                              _model
                                                                  .colorTitleTextController
                                                                  .text,
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'GeistSans',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    fontSize:
                                                                        22.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 40.0),
                                            child: Stack(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: 80.0,
                                                      height: 80.0,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    100.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.all(4.0),
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              width: 2.0,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                    2.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 100.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: const Color(
                                                                    0xFFEB4D3D),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ].divide(const SizedBox(height: 6.0)),
                                  ),
                                ]
                                    .divide(const SizedBox(height: 16.0))
                                    .addToStart(const SizedBox(height: 12.0)),
                              ),
                            ),
                          ),
                        ),
                      ].divide(const SizedBox(width: 34.0)),
                    ),
                  ),
                ].divide(const SizedBox(height: 12.0)),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    await LiveFlowsTable().update(
                      data: {
                        'expla2': _model.colorTitleTextController.text,
                      },
                      matchingRows: (rows) => rows.eqOrNull(
                        'id',
                        widget.id,
                      ),
                    );
                    FFAppState().colorChange = true;
                    safeSetState(() {});
                    Navigator.pop(context);
                  },
                  text: 'Changer la question',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: const Color(0xFFEEE8FC),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'GeistSans',
                          color: const Color(0xFF5E35B1),
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
        ),
      ),
    );
  }
}
