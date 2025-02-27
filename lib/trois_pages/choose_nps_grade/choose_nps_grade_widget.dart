import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'choose_nps_grade_model.dart';
export 'choose_nps_grade_model.dart';

class ChooseNpsGradeWidget extends StatefulWidget {
  const ChooseNpsGradeWidget({super.key});

  @override
  State<ChooseNpsGradeWidget> createState() => _ChooseNpsGradeWidgetState();
}

class _ChooseNpsGradeWidgetState extends State<ChooseNpsGradeWidget> {
  late ChooseNpsGradeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChooseNpsGradeModel());

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

    return FutureBuilder<List<ClientsRow>>(
      future: ClientsTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'id',
          FFAppState().activeClientID,
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
        List<ClientsRow> bottomSheetEditClientsRowList = snapshot.data!;

        final bottomSheetEditClientsRow =
            bottomSheetEditClientsRowList.isNotEmpty
                ? bottomSheetEditClientsRowList.first
                : null;

        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 5.0,
                color: Color(0x3B1D2429),
                offset: Offset(
                  0.0,
                  -3.0,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).shadcnCardBorderGrey,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Filtrer les réponses',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'GeistSans',
                            fontSize: 22.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: false,
                          ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        safeSetState(() {
                          _model.choiceChipsValueController?.value = ['Tous'];
                        });
                        safeSetState(() {
                          _model.checkboxGroupValueController?.value = [];
                        });
                        safeSetState(() {
                          _model.radioButtonValueController?.value = 'Non';
                        });
                      },
                      text: 'Clear',
                      icon: Icon(
                        Icons.replay,
                        size: 15.0,
                      ),
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0x005E35B1),
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily: 'GeistSans',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                              useGoogleFonts: false,
                            ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Type de Nps ',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'GeistSans',
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: false,
                          ),
                    ),
                    FlutterFlowChoiceChips(
                      options: [
                        ChipData('Tous'),
                        ChipData('Promoteurs'),
                        ChipData('Passifs'),
                        ChipData('Détracteurs')
                      ],
                      onChanged: (val) => safeSetState(
                          () => _model.choiceChipsValue = val?.firstOrNull),
                      selectedChipStyle: ChipStyle(
                        backgroundColor: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'GeistSans',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                        iconColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        iconSize: 16.0,
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      unselectedChipStyle: ChipStyle(
                        backgroundColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                              fontFamily: 'GeistSans',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                            ),
                        iconColor: FlutterFlowTheme.of(context).secondaryText,
                        iconSize: 16.0,
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      chipSpacing: 8.0,
                      rowSpacing: 8.0,
                      multiselect: false,
                      initialized: _model.choiceChipsValue != null,
                      alignment: WrapAlignment.start,
                      controller: _model.choiceChipsValueController ??=
                          FormFieldController<List<String>>(
                        [
                          valueOrDefault<String>(
                            FFAppState().filterNps,
                            'Tous',
                          )
                        ],
                      ),
                      wrapped: true,
                    ),
                  ].divide(SizedBox(height: 6.0)),
                ),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Raison',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'GeistSans',
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: false,
                            ),
                      ),
                      FlutterFlowCheckboxGroup(
                        options: [
                          bottomSheetEditClientsRow!.theme1!,
                          bottomSheetEditClientsRow.theme2!,
                          bottomSheetEditClientsRow.theme3!,
                          bottomSheetEditClientsRow.theme4!,
                          'Autre'
                        ],
                        onChanged: (val) => safeSetState(
                            () => _model.checkboxGroupValues = val),
                        controller: _model.checkboxGroupValueController ??=
                            FormFieldController<List<String>>(
                          List.from(FFAppState().filterReason ?? []),
                        ),
                        activeColor: FlutterFlowTheme.of(context).primary,
                        checkColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        checkboxBorderColor:
                            FlutterFlowTheme.of(context).primaryText,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'GeistSans',
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                        checkboxBorderRadius: BorderRadius.circular(4.0),
                        initialized: _model.checkboxGroupValues != null,
                      ),
                    ].divide(SizedBox(height: 6.0)),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Feedback',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'GeistSans',
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: false,
                          ),
                    ),
                    FlutterFlowRadioButton(
                      options: ['Non', 'Oui'].toList(),
                      onChanged: (val) => safeSetState(() {}),
                      controller: _model.radioButtonValueController ??=
                          FormFieldController<String>(valueOrDefault<String>(
                        FFAppState().filterFeedback ? 'Oui' : 'Non',
                        'Non',
                      )),
                      optionHeight: 32.0,
                      textStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'GeistSans',
                                letterSpacing: 0.0,
                                useGoogleFonts: false,
                              ),
                      selectedTextStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'GeistSans',
                                letterSpacing: 0.0,
                                useGoogleFonts: false,
                              ),
                      buttonPosition: RadioButtonPosition.left,
                      direction: Axis.horizontal,
                      radioButtonColor: FlutterFlowTheme.of(context).primary,
                      inactiveRadioButtonColor:
                          FlutterFlowTheme.of(context).secondaryText,
                      toggleable: false,
                      horizontalAlignment: WrapAlignment.start,
                      verticalAlignment: WrapCrossAlignment.start,
                    ),
                  ].divide(SizedBox(height: 6.0)),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    FFAppState().filterNps = _model.choiceChipsValue!;
                    FFAppState().filterReason =
                        _model.checkboxGroupValues!.toList().cast<String>();
                    FFAppState().filterFeedback =
                        _model.radioButtonValue == 'Oui';
                    safeSetState(() {});
                    Navigator.pop(context);
                  },
                  text: 'Appliquer les filtres',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFFEEE8FC),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'GeistSans',
                          color: Color(0xFF5E35B1),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: false,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 0.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ].divide(SizedBox(height: 16.0)),
            ),
          ),
        );
      },
    );
  }
}
