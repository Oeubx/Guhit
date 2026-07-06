import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'c_changes_approval_widget.dart' show CChangesApprovalWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CChangesApprovalModel extends FlutterFlowModel<CChangesApprovalWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField_remarks widget.
  FocusNode? textFieldRemarksFocusNode;
  TextEditingController? textFieldRemarksTextController;
  String? Function(BuildContext, String?)?
      textFieldRemarksTextControllerValidator;
  bool isDataUploading_uploadLocalC = false;
  FFUploadedFile uploadedLocalFile_uploadLocalC =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  bool isDataUploading_uploadedDbC = false;
  FFUploadedFile uploadedLocalFile_uploadedDbC =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadedDbC = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldRemarksFocusNode?.dispose();
    textFieldRemarksTextController?.dispose();
  }
}
