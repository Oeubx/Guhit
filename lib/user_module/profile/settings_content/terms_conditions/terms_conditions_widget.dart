import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'terms_conditions_model.dart';
export 'terms_conditions_model.dart';

class TermsConditionsWidget extends StatefulWidget {
  const TermsConditionsWidget({super.key});

  static String routeName = 'TermsConditions';
  static String routePath = '/termsConditions';

  @override
  State<TermsConditionsWidget> createState() => _TermsConditionsWidgetState();
}

class _TermsConditionsWidgetState extends State<TermsConditionsWidget> {
  late TermsConditionsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsConditionsModel());
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
                                '''# **Welcome to GUHIT**\n\n## *These Terms and Conditions govern the use of the GUHIT platform. By creating an account, accessing, or using the application, users agree to comply with these terms.*\n\n### **1. User Accounts**\nUsers are responsible for maintaining the confidentiality of their account credentials. Any activity performed through a user\'s account is the responsibility of the account owner.\n\n### **2. User Conduct**\nUsers agree to:\nProvide accurate account information.\nRespect other users and artists.\nRefrain from posting harmful, offensive, fraudulent, or illegal content.\nAvoid harassment, spam, or abusive behavior.\n\n### **3. Artwork Ownership**\nArtists retain full ownership and intellectual property rights over their uploaded artworks. GUHIT does not claim ownership of any artwork posted on the platform.\n\n### 4. Commission Transactions\nClients and artists are responsible for ensuring that commission details, expectations, and agreements are clearly communicated. GUHIT serves only as a platform facilitating interactions and is not a party to commission agreements.\n\n### **5. Content Moderation**\nGUHIT reserves the right to remove content or suspend accounts that violate platform policies, intellectual property rights, or community guidelines.\n\n### **6. Limitation of Liability**\nGUHIT is provided for educational and research purposes. The platform is not responsible for losses, disputes, or damages arising from user interactions or commission transactions.\n\n### **7. Changes to Terms**\nGUHIT reserves the right to modify these Terms and Conditions. Continued use of the platform constitutes acceptance of updated terms.\n''',
                            selectable: false,
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
                    'Change Password',
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
