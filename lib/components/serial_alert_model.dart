import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serial_alert_widget.dart' show SerialAlertWidget;
import 'package:flutter/material.dart';

class SerialAlertModel extends FlutterFlowModel<SerialAlertWidget> {
  ///  Local state fields for this component.

  String serieNummer = '0';

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Delete sensor)] action in Button widget.
  ApiCallResponse? deleteSensorResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
