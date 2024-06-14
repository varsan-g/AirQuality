import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_sensor_page_widget.dart' show AddSensorPageWidget;
import 'package:flutter/material.dart';

class AddSensorPageModel extends FlutterFlowModel<AddSensorPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  var scannedSN = '';
  // State field(s) for serialTxtBox widget.
  FocusNode? serialTxtBoxFocusNode;
  TextEditingController? serialTxtBoxTextController;
  String? Function(BuildContext, String?)? serialTxtBoxTextControllerValidator;
  String? _serialTxtBoxTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Udfyld venligst serienummeret.';
    }

    if (val.length < 6) {
      return 'Serienummeret er mindst 6 tegn langt.';
    }

    return null;
  }

  // State field(s) for roomNameTxtBox widget.
  FocusNode? roomNameTxtBoxFocusNode;
  TextEditingController? roomNameTxtBoxTextController;
  String? Function(BuildContext, String?)?
      roomNameTxtBoxTextControllerValidator;
  String? _roomNameTxtBoxTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Navngiv venligst det rum, du placerer sensoren i.';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Create Sensor)] action in Button widget.
  ApiCallResponse? createSensorResult;

  @override
  void initState(BuildContext context) {
    serialTxtBoxTextControllerValidator = _serialTxtBoxTextControllerValidator;
    roomNameTxtBoxTextControllerValidator =
        _roomNameTxtBoxTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    serialTxtBoxFocusNode?.dispose();
    serialTxtBoxTextController?.dispose();

    roomNameTxtBoxFocusNode?.dispose();
    roomNameTxtBoxTextController?.dispose();
  }
}
