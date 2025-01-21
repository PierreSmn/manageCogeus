import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/library_components/dropdown_menu_item/dropdown_menu_item_widget.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dropdown_menu_model.dart';
export 'dropdown_menu_model.dart';

class DropdownMenuWidget extends StatefulWidget {
  const DropdownMenuWidget({
    super.key,
    double? width,
    required this.items,
    this.onSelectAction,
  }) : this.width = width ?? 200.0;

  final double width;
  final List<MenuItemStruct>? items;
  final Future Function(String itemKey)? onSelectAction;

  @override
  State<DropdownMenuWidget> createState() => _DropdownMenuWidgetState();
}

class _DropdownMenuWidgetState extends State<DropdownMenuWidget> {
  late DropdownMenuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DropdownMenuModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.indexFocus = 0;
      safeSetState(() {});
    });

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
          if (_model.indexFocus == widget!.items?.length) {
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
          if (_model.indexFocus != null) {
            await widget.onSelectAction?.call(
              (widget!.items!.elementAtOrNull(_model.indexFocus))!.name,
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
          focusNode: _model.dropdownMenuShortcutsFocusNode,
          child: GestureDetector(
              onTap: () =>
                  _model.dropdownMenuShortcutsFocusNode!.canRequestFocus
                      ? FocusScope.of(context)
                          .requestFocus(_model.dropdownMenuShortcutsFocusNode)
                      : FocusScope.of(context).unfocus(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(2.0, 4.0, 2.0, 0.0),
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
                  child: Builder(
                    builder: (context) {
                      final items = widget!.items!.toList();

                      return Column(
                        mainAxisSize: MainAxisSize.min,
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
                                'Keyxy1_${itemsItem.name}',
                              ),
                              indexNo: itemsIndex,
                              currentFocusIndex: _model.indexFocus,
                              itemData: itemsItem,
                              onMouseEnterAction: (indexNo) async {
                                _model.indexFocus = itemsIndex;
                                safeSetState(() {});
                              },
                              onTapAction: () async {
                                await widget.onSelectAction?.call(
                                  itemsItem.name,
                                );
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
              )),
        ),
      ),
    );
  }
}
