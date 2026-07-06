import '/flutter_flow/flutter_flow_util.dart';
import '/nav_bar_pages/nav_bar/nav_bar_widget.dart';
import 'ratings_widget.dart' show RatingsWidget;
import 'package:flutter/material.dart';

class RatingsModel extends FlutterFlowModel<RatingsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for RatingBar widget.
  double? ratingBarValue1;
  // State field(s) for RatingBar widget.
  double? ratingBarValue2;
  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    navBarModel.dispose();
  }
}
