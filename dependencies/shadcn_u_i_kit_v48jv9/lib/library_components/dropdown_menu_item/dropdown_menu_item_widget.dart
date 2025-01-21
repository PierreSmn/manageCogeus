import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/library_components/dropdown_menu/dropdown_menu_widget.dart';
import '/library_components/menu_section_title/menu_section_title_widget.dart';
import 'dart:ui';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dropdown_menu_item_model.dart';
export 'dropdown_menu_item_model.dart';

class DropdownMenuItemWidget extends StatefulWidget {
  const DropdownMenuItemWidget({
    super.key,
    required this.onMouseEnterAction,
    this.onTapAction,
    this.icon,
    int? indexNo,
    this.currentFocusIndex,
    required this.itemData,
  }) : this.indexNo = indexNo ?? 0;

  final Future Function(int indexNo)? onMouseEnterAction;
  final Future Function()? onTapAction;
  final Widget? icon;
  final int indexNo;
  final int? currentFocusIndex;
  final MenuItemStruct? itemData;

  @override
  State<DropdownMenuItemWidget> createState() => _DropdownMenuItemWidgetState();
}

class _DropdownMenuItemWidgetState extends State<DropdownMenuItemWidget> {
  late DropdownMenuItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DropdownMenuItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
      child: MouseRegion(
        opaque: false,
        cursor: SystemMouseCursors.basic ?? MouseCursor.defer,
        child: Builder(
          builder: (context) {
            if (valueOrDefault<bool>(
              widget!.itemData?.isSectionHeader,
              false,
            )) {
              return wrapWithModel(
                model: _model.menuSectionTitleModel,
                updateCallback: () => safeSetState(() {}),
                child: MenuSectionTitleWidget(
                  text: widget!.itemData!.name,
                ),
              );
            } else if (valueOrDefault<bool>(
              widget!.itemData?.isDivider,
              false,
            )) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Divider(
                    height: 1.0,
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).border,
                  ),
                ],
              );
            } else {
              return Builder(
                builder: (context) => InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (widget!.itemData!.isDisabled) {
                      return;
                    }

                    if (widget!.itemData!.subMenuItems.isNotEmpty) {
                      await showAlignedDialog(
                        barrierColor: Colors.transparent,
                        context: context,
                        isGlobal: false,
                        avoidOverflow: true,
                        targetAnchor: AlignmentDirectional(1.0, -1.0)
                            .resolve(Directionality.of(context)),
                        followerAnchor: AlignmentDirectional(-1.0, -1.0)
                            .resolve(Directionality.of(context)),
                        builder: (dialogContext) {
                          return Material(
                            color: Colors.transparent,
                            child: DropdownMenuWidget(
                              items: widget!.itemData!.subMenuItems,
                              onSelectAction: (itemKey) async {
                                Navigator.pop(context);
                              },
                            ),
                          );
                        },
                      );

                      return;
                    } else {
                      await widget.onTapAction?.call();
                      return;
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: 32.0,
                    decoration: BoxDecoration(
                      color: valueOrDefault<Color>(
                        (widget!.indexNo == widget!.currentFocusIndex) &&
                                !widget!.itemData!.isDisabled
                            ? FlutterFlowTheme.of(context).accent
                            : FlutterFlowTheme.of(context).popover,
                        FlutterFlowTheme.of(context).popover,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (valueOrDefault<bool>(
                          widget!.icon != null,
                          false,
                        ))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 8.0, 0.0),
                            child: Container(
                              width: 16.0,
                              height: 16.0,
                              decoration: BoxDecoration(),
                              child: Builder(
                                builder: (context) {
                                  if (valueOrDefault<bool>(
                                    widget!.icon != null,
                                    false,
                                  )) {
                                    return widget!.icon!;
                                  } else {
                                    return Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(),
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                        Expanded(
                          child: Text(
                            valueOrDefault<String>(
                              widget!.itemData?.name,
                              'Name',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Geist',
                                  color: valueOrDefault<Color>(
                                    () {
                                      if (widget!.itemData!.isDestructive) {
                                        return FlutterFlowTheme.of(context)
                                            .destructive;
                                      } else if (widget!.itemData!.isDisabled) {
                                        return FlutterFlowTheme.of(context)
                                            .ring;
                                      } else if (widget!.indexNo ==
                                          widget!.currentFocusIndex) {
                                        return FlutterFlowTheme.of(context)
                                            .accentforeground;
                                      } else {
                                        return FlutterFlowTheme.of(context)
                                            .popoverforeground;
                                      }
                                    }(),
                                    FlutterFlowTheme.of(context)
                                        .popoverforeground,
                                  ),
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                        if (valueOrDefault<bool>(
                          valueOrDefault<bool>(
                                widget!.itemData?.shortcut != null &&
                                    widget!.itemData?.shortcut != '',
                                false,
                              ) &&
                              !widget!.itemData!.isDisabled,
                          false,
                        ))
                          Text(
                            valueOrDefault<String>(
                              widget!.itemData?.shortcut,
                              'S',
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Geist',
                                      color: valueOrDefault<Color>(
                                        widget!.itemData!.isDestructive
                                            ? FlutterFlowTheme.of(context)
                                                .destructive
                                            : FlutterFlowTheme.of(context)
                                                .mutedforeground,
                                        FlutterFlowTheme.of(context)
                                            .mutedforeground,
                                      ),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                          ),
                        if (valueOrDefault<bool>(
                          widget!.itemData?.subMenuItems != null &&
                              (widget!.itemData?.subMenuItems)!.isNotEmpty,
                          false,
                        ))
                          Icon(
                            Icons.chevron_right_rounded,
                            color:
                                FlutterFlowTheme.of(context).popoverforeground,
                            size: 14.0,
                          ),
                      ]
                          .addToStart(SizedBox(width: 8.0))
                          .addToEnd(SizedBox(width: 8.0)),
                    ),
                  ),
                ),
              );
            }
          },
        ),
        onEnter: ((event) async {
          safeSetState(() => _model.mouseRegionHovered = true);
          await widget.onMouseEnterAction?.call(
            widget!.indexNo,
          );
        }),
        onExit: ((event) async {
          safeSetState(() => _model.mouseRegionHovered = false);
        }),
      ),
    );
  }
}
