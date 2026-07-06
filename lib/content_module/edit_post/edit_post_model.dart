import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'edit_post_widget.dart' show EditPostWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditPostModel extends FlutterFlowModel<EditPostWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField_content widget.
  FocusNode? textFieldContentFocusNode;
  TextEditingController? textFieldContentTextController;
  String? Function(BuildContext, String?)?
      textFieldContentTextControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  bool isDataUploading_uploadedImageEdit = false;
  FFUploadedFile uploadedLocalFile_uploadedImageEdit =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  bool isDataUploading_successUploadedImageEdit = false;
  FFUploadedFile uploadedLocalFile_successUploadedImageEdit =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_successUploadedImageEdit = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldContentFocusNode?.dispose();
    textFieldContentTextController?.dispose();
  }
}
