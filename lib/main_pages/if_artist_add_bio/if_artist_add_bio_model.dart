import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'if_artist_add_bio_widget.dart' show IfArtistAddBioWidget;
import 'package:flutter/material.dart';

class IfArtistAddBioModel extends FlutterFlowModel<IfArtistAddBioWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for descrp widget.
  FocusNode? descrpFocusNode;
  TextEditingController? descrpTextController;
  String? Function(BuildContext, String?)? descrpTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    descrpFocusNode?.dispose();
    descrpTextController?.dispose();
  }
}
