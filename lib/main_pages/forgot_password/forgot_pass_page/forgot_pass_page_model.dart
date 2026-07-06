import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'forgot_pass_page_widget.dart' show ForgotPassPageWidget;
import 'package:flutter/material.dart';

class ForgotPassPageModel extends FlutterFlowModel<ForgotPassPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for resetPass widget.
  FocusNode? resetPassFocusNode;
  TextEditingController? resetPassTextController;
  String? Function(BuildContext, String?)? resetPassTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    resetPassFocusNode?.dispose();
    resetPassTextController?.dispose();
  }
}
