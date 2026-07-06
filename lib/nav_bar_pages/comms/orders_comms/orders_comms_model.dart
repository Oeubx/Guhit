import '/flutter_flow/flutter_flow_util.dart';
import '/nav_bar_pages/nav_bar/nav_bar_widget.dart';
import '/index.dart';
import 'orders_comms_widget.dart' show OrdersCommsWidget;
import 'package:flutter/material.dart';

class OrdersCommsModel extends FlutterFlowModel<OrdersCommsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    navBarModel.dispose();
  }
}
