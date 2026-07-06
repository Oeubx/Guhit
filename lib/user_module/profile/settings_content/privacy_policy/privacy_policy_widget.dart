import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'privacy_policy_model.dart';
export 'privacy_policy_model.dart';

class PrivacyPolicyWidget extends StatefulWidget {
  const PrivacyPolicyWidget({super.key});

  static String routeName = 'PrivacyPolicy';
  static String routePath = '/privacyPolicy';

  @override
  State<PrivacyPolicyWidget> createState() => _PrivacyPolicyWidgetState();
}

class _PrivacyPolicyWidgetState extends State<PrivacyPolicyWidget> {
  late PrivacyPolicyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrivacyPolicyModel());
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
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: MarkdownBody(
                            data:
                                '''# **Privacy Policy for GUHIT**\n\n### **GUHIT** values the privacy and security of its users. This Privacy Policy explains how user information is collected, used, stored, and protected.\n\n## **1. Information We Collect**\n### The platform may collect the following information:\n\nAccount Information\n\nEmail address\n\nUsername\n\nProfile information\n\nProfile picture\n\nContent Information\n\nUploaded artworks\n\nArtwork descriptions and tags\n\nCommission requests and related information\n\nActivity Information\n\nLikes and reactions\n\nFollow relationships\n\nDirect messages\n\nCommission status updates\n\n## **2. How We Use Information**\nCollected information is used to:\nCreate and manage user accounts.\n\nFacilitate commission requests and communication.\n\nDisplay user profiles and portfolios.\n\nImprove platform functionality and user experience.\n\nGenerate recommendations and content categorization features.\n\n## **3. Data Security**\n### **GUHIT** implements secure programming practices to protect user information, including:\nPassword hashing and secure authentication.\n\nInput validation and sanitization.\n\nProtection against common security vulnerabilities.\n\nSecure storage and transmission of data.\n\n## **4. Intellectual Property Protection**\n### Artists maintain ownership of all artworks uploaded to the platform. GUHIT stores artwork information solely to provide platform services and does not claim ownership of user-generated content.\n\n## **5. Sharing of Information**\n### GUHIT does not sell, rent, or share personal information with third parties except when required by law or necessary for system operation.\n\n## **6. User Rights**\n### Users may:\nUpdate their profile information.\n\nDelete their account subject to platform policies.\n\nRequest correction of inaccurate account information.\n\n## **7. Policy Updates**\n### This Privacy Policy may be updated periodically to reflect changes in system functionality, security requirements, or legal obligations.\n\n## **8. Contact Information**\nFor questions regarding these Terms and Conditions or Privacy Policy, users may contact the GUHIT development team through the platform\'s support channels.\n\n''',
                            selectable: true,
                            onTapLink: (_, url, __) => launchURL(url!),
                          ),
                        ),
                      ],
                    ),
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
                    'Privacy Policy',
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
