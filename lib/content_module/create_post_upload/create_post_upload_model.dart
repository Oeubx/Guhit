import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/content_module/c_warning/c_warning_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'create_post_upload_widget.dart' show CreatePostUploadWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreatePostUploadModel extends FlutterFlowModel<CreatePostUploadWidget> {
  ///  Local state fields for this component.

  List<String> generatedTagsHolder = [];
  void addToGeneratedTagsHolder(String item) => generatedTagsHolder.add(item);
  void removeFromGeneratedTagsHolder(String item) =>
      generatedTagsHolder.remove(item);
  void removeAtIndexFromGeneratedTagsHolder(int index) =>
      generatedTagsHolder.removeAt(index);
  void insertAtIndexInGeneratedTagsHolder(int index, String item) =>
      generatedTagsHolder.insert(index, item);
  void updateGeneratedTagsHolderAtIndex(int index, Function(String) updateFn) =>
      generatedTagsHolder[index] = updateFn(generatedTagsHolder[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField_content widget.
  FocusNode? textFieldContentFocusNode;
  TextEditingController? textFieldContentTextController;
  String? Function(BuildContext, String?)?
      textFieldContentTextControllerValidator;
  // State field(s) for Checkbox_Portfolio widget.
  bool? checkboxPortfolioValue;
  // Stores action output result for [Bottom Sheet - C_Warning] action in Button widget.
  bool? permissionValue;
  // Stores action output result for [Custom Action - apiRateLimiter] action in Button widget.
  bool? userRateLimiterValue;
  // Stores action output result for [Custom Action - imageConversionIntoBase64] action in Button widget.
  String? convertedImageIntoBase64Value;
  // Stores action output result for [Backend Call - API (uploadTagsGeneration)] action in Button widget.
  ApiCallResponse? apiResult;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue;
  FormFieldController<List<String>>? dropDownValueController;
  // State field(s) for Checkbox_aiTags widget.
  bool? checkboxAiTagsValue;
  bool isDataUploading_uploadedImageCreate = false;
  FFUploadedFile uploadedLocalFile_uploadedImageCreate =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  bool isDataUploading_successUploadedImageCreate = false;
  FFUploadedFile uploadedLocalFile_successUploadedImageCreate =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_successUploadedImageCreate = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldContentFocusNode?.dispose();
    textFieldContentTextController?.dispose();
  }
}
