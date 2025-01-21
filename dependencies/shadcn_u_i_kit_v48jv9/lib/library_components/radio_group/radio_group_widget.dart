import '/flutter_flow/flutter_flow_util.dart';
import '/library_components/radio_group_item/radio_group_item_widget.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'radio_group_model.dart';
export 'radio_group_model.dart';

class RadioGroupWidget extends StatefulWidget {
  const RadioGroupWidget({
    super.key,
    required this.options,
    this.currentChoice,
    this.onSelectAction,
  });

  final List<String>? options;
  final String? currentChoice;
  final Future Function(String option)? onSelectAction;

  @override
  State<RadioGroupWidget> createState() => _RadioGroupWidgetState();
}

class _RadioGroupWidgetState extends State<RadioGroupWidget> {
  late RadioGroupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RadioGroupModel());

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
      child: Builder(
        builder: (context) {
          final option = widget!.options!.toList();

          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(option.length, (optionIndex) {
              final optionItem = option[optionIndex];
              return wrapWithModel(
                model: _model.radioGroupItemModels.getModel(
                  optionItem,
                  optionIndex,
                ),
                updateCallback: () => safeSetState(() {}),
                child: RadioGroupItemWidget(
                  key: Key(
                    'Keydpw_${optionItem}',
                  ),
                  isActive: widget!.currentChoice == optionItem,
                  option: optionItem,
                  onTapAction: (option) async {
                    await widget.onSelectAction?.call(
                      option,
                    );
                  },
                ),
              );
            }).divide(SizedBox(height: 8.0)),
          );
        },
      ),
    );
  }
}
