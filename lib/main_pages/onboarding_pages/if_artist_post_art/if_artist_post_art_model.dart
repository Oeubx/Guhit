import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'if_artist_post_art_widget.dart' show IfArtistPostArtWidget;
import 'package:flutter/material.dart';

class IfArtistPostArtModel extends FlutterFlowModel<IfArtistPostArtWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for descrp widget.
  FocusNode? descrpFocusNode;
  TextEditingController? descrpTextController;
  String? Function(BuildContext, String?)? descrpTextControllerValidator;
  bool isDataUploading_uploadDataSoz = false;
  FFUploadedFile uploadedLocalFile_uploadDataSoz =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataSoz = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    descrpFocusNode?.dispose();
    descrpTextController?.dispose();
  }
}
