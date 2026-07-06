import '/flutter_flow/flutter_flow_util.dart';
import 'create_rating_buyer_p_o_v_widget.dart' show CreateRatingBuyerPOVWidget;
import 'package:flutter/material.dart';

class CreateRatingBuyerPOVModel
    extends FlutterFlowModel<CreateRatingBuyerPOVWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();
  }
}
