import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'cancel_order_artist_p_o_v_copy_widget.dart'
    show CancelOrderArtistPOVCopyWidget;
import 'package:flutter/material.dart';

class CancelOrderArtistPOVCopyModel
    extends FlutterFlowModel<CancelOrderArtistPOVCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for CheckboxGroup widget.
  FormFieldController<List<String>>? checkboxGroupValueController;
  List<String>? get checkboxGroupValues => checkboxGroupValueController?.value;
  set checkboxGroupValues(List<String>? v) =>
      checkboxGroupValueController?.value = v;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
