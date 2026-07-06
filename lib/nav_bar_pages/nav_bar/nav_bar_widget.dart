import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
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
        height: 100.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primary,
          shape: BoxShape.rectangle,
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FlutterFlowIconButton(
                borderRadius: 8.0,
                buttonSize: 50.0,
                icon: Icon(
                  Icons.home_filled,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pushNamed(MainPageWidget.routeName);
                },
              ),
              FlutterFlowIconButton(
                borderRadius: 8.0,
                buttonSize: 50.0,
                icon: Icon(
                  Icons.mail_rounded,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pushNamed(CommunityMessagingWidget.routeName);
                },
              ),
              FlutterFlowIconButton(
                borderRadius: 8.0,
                buttonSize: 50.0,
                icon: Icon(
                  Icons.store,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pushNamed(OrdersCommsWidget.routeName);
                },
              ),
              FlutterFlowIconButton(
                borderRadius: 8.0,
                buttonSize: 50.0,
                icon: Icon(
                  Icons.notifications_rounded,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pushNamed(NotificationsWidget.routeName);
                },
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: AuthUserStreamWidget(
                  builder: (context) => InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(
                        ProfileWidget.routeName,
                        queryParameters: {
                          'userReference': serializeParam(
                            currentUserReference,
                            ParamType.DocumentReference,
                          ),
                        }.withoutNulls,
                      );
                    },
                    child: Container(
                      width: 35.0,
                      height: 35.0,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        currentUserPhoto,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
