import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'sign_up_page_widget.dart' show SignUpPageWidget;
import 'package:flutter/material.dart';

class SignUpPageModel extends FlutterFlowModel<SignUpPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for emailsign widget.
  FocusNode? emailsignFocusNode;
  TextEditingController? emailsignTextController;
  String? Function(BuildContext, String?)? emailsignTextControllerValidator;
  String? _emailsignTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Email is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for passwordsign widget.
  FocusNode? passwordsignFocusNode;
  TextEditingController? passwordsignTextController;
  late bool passwordsignVisibility;
  String? Function(BuildContext, String?)? passwordsignTextControllerValidator;
  String? _passwordsignTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter Password is required';
    }

    if (val.length < 7) {
      return 'Minimum 7 characters';
    }

    return null;
  }

  // State field(s) for confirmPasswordsign widget.
  FocusNode? confirmPasswordsignFocusNode;
  TextEditingController? confirmPasswordsignTextController;
  late bool confirmPasswordsignVisibility;
  String? Function(BuildContext, String?)?
      confirmPasswordsignTextControllerValidator;
  String? _confirmPasswordsignTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Confirm Password is required';
    }

    if (val.length < 7) {
      return 'Minimum 7 characters';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    emailsignTextControllerValidator = _emailsignTextControllerValidator;
    passwordsignVisibility = false;
    passwordsignTextControllerValidator = _passwordsignTextControllerValidator;
    confirmPasswordsignVisibility = false;
    confirmPasswordsignTextControllerValidator =
        _confirmPasswordsignTextControllerValidator;
  }

  @override
  void dispose() {
    emailsignFocusNode?.dispose();
    emailsignTextController?.dispose();

    passwordsignFocusNode?.dispose();
    passwordsignTextController?.dispose();

    confirmPasswordsignFocusNode?.dispose();
    confirmPasswordsignTextController?.dispose();
  }
}
