import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/experience_related/edit_engagement/edit_engagement_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'create_profile_model.dart';
export 'create_profile_model.dart';

class CreateProfileWidget extends StatefulWidget {
  const CreateProfileWidget({
    super.key,
    this.clid,
    this.np1,
  });

  final int? clid;
  final int? np1;

  @override
  State<CreateProfileWidget> createState() => _CreateProfileWidgetState();
}

class _CreateProfileWidgetState extends State<CreateProfileWidget>
    with TickerProviderStateMixin {
  late CreateProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateProfileModel());

    _model.nameTextController ??= TextEditingController();
    _model.nameFocusNode ??= FocusNode();

    _model.lastNameTextController ??= TextEditingController();
    _model.lastNameFocusNode ??= FocusNode();

    _model.phoneTextController ??= TextEditingController(text: '+33');
    _model.phoneFocusNode ??= FocusNode();

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
        title: 'createProfile',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                                                  32.0, 24.0, 0.0, 0.0),
                                          child: Text(
                                            'Completer votre Profil',
                                            style: FlutterFlowTheme.of(context)
                                                .displaySmall
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (currentUserUid != '')
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
                                                  controller:
                                                      _model.nameTextController,
                                                  focusNode:
                                                      _model.nameFocusNode,
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText: 'Prénom',
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          color:
                                                              const Color(0xFF778089),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .inputTitleGrey,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
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
                                                              12.0),
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
                                                              12.0),
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
                                                              12.0),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .inputBg,
                                                    contentPadding:
                                                        const EdgeInsets.all(16.0),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  validator: _model
                                                      .nameTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                              SizedBox(
                                                width: double.infinity,
                                                child: TextFormField(
                                                  controller: _model
                                                      .lastNameTextController,
                                                  focusNode:
                                                      _model.lastNameFocusNode,
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText: 'Nom de famille',
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .inputTitleGrey,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .inputTitleGrey,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
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
                                                              12.0),
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
                                                              12.0),
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
                                                              12.0),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .inputBg,
                                                    contentPadding:
                                                        const EdgeInsets.all(16.0),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .revoCardTextColor,
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  validator: _model
                                                      .lastNameTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                              SizedBox(
                                                width: double.infinity,
                                                child: TextFormField(
                                                  controller: _model
                                                      .phoneTextController,
                                                  focusNode:
                                                      _model.phoneFocusNode,
                                                  autofocus: false,
                                                  textCapitalization:
                                                      TextCapitalization.none,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText: 'Téléphone',
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .inputTitleGrey,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .inputTitleGrey,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
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
                                                              12.0),
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
                                                              12.0),
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
                                                              12.0),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .inputBg,
                                                    contentPadding:
                                                        const EdgeInsets.all(16.0),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .revoCardTextColor,
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  keyboardType:
                                                      TextInputType.phone,
                                                  validator: _model
                                                      .phoneTextControllerValidator
                                                      .asValidator(context),
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter
                                                        .allow(RegExp('[0-9]'))
                                                  ],
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Builder(
                                                  builder: (context) =>
                                                      FFButtonWidget(
                                                    onPressed: () async {
                                                      if (widget.clid !=
                                                          null) {
                                                        _model.clientRowclassic =
                                                            await ClientsTable()
                                                                .queryRows(
                                                          queryFn: (q) => q.eq(
                                                            'id',
                                                            widget.clid,
                                                          ),
                                                        );
                                                        _model.updatedUserclassic =
                                                            await UsersTable()
                                                                .update(
                                                          data: {
                                                            'company_name': _model
                                                                .clientRowclassic
                                                                ?.firstOrNull
                                                                ?.name,
                                                            'site_url': _model
                                                                .clientRowclassic
                                                                ?.firstOrNull
                                                                ?.siteUrl,
                                                            'client_id': _model
                                                                .clientRowclassic
                                                                ?.firstOrNull
                                                                ?.id,
                                                            'phone_number': _model
                                                                .phoneTextController
                                                                .text,
                                                            'first_name': _model
                                                                .nameTextController
                                                                .text,
                                                            'last_name': _model
                                                                .lastNameTextController
                                                                .text,
                                                          },
                                                          matchingRows:
                                                              (rows) => rows.eq(
                                                            'id',
                                                            currentUserUid,
                                                          ),
                                                          returnRows: true,
                                                        );
                                                        await SendNotificaitonOfNewUserCall
                                                            .call(
                                                          companyName: _model
                                                              .updatedUserclassic
                                                              ?.firstOrNull
                                                              ?.companyName,
                                                          name: _model
                                                              .updatedUserclassic
                                                              ?.firstOrNull
                                                              ?.firstName,
                                                          surname: _model
                                                              .updatedUserclassic
                                                              ?.firstOrNull
                                                              ?.lastName,
                                                          email: _model
                                                              .updatedUserclassic
                                                              ?.firstOrNull
                                                              ?.email,
                                                          phone: _model
                                                              .updatedUserclassic
                                                              ?.firstOrNull
                                                              ?.phoneNumber,
                                                          siteUrl: _model
                                                              .updatedUserclassic
                                                              ?.firstOrNull
                                                              ?.siteUrl,
                                                        );

                                                        FFAppState()
                                                                .activeBrand =
                                                            _model
                                                                .updatedUserclassic!
                                                                .firstOrNull!
                                                                .companyName!;
                                                        FFAppState()
                                                                .activeClientID =
                                                            _model
                                                                .updatedUserclassic!
                                                                .firstOrNull!
                                                                .clientId!;
                                                        safeSetState(() {});
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (dialogContext) {
                                                            return Dialog(
                                                              elevation: 0,
                                                              insetPadding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              alignment: const AlignmentDirectional(
                                                                      0.0, 0.0)
                                                                  .resolve(
                                                                      Directionality.of(
                                                                          context)),
                                                              child:
                                                                  WebViewAware(
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    FocusScope.of(
                                                                            dialogContext)
                                                                        .unfocus();
                                                                    FocusManager
                                                                        .instance
                                                                        .primaryFocus
                                                                        ?.unfocus();
                                                                  },
                                                                  child:
                                                                      const EditEngagementWidget(),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );

                                                        context.goNamed('home');
                                                      } else {
                                                        if (widget.np1 !=
                                                            null) {
                                                          _model.clientRownp1Set =
                                                              await ClientsNp1Table()
                                                                  .queryRows(
                                                            queryFn: (q) =>
                                                                q.eq(
                                                              'id',
                                                              widget.np1,
                                                            ),
                                                          );
                                                          _model.updatedUsernp1set =
                                                              await UsersTable()
                                                                  .update(
                                                            data: {
                                                              'company_name': _model
                                                                  .clientRownp1Set
                                                                  ?.firstOrNull
                                                                  ?.name,
                                                              'site_url': _model
                                                                  .clientRownp1Set
                                                                  ?.firstOrNull
                                                                  ?.siteUrl,
                                                              'phone_number': _model
                                                                  .phoneTextController
                                                                  .text,
                                                              'first_name': _model
                                                                  .nameTextController
                                                                  .text,
                                                              'last_name': _model
                                                                  .lastNameTextController
                                                                  .text,
                                                              'np1_id': _model
                                                                  .clientRownp1Set
                                                                  ?.firstOrNull
                                                                  ?.id,
                                                              'client_id': _model
                                                                  .clientRownp1Set
                                                                  ?.firstOrNull
                                                                  ?.clientPrincipalId,
                                                            },
                                                            matchingRows:
                                                                (rows) =>
                                                                    rows.eq(
                                                              'id',
                                                              currentUserUid,
                                                            ),
                                                            returnRows: true,
                                                          );
                                                          await SendNotificaitonOfNewUserCall
                                                              .call(
                                                            companyName: _model
                                                                .updatedUsernp1set
                                                                ?.firstOrNull
                                                                ?.companyName,
                                                            name: _model
                                                                .updatedUsernp1set
                                                                ?.firstOrNull
                                                                ?.firstName,
                                                            surname: _model
                                                                .updatedUsernp1set
                                                                ?.firstOrNull
                                                                ?.lastName,
                                                            email: _model
                                                                .updatedUsernp1set
                                                                ?.firstOrNull
                                                                ?.email,
                                                            phone: _model
                                                                .updatedUsernp1set
                                                                ?.firstOrNull
                                                                ?.phoneNumber,
                                                            siteUrl: _model
                                                                .updatedUsernp1set
                                                                ?.firstOrNull
                                                                ?.siteUrl,
                                                          );

                                                          FFAppState().isNp1 =
                                                              true;
                                                          FFAppState()
                                                                  .activeNp1 =
                                                              widget.np1!;
                                                          FFAppState()
                                                                  .activeClientID =
                                                              _model
                                                                  .clientRownp1Set!
                                                                  .firstOrNull!
                                                                  .clientPrincipalId!;
                                                          FFAppState()
                                                                  .activeBrand =
                                                              _model
                                                                  .clientRownp1Set!
                                                                  .firstOrNull!
                                                                  .name!;
                                                          safeSetState(() {});
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
                                                                insetPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                alignment: const AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                                child:
                                                                    WebViewAware(
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      FocusScope.of(
                                                                              dialogContext)
                                                                          .unfocus();
                                                                      FocusManager
                                                                          .instance
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    child:
                                                                        const EditEngagementWidget(),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );

                                                          context
                                                              .goNamed('home');
                                                        } else {
                                                          await UsersTable()
                                                              .update(
                                                            data: {
                                                              'first_name': _model
                                                                  .nameTextController
                                                                  .text,
                                                              'last_name': _model
                                                                  .lastNameTextController
                                                                  .text,
                                                              'phone_number': _model
                                                                  .phoneTextController
                                                                  .text,
                                                            },
                                                            matchingRows:
                                                                (rows) =>
                                                                    rows.eq(
                                                              'id',
                                                              currentUserUid,
                                                            ),
                                                          );

                                                          context.pushNamed(
                                                              'createProfileClient');
                                                        }
                                                      }

                                                      safeSetState(() {});
                                                    },
                                                    text: 'Continuer',
                                                    options: FFButtonOptions(
                                                      width: 230.0,
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
                                                      color: const Color(0xFFEEE8FC),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Manrope',
                                                                color: const Color(
                                                                    0xFF5E35B1),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                      elevation: 0.0,
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 0.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
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
