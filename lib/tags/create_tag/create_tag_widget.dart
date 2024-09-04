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
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).revoWhite,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Créer un Tag',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Manrope',
                  color: FlutterFlowTheme.of(context).revoCardTextColor,
                  fontSize: 22,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
            child: TextFormField(
              controller: _model.textController,
              focusNode: _model.textFieldFocusNode,
              autofocus: false,
              textCapitalization: TextCapitalization.sentences,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Nom du Tag',
                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Manrope',
                      color: const Color(0xFF778089),
                      letterSpacing: 0.0,
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0x00000000),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).primary,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
                filled: true,
                fillColor: FlutterFlowTheme.of(context).revoSearchBarBg,
                contentPadding: const EdgeInsets.all(16),
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Manrope',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontSize: 15,
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
            text: 'Créer le Tag',
            icon: const Icon(
              Icons.check_sharp,
              size: 15,
            ),
            options: FFButtonOptions(
              height: 40,
              padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
              iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
              color: const Color(0xFFEEE8FC),
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Manrope',
                    color: const Color(0xFF5E35B1),
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                  ),
              elevation: 0,
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 0,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ].addToStart(const SizedBox(height: 28)).addToEnd(const SizedBox(height: 28)),
      ),
    );
  }
}
