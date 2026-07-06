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
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'page_home_model.dart';
export 'page_home_model.dart';

class PageHomeWidget extends StatefulWidget {
  const PageHomeWidget({super.key});

  static String routeName = 'Page_Home';
  static String routePath = '/pageHome';

  @override
  State<PageHomeWidget> createState() => _PageHomeWidgetState();
}

class _PageHomeWidgetState extends State<PageHomeWidget> {
  late PageHomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PageHomeModel());
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
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 65.0, 0.0, 70.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
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
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<UserRow> stackPreferencesUserRowList =
                                  snapshot.data!;

                              final stackPreferencesUserRow =
                                  stackPreferencesUserRowList.isNotEmpty
                                      ? stackPreferencesUserRowList.first
                                      : null;

                              return Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 0.0, 15.0, 0.0),
                                    child: FutureBuilder<List<UploadsRow>>(
                                      future: UploadsTable().queryRows(
                                        queryFn: (q) => q
                                            .overlapsOrNull(
                                              'tags',
                                              stackPreferencesUserRow
                                                  ?.userPreferredTags,
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
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
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
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewUploadsRowList.length,
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewUploadsRow =
                                                listViewUploadsRowList[
                                                    listViewIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 15.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(5.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      FutureBuilder<
                                                          List<UserRow>>(
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

                                                          return InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              if (rowUserRow
                                                                      ?.userId ==
                                                                  currentUserUid) {
                                                                context.pushNamed(
                                                                    ViewProfileAuthWidget
                                                                        .routeName);

                                                                return;
                                                              } else {
                                                                context
                                                                    .pushNamed(
                                                                  ViewProfileNonAuthWidget
                                                                      .routeName,
                                                                  queryParameters:
                                                                      {
                                                                    'userIDreference':
                                                                        serializeParam(
                                                                      rowUserRow,
                                                                      ParamType
                                                                          .SupabaseRow,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );

                                                                return;
                                                              }
                                                            },
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  width: 45.0,
                                                                  height: 45.0,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
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
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 5.0)),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                      Divider(
                                                        thickness: 2.0,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
                                                      Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  5.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
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
                                                                  child: Image
                                                                      .network(
                                                                    listViewUploadsRow
                                                                        .uploadimgURL!,
                                                                    fit: BoxFit
                                                                        .fill,
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
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        5.0)),
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 5.0)),
                                                          ),
                                                        ),
                                                      ),
                                                      Divider(
                                                        thickness: 2.0,
                                                        color:
                                                            FlutterFlowTheme.of(
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
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                formatNumber(
                                                                  listViewUploadsRow
                                                                      .likes
                                                                      .length,
                                                                  formatType:
                                                                      FormatType
                                                                          .compact,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .roboto(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                              if (!listViewUploadsRow
                                                                  .likes
                                                                  .contains(
                                                                      currentUserUid))
                                                                FlutterFlowIconButton(
                                                                  borderRadius:
                                                                      8.0,
                                                                  buttonSize:
                                                                      40.0,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .thumb_up,
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
                                                                            .cast<String>();
                                                                    FFAppState()
                                                                        .addToGetListANDinsertUser(
                                                                            currentUserUid);
                                                                    await UploadsTable()
                                                                        .update(
                                                                      data: {
                                                                        'likes':
                                                                            FFAppState().getListANDinsertUser,
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
                                                                    FFAppState()
                                                                            .getPostTags =
                                                                        listViewUploadsRow
                                                                            .tags
                                                                            .toList()
                                                                            .cast<String>();
                                                                    FFAppState().userTags = stackPreferencesUserRow!
                                                                        .userPreferredTags
                                                                        .toList()
                                                                        .cast<
                                                                            String>();
                                                                    _model.addCurrTags =
                                                                        await actions
                                                                            .compareAndAddTags(
                                                                      FFAppState()
                                                                          .getPostTags
                                                                          .toList(),
                                                                      FFAppState()
                                                                          .userTags
                                                                          .toList(),
                                                                    );
                                                                    FFAppState()
                                                                        .getPostTags = [];
                                                                    FFAppState()
                                                                        .userTags = [];
                                                                    await UserTable()
                                                                        .update(
                                                                      data: {
                                                                        'user_preferredTags':
                                                                            _model.addCurrTags,
                                                                      },
                                                                      matchingRows:
                                                                          (rows) =>
                                                                              rows.eqOrNull(
                                                                        'user_id',
                                                                        currentUserUid,
                                                                      ),
                                                                    );
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
                                                                            listViewUploadsRow.uploaderId,
                                                                        'notif_type':
                                                                            'liked your post.',
                                                                        'doc_ref':
                                                                            listViewUploadsRow.uploadId,
                                                                      });
                                                                    }

                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                ),
                                                              if (listViewUploadsRow
                                                                  .likes
                                                                  .contains(
                                                                      currentUserUid))
                                                                FlutterFlowIconButton(
                                                                  borderRadius:
                                                                      8.0,
                                                                  buttonSize:
                                                                      40.0,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .thumb_up,
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
                                                                            .cast<String>();
                                                                    FFAppState()
                                                                        .removeFromGetListANDremoveUser(
                                                                            currentUserUid);
                                                                    await UploadsTable()
                                                                        .update(
                                                                      data: {
                                                                        'likes':
                                                                            FFAppState().getListANDremoveUser,
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
                                                                    FFAppState()
                                                                            .getPostTags =
                                                                        listViewUploadsRow
                                                                            .tags
                                                                            .toList()
                                                                            .cast<String>();
                                                                    FFAppState().userTags = stackPreferencesUserRow!
                                                                        .userPreferredTags
                                                                        .toList()
                                                                        .cast<
                                                                            String>();
                                                                    _model.removeCurrTags =
                                                                        await actions
                                                                            .compareAndRemoveTags(
                                                                      FFAppState()
                                                                          .getPostTags
                                                                          .toList(),
                                                                      FFAppState()
                                                                          .userTags
                                                                          .toList(),
                                                                    );
                                                                    FFAppState()
                                                                        .getPostTags = [];
                                                                    FFAppState()
                                                                        .userTags = [];
                                                                    await UserTable()
                                                                        .update(
                                                                      data: {
                                                                        'user_preferredTags':
                                                                            _model.addCurrTags,
                                                                      },
                                                                      matchingRows:
                                                                          (rows) =>
                                                                              rows.eqOrNull(
                                                                        'user_id',
                                                                        currentUserUid,
                                                                      ),
                                                                    );

                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                ),
                                                            ].divide(SizedBox(
                                                                width: 5.0)),
                                                          ),
                                                          FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              context.pushNamed(
                                                                PageViewUploadWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
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
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
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
                                                        ].divide(SizedBox(
                                                            width: 10.0)),
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
                                ],
                              );
                            },
                          ),
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
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<UserRow> stackAllUserRowList =
                                  snapshot.data!;

                              final stackAllUserRow =
                                  stackAllUserRowList.isNotEmpty
                                      ? stackAllUserRowList.first
                                      : null;

                              return Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 0.0, 15.0, 0.0),
                                    child: FutureBuilder<List<UploadsRow>>(
                                      future: UploadsTable().queryRows(
                                        queryFn: (q) =>
                                            q.order('last_updated_at'),
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
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
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
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewUploadsRowList.length,
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewUploadsRow =
                                                listViewUploadsRowList[
                                                    listViewIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 15.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(5.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      FutureBuilder<
                                                          List<UserRow>>(
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

                                                          return InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              if (rowUserRow
                                                                      ?.userId ==
                                                                  currentUserUid) {
                                                                context.pushNamed(
                                                                    ViewProfileAuthWidget
                                                                        .routeName);

                                                                return;
                                                              } else {
                                                                context
                                                                    .pushNamed(
                                                                  ViewProfileNonAuthWidget
                                                                      .routeName,
                                                                  queryParameters:
                                                                      {
                                                                    'userIDreference':
                                                                        serializeParam(
                                                                      rowUserRow,
                                                                      ParamType
                                                                          .SupabaseRow,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );

                                                                return;
                                                              }
                                                            },
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  width: 45.0,
                                                                  height: 45.0,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
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
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 5.0)),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                      Divider(
                                                        thickness: 2.0,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
                                                      Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  5.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
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
                                                                  child: Image
                                                                      .network(
                                                                    listViewUploadsRow
                                                                        .uploadimgURL!,
                                                                    fit: BoxFit
                                                                        .fill,
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
                                                                        listViewUploadsRow
                                                                            .lastUpdatedAt),
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
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        5.0)),
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 5.0)),
                                                          ),
                                                        ),
                                                      ),
                                                      Divider(
                                                        thickness: 2.0,
                                                        color:
                                                            FlutterFlowTheme.of(
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
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                formatNumber(
                                                                  listViewUploadsRow
                                                                      .likes
                                                                      .length,
                                                                  formatType:
                                                                      FormatType
                                                                          .compact,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .roboto(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                              if (!listViewUploadsRow
                                                                  .likes
                                                                  .contains(
                                                                      currentUserUid))
                                                                FlutterFlowIconButton(
                                                                  borderRadius:
                                                                      8.0,
                                                                  buttonSize:
                                                                      40.0,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .thumb_up,
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
                                                                            .cast<String>();
                                                                    FFAppState()
                                                                        .addToGetListANDinsertUser(
                                                                            currentUserUid);
                                                                    await UploadsTable()
                                                                        .update(
                                                                      data: {
                                                                        'likes':
                                                                            FFAppState().getListANDinsertUser,
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
                                                                    FFAppState()
                                                                            .getPostTags =
                                                                        listViewUploadsRow
                                                                            .tags
                                                                            .toList()
                                                                            .cast<String>();
                                                                    FFAppState().userTags = stackAllUserRow!
                                                                        .userPreferredTags
                                                                        .toList()
                                                                        .cast<
                                                                            String>();
                                                                    _model.addCurrTagsAll =
                                                                        await actions
                                                                            .compareAndAddTags(
                                                                      FFAppState()
                                                                          .getPostTags
                                                                          .toList(),
                                                                      FFAppState()
                                                                          .userTags
                                                                          .toList(),
                                                                    );
                                                                    FFAppState()
                                                                        .getPostTags = [];
                                                                    FFAppState()
                                                                        .userTags = [];
                                                                    await UserTable()
                                                                        .update(
                                                                      data: {
                                                                        'user_preferredTags':
                                                                            _model.addCurrTagsAll,
                                                                      },
                                                                      matchingRows:
                                                                          (rows) =>
                                                                              rows.eqOrNull(
                                                                        'user_id',
                                                                        currentUserUid,
                                                                      ),
                                                                    );
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
                                                                            listViewUploadsRow.uploaderId,
                                                                        'notif_type':
                                                                            'liked your post.',
                                                                        'doc_ref':
                                                                            listViewUploadsRow.uploadId,
                                                                      });
                                                                    }

                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                ),
                                                              if (listViewUploadsRow
                                                                  .likes
                                                                  .contains(
                                                                      currentUserUid))
                                                                FlutterFlowIconButton(
                                                                  borderRadius:
                                                                      8.0,
                                                                  buttonSize:
                                                                      40.0,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .thumb_up,
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
                                                                            .cast<String>();
                                                                    FFAppState()
                                                                        .removeFromGetListANDremoveUser(
                                                                            currentUserUid);
                                                                    await UploadsTable()
                                                                        .update(
                                                                      data: {
                                                                        'likes':
                                                                            FFAppState().getListANDremoveUser,
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
                                                                    FFAppState()
                                                                            .getPostTags =
                                                                        listViewUploadsRow
                                                                            .tags
                                                                            .toList()
                                                                            .cast<String>();
                                                                    FFAppState().userTags = stackAllUserRow!
                                                                        .userPreferredTags
                                                                        .toList()
                                                                        .cast<
                                                                            String>();
                                                                    _model.removeCurrTagsAll =
                                                                        await actions
                                                                            .compareAndRemoveTags(
                                                                      FFAppState()
                                                                          .getPostTags
                                                                          .toList(),
                                                                      FFAppState()
                                                                          .userTags
                                                                          .toList(),
                                                                    );
                                                                    FFAppState()
                                                                        .getPostTags = [];
                                                                    FFAppState()
                                                                        .userTags = [];
                                                                    await UserTable()
                                                                        .update(
                                                                      data: {
                                                                        'user_preferredTags':
                                                                            _model.addCurrTagsAll,
                                                                      },
                                                                      matchingRows:
                                                                          (rows) =>
                                                                              rows.eqOrNull(
                                                                        'user_id',
                                                                        currentUserUid,
                                                                      ),
                                                                    );

                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                ),
                                                            ].divide(SizedBox(
                                                                width: 5.0)),
                                                          ),
                                                          FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              context.pushNamed(
                                                                PageViewUploadWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
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
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
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
                                                        ].divide(SizedBox(
                                                            width: 10.0)),
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
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () {
                                        FocusScope.of(context).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: SideNavWidget(),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                              child: Icon(
                                Icons.menu_outlined,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 24.0,
                              ),
                            ),
                            Text(
                              'Homepage',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ].divide(SizedBox(width: 20.0)),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
