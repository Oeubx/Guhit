import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'sign_up_profile_details_widget.dart' show SignUpProfileDetailsWidget;
import 'package:flutter/material.dart';

class SignUpProfileDetailsModel
    extends FlutterFlowModel<SignUpProfileDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading_userUploadImg = false;
  FFUploadedFile uploadedLocalFile_userUploadImg =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_userUploadImg = '';

  // State field(s) for displayName widget.
  FocusNode? displayNameFocusNode;
  TextEditingController? displayNameTextController;
  String? Function(BuildContext, String?)? displayNameTextControllerValidator;
  String? _displayNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter your Name is required';
    }

    return null;
  }

  // State field(s) for username widget.
  FocusNode? usernameFocusNode;
  TextEditingController? usernameTextController;
  String? Function(BuildContext, String?)? usernameTextControllerValidator;
  String? _usernameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter Username is required';
    }

    if (val.length > 10) {
      return 'Maximum 10 Characters';
    }
    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return 'This Username is Taken';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    displayNameTextControllerValidator = _displayNameTextControllerValidator;
    usernameTextControllerValidator = _usernameTextControllerValidator;
  }

  @override
  void dispose() {
    displayNameFocusNode?.dispose();
    displayNameTextController?.dispose();

    usernameFocusNode?.dispose();
    usernameTextController?.dispose();
  }
}
