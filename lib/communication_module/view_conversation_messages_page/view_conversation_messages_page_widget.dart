import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'view_conversation_messages_page_model.dart';
export 'view_conversation_messages_page_model.dart';

class ViewConversationMessagesPageWidget extends StatefulWidget {
  const ViewConversationMessagesPageWidget({
    super.key,
    required this.idReference,
  });

  /// conversation id reference
  final ConversationRow? idReference;

  static String routeName = 'View_ConversationMessages_Page';
  static String routePath = '/viewConversationMessagesPage';

  @override
  State<ViewConversationMessagesPageWidget> createState() =>
      _ViewConversationMessagesPageWidgetState();
}

class _ViewConversationMessagesPageWidgetState
    extends State<ViewConversationMessagesPageWidget> {
  late ViewConversationMessagesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewConversationMessagesPageModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
          child: Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Stack(
              alignment: AlignmentDirectional(0.0, -1.0),
              children: [
                Container(
                  width: double.infinity,
                  height: 1000.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 55.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FutureBuilder<List<MessagesRow>>(
                          future: MessagesTable().queryRows(
                            queryFn: (q) => q
                                .eqOrNull(
                                  'convo_id_Ref',
                                  widget!.idReference?.convoId,
                                )
                                .order('message_timestamp', ascending: true),
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
                            List<MessagesRow> listViewMessagesRowList =
                                snapshot.data!;

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewMessagesRowList.length,
                              itemBuilder: (context, listViewIndex) {
                                final listViewMessagesRow =
                                    listViewMessagesRowList[listViewIndex];
                                return Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Stack(
                                    children: [
                                      if (listViewMessagesRow.messageBy !=
                                          currentUserUid)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 5.0),
                                          child: FutureBuilder<List<UserRow>>(
                                            future: UserTable().querySingleRow(
                                              queryFn: (q) => q
                                                  .inFilterOrNull(
                                                    'user_id',
                                                    widget!
                                                        .idReference?.userIDs,
                                                  )
                                                  .neqOrNull(
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
                                                  rowOthersenderUserRowList =
                                                  snapshot.data!;

                                              final rowOthersenderUserRow =
                                                  rowOthersenderUserRowList
                                                          .isNotEmpty
                                                      ? rowOthersenderUserRowList
                                                          .first
                                                      : null;

                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: 40.0,
                                                        height: 40.0,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.network(
                                                          rowOthersenderUserRow!
                                                              .userImgURL!,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Container(
                                                        constraints:
                                                            BoxConstraints(
                                                          maxWidth: 150.0,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    5.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    25.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    25.0),
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  15.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              listViewMessagesRow
                                                                  .messageContent,
                                                              '>content',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Colors
                                                                      .black,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 15.0)),
                                                  ),
                                                  if (listViewMessagesRow
                                                              .messageAttachment !=
                                                          null &&
                                                      listViewMessagesRow
                                                              .messageAttachment !=
                                                          '')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  55.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          listViewMessagesRow
                                                              .messageAttachment!,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                ].divide(SizedBox(height: 5.0)),
                                              );
                                            },
                                          ),
                                        ),
                                      if (listViewMessagesRow.messageBy ==
                                          currentUserUid)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 10.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 5.0),
                                                    child: Container(
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: 150.0,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  25.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  5.0),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  25.0),
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            15.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            listViewMessagesRow
                                                                .messageContent,
                                                            '>content',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontStyle,
                                                                ),
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  if (listViewMessagesRow
                                                              .messageAttachment !=
                                                          null &&
                                                      listViewMessagesRow
                                                              .messageAttachment !=
                                                          '')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  55.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          listViewMessagesRow
                                                              .messageAttachment!,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x33000000),
                              offset: Offset(
                                0.0,
                                2.0,
                              ),
                            )
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: FutureBuilder<List<UserRow>>(
                            future: UserTable().querySingleRow(
                              queryFn: (q) => q
                                  .inFilterOrNull(
                                    'user_id',
                                    widget!.idReference?.userIDs,
                                  )
                                  .neqOrNull(
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
                              List<UserRow> rowUserRowList = snapshot.data!;

                              final rowUserRow = rowUserRowList.isNotEmpty
                                  ? rowUserRowList.first
                                  : null;

                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FlutterFlowIconButton(
                                    borderRadius: 8.0,
                                    buttonSize: 40.0,
                                    icon: Icon(
                                      Icons.west_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      context.safePop();
                                    },
                                  ),
                                  Container(
                                    width: 40.0,
                                    height: 40.0,
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
                                      '>user name',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          font: GoogleFonts.roboto(
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleLarge
                                                  .fontStyle,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 5.0)),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (_model.uploadedLocalFile_uploadedMsg != null &&
                        (_model.uploadedLocalFile_uploadedMsg.bytes
                                ?.isNotEmpty ??
                            false))
                      Align(
                        alignment: AlignmentDirectional(1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.memory(
                              _model.uploadedLocalFile_uploadedMsg.bytes ??
                                  Uint8List.fromList([]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x33000000),
                              offset: Offset(
                                0.0,
                                2.0,
                              ),
                            )
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  width: 200.0,
                                  child: TextFormField(
                                    controller: _model.textController,
                                    focusNode: _model.textFieldFocusNode,
                                    autofocus: false,
                                    enabled: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                      hintText: 'Say Hello!',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFFA9A9A9),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
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
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                    cursorColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    enableInteractiveSelection: true,
                                    validator: _model.textControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                              FlutterFlowIconButton(
                                borderRadius: 8.0,
                                buttonSize: 40.0,
                                icon: Icon(
                                  Icons.upload_file,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  final selectedMedia =
                                      await selectMediaWithSourceBottomSheet(
                                    context: context,
                                    allowPhoto: true,
                                  );
                                  if (selectedMedia != null &&
                                      selectedMedia.every((m) =>
                                          validateFileFormat(
                                              m.storagePath, context))) {
                                    safeSetState(() => _model
                                        .isDataUploading_uploadedMsg = true);
                                    var selectedUploadedFiles =
                                        <FFUploadedFile>[];

                                    try {
                                      selectedUploadedFiles = selectedMedia
                                          .map((m) => FFUploadedFile(
                                                name: m.storagePath
                                                    .split('/')
                                                    .last,
                                                bytes: m.bytes,
                                                height: m.dimensions?.height,
                                                width: m.dimensions?.width,
                                                blurHash: m.blurHash,
                                                originalFilename:
                                                    m.originalFilename,
                                              ))
                                          .toList();
                                    } finally {
                                      _model.isDataUploading_uploadedMsg =
                                          false;
                                    }
                                    if (selectedUploadedFiles.length ==
                                        selectedMedia.length) {
                                      safeSetState(() {
                                        _model.uploadedLocalFile_uploadedMsg =
                                            selectedUploadedFiles.first;
                                      });
                                    } else {
                                      safeSetState(() {});
                                      return;
                                    }
                                  }
                                },
                              ),
                              FlutterFlowIconButton(
                                borderRadius: 8.0,
                                buttonSize: 40.0,
                                icon: Icon(
                                  Icons.send,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 24.0,
                                ),
                                onPressed: ((_model.textController.text ==
                                                null ||
                                            _model.textController.text == '') ||
                                        (_model.uploadedLocalFile_uploadedMsg ==
                                                null ||
                                            (_model.uploadedLocalFile_uploadedMsg
                                                    .bytes?.isEmpty ??
                                                true)))
                                    ? null
                                    : () async {
                                        if (_model.uploadedLocalFile_uploadedMsg !=
                                                null &&
                                            (_model.uploadedLocalFile_uploadedMsg
                                                    .bytes?.isNotEmpty ??
                                                false)) {
                                          {
                                            safeSetState(() => _model
                                                    .isDataUploading_attachmentUploadedToDb =
                                                true);
                                            var selectedUploadedFiles =
                                                <FFUploadedFile>[];
                                            var selectedMedia =
                                                <SelectedFile>[];
                                            var downloadUrls = <String>[];
                                            try {
                                              selectedUploadedFiles = _model
                                                      .uploadedLocalFile_uploadedMsg
                                                      .bytes!
                                                      .isNotEmpty
                                                  ? [
                                                      _model
                                                          .uploadedLocalFile_uploadedMsg
                                                    ]
                                                  : <FFUploadedFile>[];
                                              selectedMedia =
                                                  selectedFilesFromUploadedFiles(
                                                selectedUploadedFiles,
                                                storageFolderPath:
                                                    'Message_Image',
                                              );
                                              downloadUrls =
                                                  await uploadSupabaseStorageFiles(
                                                bucketName:
                                                    'Message_Attachment',
                                                selectedFiles: selectedMedia,
                                              );
                                            } finally {
                                              _model.isDataUploading_attachmentUploadedToDb =
                                                  false;
                                            }
                                            if (selectedUploadedFiles.length ==
                                                    selectedMedia.length &&
                                                downloadUrls.length ==
                                                    selectedMedia.length) {
                                              safeSetState(() {
                                                _model.uploadedLocalFile_attachmentUploadedToDb =
                                                    selectedUploadedFiles.first;
                                                _model.uploadedFileUrl_attachmentUploadedToDb =
                                                    downloadUrls.first;
                                              });
                                            } else {
                                              safeSetState(() {});
                                              return;
                                            }
                                          }

                                          await MessagesTable().insert({
                                            'convo_id_Ref':
                                                widget!.idReference?.convoId,
                                            'message_by': currentUserUid,
                                            'message_content':
                                                _model.textController.text,
                                            'message_timestamp':
                                                supaSerialize<DateTime>(
                                                    functions.getCurrentTime(
                                                        getCurrentTimestamp)),
                                            'message_attachment': _model
                                                .uploadedFileUrl_attachmentUploadedToDb,
                                          });
                                          await ConversationTable().update(
                                            data: {
                                              'lastMessage_sender':
                                                  currentUserUid,
                                              'lastMessage_content':
                                                  'Sent an Image.',
                                              'lastMessage_time':
                                                  supaSerialize<DateTime>(
                                                      functions.getCurrentTime(
                                                          getCurrentTimestamp)),
                                            },
                                            matchingRows: (rows) =>
                                                rows.eqOrNull(
                                              'convo_id',
                                              widget!.idReference?.convoId,
                                            ),
                                          );
                                        } else {
                                          await MessagesTable().insert({
                                            'convo_id_Ref':
                                                widget!.idReference?.convoId,
                                            'message_by': currentUserUid,
                                            'message_content':
                                                _model.textController.text,
                                            'message_timestamp':
                                                supaSerialize<DateTime>(
                                                    functions.getCurrentTime(
                                                        getCurrentTimestamp)),
                                          });
                                          await ConversationTable().update(
                                            data: {
                                              'lastMessage_sender':
                                                  currentUserUid,
                                              'lastMessage_content':
                                                  _model.textController.text,
                                              'lastMessage_time':
                                                  supaSerialize<DateTime>(
                                                      functions.getCurrentTime(
                                                          getCurrentTimestamp)),
                                            },
                                            matchingRows: (rows) =>
                                                rows.eqOrNull(
                                              'convo_id',
                                              widget!.idReference?.convoId,
                                            ),
                                          );
                                        }

                                        safeSetState(() {
                                          _model.textController?.clear();
                                        });
                                        safeSetState(() {
                                          _model.isDataUploading_uploadedMsg =
                                              false;
                                          _model.uploadedLocalFile_uploadedMsg =
                                              FFUploadedFile(
                                                  bytes: Uint8List.fromList([]),
                                                  originalFilename: '');
                                        });

                                        safeSetState(() {
                                          _model.isDataUploading_attachmentUploadedToDb =
                                              false;
                                          _model.uploadedLocalFile_attachmentUploadedToDb =
                                              FFUploadedFile(
                                                  bytes: Uint8List.fromList([]),
                                                  originalFilename: '');
                                          _model.uploadedFileUrl_attachmentUploadedToDb =
                                              '';
                                        });

                                        safeSetState(() {});
                                      },
                              ),
                            ].divide(SizedBox(width: 5.0)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
