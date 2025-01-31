import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/experience_related/edit_engagement/edit_engagement_widget.dart';
import '/experience_related/pay_stripe/pay_stripe_widget.dart';
import '/experience_related/read_engagement/read_engagement_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/navbarnav/navbarnav_widget.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'redirections_model.dart';
export 'redirections_model.dart';

class RedirectionsWidget extends StatefulWidget {
  const RedirectionsWidget({super.key});

  @override
  State<RedirectionsWidget> createState() => _RedirectionsWidgetState();
}

class _RedirectionsWidgetState extends State<RedirectionsWidget> {
  late RedirectionsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RedirectionsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if ((FFAppState().activeClientID == null) ||
          (FFAppState().activeBrand == '') ||
          (FFAppState().activeClientID == 0)) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                title: const Text('Attention'),
                content: const Text('Vous devez remettre à jour votre profil.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: const Text('Ok'),
                  ),
                ],
              ),
            );
          },
        );

        context.pushNamed('updateProfile');
      }
    });

    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'redirections',
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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FutureBuilder<List<ClientsRow>>(
                    future: (_model.requestCompleter ??=
                            Completer<List<ClientsRow>>()
                              ..complete(ClientsTable().querySingleRow(
                                queryFn: (q) => q.eqOrNull(
                                  'id',
                                  FFAppState().activeClientID,
                                ),
                              )))
                        .future,
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
                      List<ClientsRow> containerClientsRowList = snapshot.data!;

                      final containerClientsRow =
                          containerClientsRowList.isNotEmpty
                              ? containerClientsRowList.first
                              : null;

                      return Container(
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        decoration: const BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            wrapWithModel(
                              model: _model.navbarnavModel,
                              updateCallback: () => safeSetState(() {}),
                              child: const NavbarnavWidget(
                                selectedIndex: 3,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).revoBG,
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      50.0, 32.0, 50.0, 40.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.7,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  'Redirections',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'GeistSans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .revoCardTextColor,
                                                                        fontSize:
                                                                            44.72,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                                Builder(
                                                                  builder:
                                                                      (context) =>
                                                                          Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            24.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        FlutterFlowIconButton(
                                                                      borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                      borderRadius:
                                                                          8.0,
                                                                      buttonSize:
                                                                          40.0,
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .cogeusButtonBG,
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .edit,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      onPressed:
                                                                          () async {
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (dialogContext) {
                                                                            return Dialog(
                                                                              elevation: 0,
                                                                              insetPadding: EdgeInsets.zero,
                                                                              backgroundColor: Colors.transparent,
                                                                              alignment: const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                              child: WebViewAware(
                                                                                child: GestureDetector(
                                                                                  onTap: () {
                                                                                    FocusScope.of(dialogContext).unfocus();
                                                                                    FocusManager.instance.primaryFocus?.unfocus();
                                                                                  },
                                                                                  child: const EditEngagementWidget(),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      FlutterFlowIconButton(
                                                                    borderColor:
                                                                        Colors
                                                                            .transparent,
                                                                    borderRadius:
                                                                        8.0,
                                                                    buttonSize:
                                                                        40.0,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .cogeusButtonBG,
                                                                    icon: Icon(
                                                                      Icons
                                                                          .ios_share,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      await Clipboard.setData(
                                                                          ClipboardData(
                                                                              text: 'https://app.cogeus.com/nps?clid=${FFAppState().activeClientID.toString()}'));
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            'Lien copié',
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                          ),
                                                                          duration:
                                                                              const Duration(milliseconds: 4000),
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  width: 360.0,
                                                                  height: 750.0,
                                                                  decoration:
                                                                      const BoxDecoration(),
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .readEngagementModel,
                                                                    updateCallback: () =>
                                                                        safeSetState(
                                                                            () {}),
                                                                    child:
                                                                        ReadEngagementWidget(
                                                                      id: valueOrDefault<
                                                                          int>(
                                                                        FFAppState()
                                                                            .activeClientID,
                                                                        5,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.4,
                                                                  height: 750.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .revoWhite,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            16.0),
                                                                    child:
                                                                        SingleChildScrollView(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children:
                                                                            [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              Text(
                                                                                'Branding',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'GeistSans',
                                                                                      color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                      fontSize: 28.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      useGoogleFonts: false,
                                                                                    ),
                                                                              ),
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Builder(
                                                                                    builder: (context) => FFButtonWidget(
                                                                                      onPressed: () async {
                                                                                        _model.userRow = await UsersTable().queryRows(
                                                                                          queryFn: (q) => q.eqOrNull(
                                                                                            'id',
                                                                                            currentUserUid,
                                                                                          ),
                                                                                        );
                                                                                        if (_model.userRow!.firstOrNull!.activeSub!) {
                                                                                          _model.npsLink = 'https://app.cogeus.com/nps?clid=${FFAppState().activeClientID.toString()}&nps=';
                                                                                          safeSetState(() {});
                                                                                          await Clipboard.setData(ClipboardData(
                                                                                              text: '<!DOCTYPE html><html lang=\"fr\"><head>  <meta charset=\"UTF-8\">  <title> </title></head><body>  <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">    <tr>      <td align=\"center\" style=\"padding:30px 0;\">        <table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\" style=\"width: 320px; font-family: System, Helvetica, sans-serif; margin: auto;\">          <tr>            <td style=\"font-size: 20px; padding-bottom: 10px; text-align: center;\">              Sur une échelle de 0 à 10, quelle est la probabilité que vous recommandiez ${FFAppState().activeBrand} à un ami ?            </td>          </tr>          <tr>            <td height=\"10\"></td>          </tr>          <!-- Score 10 -->          <tr>            <td style=\"background-color: ${valueOrDefault<String>(
                                                                                            containerClientsRow?.color,
                                                                                            '#1c4494',
                                                                                          )}; border-radius: 4px; width: 150px; height: 30px; text-align: center; vertical-align: middle; margin: 5px 0;\">              <a href=\"${_model.npsLink}10\" style=\"display: block; width: 100%; height: 100%; text-decoration: none; color: #ffffff; font-size: 14px; line-height: 30px; font-family: Arial, sans-serif;\">                10 - Très probable              </a>            </td>          </tr>          <tr>            <td height=\"5\"></td>          </tr>          <!-- Score 9 -->          <tr>            <td style=\"background-color: ${valueOrDefault<String>(
                                                                                            containerClientsRow?.color,
                                                                                            '#1c4494',
                                                                                          )}; border-radius: 4px; width: 150px; height: 30px; text-align: center; vertical-align: middle; margin: 5px 0;\">              <a href=\"${_model.npsLink}9\" style=\"display: block; width: 100%; height: 100%; text-decoration: none; color: #ffffff; font-size: 16px; line-height: 30px; font-family: Arial, sans-serif;\">                9              </a>            </td>          </tr>          <tr>            <td height=\"5\"></td>          </tr>          <!-- Score 8 -->          <tr>            <td style=\"background-color: ${valueOrDefault<String>(
                                                                                            containerClientsRow?.color,
                                                                                            '#1c4494',
                                                                                          )}; border-radius: 4px; width: 150px; height: 30px; text-align: center; vertical-align: middle; margin: 5px 0;\">              <a href=\"${_model.npsLink}8\" style=\"display: block; width: 100%; height: 100%; text-decoration: none; color: #ffffff; font-size: 16px; line-height: 30px; font-family: Arial, sans-serif;\">                8              </a>            </td>          </tr>          <tr>            <td height=\"5\"></td>          </tr>          <!-- Score 7 -->          <tr>            <td style=\"background-color: ${valueOrDefault<String>(
                                                                                            containerClientsRow?.color,
                                                                                            '#1c4494',
                                                                                          )}; border-radius: 4px; width: 150px; height: 30px; text-align: center; vertical-align: middle; margin: 5px 0;\">              <a href=\"${_model.npsLink}7\" style=\"display: block; width: 100%; height: 100%; text-decoration: none; color: #ffffff; font-size: 16px; line-height: 30px; font-family: Arial, sans-serif;\">                7              </a>            </td>          </tr>          <tr>            <td height=\"5\"></td>          </tr>          <!-- Score 6 -->          <tr>            <td style=\"background-color: ${valueOrDefault<String>(
                                                                                            containerClientsRow?.color,
                                                                                            '#1c4494',
                                                                                          )}; border-radius: 4px; width: 150px; height: 30px; text-align: center; vertical-align: middle; margin: 5px 0;\">              <a href=\"${_model.npsLink}6\" style=\"display: block; width: 100%; height: 100%; text-decoration: none; color: #ffffff; font-size: 16px; line-height: 30px; font-family: Arial, sans-serif;\">                6              </a>            </td>          </tr>          <tr>            <td height=\"5\"></td>          </tr>          <!-- Score 5 -->          <tr>            <td style=\"background-color: ${valueOrDefault<String>(
                                                                                            containerClientsRow?.color,
                                                                                            '#1c4494',
                                                                                          )}; border-radius: 4px; width: 150px; height: 30px; text-align: center; vertical-align: middle; margin: 5px 0;\">              <a href=\"${_model.npsLink}5\" style=\"display: block; width: 100%; height: 100%; text-decoration: none; color: #ffffff; font-size: 16px; line-height: 30px; font-family: Arial, sans-serif;\">                5              </a>            </td>          </tr>          <tr>            <td height=\"5\"></td>          </tr>          <!-- Score 4 -->          <tr>            <td style=\"background-color: ${valueOrDefault<String>(
                                                                                            containerClientsRow?.color,
                                                                                            '#1c4494',
                                                                                          )}; border-radius: 4px; width: 150px; height: 30px; text-align: center; vertical-align: middle; margin: 5px 0;\">              <a href=\"${_model.npsLink}4\" style=\"display: block; width: 100%; height: 100%; text-decoration: none; color: #ffffff; font-size: 16px; line-height: 30px; font-family: Arial, sans-serif;\">                4              </a>            </td>          </tr>          <tr>            <td height=\"5\"></td>          </tr>          <!-- Score 3 -->          <tr>            <td style=\"background-color: ${valueOrDefault<String>(
                                                                                            containerClientsRow?.color,
                                                                                            '#1c4494',
                                                                                          )}; border-radius: 4px; width: 150px; height: 30px; text-align: center; vertical-align: middle; margin: 5px 0;\">              <a href=\"${_model.npsLink}3\" style=\"display: block; width: 100%; height: 100%; text-decoration: none; color: #ffffff; font-size: 16px; line-height: 30px; font-family: Arial, sans-serif;\">                3              </a>            </td>          </tr>          <tr>            <td height=\"5\"></td>          </tr>          <!-- Score 2 -->          <tr>            <td style=\"background-color: ${valueOrDefault<String>(
                                                                                            containerClientsRow?.color,
                                                                                            '#1c4494',
                                                                                          )}; border-radius: 4px; width: 150px; height: 30px; text-align: center; vertical-align: middle; margin: 5px 0;\">              <a href=\"${_model.npsLink}2\" style=\"display: block; width: 100%; height: 100%; text-decoration: none; color: #ffffff; font-size: 16px; line-height: 30px; font-family: Arial, sans-serif;\">                2              </a>            </td>          </tr>          <tr>            <td height=\"5\"></td>          </tr>          <!-- Score 1 -->          <tr>            <td style=\"background-color: ${valueOrDefault<String>(
                                                                                            containerClientsRow?.color,
                                                                                            '#1c4494',
                                                                                          )}; border-radius: 4px; width: 150px; height: 30px; text-align: center; vertical-align: middle; margin: 5px 0;\">              <a href=\"${_model.npsLink}1\" style=\"display: block; width: 100%; height: 100%; text-decoration: none; color: #ffffff; font-size: 16px; line-height: 30px; font-family: Arial, sans-serif;\">                1              </a>            </td>          </tr>          <tr>            <td height=\"5\"></td>          </tr>          <!-- Score 0 -->          <tr>            <td style=\"background-color: ${valueOrDefault<String>(
                                                                                            containerClientsRow?.color,
                                                                                            '#1c4494',
                                                                                          )}; border-radius: 4px; width: 150px; height: 30px; text-align: center; vertical-align: middle; margin: 5px 0;\">              <a href=\"${_model.npsLink}0\" style=\"display: block; width: 100%; height: 100%; text-decoration: none; color: #ffffff; font-size: 14px; line-height: 30px; font-family: Arial, sans-serif;\">                0 - Pas du tout probable              </a>            </td>          </tr>        </table>      </td>    </tr>  </table></body></html>'));
                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                            SnackBar(
                                                                                              content: Text(
                                                                                                'Code copié',
                                                                                                style: TextStyle(
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                ),
                                                                                              ),
                                                                                              duration: const Duration(milliseconds: 4000),
                                                                                              backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                            ),
                                                                                          );
                                                                                        } else {
                                                                                          await showDialog(
                                                                                            context: context,
                                                                                            builder: (dialogContext) {
                                                                                              return Dialog(
                                                                                                elevation: 0,
                                                                                                insetPadding: EdgeInsets.zero,
                                                                                                backgroundColor: Colors.transparent,
                                                                                                alignment: const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                child: WebViewAware(
                                                                                                  child: GestureDetector(
                                                                                                    onTap: () {
                                                                                                      FocusScope.of(dialogContext).unfocus();
                                                                                                      FocusManager.instance.primaryFocus?.unfocus();
                                                                                                    },
                                                                                                    child: const SizedBox(
                                                                                                      height: 230.0,
                                                                                                      width: 360.0,
                                                                                                      child: PayStripeWidget(),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          );
                                                                                        }

                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      text: 'Exporter le code',
                                                                                      options: FFButtonOptions(
                                                                                        height: 40.0,
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                        iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
                                                                                  FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      await launchURL('http://api.qrserver.com/v1/create-qr-code/?data=https://app.cogeus.com/nps?clid=${FFAppState().activeClientID.toString()}');
                                                                                    },
                                                                                    text: 'Télécharger QR code',
                                                                                    options: FFButtonOptions(
                                                                                      height: 40.0,
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
                                                                                  FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      await Clipboard.setData(ClipboardData(text: 'https://app.cogeus.com/nps?clid=${FFAppState().activeClientID.toString()}'));
                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                        SnackBar(
                                                                                          content: Text(
                                                                                            'Lien copié',
                                                                                            style: TextStyle(
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                            ),
                                                                                          ),
                                                                                          duration: const Duration(milliseconds: 4000),
                                                                                          backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                    text: 'Copier le lien',
                                                                                    options: FFButtonOptions(
                                                                                      height: 40.0,
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
                                                                                ].divide(const SizedBox(height: 7.0)),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          SingleChildScrollView(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                MouseRegion(
                                                                                  opaque: false,
                                                                                  cursor: MouseCursor.defer ?? MouseCursor.defer,
                                                                                  onEnter: ((event) async {
                                                                                    safeSetState(() => _model.mouseRegionHovered = true);
                                                                                  }),
                                                                                  onExit: ((event) async {
                                                                                    safeSetState(() => _model.mouseRegionHovered = false);
                                                                                  }),
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsets.all(3.0),
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                        borderRadius: BorderRadius.circular(16.0),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(const SizedBox(height: 8.0)),
                                                                            ),
                                                                          ),
                                                                          SingleChildScrollView(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  'Theme',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Manrope',
                                                                                        fontSize: 16.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsets.all(3.0),
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      borderRadius: BorderRadius.circular(16.0),
                                                                                    ),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: const EdgeInsets.all(3.0),
                                                                                          child: Container(
                                                                                            width: double.infinity,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).revoWhite,
                                                                                              borderRadius: BorderRadius.circular(16.0),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    'Couleur',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Manrope',
                                                                                                          color: FlutterFlowTheme.of(context).secondary,
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                  ),
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: const EdgeInsets.all(3.0),
                                                                                                        child: InkWell(
                                                                                                          splashColor: Colors.transparent,
                                                                                                          focusColor: Colors.transparent,
                                                                                                          hoverColor: Colors.transparent,
                                                                                                          highlightColor: Colors.transparent,
                                                                                                          onTap: () async {
                                                                                                            await ClientsTable().update(
                                                                                                              data: {
                                                                                                                'color': '#1c4494',
                                                                                                              },
                                                                                                              matchingRows: (rows) => rows.eqOrNull(
                                                                                                                'id',
                                                                                                                FFAppState().activeClientID,
                                                                                                              ),
                                                                                                            );
                                                                                                            _model.customColor = false;
                                                                                                            safeSetState(() {});
                                                                                                            safeSetState(() => _model.requestCompleter = null);
                                                                                                            await _model.waitForRequestCompleted();
                                                                                                          },
                                                                                                          child: Container(
                                                                                                            width: 50.0,
                                                                                                            height: 50.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).accent4,
                                                                                                              borderRadius: BorderRadius.circular(100.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: const EdgeInsets.all(3.0),
                                                                                                        child: InkWell(
                                                                                                          splashColor: Colors.transparent,
                                                                                                          focusColor: Colors.transparent,
                                                                                                          hoverColor: Colors.transparent,
                                                                                                          highlightColor: Colors.transparent,
                                                                                                          onTap: () async {
                                                                                                            await ClientsTable().update(
                                                                                                              data: {
                                                                                                                'color': '#000000',
                                                                                                              },
                                                                                                              matchingRows: (rows) => rows.eqOrNull(
                                                                                                                'id',
                                                                                                                FFAppState().activeClientID,
                                                                                                              ),
                                                                                                            );
                                                                                                            _model.customColor = false;
                                                                                                            safeSetState(() {});
                                                                                                            safeSetState(() => _model.requestCompleter = null);
                                                                                                            await _model.waitForRequestCompleted();
                                                                                                          },
                                                                                                          child: Container(
                                                                                                            width: 50.0,
                                                                                                            height: 50.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                              borderRadius: BorderRadius.circular(100.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: const EdgeInsets.all(3.0),
                                                                                                        child: InkWell(
                                                                                                          splashColor: Colors.transparent,
                                                                                                          focusColor: Colors.transparent,
                                                                                                          hoverColor: Colors.transparent,
                                                                                                          highlightColor: Colors.transparent,
                                                                                                          onTap: () async {
                                                                                                            await ClientsTable().update(
                                                                                                              data: {
                                                                                                                'color': '#666666',
                                                                                                              },
                                                                                                              matchingRows: (rows) => rows.eqOrNull(
                                                                                                                'id',
                                                                                                                FFAppState().activeClientID,
                                                                                                              ),
                                                                                                            );
                                                                                                            _model.customColor = false;
                                                                                                            safeSetState(() {});
                                                                                                            safeSetState(() => _model.requestCompleter = null);
                                                                                                            await _model.waitForRequestCompleted();
                                                                                                          },
                                                                                                          child: Container(
                                                                                                            width: 50.0,
                                                                                                            height: 50.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                                                              borderRadius: BorderRadius.circular(100.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: const EdgeInsets.all(3.0),
                                                                                                        child: InkWell(
                                                                                                          splashColor: Colors.transparent,
                                                                                                          focusColor: Colors.transparent,
                                                                                                          hoverColor: Colors.transparent,
                                                                                                          highlightColor: Colors.transparent,
                                                                                                          onTap: () async {
                                                                                                            await ClientsTable().update(
                                                                                                              data: {
                                                                                                                'color': '#52b58e',
                                                                                                              },
                                                                                                              matchingRows: (rows) => rows.eqOrNull(
                                                                                                                'id',
                                                                                                                FFAppState().activeClientID,
                                                                                                              ),
                                                                                                            );
                                                                                                            _model.customColor = false;
                                                                                                            safeSetState(() {});
                                                                                                            safeSetState(() => _model.requestCompleter = null);
                                                                                                            await _model.waitForRequestCompleted();
                                                                                                          },
                                                                                                          child: Container(
                                                                                                            width: 50.0,
                                                                                                            height: 50.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).vertSympa,
                                                                                                              borderRadius: BorderRadius.circular(100.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: const EdgeInsets.all(3.0),
                                                                                                        child: InkWell(
                                                                                                          splashColor: Colors.transparent,
                                                                                                          focusColor: Colors.transparent,
                                                                                                          hoverColor: Colors.transparent,
                                                                                                          highlightColor: Colors.transparent,
                                                                                                          onTap: () async {
                                                                                                            _model.customColor = true;
                                                                                                            safeSetState(() {});
                                                                                                          },
                                                                                                          child: Container(
                                                                                                            width: 50.0,
                                                                                                            height: 50.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).cogeusButtonBG,
                                                                                                              borderRadius: BorderRadius.circular(100.0),
                                                                                                            ),
                                                                                                            child: Icon(
                                                                                                              Icons.edit,
                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                              size: 24.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ].divide(const SizedBox(width: 16.0)),
                                                                                                  ),
                                                                                                  if (_model.customColor)
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          'Code Hex',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Manrope',
                                                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                                                fontSize: 14.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                              ),
                                                                                                        ),
                                                                                                        SizedBox(
                                                                                                          width: 100.0,
                                                                                                          child: TextFormField(
                                                                                                            controller: _model.textController ??= TextEditingController(
                                                                                                              text: valueOrDefault<String>(
                                                                                                                containerClientsRow?.color,
                                                                                                                '#1c4494',
                                                                                                              ),
                                                                                                            ),
                                                                                                            focusNode: _model.textFieldFocusNode,
                                                                                                            onFieldSubmitted: (_) async {
                                                                                                              await ClientsTable().update(
                                                                                                                data: {
                                                                                                                  'color': _model.textController.text,
                                                                                                                },
                                                                                                                matchingRows: (rows) => rows.eqOrNull(
                                                                                                                  'id',
                                                                                                                  FFAppState().activeClientID,
                                                                                                                ),
                                                                                                              );
                                                                                                              safeSetState(() => _model.requestCompleter = null);
                                                                                                              await _model.waitForRequestCompleted();
                                                                                                            },
                                                                                                            autofocus: false,
                                                                                                            obscureText: false,
                                                                                                            decoration: InputDecoration(
                                                                                                              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                    fontFamily: 'GeistSans',
                                                                                                                    color: FlutterFlowTheme.of(context).tertiary,
                                                                                                                    fontSize: 16.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    useGoogleFonts: false,
                                                                                                                  ),
                                                                                                              hintText: 'TextField',
                                                                                                              hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'GeistSans',
                                                                                                                    color: FlutterFlowTheme.of(context).inputTitleGrey,
                                                                                                                    fontSize: 15.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    useGoogleFonts: false,
                                                                                                                  ),
                                                                                                              enabledBorder: InputBorder.none,
                                                                                                              focusedBorder: InputBorder.none,
                                                                                                              errorBorder: InputBorder.none,
                                                                                                              focusedErrorBorder: InputBorder.none,
                                                                                                              filled: true,
                                                                                                              fillColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                              contentPadding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'GeistSans',
                                                                                                                  color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                                                  fontSize: 15.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  useGoogleFonts: false,
                                                                                                                ),
                                                                                                            maxLength: 7,
                                                                                                            validator: _model.textControllerValidator.asValidator(context),
                                                                                                            inputFormatters: [
                                                                                                              FilteringTextInputFormatter.allow(RegExp('^#([A-Fa-f0-9]{0,6})?\$'))
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
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
                                                                              ].divide(const SizedBox(height: 8.0)),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                30.0,
                                                                                0.0,
                                                                                30.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 480.0,
                                                                              height: 440.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                borderRadius: BorderRadius.circular(16.0),
                                                                              ),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                children: [
                                                                                  Flexible(
                                                                                    child: FlutterFlowWebView(
                                                                                      content: '<!DOCTYPE html><html lang=\"fr\"><head>  <meta charset=\"UTF-8\">  <title> </title></head><body>  <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">    <tr>      <td align=\"center\" style=\"padding:30px 0;\">        <table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\" style=\"width: 320px; font-family: System, Helvetica, sans-serif; margin: auto;\">          <tr>            <td style=\"font-size: 20px; padding-bottom: 10px; text-align: center;\">              Sur une échelle de 0 à 10, quelle est la probabilité que vous recommandiez ${FFAppState().activeBrand} à un ami ?            </td>          </tr>          <tr>            <td height=\"10\"></td>          </tr>          <!-- Score 10 -->          <tr>            <td style=\"background-color: ${valueOrDefault<String>(
                                                                                        containerClientsRow?.color,
                                                                                        '#1c4494',
                                                                                      )}; border-radius: 4px; width: 150px; height: 30px; text-align: center; vertical-align: middle; margin: 5px 0;\">              <a href=\"${_model.npsLink}10\" style=\"display: block; width: 100%; height: 100%; text-decoration: none; color: #ffffff; font-size: 14px; line-height: 30px; font-family: Arial, sans-serif;\">                10 - Très probable              </a>            </td>          </tr>          <tr>            <td height=\"5\"></td>          </tr>          <!-- Score 9 -->          <tr>            <td style=\"background-color: ${valueOrDefault<String>(
                                                                                        containerClientsRow?.color,
                                                                                        '#1c4494',
                                                                                      )}; border-radius: 4px; width: 150px; height: 30px; text-align: center; vertical-align: middle; margin: 5px 0;\">              <a href=\"${_model.npsLink}9\" style=\"display: block; width: 100%; height: 100%; text-decoration: none; color: #ffffff; font-size: 16px; line-height: 30px; font-family: Arial, sans-serif;\">                9              </a>            </td>          </tr>          <tr>            <td height=\"5\"></td>          </tr>          <!-- Score 8 -->          <tr>            <td style=\"background-color: ${valueOrDefault<String>(
                                                                                        containerClientsRow?.color,
                                                                                        '#1c4494',
                                                                                      )}; border-radius: 4px; width: 150px; height: 30px; text-align: center; vertical-align: middle; margin: 5px 0;\">              <a href=\"${_model.npsLink}8\" style=\"display: block; width: 100%; height: 100%; text-decoration: none; color: #ffffff; font-size: 16px; line-height: 30px; font-family: Arial, sans-serif;\">                8              </a>            </td>          </tr>          <tr>            <td height=\"5\"></td>          </tr>          <!-- Score 7 -->          <tr>            <td style=\"background-color: ${valueOrDefault<String>(
                                                                                        containerClientsRow?.color,
                                                                                        '#1c4494',
                                                                                      )}; border-radius: 4px; width: 150px; height: 30px; text-align: center; vertical-align: middle; margin: 5px 0;\">              <a href=\"${_model.npsLink}7\" style=\"display: block; width: 100%; height: 100%; text-decoration: none; color: #ffffff; font-size: 16px; line-height: 30px; font-family: Arial, sans-serif;\">                7              </a>            </td>          </tr>          <tr>            <td height=\"5\"></td>          </tr>          <!-- Score 6 -->          <tr>            <td style=\"background-color: ${valueOrDefault<String>(
                                                                                        containerClientsRow?.color,
                                                                                        '#1c4494',
                                                                                      )}; border-radius: 4px; width: 150px; height: 30px; text-align: center; vertical-align: middle; margin: 5px 0;\">              <a href=\"${_model.npsLink}6\" style=\"display: block; width: 100%; height: 100%; text-decoration: none; color: #ffffff; font-size: 16px; line-height: 30px; font-family: Arial, sans-serif;\">                6              </a>            </td>          </tr>          <tr>            <td height=\"5\"></td>          </tr>          <!-- Score 5 -->          <tr>            <td style=\"background-color: ${valueOrDefault<String>(
                                                                                        containerClientsRow?.color,
                                                                                        '#1c4494',
                                                                                      )}; border-radius: 4px; width: 150px; height: 30px; text-align: center; vertical-align: middle; margin: 5px 0;\">              <a href=\"${_model.npsLink}5\" style=\"display: block; width: 100%; height: 100%; text-decoration: none; color: #ffffff; font-size: 16px; line-height: 30px; font-family: Arial, sans-serif;\">                5              </a>            </td>          </tr>          <tr>            <td height=\"5\"></td>          </tr>          <!-- Score 4 -->          <tr>            <td style=\"background-color: ${valueOrDefault<String>(
                                                                                        containerClientsRow?.color,
                                                                                        '#1c4494',
                                                                                      )}; border-radius: 4px; width: 150px; height: 30px; text-align: center; vertical-align: middle; margin: 5px 0;\">              <a href=\"${_model.npsLink}4\" style=\"display: block; width: 100%; height: 100%; text-decoration: none; color: #ffffff; font-size: 16px; line-height: 30px; font-family: Arial, sans-serif;\">                4              </a>            </td>          </tr>          <tr>            <td height=\"5\"></td>          </tr>          <!-- Score 3 -->          <tr>            <td style=\"background-color: ${valueOrDefault<String>(
                                                                                        containerClientsRow?.color,
                                                                                        '#1c4494',
                                                                                      )}; border-radius: 4px; width: 150px; height: 30px; text-align: center; vertical-align: middle; margin: 5px 0;\">              <a href=\"${_model.npsLink}3\" style=\"display: block; width: 100%; height: 100%; text-decoration: none; color: #ffffff; font-size: 16px; line-height: 30px; font-family: Arial, sans-serif;\">                3              </a>            </td>          </tr>          <tr>            <td height=\"5\"></td>          </tr>          <!-- Score 2 -->          <tr>            <td style=\"background-color: ${valueOrDefault<String>(
                                                                                        containerClientsRow?.color,
                                                                                        '#1c4494',
                                                                                      )}; border-radius: 4px; width: 150px; height: 30px; text-align: center; vertical-align: middle; margin: 5px 0;\">              <a href=\"${_model.npsLink}2\" style=\"display: block; width: 100%; height: 100%; text-decoration: none; color: #ffffff; font-size: 16px; line-height: 30px; font-family: Arial, sans-serif;\">                2              </a>            </td>          </tr>          <tr>            <td height=\"5\"></td>          </tr>          <!-- Score 1 -->          <tr>            <td style=\"background-color: ${valueOrDefault<String>(
                                                                                        containerClientsRow?.color,
                                                                                        '#1c4494',
                                                                                      )}; border-radius: 4px; width: 150px; height: 30px; text-align: center; vertical-align: middle; margin: 5px 0;\">              <a href=\"${_model.npsLink}1\" style=\"display: block; width: 100%; height: 100%; text-decoration: none; color: #ffffff; font-size: 16px; line-height: 30px; font-family: Arial, sans-serif;\">                1              </a>            </td>          </tr>          <tr>            <td height=\"5\"></td>          </tr>          <!-- Score 0 -->          <tr>            <td style=\"background-color: ${valueOrDefault<String>(
                                                                                        containerClientsRow?.color,
                                                                                        '#1c4494',
                                                                                      )}; border-radius: 4px; width: 150px; height: 30px; text-align: center; vertical-align: middle; margin: 5px 0;\">              <a href=\"${_model.npsLink}0\" style=\"display: block; width: 100%; height: 100%; text-decoration: none; color: #ffffff; font-size: 14px; line-height: 30px; font-family: Arial, sans-serif;\">                0 - Pas du tout probable              </a>            </td>          </tr>        </table>      </td>    </tr>  </table></body></html>',
                                                                                      width: 400.0,
                                                                                      height: 410.0,
                                                                                      verticalScroll: false,
                                                                                      horizontalScroll: false,
                                                                                      html: true,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ].divide(const SizedBox(height: 12.0)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(const SizedBox(
                                                                  width: 34.0)),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              height: 24.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
