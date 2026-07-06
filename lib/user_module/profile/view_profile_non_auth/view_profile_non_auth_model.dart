import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/commission_management_module/for_both/c_creation_request/c_creation_request_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'view_profile_non_auth_widget.dart' show ViewProfileNonAuthWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ViewProfileNonAuthModel
    extends FlutterFlowModel<ViewProfileNonAuthWidget> {
  ///  State fields for stateful widgets in this page.

  Stream<List<UserRow>>? columnHeaderSupabaseStream;
  // Stores action output result for [Backend Call - Query Rows] action in Button_message widget.
  List<ConversationRow>? queryConversations;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    navBarModel.dispose();
  }
}
