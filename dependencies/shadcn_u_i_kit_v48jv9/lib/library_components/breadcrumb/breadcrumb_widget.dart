import '/flutter_flow/flutter_flow_util.dart';
import '/library_components/breadcrumb_item/breadcrumb_item_widget.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'breadcrumb_model.dart';
export 'breadcrumb_model.dart';

class BreadcrumbWidget extends StatefulWidget {
  const BreadcrumbWidget({
    super.key,
    required this.breadcrumbs,
    this.onTapAction,
  });

  final List<String>? breadcrumbs;
  final Future Function(int index)? onTapAction;

  @override
  State<BreadcrumbWidget> createState() => _BreadcrumbWidgetState();
}

class _BreadcrumbWidgetState extends State<BreadcrumbWidget> {
  late BreadcrumbModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BreadcrumbModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final crumb = widget!.breadcrumbs!.toList();

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(crumb.length, (crumbIndex) {
            final crumbItem = crumb[crumbIndex];
            return Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                wrapWithModel(
                  model: _model.breadcrumbItemModels.getModel(
                    crumbItem,
                    crumbIndex,
                  ),
                  updateCallback: () => safeSetState(() {}),
                  child: BreadcrumbItemWidget(
                    key: Key(
                      'Key2aq_${crumbItem}',
                    ),
                    text: valueOrDefault<String>(
                      crumbItem,
                      'Breadcrumb',
                    ),
                    itemNo: crumbIndex,
                    count: widget!.breadcrumbs?.length,
                    onTapAction: (index) async {
                      await widget.onTapAction?.call(
                        index,
                      );
                    },
                  ),
                ),
                if (valueOrDefault<bool>(
                  crumbIndex != (widget!.breadcrumbs!.length - 1),
                  true,
                ))
                  Icon(
                    Icons.chevron_right_rounded,
                    color: FlutterFlowTheme.of(context).mutedforeground,
                    size: 18.0,
                  ),
              ].divide(SizedBox(width: 10.0)),
            );
          }).divide(SizedBox(width: 10.0)),
        );
      },
    );
  }
}
