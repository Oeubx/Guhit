import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/index.dart';
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditProfileModel extends FlutterFlowModel<EditProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  Stream<List<UserRow>>? columnSupabaseStream;
  bool isDataUploading_uploadedPFPLocal = false;
  FFUploadedFile uploadedLocalFile_uploadedPFPLocal =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for TextField_username widget.
  FocusNode? textFieldUsernameFocusNode;
  TextEditingController? textFieldUsernameTextController;
  String? Function(BuildContext, String?)?
      textFieldUsernameTextControllerValidator;
  // State field(s) for TextField_bio widget.
  FocusNode? textFieldBioFocusNode;
  TextEditingController? textFieldBioTextController;
  String? Function(BuildContext, String?)? textFieldBioTextControllerValidator;
  bool isDataUploading_successUploadedPFP = false;
  FFUploadedFile uploadedLocalFile_successUploadedPFP =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_successUploadedPFP = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldUsernameFocusNode?.dispose();
    textFieldUsernameTextController?.dispose();

    textFieldBioFocusNode?.dispose();
    textFieldBioTextController?.dispose();
  }
}
