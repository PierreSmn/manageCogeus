import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'change_color_model.dart';
export 'change_color_model.dart';

class ChangeColorWidget extends StatefulWidget {
  const ChangeColorWidget({
    super.key,
    required this.title,
    required this.text,
    required this.button,
    required this.buttonTxt,
    required this.id,
  });

  final String? title;
  final String? text;
  final String? button;
  final String? buttonTxt;
  final int? id;

  @override
  State<ChangeColorWidget> createState() => _ChangeColorWidgetState();
}

class _ChangeColorWidgetState extends State<ChangeColorWidget> {
  late ChangeColorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChangeColorModel());

    _model.colorTitleTextController ??=
        TextEditingController(text: widget.title);
    _model.colorTitleFocusNode ??= FocusNode();

    _model.colorTextTextController ??=
        TextEditingController(text: widget.text);
    _model.colorTextFocusNode ??= FocusNode();

    _model.colorButtonTextController ??=
        TextEditingController(text: widget.button);
    _model.colorButtonFocusNode ??= FocusNode();

    _model.colorButtonTextTextController ??=
        TextEditingController(text: widget.buttonTxt);
    _model.colorButtonTextFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Changement de couleur',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Manrope',
                    color: FlutterFlowTheme.of(context).revoCardTextColor,
                    fontSize: 40.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: 200.0,
                      child: TextFormField(
                        controller: _model.colorTitleTextController,
                        focusNode: _model.colorTitleFocusNode,
                        onFieldSubmitted: (_) async {
                          _model.state = _model.colorTitleTextController.text;
                          setState(() {});
                        },
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Couleur du Titre',
                          alignLabelWithHint: false,
                          hintText: '#0E0E10',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Manrope',
                              letterSpacing: 0.0,
                            ),
                        maxLength: 7,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        buildCounter: (context,
                                {required currentLength,
                                required isFocused,
                                maxLength}) =>
                            null,
                        validator: _model.colorTitleTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 60.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: colorFromCssString(
                            _model.colorTitleTextController.text,
                            defaultColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                      ),
                    ),
                  ].divide(const SizedBox(width: 34.0)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: 200.0,
                      child: TextFormField(
                        controller: _model.colorTextTextController,
                        focusNode: _model.colorTextFocusNode,
                        onFieldSubmitted: (_) async {
                          _model.state = _model.colorTextTextController.text;
                          setState(() {});
                        },
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Couleur du Texte',
                          alignLabelWithHint: false,
                          hintText: '#7F7E83',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Manrope',
                              letterSpacing: 0.0,
                            ),
                        maxLength: 7,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        buildCounter: (context,
                                {required currentLength,
                                required isFocused,
                                maxLength}) =>
                            null,
                        validator: _model.colorTextTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 60.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: colorFromCssString(
                            _model.colorTextTextController.text,
                            defaultColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                      ),
                    ),
                  ].divide(const SizedBox(width: 34.0)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: 200.0,
                      child: TextFormField(
                        controller: _model.colorButtonTextController,
                        focusNode: _model.colorButtonFocusNode,
                        onFieldSubmitted: (_) async {
                          _model.state = _model.colorButtonTextController.text;
                          setState(() {});
                        },
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Couleur fond du Bouton',
                          alignLabelWithHint: false,
                          hintText: '#0071E3',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Manrope',
                              letterSpacing: 0.0,
                            ),
                        maxLength: 7,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        buildCounter: (context,
                                {required currentLength,
                                required isFocused,
                                maxLength}) =>
                            null,
                        validator: _model.colorButtonTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 60.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: colorFromCssString(
                            _model.colorButtonTextController.text,
                            defaultColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                      ),
                    ),
                  ].divide(const SizedBox(width: 34.0)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: 200.0,
                      child: TextFormField(
                        controller: _model.colorButtonTextTextController,
                        focusNode: _model.colorButtonTextFocusNode,
                        onFieldSubmitted: (_) async {
                          _model.state =
                              _model.colorButtonTextTextController.text;
                          setState(() {});
                        },
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Texte du Bouton',
                          alignLabelWithHint: false,
                          hintText: '#FFFFFF',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Manrope',
                              letterSpacing: 0.0,
                            ),
                        maxLength: 7,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        buildCounter: (context,
                                {required currentLength,
                                required isFocused,
                                maxLength}) =>
                            null,
                        validator: _model.colorButtonTextTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 60.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: colorFromCssString(
                            _model.colorButtonTextTextController.text,
                            defaultColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                      ),
                    ),
                  ].divide(const SizedBox(width: 34.0)),
                ),
              ].divide(const SizedBox(height: 12.0)),
            ),
            FFButtonWidget(
              onPressed: () async {
                await LiveFlowsTable().update(
                  data: {
                    'colorTitle': _model.colorTitleTextController.text,
                    'colorText': _model.colorTextTextController.text,
                    'colorButton': _model.colorButtonTextController.text,
                    'colorButtonText':
                        _model.colorButtonTextTextController.text,
                  },
                  matchingRows: (rows) => rows.eq(
                    'id',
                    widget.id,
                  ),
                );
                FFAppState().colorChange = true;
                setState(() {});
                Navigator.pop(context);
              },
              text: 'Changer de couleur',
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
          ].divide(const SizedBox(height: 12.0)),
        ),
      ),
    );
  }
}
