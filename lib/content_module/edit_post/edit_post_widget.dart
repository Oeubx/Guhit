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
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_post_model.dart';
export 'edit_post_model.dart';

class EditPostWidget extends StatefulWidget {
  const EditPostWidget({
    super.key,
    required this.idReference,
  });

  /// id reference of selected post
  final UploadsRow? idReference;

  @override
  State<EditPostWidget> createState() => _EditPostWidgetState();
}

class _EditPostWidgetState extends State<EditPostWidget> {
  late EditPostModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditPostModel());

    _model.textFieldContentTextController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget!.idReference?.uploadContent,
      '>initial content',
    ));
    _model.textFieldContentFocusNode ??= FocusNode();
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
        height: 375.0,
        decoration: BoxDecoration(
          color: Color(0xFF02394F),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: Align(
          alignment: AlignmentDirectional(-1.0, 0.0),
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      List<UserRow> columnUserRowList = snapshot.data!;

                      final columnUserRow = columnUserRowList.isNotEmpty
                          ? columnUserRowList.first
                          : null;

                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Edit Post',
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          font: GoogleFonts.roboto(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontStyle,
                                          ),
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleLarge
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleLarge
                                                  .fontStyle,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 5.0)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (currentUserUid ==
                                      widget!.idReference?.uploaderId)
                                    FlutterFlowIconButton(
                                      borderRadius: 8.0,
                                      buttonSize: 40.0,
                                      icon: FaIcon(
                                        FontAwesomeIcons.trashAlt,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 22.0,
                                      ),
                                      onPressed: () async {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title:
                                                          Text('Post Deletion'),
                                                      content: Text(
                                                          'Click \"Confirm\" to proceed with post deletion'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  false),
                                                          child: Text('Cancel'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  true),
                                                          child:
                                                              Text('Confirm'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (confirmDialogResponse) {
                                          await CommentsTable().delete(
                                            matchingRows: (rows) =>
                                                rows.eqOrNull(
                                              'upload_idRef',
                                              widget!.idReference?.uploadId,
                                            ),
                                          );
                                          await UploadsTable().delete(
                                            matchingRows: (rows) =>
                                                rows.eqOrNull(
                                              'upload_id',
                                              widget!.idReference?.uploadId,
                                            ),
                                          );
                                          Navigator.pop(context);
                                        }
                                      },
                                    ),
                                  FlutterFlowIconButton(
                                    borderRadius: 8.0,
                                    buttonSize: 40.0,
                                    icon: Icon(
                                      Icons.close,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      safeSetState(() {
                                        _model.textFieldContentTextController
                                            ?.clear();
                                      });
                                      safeSetState(() {
                                        _model.isDataUploading_uploadedImageEdit =
                                            false;
                                        _model.uploadedLocalFile_uploadedImageEdit =
                                            FFUploadedFile(
                                                bytes: Uint8List.fromList([]),
                                                originalFilename: '');
                                      });

                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            ].divide(SizedBox(width: 10.0)),
                          ),
                          Container(
                            width: double.infinity,
                            child: TextFormField(
                              controller: _model.textFieldContentTextController,
                              focusNode: _model.textFieldContentFocusNode,
                              autofocus: false,
                              enabled: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      color: Colors.black,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                hintText: 'Describe your artwork',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      color: Colors.black,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Colors.black,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                              maxLines: 5,
                              maxLength: 250,
                              maxLengthEnforcement:
                                  MaxLengthEnforcement.enforced,
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              enableInteractiveSelection: true,
                              validator: _model
                                  .textFieldContentTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          if ((columnUserRow?.isArtist == true) &&
                              ((widget!.idReference?.uploadimgURL != null &&
                                      widget!.idReference?.uploadimgURL !=
                                          '') ||
                                  (_model.uploadedLocalFile_uploadedImageEdit !=
                                          null &&
                                      (_model.uploadedLocalFile_uploadedImageEdit
                                              .bytes?.isNotEmpty ??
                                          false))))
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Include to Porfolio ?',
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        font: GoogleFonts.roboto(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleLarge
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleLarge
                                                  .fontStyle,
                                        ),
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                ),
                                Theme(
                                  data: ThemeData(
                                    checkboxTheme: CheckboxThemeData(
                                      visualDensity: VisualDensity.compact,
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                    ),
                                    unselectedWidgetColor:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  child: Checkbox(
                                    value: _model.checkboxValue ??= false,
                                    onChanged: (newValue) async {
                                      safeSetState(() =>
                                          _model.checkboxValue = newValue!);
                                    },
                                    side: (FlutterFlowTheme.of(context)
                                                .alternate !=
                                            null)
                                        ? BorderSide(
                                            width: 2,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate!,
                                          )
                                        : null,
                                    activeColor:
                                        FlutterFlowTheme.of(context).tertiary,
                                    checkColor:
                                        FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ].divide(SizedBox(width: 5.0)),
                            ),
                          if (_model.uploadedLocalFile_uploadedImageEdit !=
                                  null &&
                              (_model.uploadedLocalFile_uploadedImageEdit.bytes
                                      ?.isNotEmpty ??
                                  false))
                            Container(
                              decoration: BoxDecoration(),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.memory(
                                  _model.uploadedLocalFile_uploadedImageEdit
                                          .bytes ??
                                      Uint8List.fromList([]),
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Image.asset(
                                    'assets/images/error_image.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          if (_model.uploadedLocalFile_uploadedImageEdit ==
                                  null ||
                              (_model.uploadedLocalFile_uploadedImageEdit.bytes
                                      ?.isEmpty ??
                                  true))
                            Container(
                              decoration: BoxDecoration(),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  widget!.idReference!.uploadimgURL!,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Image.asset(
                                    'assets/images/error_image.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                        ].divide(SizedBox(height: 5.0)),
                      );
                    },
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          final selectedMedia =
                              await selectMediaWithSourceBottomSheet(
                            context: context,
                            allowPhoto: true,
                          );
                          if (selectedMedia != null &&
                              selectedMedia.every((m) =>
                                  validateFileFormat(m.storagePath, context))) {
                            safeSetState(() => _model
                                .isDataUploading_uploadedImageEdit = true);
                            var selectedUploadedFiles = <FFUploadedFile>[];

                            try {
                              selectedUploadedFiles = selectedMedia
                                  .map((m) => FFUploadedFile(
                                        name: m.storagePath.split('/').last,
                                        bytes: m.bytes,
                                        height: m.dimensions?.height,
                                        width: m.dimensions?.width,
                                        blurHash: m.blurHash,
                                        originalFilename: m.originalFilename,
                                      ))
                                  .toList();
                            } finally {
                              _model.isDataUploading_uploadedImageEdit = false;
                            }
                            if (selectedUploadedFiles.length ==
                                selectedMedia.length) {
                              safeSetState(() {
                                _model.uploadedLocalFile_uploadedImageEdit =
                                    selectedUploadedFiles.first;
                              });
                            } else {
                              safeSetState(() {});
                              return;
                            }
                          }
                        },
                        text: 'Upload',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).alternate,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.roboto(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.black,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          if (_model.uploadedLocalFile_uploadedImageEdit !=
                                  null &&
                              (_model.uploadedLocalFile_uploadedImageEdit.bytes
                                      ?.isNotEmpty ??
                                  false)) {
                            {
                              safeSetState(() => _model
                                      .isDataUploading_successUploadedImageEdit =
                                  true);
                              var selectedUploadedFiles = <FFUploadedFile>[];
                              var selectedMedia = <SelectedFile>[];
                              var downloadUrls = <String>[];
                              try {
                                selectedUploadedFiles = _model
                                        .uploadedLocalFile_uploadedImageEdit
                                        .bytes!
                                        .isNotEmpty
                                    ? [
                                        _model
                                            .uploadedLocalFile_uploadedImageEdit
                                      ]
                                    : <FFUploadedFile>[];
                                selectedMedia = selectedFilesFromUploadedFiles(
                                  selectedUploadedFiles,
                                  storageFolderPath: 'User_Upload',
                                );
                                downloadUrls = await uploadSupabaseStorageFiles(
                                  bucketName: 'User_Bucket',
                                  selectedFiles: selectedMedia,
                                );
                              } finally {
                                _model.isDataUploading_successUploadedImageEdit =
                                    false;
                              }
                              if (selectedUploadedFiles.length ==
                                      selectedMedia.length &&
                                  downloadUrls.length == selectedMedia.length) {
                                safeSetState(() {
                                  _model.uploadedLocalFile_successUploadedImageEdit =
                                      selectedUploadedFiles.first;
                                  _model.uploadedFileUrl_successUploadedImageEdit =
                                      downloadUrls.first;
                                });
                              } else {
                                safeSetState(() {});
                                return;
                              }
                            }

                            await UploadsTable().update(
                              data: {
                                'uploadContent':
                                    _model.textFieldContentTextController.text,
                                'uploadimg_URL': _model
                                    .uploadedFileUrl_successUploadedImageEdit,
                                'last_updated_at': supaSerialize<DateTime>(
                                    functions
                                        .getCurrentTime(getCurrentTimestamp)),
                                'isPortfolio': _model.checkboxValue,
                              },
                              matchingRows: (rows) => rows.eqOrNull(
                                'upload_id',
                                widget!.idReference?.uploadId,
                              ),
                            );
                          } else {
                            await UploadsTable().update(
                              data: {
                                'uploadContent':
                                    _model.textFieldContentTextController.text,
                                'last_updated_at': supaSerialize<DateTime>(
                                    functions
                                        .getCurrentTime(getCurrentTimestamp)),
                              },
                              matchingRows: (rows) => rows.eqOrNull(
                                'upload_id',
                                widget!.idReference?.uploadId,
                              ),
                            );
                          }

                          safeSetState(() {
                            _model.textFieldContentTextController?.clear();
                          });
                          safeSetState(() {
                            _model.isDataUploading_uploadedImageEdit = false;
                            _model.uploadedLocalFile_uploadedImageEdit =
                                FFUploadedFile(
                                    bytes: Uint8List.fromList([]),
                                    originalFilename: '');
                          });

                          safeSetState(() {
                            _model.isDataUploading_successUploadedImageEdit =
                                false;
                            _model.uploadedLocalFile_successUploadedImageEdit =
                                FFUploadedFile(
                                    bytes: Uint8List.fromList([]),
                                    originalFilename: '');
                            _model.uploadedFileUrl_successUploadedImageEdit =
                                '';
                          });

                          Navigator.pop(context);
                        },
                        text: 'Update Post',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).secondary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.roboto(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ],
                  ),
                ].divide(SizedBox(height: 10.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
