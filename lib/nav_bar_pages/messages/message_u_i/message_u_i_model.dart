import '/flutter_flow/flutter_flow_util.dart';
import 'message_u_i_widget.dart' show MessageUIWidget;
import 'package:flutter/material.dart';

class MessageUIModel extends FlutterFlowModel<MessageUIWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool isDataUploading_uploadData6iq = false;
  FFUploadedFile uploadedLocalFile_uploadData6iq =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadData6iq = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
