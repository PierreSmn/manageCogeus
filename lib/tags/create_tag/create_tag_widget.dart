import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'create_tag_model.dart';
export 'create_tag_model.dart';

class CreateTagWidget extends StatefulWidget {
  const CreateTagWidget({super.key});

  @override
  State<CreateTagWidget> createState() => _CreateTagWidgetState();
}

class _CreateTagWidgetState extends State<CreateTagWidget> {
  late CreateTagModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateTagModel());

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
    context.watch<FFAppState>();

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
            'Créer une Collection',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Manrope',
                  color: FlutterFlowTheme.of(context).revoCardTextColor,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
            child: TextFormField(
              controller: _model.textController,
              focusNode: _model.textFieldFocusNode,
              autofocus: false,
              textCapitalization: TextCapitalization.sentences,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Nom de la Collection',
                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Manrope',
                      color: FlutterFlowTheme.of(context).inputTitleGrey,
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                    ),
                hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Manrope',
                      color: FlutterFlowTheme.of(context).inputTitleGrey,
                      fontSize: 15.0,
                      letterSpacing: 0.0,
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0x00000000),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0x00000000),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).inputNoGoodClicked,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).inputNoGoodClicked,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                filled: true,
                fillColor: FlutterFlowTheme.of(context).inputBg,
                contentPadding: const EdgeInsets.all(16.0),
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Manrope',
                    color: FlutterFlowTheme.of(context).revoCardTextColor,
                    fontSize: 15.0,
                    letterSpacing: 0.0,
                  ),
              validator: _model.textControllerValidator.asValidator(context),
            ),
          ),
          FFButtonWidget(
            onPressed: () async {
              await TagsTable().insert({
                'brand_name': FFAppState().activeBrand,
                'owner': currentUserUid,
                'name': _model.textController.text,
              });
              Navigator.pop(context);
            },
            text: 'Créer',
            icon: const Icon(
              Icons.check_sharp,
              size: 15.0,
            ),
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
        ].addToStart(const SizedBox(height: 28.0)).addToEnd(const SizedBox(height: 28.0)),
      ),
    );
  }
}
