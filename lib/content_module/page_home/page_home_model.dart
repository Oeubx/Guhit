import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/components/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'page_home_widget.dart' show PageHomeWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PageHomeModel extends FlutterFlowModel<PageHomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - compareAndAddTags] action in IconButton_like widget.
  List<String>? addCurrTags;
  // Stores action output result for [Custom Action - compareAndRemoveTags] action in IconButton_unlike widget.
  List<String>? removeCurrTags;
  // Stores action output result for [Custom Action - compareAndAddTags] action in IconButton_like widget.
  List<String>? addCurrTagsAll;
  // Stores action output result for [Custom Action - compareAndRemoveTags] action in IconButton_unlike widget.
  List<String>? removeCurrTagsAll;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    navBarModel.dispose();
  }
}
