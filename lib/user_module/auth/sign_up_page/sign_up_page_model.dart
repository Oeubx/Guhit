import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'sign_up_page_widget.dart' show SignUpPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpPageModel extends FlutterFlowModel<SignUpPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField_email widget.
  FocusNode? textFieldEmailFocusNode;
  TextEditingController? textFieldEmailTextController;
  String? Function(BuildContext, String?)?
      textFieldEmailTextControllerValidator;
  String? _textFieldEmailTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Email is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for TextField_pw widget.
  FocusNode? textFieldPwFocusNode;
  TextEditingController? textFieldPwTextController;
  late bool textFieldPwVisibility;
  String? Function(BuildContext, String?)? textFieldPwTextControllerValidator;
  String? _textFieldPwTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Password is required';
    }

    if (val.length < 8) {
      return 'Requires at least 8 characters.';
    }

    return null;
  }

  // State field(s) for TextField_cpw widget.
  FocusNode? textFieldCpwFocusNode;
  TextEditingController? textFieldCpwTextController;
  late bool textFieldCpwVisibility;
  String? Function(BuildContext, String?)? textFieldCpwTextControllerValidator;
  String? _textFieldCpwTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Password is required';
    }

    if (val.length < 8) {
      return 'Requires at least 8 characters.';
    }

    return null;
  }

  // Stores action output result for [Custom Action - signUpValidation] action in Sign_Up_Btn widget.
  String? signUpError;

  @override
  void initState(BuildContext context) {
    textFieldEmailTextControllerValidator =
        _textFieldEmailTextControllerValidator;
    textFieldPwVisibility = false;
    textFieldPwTextControllerValidator = _textFieldPwTextControllerValidator;
    textFieldCpwVisibility = false;
    textFieldCpwTextControllerValidator = _textFieldCpwTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldEmailFocusNode?.dispose();
    textFieldEmailTextController?.dispose();

    textFieldPwFocusNode?.dispose();
    textFieldPwTextController?.dispose();

    textFieldCpwFocusNode?.dispose();
    textFieldCpwTextController?.dispose();
  }
}
