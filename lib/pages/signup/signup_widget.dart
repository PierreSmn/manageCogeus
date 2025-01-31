import '/auth/supabase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'signup_model.dart';
export 'signup_model.dart';

class SignupWidget extends StatefulWidget {
  const SignupWidget({
    super.key,
    required this.brandId,
    this.clid,
    this.np1,
    required this.type,
  });

  final int? brandId;
  final int? clid;
  final int? np1;
  final String? type;

  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget>
    with TickerProviderStateMixin {
  late SignupModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignupModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (loggedIn) {
        context.pushNamed(
          'infos',
          extra: <String, dynamic>{
            kTransitionInfoKey: const TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
            ),
          },
        );
      }
      if (widget.brandId != null) {
        _model.isBrandSet = true;
        safeSetState(() {});
      }
    });

    _model.emailTextController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();

    _model.passwordTextController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();

    _model.confirmPasswordTextController ??= TextEditingController();
    _model.confirmPasswordFocusNode ??= FocusNode();

    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(0.0, 60.0),
            end: const Offset(0.0, 0.0),
          ),
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(-0.349, 0),
            end: const Offset(0, 0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'signup',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).revoBG,
            body: SafeArea(
              top: true,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 8,
                    child: Container(
                      width: 100.0,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      alignment: const AlignmentDirectional(0.0, -1.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 20.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(16.0),
                                    bottomRight: Radius.circular(16.0),
                                    topLeft: Radius.circular(0.0),
                                    topRight: Radius.circular(0.0),
                                  ),
                                ),
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          'https://pifcxlqwffdrqcwggoqb.supabase.co/storage/v1/object/public/conversations/ffUploads/1714658498448000.png',
                                          width: 130.0,
                                          height: 100.0,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              constraints: const BoxConstraints(
                                maxWidth: 579.0,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).revoWhite,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 24.0, 0.0, 0.0),
                                          child: Text(
                                            'Créer un compte',
                                            style: FlutterFlowTheme.of(context)
                                                .displaySmall
                                                .override(
                                                  fontFamily: 'GeistSans',
                                                  fontSize: 26.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                  lineHeight: 1.618,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (currentUserUid == '')
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: double.infinity,
                                                child: TextFormField(
                                                  controller: _model
                                                      .emailTextController,
                                                  focusNode:
                                                      _model.emailFocusNode,
                                                  autofocus: false,
                                                  autofillHints: const [
                                                    AutofillHints.email
                                                  ],
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText: 'Email',
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'GeistSans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .inputTitleGrey,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'GeistSans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .inputTitleGrey,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Color(0xFFE4E5E6),
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .inputNoGoodClicked,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .inputNoGoodClicked,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                    contentPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 8.0,
                                                                16.0, 8.0),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'GeistSans',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .revoCardTextColor,
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                  validator: _model
                                                      .emailTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                              SizedBox(
                                                width: double.infinity,
                                                child: TextFormField(
                                                  controller: _model
                                                      .passwordTextController,
                                                  focusNode:
                                                      _model.passwordFocusNode,
                                                  autofocus: false,
                                                  obscureText: !_model
                                                      .passwordVisibility,
                                                  decoration: InputDecoration(
                                                    labelText: 'Mot de passe',
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'GeistSans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .inputTitleGrey,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Color(0xFFE4E5E6),
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .inputNoGoodClicked,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .inputNoGoodClicked,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                    contentPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 8.0,
                                                                16.0, 8.0),
                                                    suffixIcon: InkWell(
                                                      onTap: () => safeSetState(
                                                        () => _model
                                                                .passwordVisibility =
                                                            !_model
                                                                .passwordVisibility,
                                                      ),
                                                      focusNode: FocusNode(
                                                          skipTraversal: true),
                                                      child: Icon(
                                                        _model.passwordVisibility
                                                            ? Icons
                                                                .visibility_outlined
                                                            : Icons
                                                                .visibility_off_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .inputTitleGrey,
                                                        size: 20.0,
                                                      ),
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'GeistSans',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .revoCardTextColor,
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                  validator: _model
                                                      .passwordTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                              SizedBox(
                                                width: double.infinity,
                                                child: TextFormField(
                                                  controller: _model
                                                      .confirmPasswordTextController,
                                                  focusNode: _model
                                                      .confirmPasswordFocusNode,
                                                  autofocus: false,
                                                  obscureText: !_model
                                                      .confirmPasswordVisibility,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        'Confirmer le mot de passe',
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'GeistSans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .inputTitleGrey,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Color(0xFFE4E5E6),
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .inputNoGoodClicked,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .inputNoGoodClicked,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                    contentPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 8.0,
                                                                16.0, 8.0),
                                                    suffixIcon: InkWell(
                                                      onTap: () => safeSetState(
                                                        () => _model
                                                                .confirmPasswordVisibility =
                                                            !_model
                                                                .confirmPasswordVisibility,
                                                      ),
                                                      focusNode: FocusNode(
                                                          skipTraversal: true),
                                                      child: Icon(
                                                        _model.confirmPasswordVisibility
                                                            ? Icons
                                                                .visibility_outlined
                                                            : Icons
                                                                .visibility_off_outlined,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .revoSearchIconColor,
                                                        size: 20.0,
                                                      ),
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'GeistSans',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .revoCardTextColor,
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                  validator: _model
                                                      .confirmPasswordTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    GoRouter.of(context)
                                                        .prepareAuthEvent();
                                                    if (_model
                                                            .passwordTextController
                                                            .text !=
                                                        _model
                                                            .confirmPasswordTextController
                                                            .text) {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        const SnackBar(
                                                          content: Text(
                                                            'Passwords don\'t match!',
                                                          ),
                                                        ),
                                                      );
                                                      return;
                                                    }

                                                    final user = await authManager
                                                        .createAccountWithEmail(
                                                      context,
                                                      _model.emailTextController
                                                          .text,
                                                      _model
                                                          .passwordTextController
                                                          .text,
                                                    );
                                                    if (user == null) {
                                                      return;
                                                    }

                                                    context.goNamedAuth(
                                                      'createProfile',
                                                      context.mounted,
                                                      queryParameters: {
                                                        'clid': serializeParam(
                                                          widget.clid,
                                                          ParamType.int,
                                                        ),
                                                        'type': serializeParam(
                                                          widget.type,
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  text: 'Continuer',
                                                  options: FFButtonOptions(
                                                    width: double.infinity,
                                                    height: 40.0,
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: const Color(0xFFEEE8FC),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'GeistSans',
                                                          color:
                                                              const Color(0xFF5E35B1),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: false,
                                                        ),
                                                    elevation: 0.0,
                                                    borderSide: const BorderSide(
                                                      color: Colors.transparent,
                                                      width: 0.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                            ].divide(const SizedBox(height: 16.0)),
                                          ).animateOnPageLoad(animationsMap[
                                              'columnOnPageLoadAnimation']!),
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
          ),
        ));
  }
}
