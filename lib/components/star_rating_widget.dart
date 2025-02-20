import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'star_rating_model.dart';
export 'star_rating_model.dart';

class StarRatingWidget extends StatefulWidget {
  const StarRatingWidget({
    super.key,
    this.rating,
  });

  final int? rating;

  @override
  State<StarRatingWidget> createState() => _StarRatingWidgetState();
}

class _StarRatingWidgetState extends State<StarRatingWidget> {
  late StarRatingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StarRatingModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      onRatingUpdate: (newValue) =>
          safeSetState(() => _model.ratingBarValue = newValue),
      itemBuilder: (context, index) => Icon(
        Icons.star_rounded,
        color: Color(0xFFF3CE49),
      ),
      direction: Axis.horizontal,
      initialRating: _model.ratingBarValue ??= widget.rating!.toDouble(),
      unratedColor: FlutterFlowTheme.of(context).shadcnCardBorderGrey,
      itemCount: 5,
      itemSize: 24.0,
      glowColor: Color(0xFFF3CE49),
    );
  }
}
