import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'creation_artist_status_widget.dart' show CreationArtistStatusWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreationArtistStatusModel
    extends FlutterFlowModel<CreationArtistStatusWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField_desc widget.
  FocusNode? textFieldDescFocusNode;
  TextEditingController? textFieldDescTextController;
  String? Function(BuildContext, String?)? textFieldDescTextControllerValidator;
  // State field(s) for TextField_prices widget.
  FocusNode? textFieldPricesFocusNode;
  TextEditingController? textFieldPricesTextController;
  String? Function(BuildContext, String?)?
      textFieldPricesTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldDescFocusNode?.dispose();
    textFieldDescTextController?.dispose();

    textFieldPricesFocusNode?.dispose();
    textFieldPricesTextController?.dispose();
  }
}
