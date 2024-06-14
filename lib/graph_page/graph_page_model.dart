import '/backend/api_requests/api_calls.dart';
import '/components/side_bar_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'graph_page_widget.dart' show GraphPageWidget;
import 'package:flutter/material.dart';

class GraphPageModel extends FlutterFlowModel<GraphPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideBarNav component.
  late SideBarNavModel sideBarNavModel;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // State field(s) for sensorListDropDown widget.
  String? sensorListDropDownValue;
  FormFieldController<String>? sensorListDropDownValueController;
  // Stores action output result for [Backend Call - API (Get Sensor Data from specific Room name)] action in sensorListDropDown widget.
  ApiCallResponse? apiCallResult;
  // State field(s) for dayDropDown widget.
  String? dayDropDownValue;
  FormFieldController<String>? dayDropDownValueController;
  // Stores action output result for [Backend Call - API (Filter data by hours)] action in dayDropDown widget.
  ApiCallResponse? hourResult;

  @override
  void initState(BuildContext context) {
    sideBarNavModel = createModel(context, () => SideBarNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideBarNavModel.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
