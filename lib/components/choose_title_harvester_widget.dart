import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'choose_title_harvester_model.dart';
export 'choose_title_harvester_model.dart';

class ChooseTitleHarvesterWidget extends StatefulWidget {
  const ChooseTitleHarvesterWidget({
    super.key,
    this.harbesterID,
  });

  final int? harbesterID;

  @override
  State<ChooseTitleHarvesterWidget> createState() =>
      _ChooseTitleHarvesterWidgetState();
}

class _ChooseTitleHarvesterWidgetState
    extends State<ChooseTitleHarvesterWidget> {
  late ChooseTitleHarvesterModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChooseTitleHarvesterModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Choisir un titre',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'GeistSans',
                  color: FlutterFlowTheme.of(context).revoCardTextColor,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                  useGoogleFonts: false,
                ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
            child: TextFormField(
              controller: _model.textController,
              focusNode: _model.textFieldFocusNode,
              autofocus: false,
              textCapitalization: TextCapitalization.sentences,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Nom du Harvester',
                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'GeistSans',
                      color: FlutterFlowTheme.of(context).inputTitleGrey,
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      useGoogleFonts: false,
                    ),
                hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'GeistSans',
                      color: FlutterFlowTheme.of(context).inputTitleGrey,
                      fontSize: 15.0,
                      letterSpacing: 0.0,
                      useGoogleFonts: false,
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).shadcnCardBorderGrey,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).shadcnInputSelected,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).inputNoGoodClicked,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).inputNoGoodClicked,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                fillColor: FlutterFlowTheme.of(context).primaryBackground,
                contentPadding:
                    EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'GeistSans',
                    color: FlutterFlowTheme.of(context).revoCardTextColor,
                    fontSize: 15.0,
                    letterSpacing: 0.0,
                    useGoogleFonts: false,
                  ),
              validator: _model.textControllerValidator.asValidator(context),
            ),
          ),
          FFButtonWidget(
            onPressed: () async {
              await LiveFlowsTable().update(
                data: {
                  'title': _model.textController.text,
                },
                matchingRows: (rows) => rows.eqOrNull(
                  'id',
                  widget.harbesterID,
                ),
              );
              Navigator.pop(context);
            },
            text: 'Mettre à jour',
            icon: Icon(
              Icons.check_sharp,
              size: 15.0,
            ),
            options: FFButtonOptions(
              height: 40.0,
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
        ].addToStart(SizedBox(height: 28.0)).addToEnd(SizedBox(height: 28.0)),
      ),
    );
  }
}
