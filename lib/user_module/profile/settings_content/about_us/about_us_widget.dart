import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'about_us_model.dart';
export 'about_us_model.dart';

class AboutUsWidget extends StatefulWidget {
  const AboutUsWidget({super.key});

  static String routeName = 'AboutUs';
  static String routePath = '/aboutUs';

  @override
  State<AboutUsWidget> createState() => _AboutUsWidgetState();
}

class _AboutUsWidgetState extends State<AboutUsWidget> {
  late AboutUsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AboutUsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Container(
                height: 1750.0,
                decoration: BoxDecoration(),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(15.0, 50.0, 15.0, 100.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: MarkdownBody(
                          data:
                              '''# **About GUHIT**\n\n### GUHIT is an Art Commission and Art Sharing Platform designed to connect artists and clients within a collaborative digital community. The platform provides artists with a space to showcase their portfolios, share their creative works, and receive commission requests from potential clients.\n\n### Through GUHIT, users can discover artworks, interact with artists, request commissions, and engage with the creative community through likes, follows, comments, and direct messaging. Artists can manage their portfolios, track commission progress, and build their reputation through ratings and feedback.\nThe platform also incorporates emerging technologies such as AI-assisted tagging and artwork categorization to improve content discoverability and user experience.\n\n## **Mission**\n### To empower artists by providing a secure and accessible platform for showcasing talent, building professional connections, and receiving commission opportunities.\n\n## **Vision**\n### To become a trusted digital community where creativity, collaboration, and artistic growth thrive.\n''',
                          selectable: true,
                          onTapLink: (_, url, __) => launchURL(url!),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              wrapWithModel(
                model: _model.navBarModel,
                updateCallback: () => safeSetState(() {}),
                child: NavBarWidget(),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.safePop();
                      },
                      child: Icon(
                        Icons.arrow_back_sharp,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30.0,
                      ),
                    ),
                  ),
                  Text(
                    'About Us',
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          font: GoogleFonts.roboto(
                            fontWeight: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .fontStyle,
                          ),
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .fontStyle,
                        ),
                  ),
                ].divide(SizedBox(width: 5.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
