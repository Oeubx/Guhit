import '/flutter_flow/flutter_flow_util.dart';
import '/nav_bar_pages/nav_bar/nav_bar_widget.dart';
import 'order_details_artist_p_o_v_widget.dart'
    show OrderDetailsArtistPOVWidget;
import 'package:flutter/material.dart';

class OrderDetailsArtistPOVModel
    extends FlutterFlowModel<OrderDetailsArtistPOVWidget> {
  ///  State fields for stateful widgets in this page.

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
