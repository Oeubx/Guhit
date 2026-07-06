import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'if_artist_set_commission_status_widget.dart'
    show IfArtistSetCommissionStatusWidget;
import 'package:flutter/material.dart';

class IfArtistSetCommissionStatusModel
    extends FlutterFlowModel<IfArtistSetCommissionStatusWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for descrp widget.
  FocusNode? descrpFocusNode;
  TextEditingController? descrpTextController;
  String? Function(BuildContext, String?)? descrpTextControllerValidator;
  bool isDataUploading_uploadData2c1 = false;
  FFUploadedFile uploadedLocalFile_uploadData2c1 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadData2c1 = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    descrpFocusNode?.dispose();
    descrpTextController?.dispose();
  }
}
