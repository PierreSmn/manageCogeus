import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/library_components/button/button_widget.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'text_area_model.dart';
export 'text_area_model.dart';

class TextAreaWidget extends StatefulWidget {
  const TextAreaWidget({
    super.key,
    this.label,
    required this.hintText,
    this.description,
    bool? button,
    this.buttonText,
    this.buttonOnTapAction,
    this.buttonVariant,
    int? minLineCount,
    int? maxLineCount,
    this.initialValue,
  })  : this.button = button ?? false,
        this.minLineCount = minLineCount ?? 4,
        this.maxLineCount = maxLineCount ?? 4;

  final String? label;
  final String? hintText;
  final String? description;
  final bool button;
  final String? buttonText;
  final Future Function()? buttonOnTapAction;
  final ButtonVariant? buttonVariant;
  final int minLineCount;
  final int maxLineCount;
  final String? initialValue;

  @override
  State<TextAreaWidget> createState() => _TextAreaWidgetState();
}

class _TextAreaWidgetState extends State<TextAreaWidget> {
  late TextAreaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TextAreaModel());

    _model.textController ??= TextEditingController(text: widget!.initialValue);
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(() => safeSetState(() {}));
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
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (valueOrDefault<bool>(
            widget!.label != null && widget!.label != '',
            false,
          ))
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 6.0),
              child: Text(
                valueOrDefault<String>(
                  widget!.label,
                  'Label',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Geist',
                      letterSpacing: 0.0,
                      useGoogleFonts: false,
                    ),
              ),
            ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.5),
                    border: Border.all(
                      color: valueOrDefault<Color>(
                        (_model.textFieldFocusNode?.hasFocus ?? false)
                            ? FlutterFlowTheme.of(context).secondaryforeground
                            : Colors.transparent,
                        Colors.transparent,
                      ),
                      width: 2.0,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(1.5),
                    child: Container(
                      width: double.infinity,
                      child: TextFormField(
                        controller: _model.textController,
                        focusNode: _model.textFieldFocusNode,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Geist',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                          hintText: valueOrDefault<String>(
                            widget!.hintText,
                            'Hint Text',
                          ),
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Geist',
                                    color: FlutterFlowTheme.of(context)
                                        .mutedforeground,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).input,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).input,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          filled: true,
                          fillColor: FlutterFlowTheme.of(context).background,
                          hoverColor: Color(0x00FFFFFF),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Geist',
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                            ),
                        maxLines: valueOrDefault<int>(
                          widget!.maxLineCount,
                          4,
                        ),
                        minLines: valueOrDefault<int>(
                          widget!.minLineCount,
                          4,
                        ),
                        cursorColor: FlutterFlowTheme.of(context).primaryText,
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (valueOrDefault<bool>(
            widget!.description != null && widget!.description != '',
            false,
          ))
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(3.0, 6.0, 0.0, 0.0),
              child: Text(
                valueOrDefault<String>(
                  widget!.description,
                  'Description Text',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Geist',
                      color: FlutterFlowTheme.of(context).mutedforeground,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w300,
                      useGoogleFonts: false,
                    ),
              ),
            ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (widget!.button)
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.buttonModel,
                      updateCallback: () => safeSetState(() {}),
                      child: ButtonWidget(
                        text: valueOrDefault<String>(
                          widget!.buttonText,
                          'Button',
                        ),
                        variant: widget!.buttonVariant!,
                        action: () async {
                          await widget.buttonOnTapAction?.call();
                        },
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
