import '/flutter_flow/flutter_flow_util.dart';
import 'edit_sensor_page_widget.dart' show EditSensorPageWidget;
import 'package:flutter/material.dart';

class EditSensorPageModel extends FlutterFlowModel<EditSensorPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
