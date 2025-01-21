import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/library_components/empty_list/empty_list_widget.dart';
import '/library_components/selection_item/selection_item_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'selection_menu_model.dart';
export 'selection_menu_model.dart';

class SelectionMenuWidget extends StatefulWidget {
  const SelectionMenuWidget({
    super.key,
    String? searchHint,
    required this.items,
    this.selectAction,
    double? width,
    String? emptyListText,
    this.currentSelection,
    bool? searchable,
    bool? useRadio,
  })  : this.searchHint = searchHint ?? 'Search...',
        this.width = width ?? 200.0,
        this.emptyListText = emptyListText ?? 'Nothing found...',
        this.searchable = searchable ?? true,
        this.useRadio = useRadio ?? false;

  final String searchHint;
  final List<MenuItemStruct>? items;
  final Future Function(String item)? selectAction;
  final double width;
  final String emptyListText;
  final String? currentSelection;
  final bool searchable;
  final bool useRadio;

  @override
  State<SelectionMenuWidget> createState() => _SelectionMenuWidgetState();
}

class _SelectionMenuWidgetState extends State<SelectionMenuWidget> {
  late SelectionMenuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectionMenuModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.indexFocus = 0;
      safeSetState(() {});
    });

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
    return Shortcuts(
      shortcuts: {
        SingleActivator(
          LogicalKeyboardKey.arrowDown,
        ): VoidCallbackIntent(() async {
          if (_model.indexFocus ==
              (functions
                      .filterMenuList(
                          widget!.items!.toList(), _model.searchInput)!
                      .length -
                  1)) {
            return;
          }

          _model.indexFocus = _model.indexFocus + 1;
          safeSetState(() {});
          return;
        }),
        SingleActivator(
          LogicalKeyboardKey.arrowUp,
        ): VoidCallbackIntent(() async {
          if (_model.indexFocus == 0) {
            return;
          }

          _model.indexFocus = _model.indexFocus + -1;
          safeSetState(() {});
          return;
        }),
        SingleActivator(
          LogicalKeyboardKey.enter,
        ): VoidCallbackIntent(() async {
          if (functions
                  .filterMenuList(widget!.items!.toList(), _model.searchInput)!
                  .length >
              0) {
            await widget.selectAction?.call(
              (functions
                      .filterMenuList(
                          widget!.items!.toList(), _model.searchInput)!
                      .elementAtOrNull(_model.indexFocus))!
                  .name,
            );
            Navigator.pop(context);
            return;
          } else {
            return;
          }
        }),
      },
      child: Actions(
        actions: {
          VoidCallbackIntent: CallbackAction<VoidCallbackIntent>(
            onInvoke: (intent) => intent.callback(),
          ),
        },
        child: Focus(
          autofocus: isShortcutsSupported,
          focusNode: _model.selectionMenuShortcutsFocusNode,
          child: GestureDetector(
              onTap: () =>
                  _model.selectionMenuShortcutsFocusNode!.canRequestFocus
                      ? FocusScope.of(context)
                          .requestFocus(_model.selectionMenuShortcutsFocusNode)
                      : FocusScope.of(context).unfocus(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Container(
                  width: widget!.width,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).background,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 6.0,
                        color: Color(0x15000000),
                        offset: Offset(
                          0.0,
                          4.0,
                        ),
                        spreadRadius: 0.0,
                      )
                    ],
                    borderRadius: BorderRadius.circular(6.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).border,
                      width: 1.0,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget!.searchable)
                        Container(
                          height: 40.0,
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.search_rounded,
                                color: FlutterFlowTheme.of(context)
                                    .mutedforeground,
                                size: 18.0,
                              ),
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  child: TextFormField(
                                    controller: _model.textController,
                                    focusNode: _model.textFieldFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.textController',
                                      Duration(milliseconds: 100),
                                      () async {
                                        _model.searchInput =
                                            _model.textController.text;
                                        _model.indexFocus = 0;
                                        safeSetState(() {});
                                      },
                                    ),
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      hintText: 'Search...',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Geist',
                                            color: FlutterFlowTheme.of(context)
                                                .mutedforeground,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w300,
                                            useGoogleFonts: false,
                                          ),
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                      hoverColor: Color(0x00FFFFFF),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Geist',
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                    cursorColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    validator: _model.textControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ]
                                .divide(SizedBox(width: 6.0))
                                .addToStart(SizedBox(width: 10.0))
                                .addToEnd(SizedBox(width: 10.0)),
                          ),
                        ),
                      if (widget!.searchable)
                        Divider(
                          height: 1.0,
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).border,
                        ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final item = functions
                                    .filterMenuList(widget!.items!.toList(),
                                        _model.searchInput)
                                    ?.toList() ??
                                [];
                            if (item.isEmpty) {
                              return EmptyListWidget(
                                message: widget!.emptyListText,
                              );
                            }

                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(item.length, (itemIndex) {
                                final itemItem = item[itemIndex];
                                return wrapWithModel(
                                  model: _model.selectionItemModels.getModel(
                                    itemItem.name,
                                    itemIndex,
                                  ),
                                  updateCallback: () => safeSetState(() {}),
                                  child: SelectionItemWidget(
                                    key: Key(
                                      'Keyevs_${itemItem.name}',
                                    ),
                                    text: itemItem.name,
                                    isInFocus: _model.indexFocus == itemIndex,
                                    isDisabled: itemItem.isDisabled,
                                    isSelected: widget!.currentSelection ==
                                        itemItem.name,
                                    showIndicator: true,
                                    shortcut: itemItem.shortcut,
                                    isRadioIndicator: widget!.useRadio,
                                    onMouseEnterAction: () async {
                                      _model.indexFocus = itemIndex;
                                      safeSetState(() {});
                                    },
                                    onTapAction: () async {
                                      await widget.selectAction?.call(
                                        itemItem.name,
                                      );
                                      Navigator.pop(context);
                                    },
                                  ),
                                );
                              })
                                  .divide(SizedBox(height: 4.0))
                                  .addToStart(SizedBox(height: 4.0))
                                  .addToEnd(SizedBox(height: 4.0)),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
