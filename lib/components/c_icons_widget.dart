import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'c_icons_model.dart';
export 'c_icons_model.dart';

class CIconsWidget extends StatefulWidget {
  const CIconsWidget({super.key});

  @override
  State<CIconsWidget> createState() => _CIconsWidgetState();
}

class _CIconsWidgetState extends State<CIconsWidget> {
  late CIconsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CIconsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            FaIcon(
              FontAwesomeIcons.fan,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            Icon(
              Icons.fireplace,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            FaIcon(
              FontAwesomeIcons.grin,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            FaIcon(
              FontAwesomeIcons.shapes,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            Icon(
              Icons.filter_vintage_sharp,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            Icon(
              Icons.rocket,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            Icon(
              Icons.face,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            FaIcon(
              FontAwesomeIcons.tree,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            Icon(
              Icons.area_chart,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            FaIcon(
              FontAwesomeIcons.objectGroup,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            Icon(
              Icons.portrait_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            Icon(
              Icons.boy,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            FaIcon(
              FontAwesomeIcons.eye,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            Icon(
              Icons.color_lens_sharp,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            Icon(
              Icons.castle_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
          ],
        ),
      ),
    );
  }
}
