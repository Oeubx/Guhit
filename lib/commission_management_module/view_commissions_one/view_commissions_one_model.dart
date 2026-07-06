import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/commission_management_module/commissioned_ui/c_complete/c_complete_widget.dart';
import '/commission_management_module/commissioner_ui/approve_and_rate_commissioned/approve_and_rate_commissioned_widget.dart';
import '/commission_management_module/for_both/c_approve_changes_ongoing/c_approve_changes_ongoing_widget.dart';
import '/commission_management_module/for_both/c_cancel_led/c_cancel_led_widget.dart';
import '/commission_management_module/for_both/c_changes_approval/c_changes_approval_widget.dart';
import '/commission_management_module/view_commission_details_one/view_commission_details_one_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'view_commissions_one_widget.dart' show ViewCommissionsOneWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ViewCommissionsOneModel
    extends FlutterFlowModel<ViewCommissionsOneWidget> {
  ///  State fields for stateful widgets in this page.

  Stream<List<CommissionRow>>? viewCommissionsOneSupabaseStream;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<ConversationRow>? queryConversationsC;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expandableExpandableController.dispose();
  }
}
