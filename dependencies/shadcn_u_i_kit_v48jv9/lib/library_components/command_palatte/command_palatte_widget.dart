import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/library_components/dropdown_menu_item/dropdown_menu_item_widget.dart';
import '/library_components/empty_list/empty_list_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'command_palatte_model.dart';
export 'command_palatte_model.dart';

class CommandPalatteWidget extends StatefulWidget {
  const CommandPalatteWidget({
    super.key,
    String? searchHint,
    this.items,
    this.selectAction,
    double? width,
    String? emptyListText,
  })  : this.searchHint = searchHint ?? 'Search...',
        this.width = width ?? 200.0,
        this.emptyListText = emptyListText ?? 'Nothing found...';

  final String searchHint;
  final List<MenuItemStruct>? items;
  final Future Function(String item)? selectAction;
  final double width;
  final String emptyListText;

  @override
  State<CommandPalatteWidget> createState() => _CommandPalatteWidgetState();
}

class _CommandPalatteWidgetState extends State<CommandPalatteWidget> {
  late CommandPalatteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommandPalatteModel());

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
          if (_model.indexFocus == 10) {
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
          focusNode: _model.commandPalatteShortcutsFocusNode,
          child: GestureDetector(
              onTap: () =>
                  _model.commandPalatteShortcutsFocusNode!.canRequestFocus
                      ? FocusScope.of(context)
                          .requestFocus(_model.commandPalatteShortcutsFocusNode)
                      : FocusScope.of(context).unfocus(),
              child: Container(
                width: 500.0,
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
                    Container(
                      height: 40.0,
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.search_rounded,
                            color: FlutterFlowTheme.of(context).mutedforeground,
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
                                  hintText: 'Type a command or search...',
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
                                cursorColor:
                                    FlutterFlowTheme.of(context).primaryText,
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
                          final items = functions
                                  .filterMenuList(widget!.items!.toList(),
                                      _model.searchInput)
                                  ?.toList() ??
                              [];
                          if (items.isEmpty) {
                            return EmptyListWidget(
                              message: widget!.emptyListText,
                            );
                          }

                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(items.length, (itemsIndex) {
                              final itemsItem = items[itemsIndex];
                              return wrapWithModel(
                                model: _model.dropdownMenuItemModels.getModel(
                                  itemsItem.name,
                                  itemsIndex,
                                ),
                                updateCallback: () => safeSetState(() {}),
                                child: DropdownMenuItemWidget(
                                  key: Key(
                                    'Key9i2_${itemsItem.name}',
                                  ),
                                  indexNo: valueOrDefault<int>(
                                    itemsIndex,
                                    0,
                                  ),
                                  currentFocusIndex: valueOrDefault<int>(
                                    _model.indexFocus,
                                    0,
                                  ),
                                  itemData: itemsItem,
                                  onMouseEnterAction: (indexNo) async {
                                    _model.indexFocus = indexNo;
                                    safeSetState(() {});
                                  },
                                  onTapAction: () async {
                                    if (functions
                                            .filterMenuList(
                                                widget!.items!.toList(),
                                                _model.searchInput)!
                                            .length >
                                        0) {
                                      await widget.selectAction?.call(
                                        itemsItem.name,
                                      );
                                      Navigator.pop(context);
                                    }
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
              )),
        ),
      ),
    );
  }
}
