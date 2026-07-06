import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'reset_password_widget.dart' show ResetPasswordWidget;
import 'package:flutter/material.dart';

class ResetPasswordModel extends FlutterFlowModel<ResetPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for pass1 widget.
  FocusNode? pass1FocusNode;
  TextEditingController? pass1TextController;
  late bool pass1Visibility;
  String? Function(BuildContext, String?)? pass1TextControllerValidator;
  // State field(s) for confrimPass widget.
  FocusNode? confrimPassFocusNode;
  TextEditingController? confrimPassTextController;
  late bool confrimPassVisibility;
  String? Function(BuildContext, String?)? confrimPassTextControllerValidator;

  @override
  void initState(BuildContext context) {
    pass1Visibility = false;
    confrimPassVisibility = false;
  }

  @override
  void dispose() {
    pass1FocusNode?.dispose();
    pass1TextController?.dispose();

    confrimPassFocusNode?.dispose();
    confrimPassTextController?.dispose();
  }
}
