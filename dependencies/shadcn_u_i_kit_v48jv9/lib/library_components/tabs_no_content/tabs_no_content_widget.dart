import '/flutter_flow/flutter_flow_util.dart';
import '/library_components/tab_menu_item/tab_menu_item_widget.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tabs_no_content_model.dart';
export 'tabs_no_content_model.dart';

class TabsNoContentWidget extends StatefulWidget {
  const TabsNoContentWidget({
    super.key,
    required this.tabs,
    this.onChangeAction,
  });

  final List<String>? tabs;
  final Future Function(int itemNo)? onChangeAction;

  @override
  State<TabsNoContentWidget> createState() => _TabsNoContentWidgetState();
}

class _TabsNoContentWidgetState extends State<TabsNoContentWidget> {
  late TabsNoContentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TabsNoContentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Column(
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
                      return wrapWithModel(
                        model: _model.tabMenuItemModels.getModel(
                          tabItem,
                          tabIndex,
                        ),
                        updateCallback: () => safeSetState(() {}),
                        child: TabMenuItemWidget(
                          key: Key(
                            'Key42s_${tabItem}',
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
                      );
                    }).divide(SizedBox(width: 5.0)),
                  );
                },
              ),
            ),
          ),
        ].divide(SizedBox(height: 8.0)),
      ),
    );
  }
}
