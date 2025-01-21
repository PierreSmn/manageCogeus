import '/flutter_flow/flutter_flow_util.dart';
import '/library_components/tab_menu_item/tab_menu_item_widget.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tabs_model.dart';
export 'tabs_model.dart';

class TabsWidget extends StatefulWidget {
  const TabsWidget({
    super.key,
    required this.tabs,
    this.onChangeAction,
    required this.content,
  });

  final List<String>? tabs;
  final Future Function(int index)? onChangeAction;
  final Widget Function()? content;

  @override
  State<TabsWidget> createState() => _TabsWidgetState();
}

class _TabsWidgetState extends State<TabsWidget> {
  late TabsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TabsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).accent,
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(4.0),
            child: Builder(
              builder: (context) {
                final tab = widget!.tabs!.toList();

                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(tab.length, (tabIndex) {
                    final tabItem = tab[tabIndex];
                    return Expanded(
                      child: wrapWithModel(
                        model: _model.tabMenuItemModels.getModel(
                          tabItem,
                          tabIndex,
                        ),
                        updateCallback: () => safeSetState(() {}),
                        child: TabMenuItemWidget(
                          key: Key(
                            'Key1r9_${tabItem}',
                          ),
                          name: tabItem,
                          currentSelection: _model.selection,
                          itemNo: tabIndex,
                          onTapAction: (itemNo) async {
                            _model.selection = itemNo;
                            safeSetState(() {});
                            await widget.onChangeAction?.call(
                              itemNo,
                            );
                          },
                        ),
                      ),
                    );
                  }).divide(SizedBox(width: 5.0)),
                );
              },
            ),
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).background,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).border,
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Builder(builder: (_) {
              return widget.content!();
            }),
          ),
        ),
      ].divide(SizedBox(height: 8.0)),
    );
  }
}
