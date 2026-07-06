import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'c_accept_ongoing_widget.dart' show CAcceptOngoingWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CAcceptOngoingModel extends FlutterFlowModel<CAcceptOngoingWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField_remarks widget.
  FocusNode? textFieldRemarksFocusNode;
  TextEditingController? textFieldRemarksTextController;
  String? Function(BuildContext, String?)?
      textFieldRemarksTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldRemarksFocusNode?.dispose();
    textFieldRemarksTextController?.dispose();
  }
}
