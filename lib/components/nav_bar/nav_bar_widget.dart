import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nav_bar_model.dart';
export 'nav_bar_model.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  late NavBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        height: 70.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlutterFlowIconButton(
                borderRadius: 8.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).primary,
                icon: Icon(
                  Icons.home_outlined,
                  color: FlutterFlowTheme.of(context).info,
                  size: 25.0,
                ),
                onPressed: () async {
                  context.pushNamed(PageHomeWidget.routeName);
                },
              ),
              FlutterFlowIconButton(
                borderRadius: 8.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).primary,
                icon: Icon(
                  Icons.chat_bubble_outline_rounded,
                  color: FlutterFlowTheme.of(context).info,
                  size: 25.0,
                ),
                onPressed: () async {
                  context.pushNamed(ViewConversationPageWidget.routeName);
                },
              ),
              FlutterFlowIconButton(
                borderRadius: 8.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).primary,
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  color: FlutterFlowTheme.of(context).info,
                  size: 25.0,
                ),
                onPressed: () async {
                  context.pushNamed(PageMarketplaceWidget.routeName);
                },
              ),
              Stack(
                children: [
                  FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).primary,
                    icon: Icon(
                      Icons.notifications_outlined,
                      color: FlutterFlowTheme.of(context).info,
                      size: 25.0,
                    ),
                    onPressed: () async {
                      context.pushNamed(PageNotificationsWidget.routeName);
                    },
                  ),
                  FutureBuilder<List<NotificationRow>>(
                    future: NotificationTable().queryRows(
                      queryFn: (q) => q
                          .eqOrNull(
                            'is_read',
                            false,
                          )
                          .eqOrNull(
                            'made_for',
                            currentUserUid,
                          ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<NotificationRow> containerNotificationRowList =
                          snapshot.data!;

                      return Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).tertiary,
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            formatNumber(
                              containerNotificationRowList.length,
                              formatType: FormatType.compact,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: GoogleFonts.roboto(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              FlutterFlowIconButton(
                borderRadius: 8.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).primary,
                icon: Icon(
                  Icons.person,
                  color: FlutterFlowTheme.of(context).info,
                  size: 25.0,
                ),
                onPressed: () async {
                  context.pushNamed(ViewProfileAuthWidget.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
