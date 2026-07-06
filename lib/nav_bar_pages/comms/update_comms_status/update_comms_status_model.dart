import '/flutter_flow/flutter_flow_util.dart';
import 'update_comms_status_widget.dart' show UpdateCommsStatusWidget;
import 'package:flutter/material.dart';

class UpdateCommsStatusModel extends FlutterFlowModel<UpdateCommsStatusWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for descrp widget.
  FocusNode? descrpFocusNode1;
  TextEditingController? descrpTextController1;
  String? Function(BuildContext, String?)? descrpTextController1Validator;
  // State field(s) for descrp widget.
  FocusNode? descrpFocusNode2;
  TextEditingController? descrpTextController2;
  String? Function(BuildContext, String?)? descrpTextController2Validator;
  // State field(s) for descrp widget.
  FocusNode? descrpFocusNode3;
  TextEditingController? descrpTextController3;
  String? Function(BuildContext, String?)? descrpTextController3Validator;
  bool isDataUploading_uploadData2c122 = false;
  FFUploadedFile uploadedLocalFile_uploadData2c122 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadData2c122 = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    descrpFocusNode1?.dispose();
    descrpTextController1?.dispose();

    descrpFocusNode2?.dispose();
    descrpTextController2?.dispose();

    descrpFocusNode3?.dispose();
    descrpTextController3?.dispose();
  }
}
