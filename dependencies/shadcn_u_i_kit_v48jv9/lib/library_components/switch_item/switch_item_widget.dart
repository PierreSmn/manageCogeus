import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'switch_item_model.dart';
export 'switch_item_model.dart';

class SwitchItemWidget extends StatefulWidget {
  const SwitchItemWidget({
    super.key,
    this.toggleOnAction,
    this.toggleOffAction,
    bool? currentValue,
  }) : this.currentValue = currentValue ?? false;

  final Future Function()? toggleOnAction;
  final Future Function()? toggleOffAction;
  final bool currentValue;

  @override
  State<SwitchItemWidget> createState() => _SwitchItemWidgetState();
}

class _SwitchItemWidgetState extends State<SwitchItemWidget> {
  late SwitchItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwitchItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        if (widget!.currentValue) {
          await widget.toggleOffAction?.call();
          return;
        } else {
          await widget.toggleOnAction?.call();
          return;
        }
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        curve: Curves.linear,
        width: 44.0,
        height: 24.0,
        decoration: BoxDecoration(
          color: valueOrDefault<Color>(
            widget!.currentValue
                ? FlutterFlowTheme.of(context).primarycolor
                : FlutterFlowTheme.of(context).secondarycolor,
            FlutterFlowTheme.of(context).secondarycolor,
          ),
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: Align(
          alignment: AlignmentDirectional(
              valueOrDefault<double>(
                widget!.currentValue ? 1.0 : -1.0,
                -1.0,
              ),
              0.0),
          child: Padding(
            padding: EdgeInsets.all(2.0),
            child: Container(
              width: 22.0,
              height: 22.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).background,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
