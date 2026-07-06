import '/flutter_flow/flutter_flow_util.dart';
import 'create_post_widget.dart' show CreatePostWidget;
import 'package:flutter/material.dart';

class CreatePostModel extends FlutterFlowModel<CreatePostWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for descrp widget.
  FocusNode? descrpFocusNode;
  TextEditingController? descrpTextController;
  String? Function(BuildContext, String?)? descrpTextControllerValidator;
  String? _descrpTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Describe your art!  is required';
    }

    if (val.length < 1) {
      return 'Add description to your art';
    }

    return null;
  }

  bool isDataUploading_uploadDataF3k = false;
  FFUploadedFile uploadedLocalFile_uploadDataF3k =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataF3k = '';

  @override
  void initState(BuildContext context) {
    descrpTextControllerValidator = _descrpTextControllerValidator;
  }

  @override
  void dispose() {
    descrpFocusNode?.dispose();
    descrpTextController?.dispose();
  }
}
