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
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'view_profile_non_auth_model.dart';
export 'view_profile_non_auth_model.dart';

/// _updated
class ViewProfileNonAuthWidget extends StatefulWidget {
  const ViewProfileNonAuthWidget({
    super.key,
    required this.userIDreference,
  });

  /// id reference of non auth
  final UserRow? userIDreference;

  static String routeName = 'View_Profile_NonAuth';
  static String routePath = '/viewProfileNonAuth';

  @override
  State<ViewProfileNonAuthWidget> createState() =>
      _ViewProfileNonAuthWidgetState();
}

class _ViewProfileNonAuthWidgetState extends State<ViewProfileNonAuthWidget>
    with TickerProviderStateMixin {
  late ViewProfileNonAuthModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewProfileNonAuthModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 1,
    )..addListener(() => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
          child: Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Stack(
              alignment: AlignmentDirectional(0.0, -1.0),
              children: [
                Container(
                  width: double.infinity,
                  height: 1000.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                ),
                SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      StreamBuilder<List<UserRow>>(
                        stream: _model.columnHeaderSupabaseStream ??= SupaFlow
                            .client
                            .from("User")
                            .stream(primaryKey: ['user_id'])
                            .eqOrNull(
                              'user_id',
                              widget!.userIDreference?.userId,
                            )
                            .map((list) =>
                                list.map((item) => UserRow(item)).toList()),
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
                          List<UserRow> columnHeaderUserRowList =
                              snapshot.data!;

                          final columnHeaderUserRow =
                              columnHeaderUserRowList.isNotEmpty
                                  ? columnHeaderUserRowList.first
                                  : null;

                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(30.0),
                                        bottomRight: Radius.circular(30.0),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        25.0, 40.0, 0.0, 0.0),
                                    child: Container(
                                      width: 150.0,
                                      height: 150.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        25.0, 40.0, 25.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              width: 150.0,
                                              height: 150.0,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Container(
                                                  width: 125.0,
                                                  height: 125.0,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    widget!.userIDreference!
                                                        .userImgURL!,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                widget!
                                                    .userIDreference?.userName,
                                                '>username',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        font:
                                                            GoogleFonts.roboto(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLarge
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge
                                                                .fontStyle,
                                                      ),
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                widget!
                                                    .userIDreference?.userEmail,
                                                '>user@email',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    font: GoogleFonts.roboto(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                RichText(
                                                  textScaler:
                                                      MediaQuery.of(context)
                                                          .textScaler,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: formatNumber(
                                                          columnHeaderUserRow!
                                                              .followers.length,
                                                          formatType: FormatType
                                                              .compact,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .roboto(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                      TextSpan(
                                                        text: ' Followers | ',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .roboto(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Colors
                                                                      .black,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                                if (widget!.userIDreference
                                                        ?.isArtist ==
                                                    true)
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Icon(
                                                        Icons.star,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        size: 24.0,
                                                      ),
                                                      FutureBuilder<
                                                          List<CommissionRow>>(
                                                        future:
                                                            CommissionTable()
                                                                .queryRows(
                                                          queryFn: (q) =>
                                                              q.eqOrNull(
                                                            'commissioned_id',
                                                            widget!
                                                                .userIDreference
                                                                ?.userId,
                                                          ),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  valueColor:
                                                                      AlwaysStoppedAnimation<
                                                                          Color>(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<CommissionRow>
                                                              textRatingCountCommissionRowList =
                                                              snapshot.data!;

                                                          return RichText(
                                                            textScaler:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                            text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text: 'N',
                                                                  style:
                                                                      TextStyle(
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .italic,
                                                                  ),
                                                                ),
                                                                TextSpan(
                                                                  text: ' (',
                                                                  style:
                                                                      TextStyle(),
                                                                ),
                                                                TextSpan(
                                                                  text:
                                                                      formatNumber(
                                                                    textRatingCountCommissionRowList
                                                                        .length,
                                                                    formatType:
                                                                        FormatType
                                                                            .compact,
                                                                  ),
                                                                  style:
                                                                      TextStyle(
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .italic,
                                                                  ),
                                                                ),
                                                                TextSpan(
                                                                  text: '+)',
                                                                  style:
                                                                      TextStyle(),
                                                                )
                                                              ],
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                              ],
                                            ),
                                          ].divide(SizedBox(height: 5.0)),
                                        ),
                                      ].divide(SizedBox(width: 10.0)),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25.0, 0.0, 25.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    widget!.userIDreference?.userBio,
                                    '>userbio',
                                  ),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  FutureBuilder<List<UserRow>>(
                                    future: UserTable().querySingleRow(
                                      queryFn: (q) => q.eqOrNull(
                                        'user_id',
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
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<UserRow> rowUserRowList =
                                          snapshot.data!;

                                      final rowUserRow =
                                          rowUserRowList.isNotEmpty
                                              ? rowUserRowList.first
                                              : null;

                                      return Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (columnHeaderUserRow?.followers
                                                  ?.contains(currentUserUid) !=
                                              true)
                                            FFButtonWidget(
                                              onPressed: () async {
                                                FFAppState()
                                                        .getListANDinsertUser =
                                                    widget!.userIDreference!
                                                        .followers
                                                        .toList()
                                                        .cast<String>();
                                                FFAppState()
                                                    .addToGetListANDinsertUser(
                                                        currentUserUid);
                                                await UserTable().update(
                                                  data: {
                                                    'followers': FFAppState()
                                                        .getListANDinsertUser,
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eqOrNull(
                                                    'user_id',
                                                    widget!.userIDreference
                                                        ?.userId,
                                                  ),
                                                );
                                                FFAppState()
                                                    .getListANDinsertUser = [];
                                                FFAppState()
                                                        .getListANDinsertUser =
                                                    rowUserRow!.following
                                                        .toList()
                                                        .cast<String>();
                                                FFAppState()
                                                    .addToGetListANDinsertUser(
                                                        widget!.userIDreference!
                                                            .userId!);
                                                await UserTable().update(
                                                  data: {
                                                    'following': FFAppState()
                                                        .getListANDinsertUser,
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eqOrNull(
                                                    'user_id',
                                                    currentUserUid,
                                                  ),
                                                );
                                                FFAppState()
                                                    .getListANDinsertUser = [];
                                                safeSetState(() {});
                                              },
                                              text: 'Follow',
                                              options: FFButtonOptions(
                                                width: 150.0,
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: Color(0xFF4EEFFF),
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .titleSmall
                                                    .override(
                                                      font: GoogleFonts.roboto(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(25.0),
                                              ),
                                            ),
                                          if (columnHeaderUserRow?.followers
                                                  ?.contains(currentUserUid) ==
                                              true)
                                            FFButtonWidget(
                                              onPressed: () async {
                                                FFAppState()
                                                        .getListANDremoveUser =
                                                    widget!.userIDreference!
                                                        .followers
                                                        .toList()
                                                        .cast<String>();
                                                FFAppState()
                                                    .removeFromGetListANDremoveUser(
                                                        currentUserUid);
                                                await UserTable().update(
                                                  data: {
                                                    'followers': FFAppState()
                                                        .getListANDremoveUser,
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eqOrNull(
                                                    'user_id',
                                                    widget!.userIDreference
                                                        ?.userId,
                                                  ),
                                                );
                                                FFAppState()
                                                    .getListANDremoveUser = [];
                                                FFAppState()
                                                        .getListANDremoveUser =
                                                    rowUserRow!.following
                                                        .toList()
                                                        .cast<String>();
                                                FFAppState()
                                                    .removeFromGetListANDremoveUser(
                                                        widget!.userIDreference!
                                                            .userId!);
                                                await UserTable().update(
                                                  data: {
                                                    'following': FFAppState()
                                                        .getListANDremoveUser,
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eqOrNull(
                                                    'user_id',
                                                    currentUserUid,
                                                  ),
                                                );
                                                FFAppState()
                                                    .getListANDremoveUser = [];
                                                safeSetState(() {});
                                              },
                                              text: 'Unfollow',
                                              options: FFButtonOptions(
                                                width: 150.0,
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: Colors.white,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .titleSmall
                                                    .override(
                                                      font: GoogleFonts.roboto(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                                elevation: 0.0,
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(25.0),
                                              ),
                                            ),
                                        ],
                                      );
                                    },
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      _model.queryConversations =
                                          await ConversationTable().queryRows(
                                        queryFn: (q) => q
                                            .containsOrNull(
                                              'user_IDs',
                                              '{${currentUserUid}}',
                                            )
                                            .containsOrNull(
                                              'user_IDs',
                                              '{${widget!.userIDreference?.userId}}',
                                            ),
                                      );
                                      if (!(_model.queryConversations != null &&
                                          (_model.queryConversations)!
                                              .isNotEmpty)) {
                                        FFAppState().addToConversationCreation(
                                            currentUserUid);
                                        FFAppState().addToConversationCreation(
                                            widget!.userIDreference!.userId!);
                                        await ConversationTable().insert({
                                          'user_IDs':
                                              FFAppState().conversationCreation,
                                          'lastMessage_sender': currentUserUid,
                                          'lastMessage_time':
                                              supaSerialize<DateTime>(
                                                  functions.getCurrentTime(
                                                      getCurrentTimestamp)),
                                          'lastMessage_content': 'Say Hi !',
                                        });
                                        FFAppState().conversationCreation = [];
                                      }

                                      context.pushNamed(
                                          ViewConversationPageWidget.routeName);

                                      safeSetState(() {});
                                    },
                                    text: 'Message',
                                    options: FFButtonOptions(
                                      width: 150.0,
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Colors.white,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: GoogleFonts.roboto(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 2.0,
                                indent: 25.0,
                                endIndent: 25.0,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                            ].divide(SizedBox(height: 15.0)),
                          );
                        },
                      ),
                      if (widget!.userIDreference?.isArtist == true)
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 15.0, 0.0),
                              child: Container(
                                height: 500.0,
                                decoration: BoxDecoration(),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment(0.0, 0),
                                      child: FlutterFlowButtonTabBar(
                                        useToggleButtonStyle: false,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.roboto(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                        unselectedLabelStyle: FlutterFlowTheme
                                                .of(context)
                                            .titleMedium
                                            .override(
                                              font: GoogleFonts.roboto(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontStyle,
                                              ),
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                        labelColor: FlutterFlowTheme.of(context)
                                            .primary,
                                        unselectedLabelColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                        backgroundColor: Color(0xFFAAE7FF),
                                        unselectedBorderColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        borderWidth: 1.0,
                                        borderRadius: 8.0,
                                        elevation: 0.0,
                                        labelPadding: EdgeInsets.all(5.0),
                                        buttonMargin:
                                            EdgeInsetsDirectional.fromSTEB(
                                                8.0, 0.0, 8.0, 0.0),
                                        tabs: [
                                          Tab(
                                            text: 'Commission\nDetails',
                                          ),
                                          Tab(
                                            text: 'Posts',
                                          ),
                                          Tab(
                                            text: 'Portfolio',
                                          ),
                                        ],
                                        controller: _model.tabBarController,
                                        onTap: (i) async {
                                          [
                                            () async {},
                                            () async {},
                                            () async {}
                                          ][i]();
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: TabBarView(
                                        controller: _model.tabBarController,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        children: [
                                          KeepAliveWidgetWrapper(
                                            builder: (context) => Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 15.0, 0.0, 0.0),
                                              child: FutureBuilder<
                                                  List<ArtistAvailabilityRow>>(
                                                future:
                                                    ArtistAvailabilityTable()
                                                        .querySingleRow(
                                                  queryFn: (q) => q.eqOrNull(
                                                    'artist_idRef',
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
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<ArtistAvailabilityRow>
                                                      containerArtistAvailabilityRowList =
                                                      snapshot.data!;

                                                  final containerArtistAvailabilityRow =
                                                      containerArtistAvailabilityRowList
                                                              .isNotEmpty
                                                          ? containerArtistAvailabilityRowList
                                                              .first
                                                          : null;

                                                  return Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  5.0,
                                                                  0.0),
                                                      child:
                                                          SingleChildScrollView(
                                                        primary: false,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Status : ',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .roboto(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleLarge
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleLarge
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                                if (containerArtistAvailabilityRow
                                                                        ?.status ==
                                                                    'Open')
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xFF1AE198),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              15.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          containerArtistAvailabilityRow
                                                                              ?.status,
                                                                          '>open',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Colors.white,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (containerArtistAvailabilityRow
                                                                        ?.status ==
                                                                    'Closed')
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xFFEA2248),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              15.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          containerArtistAvailabilityRow
                                                                              ?.status,
                                                                          '>closed',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Color(0xFF212124),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                              ]
                                                                  .divide(SizedBox(
                                                                      width:
                                                                          5.0))
                                                                  .around(SizedBox(
                                                                      width:
                                                                          5.0)),
                                                            ),
                                                            if (containerArtistAvailabilityRow
                                                                        ?.description !=
                                                                    null &&
                                                                containerArtistAvailabilityRow
                                                                        ?.description !=
                                                                    '')
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5.0),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      containerArtistAvailabilityRow
                                                                          ?.description,
                                                                      '>desc',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            if (containerArtistAvailabilityRow
                                                                        ?.price !=
                                                                    null &&
                                                                containerArtistAvailabilityRow
                                                                        ?.price !=
                                                                    '')
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5.0),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      containerArtistAvailabilityRow
                                                                          ?.price,
                                                                      '>prices',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                FaIcon(
                                                                  FontAwesomeIcons
                                                                      .clock,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 24.0,
                                                                ),
                                                                Text(
                                                                  dateTimeFormat(
                                                                      "relative",
                                                                      containerArtistAvailabilityRow!
                                                                          .updatedAt!),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 5.0)),
                                                            ),
                                                            if (containerArtistAvailabilityRow
                                                                    ?.status ==
                                                                'Open')
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1.0,
                                                                        0.0),
                                                                child:
                                                                    FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      enableDrag:
                                                                          false,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            FocusScope.of(context).unfocus();
                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                          },
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                MediaQuery.viewInsetsOf(context),
                                                                            child:
                                                                                CCreationRequestWidget(
                                                                              artistIdRef: widget!.userIDreference!,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        safeSetState(
                                                                            () {}));
                                                                  },
                                                                  text:
                                                                      'Request Commission',
                                                                  options:
                                                                      FFButtonOptions(
                                                                    height:
                                                                        40.0,
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.roboto(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                          ),
                                                                          color:
                                                                              Colors.white,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                    elevation:
                                                                        0.0,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                ),
                                                              ),
                                                          ]
                                                              .divide(SizedBox(
                                                                  height: 5.0))
                                                              .around(SizedBox(
                                                                  height: 5.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          KeepAliveWidgetWrapper(
                                            builder: (context) => Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 15.0, 0.0, 0.0),
                                              child: FutureBuilder<
                                                  List<UploadsRow>>(
                                                future:
                                                    UploadsTable().queryRows(
                                                  queryFn: (q) => q
                                                      .eqOrNull(
                                                        'uploader_Id',
                                                        widget!.userIDreference
                                                            ?.userId,
                                                      )
                                                      .order('last_updated_at'),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<UploadsRow>
                                                      listViewUploadsRowList =
                                                      snapshot.data!;

                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        listViewUploadsRowList
                                                            .length,
                                                    itemBuilder: (context,
                                                        listViewIndex) {
                                                      final listViewUploadsRow =
                                                          listViewUploadsRowList[
                                                              listViewIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    15.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    5.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                FutureBuilder<
                                                                    List<
                                                                        UserRow>>(
                                                                  future: UserTable()
                                                                      .querySingleRow(
                                                                    queryFn: (q) =>
                                                                        q.eqOrNull(
                                                                      'user_id',
                                                                      listViewUploadsRow
                                                                          .uploaderId,
                                                                    ),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            valueColor:
                                                                                AlwaysStoppedAnimation<Color>(
                                                                              FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<UserRow>
                                                                        rowUserRowList =
                                                                        snapshot
                                                                            .data!;

                                                                    final rowUserRow = rowUserRowList
                                                                            .isNotEmpty
                                                                        ? rowUserRowList
                                                                            .first
                                                                        : null;

                                                                    return Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children:
                                                                          [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Container(
                                                                              width: 45.0,
                                                                              height: 45.0,
                                                                              clipBehavior: Clip.antiAlias,
                                                                              decoration: BoxDecoration(
                                                                                shape: BoxShape.circle,
                                                                              ),
                                                                              child: Image.network(
                                                                                rowUserRow!.userImgURL!,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              valueOrDefault<String>(
                                                                                rowUserRow?.userName,
                                                                                '>user_name',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                    font: GoogleFonts.roboto(
                                                                                      fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                    ),
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 5.0)),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 5.0)),
                                                                    );
                                                                  },
                                                                ),
                                                                Divider(
                                                                  thickness:
                                                                      2.0,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                ),
                                                                Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            5.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          [
                                                                        Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            listViewUploadsRow.uploadContent,
                                                                            '>content',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                        if (listViewUploadsRow.uploadimgURL !=
                                                                                null &&
                                                                            listViewUploadsRow.uploadimgURL !=
                                                                                '')
                                                                          ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            child:
                                                                                Image.network(
                                                                              listViewUploadsRow.uploadimgURL!,
                                                                              fit: BoxFit.fill,
                                                                            ),
                                                                          ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            FaIcon(
                                                                              FontAwesomeIcons.clock,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              size: 24.0,
                                                                            ),
                                                                            Text(
                                                                              valueOrDefault<String>(
                                                                                dateTimeFormat("relative", listViewUploadsRow.lastUpdatedAt),
                                                                                '>timestamp',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 5.0)),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 5.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Divider(
                                                                  thickness:
                                                                      2.0,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        if (!listViewUploadsRow
                                                                            .likes
                                                                            .contains(currentUserUid))
                                                                          FlutterFlowIconButton(
                                                                            borderRadius:
                                                                                8.0,
                                                                            buttonSize:
                                                                                40.0,
                                                                            icon:
                                                                                Icon(
                                                                              Icons.thumb_up,
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: 24.0,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              FFAppState().getListANDinsertUser = listViewUploadsRow.likes.toList().cast<String>();
                                                                              FFAppState().addToGetListANDinsertUser(currentUserUid);
                                                                              await UploadsTable().update(
                                                                                data: {
                                                                                  'likes': FFAppState().getListANDinsertUser,
                                                                                },
                                                                                matchingRows: (rows) => rows.eqOrNull(
                                                                                  'upload_id',
                                                                                  listViewUploadsRow.uploadId,
                                                                                ),
                                                                              );
                                                                              FFAppState().getListANDinsertUser = [];
                                                                              if (listViewUploadsRow.uploaderId != currentUserUid) {
                                                                                await NotificationTable().insert({
                                                                                  'is_read': false,
                                                                                  'made_by': currentUserUid,
                                                                                  'made_for': listViewUploadsRow.uploaderId,
                                                                                  'notif_type': 'liked your post.',
                                                                                  'doc_ref': listViewUploadsRow.uploadId,
                                                                                });
                                                                              }
                                                                            },
                                                                          ),
                                                                        if (listViewUploadsRow
                                                                            .likes
                                                                            .contains(currentUserUid))
                                                                          FlutterFlowIconButton(
                                                                            borderRadius:
                                                                                8.0,
                                                                            buttonSize:
                                                                                40.0,
                                                                            icon:
                                                                                Icon(
                                                                              Icons.thumb_up,
                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                              size: 24.0,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              FFAppState().getListANDremoveUser = listViewUploadsRow.likes.toList().cast<String>();
                                                                              FFAppState().removeFromGetListANDremoveUser(currentUserUid);
                                                                              await UploadsTable().update(
                                                                                data: {
                                                                                  'likes': FFAppState().getListANDremoveUser,
                                                                                },
                                                                                matchingRows: (rows) => rows.eqOrNull(
                                                                                  'upload_id',
                                                                                  listViewUploadsRow.uploadId,
                                                                                ),
                                                                              );
                                                                              FFAppState().getListANDremoveUser = [];
                                                                            },
                                                                          ),
                                                                        Text(
                                                                          formatNumber(
                                                                            listViewUploadsRow.likes.length,
                                                                            formatType:
                                                                                FormatType.compact,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 5.0)),
                                                                    ),
                                                                    FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        context
                                                                            .pushNamed(
                                                                          PageViewUploadWidget
                                                                              .routeName,
                                                                          queryParameters:
                                                                              {
                                                                            'idReference':
                                                                                serializeParam(
                                                                              listViewUploadsRow,
                                                                              ParamType.SupabaseRow,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      },
                                                                      text:
                                                                          'Comment',
                                                                      options:
                                                                          FFButtonOptions(
                                                                        height:
                                                                            40.0,
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              font: GoogleFonts.roboto(
                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                              ),
                                                                              color: Colors.white,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                            ),
                                                                        elevation:
                                                                            0.0,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          10.0)),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          KeepAliveWidgetWrapper(
                                            builder: (context) => Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 15.0, 0.0, 0.0),
                                              child: FutureBuilder<
                                                  List<UploadsRow>>(
                                                future:
                                                    UploadsTable().queryRows(
                                                  queryFn: (q) => q
                                                      .eqOrNull(
                                                        'uploader_Id',
                                                        widget!.userIDreference
                                                            ?.userId,
                                                      )
                                                      .eqOrNull(
                                                        'isPortfolio',
                                                        true,
                                                      )
                                                      .order('last_updated_at'),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<UploadsRow>
                                                      staggeredViewUploadsRowList =
                                                      snapshot.data!;

                                                  return MasonryGridView
                                                      .builder(
                                                    gridDelegate:
                                                        SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2,
                                                    ),
                                                    crossAxisSpacing: 10.0,
                                                    mainAxisSpacing: 10.0,
                                                    itemCount:
                                                        staggeredViewUploadsRowList
                                                            .length,
                                                    itemBuilder: (context,
                                                        staggeredViewIndex) {
                                                      final staggeredViewUploadsRow =
                                                          staggeredViewUploadsRowList[
                                                              staggeredViewIndex];
                                                      return InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          context.pushNamed(
                                                            PageViewUploadWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'idReference':
                                                                  serializeParam(
                                                                staggeredViewUploadsRow,
                                                                ParamType
                                                                    .SupabaseRow,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                            border: Border.all(
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child:
                                                                Image.network(
                                                              staggeredViewUploadsRow
                                                                  .uploadimgURL!,
                                                              fit: BoxFit.fill,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ]
                              .divide(SizedBox(height: 15.0))
                              .around(SizedBox(height: 15.0)),
                        ),
                      if (widget!.userIDreference?.isArtist == false)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 15.0, 0.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FutureBuilder<List<UploadsRow>>(
                                  future: UploadsTable().queryRows(
                                    queryFn: (q) => q
                                        .eqOrNull(
                                          'uploader_Id',
                                          widget!.userIDreference?.userId,
                                        )
                                        .order('last_updated_at'),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<UploadsRow> listViewUploadsRowList =
                                        snapshot.data!;

                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: listViewUploadsRowList.length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewUploadsRow =
                                            listViewUploadsRowList[
                                                listViewIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 15.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(5.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FutureBuilder<List<UserRow>>(
                                                    future: UserTable()
                                                        .querySingleRow(
                                                      queryFn: (q) =>
                                                          q.eqOrNull(
                                                        'user_id',
                                                        listViewUploadsRow
                                                            .uploaderId,
                                                      ),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<UserRow>
                                                          rowUserRowList =
                                                          snapshot.data!;

                                                      final rowUserRow =
                                                          rowUserRowList
                                                                  .isNotEmpty
                                                              ? rowUserRowList
                                                                  .first
                                                              : null;

                                                      return Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: 45.0,
                                                                height: 45.0,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Image
                                                                    .network(
                                                                  rowUserRow!
                                                                      .userImgURL!,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  rowUserRow
                                                                      ?.userName,
                                                                  '>user_name',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .roboto(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .fontStyle,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleLarge
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleLarge
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 5.0)),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 5.0)),
                                                      );
                                                    },
                                                  ),
                                                  Divider(
                                                    thickness: 2.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(5.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              listViewUploadsRow
                                                                  .uploadContent,
                                                              '>content',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          if (listViewUploadsRow
                                                                      .uploadimgURL !=
                                                                  null &&
                                                              listViewUploadsRow
                                                                      .uploadimgURL !=
                                                                  '')
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                listViewUploadsRow
                                                                    .uploadimgURL!,
                                                                fit:
                                                                    BoxFit.fill,
                                                              ),
                                                            ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              FaIcon(
                                                                FontAwesomeIcons
                                                                    .clock,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 24.0,
                                                              ),
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  dateTimeFormat(
                                                                      "relative",
                                                                      listViewUploadsRow
                                                                          .lastUpdatedAt),
                                                                  '>timestamp',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 5.0)),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 5.0)),
                                                      ),
                                                    ),
                                                  ),
                                                  Divider(
                                                    thickness: 2.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          if (!listViewUploadsRow
                                                              .likes
                                                              .contains(
                                                                  currentUserUid))
                                                            FlutterFlowIconButton(
                                                              borderRadius: 8.0,
                                                              buttonSize: 40.0,
                                                              icon: Icon(
                                                                Icons.thumb_up,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                FFAppState()
                                                                        .getListANDinsertUser =
                                                                    listViewUploadsRow
                                                                        .likes
                                                                        .toList()
                                                                        .cast<
                                                                            String>();
                                                                FFAppState()
                                                                    .addToGetListANDinsertUser(
                                                                        currentUserUid);
                                                                await UploadsTable()
                                                                    .update(
                                                                  data: {
                                                                    'likes':
                                                                        FFAppState()
                                                                            .getListANDinsertUser,
                                                                  },
                                                                  matchingRows:
                                                                      (rows) =>
                                                                          rows.eqOrNull(
                                                                    'upload_id',
                                                                    listViewUploadsRow
                                                                        .uploadId,
                                                                  ),
                                                                );
                                                                FFAppState()
                                                                    .getListANDinsertUser = [];
                                                                if (listViewUploadsRow
                                                                        .uploaderId !=
                                                                    currentUserUid) {
                                                                  await NotificationTable()
                                                                      .insert({
                                                                    'is_read':
                                                                        false,
                                                                    'made_by':
                                                                        currentUserUid,
                                                                    'made_for':
                                                                        listViewUploadsRow
                                                                            .uploaderId,
                                                                    'notif_type':
                                                                        'liked your post.',
                                                                    'doc_ref':
                                                                        listViewUploadsRow
                                                                            .uploadId,
                                                                  });
                                                                }
                                                              },
                                                            ),
                                                          if (listViewUploadsRow
                                                              .likes
                                                              .contains(
                                                                  currentUserUid))
                                                            FlutterFlowIconButton(
                                                              borderRadius: 8.0,
                                                              buttonSize: 40.0,
                                                              icon: Icon(
                                                                Icons.thumb_up,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                FFAppState()
                                                                        .getListANDremoveUser =
                                                                    listViewUploadsRow
                                                                        .likes
                                                                        .toList()
                                                                        .cast<
                                                                            String>();
                                                                FFAppState()
                                                                    .removeFromGetListANDremoveUser(
                                                                        currentUserUid);
                                                                await UploadsTable()
                                                                    .update(
                                                                  data: {
                                                                    'likes':
                                                                        FFAppState()
                                                                            .getListANDremoveUser,
                                                                  },
                                                                  matchingRows:
                                                                      (rows) =>
                                                                          rows.eqOrNull(
                                                                    'upload_id',
                                                                    listViewUploadsRow
                                                                        .uploadId,
                                                                  ),
                                                                );
                                                                FFAppState()
                                                                    .getListANDremoveUser = [];
                                                              },
                                                            ),
                                                          Text(
                                                            formatNumber(
                                                              listViewUploadsRow
                                                                  .likes.length,
                                                              formatType:
                                                                  FormatType
                                                                      .compact,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 5.0)),
                                                      ),
                                                      FFButtonWidget(
                                                        onPressed: () async {
                                                          context.pushNamed(
                                                            PageViewUploadWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'idReference':
                                                                  serializeParam(
                                                                listViewUploadsRow,
                                                                ParamType
                                                                    .SupabaseRow,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        text: 'Comment',
                                                        options:
                                                            FFButtonOptions(
                                                          height: 40.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .roboto(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                                    color: Colors
                                                                        .white,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                          elevation: 0.0,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ]
                                  .divide(SizedBox(height: 15.0))
                                  .around(SizedBox(height: 15.0)),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                wrapWithModel(
                  model: _model.navBarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: NavBarWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
