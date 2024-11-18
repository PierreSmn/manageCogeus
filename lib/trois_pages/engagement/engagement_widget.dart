import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/experience_related/edit_engagement/edit_engagement_widget.dart';
import '/experience_related/pay_stripe/pay_stripe_widget.dart';
import '/experience_related/read_engagement/read_engagement_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/navbarnav/navbarnav_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'engagement_model.dart';
export 'engagement_model.dart';

class EngagementWidget extends StatefulWidget {
  const EngagementWidget({super.key});

  @override
  State<EngagementWidget> createState() => _EngagementWidgetState();
}

class _EngagementWidgetState extends State<EngagementWidget> {
  late EngagementModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EngagementModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if ((FFAppState().activeClientID == null) ||
          (FFAppState().activeBrand == '') ||
          (FFAppState().activeClientID == 0)) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: const Text('Attention'),
              content: const Text('Vous devez remettre à jour votre profil.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: const Text('Ok'),
                ),
              ],
            );
          },
        );

        context.pushNamed('updateProfile');
      }
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
    context.watch<FFAppState>();

    return FutureBuilder<List<NewSubsRow>>(
      future: NewSubsTable().queryRows(
        queryFn: (q) => q.eq(
          'brand_name',
          FFAppState().activeBrand,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).revoBG,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitRing(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<NewSubsRow> engagementNewSubsRowList = snapshot.data!;

        return Title(
            title: 'engagement',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).revoBG,
                body: SafeArea(
                  top: true,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FutureBuilder<List<ValidSubsRow>>(
                        future: ValidSubsTable().queryRows(
                          queryFn: (q) => q.eq(
                            'brand_name',
                            FFAppState().activeBrand,
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
                          List<ValidSubsRow> containerValidSubsRowList =
                              snapshot.data!;

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
                                      color:
                                          FlutterFlowTheme.of(context).revoBG,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          50.0, 32.0, 50.0, 40.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.7,
                                                          decoration:
                                                              const BoxDecoration(),
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
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
                                                                      'Engagement',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Manrope',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).revoCardTextColor,
                                                                            fontSize:
                                                                                44.72,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                    ),
                                                                    Builder(
                                                                      builder:
                                                                          (context) =>
                                                                              Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            24.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            FlutterFlowIconButton(
                                                                          borderColor:
                                                                              Colors.transparent,
                                                                          borderRadius:
                                                                              8.0,
                                                                          buttonSize:
                                                                              40.0,
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).cogeusButtonBG,
                                                                          icon:
                                                                              Icon(
                                                                            Icons.edit,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                          onPressed:
                                                                              () async {
                                                                            await showDialog(
                                                                              context: context,
                                                                              builder: (dialogContext) {
                                                                                return Dialog(
                                                                                  elevation: 0,
                                                                                  insetPadding: EdgeInsets.zero,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  alignment: const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                  child: GestureDetector(
                                                                                    onTap: () => FocusScope.of(dialogContext).unfocus(),
                                                                                    child: const EditEngagementWidget(),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );
                                                                          },
                                                                        ),
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
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.4,
                                                                      height:
                                                                          410.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .revoWhite,
                                                                        borderRadius:
                                                                            BorderRadius.circular(16.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(16.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Text(
                                                                                  'Engagement Client',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Manrope',
                                                                                        color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                        fontSize: 24.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                ),
                                                                                Builder(
                                                                                  builder: (context) => FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      _model.userRow = await UsersTable().queryRows(
                                                                                        queryFn: (q) => q.eq(
                                                                                          'id',
                                                                                          currentUserUid,
                                                                                        ),
                                                                                      );
                                                                                      if (_model.userRow!.first.activeSub!) {
                                                                                        _model.npsLink = 'https://app.cogeus.com/nps?clid=${FFAppState().activeClientID.toString()}&nps=';
                                                                                        safeSetState(() {});
                                                                                        await Clipboard.setData(ClipboardData(text: '<!DOCTYPE html><html lang=\"fr\"><head>  <meta charset=\"UTF-8\">  <title>Enquête NPS</title></head><body>  <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">    <tr>      <td align=\"center\" style=\"padding:30px 0;\">        <table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\" style=\"width: 320px; font-family: Arial, sans-serif;\">          <tr>            <td style=\"font-size: 18px; padding-bottom: 10px; text-align: center;\">              Sur une échelle de 0 à 10, quelle est la probabilité que vous recommandiez ${FFAppState().activeBrand} à un ami ?            </td>          </tr>          <tr>            <td height=\"10\"></td>          </tr>          <!-- Score 10 -->          <tr>            <td style=\"background-color: #376ce4; border-radius: 4px; width: 150px; height: 30px; text-align: center; vertical-align: middle; margin: 5px 0;\">              <a href=\"${_model.npsLink}10\" style=\"display: block; width: 100%; height: 100%; text-decoration: none; color: #ffffff; font-size: 14px; line-height: 30px; font-family: Arial, sans-serif;\">                10 - Très probable              </a>            </td>          </tr>          <tr>            <td height=\"5\"></td>          </tr>          <!-- Score 9 -->          <tr>            <td style=\"background-color: #376ce4; border-radius: 4px; width: 150px; height: 30px; text-align: center; vertical-align: middle; margin: 5px 0;\">              <a href=\"${_model.npsLink}9\" style=\"display: block; width: 100%; height: 100%; text-decoration: none; color: #ffffff; font-size: 16px; line-height: 30px; font-family: Arial, sans-serif;\">                9              </a>            </td>          </tr>          <tr>            <td height=\"5\"></td>          </tr>          <!-- Score 8 -->          <tr>            <td style=\"background-color: #376ce4; border-radius: 4px; width: 150px; height: 30px; text-align: center; vertical-align: middle; margin: 5px 0;\">              <a href=\"${_model.npsLink}8\" style=\"display: block; width: 100%; height: 100%; text-decoration: none; color: #ffffff; font-size: 16px; line-height: 30px; font-family: Arial, sans-serif;\">                8              </a>            </td>          </tr>          <tr>            <td height=\"5\"></td>          </tr>          <!-- Score 7 -->          <tr>            <td style=\"background-color: #376ce4; border-radius: 4px; width: 150px; height: 30px; text-align: center; vertical-align: middle; margin: 5px 0;\">              <a href=\"${_model.npsLink}7\" style=\"display: block; width: 100%; height: 100%; text-decoration: none; color: #ffffff; font-size: 16px; line-height: 30px; font-family: Arial, sans-serif;\">                7              </a>            </td>          </tr>          <tr>            <td height=\"5\"></td>          </tr>          <!-- Score 6 -->          <tr>            <td style=\"background-color: #376ce4; border-radius: 4px; width: 150px; height: 30px; text-align: center; vertical-align: middle; margin: 5px 0;\">              <a href=\"${_model.npsLink}6\" style=\"display: block; width: 100%; height: 100%; text-decoration: none; color: #ffffff; font-size: 16px; line-height: 30px; font-family: Arial, sans-serif;\">                6              </a>            </td>          </tr>          <tr>            <td height=\"5\"></td>          </tr>          <!-- Score 5 -->          <tr>            <td style=\"background-color: #376ce4; border-radius: 4px; width: 150px; height: 30px; text-align: center; vertical-align: middle; margin: 5px 0;\">              <a href=\"${_model.npsLink}5\" style=\"display: block; width: 100%; height: 100%; text-decoration: none; color: #ffffff; font-size: 16px; line-height: 30px; font-family: Arial, sans-serif;\">                5              </a>            </td>          </tr>          <tr>            <td height=\"5\"></td>          </tr>          <!-- Score 4 -->          <tr>            <td style=\"background-color: #376ce4; border-radius: 4px; width: 150px; height: 30px; text-align: center; vertical-align: middle; margin: 5px 0;\">              <a href=\"${_model.npsLink}4\" style=\"display: block; width: 100%; height: 100%; text-decoration: none; color: #ffffff; font-size: 16px; line-height: 30px; font-family: Arial, sans-serif;\">                4              </a>            </td>          </tr>          <tr>            <td height=\"5\"></td>          </tr>          <!-- Score 3 -->          <tr>            <td style=\"background-color: #376ce4; border-radius: 4px; width: 150px; height: 30px; text-align: center; vertical-align: middle; margin: 5px 0;\">              <a href=\"${_model.npsLink}3\" style=\"display: block; width: 100%; height: 100%; text-decoration: none; color: #ffffff; font-size: 16px; line-height: 30px; font-family: Arial, sans-serif;\">                3              </a>            </td>          </tr>          <tr>            <td height=\"5\"></td>          </tr>          <!-- Score 2 -->          <tr>            <td style=\"background-color: #376ce4; border-radius: 4px; width: 150px; height: 30px; text-align: center; vertical-align: middle; margin: 5px 0;\">              <a href=\"${_model.npsLink}2\" style=\"display: block; width: 100%; height: 100%; text-decoration: none; color: #ffffff; font-size: 16px; line-height: 30px; font-family: Arial, sans-serif;\">                2              </a>            </td>          </tr>          <tr>            <td height=\"5\"></td>          </tr>          <!-- Score 1 -->          <tr>            <td style=\"background-color: #376ce4; border-radius: 4px; width: 150px; height: 30px; text-align: center; vertical-align: middle; margin: 5px 0;\">              <a href=\"${_model.npsLink}1\" style=\"display: block; width: 100%; height: 100%; text-decoration: none; color: #ffffff; font-size: 16px; line-height: 30px; font-family: Arial, sans-serif;\">                1              </a>            </td>          </tr>          <tr>            <td height=\"5\"></td>          </tr>          <!-- Score 0 -->          <tr>            <td style=\"background-color: #376ce4; border-radius: 4px; width: 150px; height: 30px; text-align: center; vertical-align: middle; margin: 5px 0;\">              <a href=\"${_model.npsLink}0\" style=\"display: block; width: 100%; height: 100%; text-decoration: none; color: #ffffff; font-size: 14px; line-height: 30px; font-family: Arial, sans-serif;\">                0 - Pas du tout probable              </a>            </td>          </tr>        </table>      </td>    </tr>  </table></body></html>'));
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
                                                                                              child: GestureDetector(
                                                                                                onTap: () => FocusScope.of(dialogContext).unfocus(),
                                                                                                child: const SizedBox(
                                                                                                  height: 230.0,
                                                                                                  width: 360.0,
                                                                                                  child: PayStripeWidget(),
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
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 0.0),
                                                                              child: Container(
                                                                                width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                height: 300.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: const Color(0xFF242628),
                                                                                  borderRadius: BorderRadius.circular(0.0),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(24.0),
                                                                                  child: Text(
                                                                                    '<!-- NPS Scoring Tool HTML for Email (Column Format) -->\n<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\">\n <!-- Box 1 -->\n <tr>\n   <td align=\"center\" valign=\"middle\" width=\"300\" height=\"50\" style=\"background-color:#007BFF; border-radius:4px; width:300px; height:50px;\">\n     <a href=\"https://yourdomain.com/nps?score=1\" style=\"display:block; width:100%; height:100%; text-decoration:none; color:#FFFFFF; font-family:Arial, sans-serif; font-size:16px; line-height:50px;\">1</a>\n   </td>\n </tr>\n <!-- Spacer -->\nMore ...',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Manrope',
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ].divide(const SizedBox(height: 12.0)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          320.0,
                                                                      height:
                                                                          590.0,
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child:
                                                                          wrapWithModel(
                                                                        model: _model
                                                                            .readEngagementModel,
                                                                        updateCallback:
                                                                            () =>
                                                                                safeSetState(() {}),
                                                                        child:
                                                                            ReadEngagementWidget(
                                                                          id: valueOrDefault<
                                                                              int>(
                                                                            FFAppState().activeClientID,
                                                                            5,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ].divide(const SizedBox(
                                                                      width:
                                                                          34.0)),
                                                                ),
                                                              ].divide(const SizedBox(
                                                                  height:
                                                                      24.0)),
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
      },
    );
  }
}
