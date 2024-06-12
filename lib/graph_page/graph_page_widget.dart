import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/side_bar_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'graph_page_model.dart';
export 'graph_page_model.dart';

class GraphPageWidget extends StatefulWidget {
  const GraphPageWidget({super.key});

  @override
  State<GraphPageWidget> createState() => _GraphPageWidgetState();
}

class _GraphPageWidgetState extends State<GraphPageWidget>
    with TickerProviderStateMixin {
  late GraphPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GraphPageModel());

    animationsMap.addAll({
      'dropDownOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 10.000000000000014),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'dropDownOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 10.000000000000014),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 10.000000000000014),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 10.000000000000014),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 10.000000000000014),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: SensorGroup.getSensorDataFromSpecificRoomNameCall.call(
        roomName: valueOrDefault<String>(
          _model.sensorListDropDownValue,
          'Blå stue',
        ),
        authToken: currentAuthenticationToken,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final graphPageGetSensorDataFromSpecificRoomNameResponse =
            snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: FutureBuilder<ApiCallResponse>(
              future: SensorGroup.filterDataByHoursCall.call(
                authToken: currentAuthenticationToken,
                hours: valueOrDefault<String>(
                  _model.dayDropDownValue,
                  '24',
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
                final rowFilterDataByHoursResponse = snapshot.data!;
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                    ))
                      wrapWithModel(
                        model: _model.sideBarNavModel,
                        updateCallback: () => setState(() {}),
                        child: SideBarNavWidget(
                          oneBG:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          oneIcon: Icon(
                            Icons.bar_chart_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                          twoBG: FlutterFlowTheme.of(context).primaryBackground,
                          twoIcon: Icon(
                            Icons.school_outlined,
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                          threeColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          threeIcon: Icon(
                            Icons.account_circle_outlined,
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                      ),
                    Expanded(
                      child: FutureBuilder<ApiCallResponse>(
                        future: (_model.apiRequestCompleter ??= Completer<
                                ApiCallResponse>()
                              ..complete(SensorGroup.listAllSensorsCall.call(
                                authToken: valueOrDefault<String>(
                                  currentAuthenticationToken,
                                  'Blå stue',
                                ),
                              )))
                            .future,
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
                          final listViewListAllSensorsResponse = snapshot.data!;
                          return RefreshIndicator(
                            onRefresh: () async {
                              setState(() => _model.apiRequestCompleter = null);
                              await _model.waitForApiRequestCompleted();
                            },
                            child: ListView(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              children: [
                                if (responsiveVisibility(
                                  context: context,
                                  tabletLandscape: false,
                                  desktop: false,
                                ))
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 44.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                    ),
                                  ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 24.0, 16.0, 16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        '1. Vælg en sensor',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLargeFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLargeFamily),
                                            ),
                                      ),
                                      Text(
                                        'Vælg en aktiv sensor fra listen nedenunder.',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 0.0),
                                        child: FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .sensorListDropDownValueController ??=
                                              FormFieldController<String>(
                                            _model.sensorListDropDownValue ??=
                                                'Blå stue',
                                          ),
                                          options: SensorGroup
                                              .listAllSensorsCall
                                              .roomName(
                                            listViewListAllSensorsResponse
                                                .jsonBody,
                                          )!,
                                          onChanged: (val) async {
                                            setState(() => _model
                                                .sensorListDropDownValue = val);
                                            _model.apiCallResult = await SensorGroup
                                                .getSensorDataFromSpecificRoomNameCall
                                                .call(
                                              roomName: _model
                                                  .sensorListDropDownValue,
                                              authToken:
                                                  currentAuthenticationToken,
                                            );
                                            if ((_model
                                                    .apiCallResult?.succeeded ??
                                                true)) {
                                              setState(() {});
                                            }

                                            setState(() {});
                                          },
                                          width: 300.0,
                                          height: 56.0,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          hintText: 'Vælg en sensor...',
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          elevation: 2.0,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          borderWidth: 2.0,
                                          borderRadius: 50.0,
                                          margin:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 4.0, 16.0, 4.0),
                                          hidesUnderline: true,
                                          isOverButton: true,
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        ).animateOnPageLoad(animationsMap[
                                            'dropDownOnPageLoadAnimation1']!),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 24.0, 16.0, 16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 8.0),
                                        child: Text(
                                          'Tidshorisont',
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMediumFamily),
                                              ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 0.0, 4.0, 0.0),
                                            child: Container(
                                              width: 343.0,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              child: Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: FlutterFlowDropDown<
                                                    String>(
                                                  controller: _model
                                                          .dayDropDownValueController ??=
                                                      FormFieldController<
                                                          String>(
                                                    _model.dayDropDownValue ??=
                                                        '24',
                                                  ),
                                                  options: List<String>.from(
                                                      ['1', '24', '7']),
                                                  optionLabels: const [
                                                    '1 time',
                                                    '24 timer',
                                                    '7 dage',
                                                    ''
                                                  ],
                                                  onChanged: (val) async {
                                                    setState(() => _model
                                                            .dayDropDownValue =
                                                        val);
                                                    var shouldSetState = false;
                                                    _model.hourResult =
                                                        await SensorGroup
                                                            .filterDataByHoursCall
                                                            .call(
                                                      hours: _model
                                                          .dayDropDownValue,
                                                      authToken:
                                                          currentAuthenticationToken,
                                                    );
                                                    shouldSetState = true;
                                                    if (!(_model.hourResult
                                                            ?.succeeded ??
                                                        true)) {
                                                      if (shouldSetState) {
                                                        setState(() {});
                                                      }
                                                      return;
                                                    }

                                                    setState(() {});
                                                    if (shouldSetState) {
                                                      setState(() {});
                                                    }
                                                  },
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.5,
                                                  height: 50.0,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts: GoogleFonts
                                                                    .asMap()
                                                                .containsKey(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumFamily),
                                                          ),
                                                  hintText: 'Vælg en periode',
                                                  icon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 24.0,
                                                  ),
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  elevation: 2.0,
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                  borderWidth: 2.0,
                                                  borderRadius: 50.0,
                                                  margin: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 4.0, 16.0, 4.0),
                                                  hidesUnderline: true,
                                                  isOverButton: true,
                                                  isSearchable: false,
                                                  isMultiSelect: false,
                                                ).animateOnPageLoad(animationsMap[
                                                    'dropDownOnPageLoadAnimation2']!),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      12.0, 24.0, 12.0, 0.0),
                                  child: Wrap(
                                    spacing: 8.0,
                                    runSpacing: 8.0,
                                    alignment: WrapAlignment.start,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    direction: Axis.horizontal,
                                    runAlignment: WrapAlignment.start,
                                    verticalDirection: VerticalDirection.down,
                                    clipBehavior: Clip.none,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'Se tallene for ${valueOrDefault<String>(
                                            _model.sensorListDropDownValue,
                                            'Blå stue',
                                          )}',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLargeFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLargeFamily),
                                              ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 4.0, 8.0, 4.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                child: Container(
                                                  height: 400.0,
                                                  constraints: BoxConstraints(
                                                    maxWidth: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.38,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        blurRadius: 4.0,
                                                        color:
                                                            Color(0x33000000),
                                                        offset: Offset(
                                                          0.0,
                                                          2.0,
                                                        ),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(14.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'CO2',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmallFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineSmallFamily),
                                                              ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      4.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Den optimale PPM værdi er under 600',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmallFamily,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodySmallFamily),
                                                                ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          14.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      FlutterFlowLineChart(
                                                                    data: [
                                                                      FFLineChartData(
                                                                        xData: SensorGroup
                                                                            .filterDataByHoursCall
                                                                            .timestamps(
                                                                          rowFilterDataByHoursResponse
                                                                              .jsonBody,
                                                                        )!,
                                                                        yData: SensorGroup
                                                                            .filterDataByHoursCall
                                                                            .co2s(
                                                                          rowFilterDataByHoursResponse
                                                                              .jsonBody,
                                                                        )!,
                                                                        settings:
                                                                            LineChartBarData(
                                                                          color:
                                                                              const Color(0xFF76C7C0),
                                                                          barWidth:
                                                                              1.0,
                                                                          isCurved:
                                                                              true,
                                                                          preventCurveOverShooting:
                                                                              true,
                                                                          dotData:
                                                                              FlDotData(show: false),
                                                                          belowBarData:
                                                                              BarAreaData(
                                                                            show:
                                                                                true,
                                                                            color:
                                                                                const Color(0xB3BDE4E6),
                                                                          ),
                                                                        ),
                                                                      )
                                                                    ],
                                                                    chartStylingInfo:
                                                                        ChartStylingInfo(
                                                                      enableTooltip:
                                                                          true,
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      borderColor:
                                                                          const Color(
                                                                              0xFFC3C3C3),
                                                                      borderWidth:
                                                                          1.0,
                                                                    ),
                                                                    axisBounds:
                                                                        const AxisBounds(
                                                                      minY: 0.0,
                                                                      maxY:
                                                                          3000.0,
                                                                    ),
                                                                    xAxisLabelInfo:
                                                                        const AxisLabelInfo(
                                                                      reservedSize:
                                                                          32.0,
                                                                    ),
                                                                    yAxisLabelInfo:
                                                                        AxisLabelInfo(
                                                                      title:
                                                                          'CO2',
                                                                      titleTextStyle:
                                                                          const TextStyle(
                                                                        fontSize:
                                                                            14.0,
                                                                      ),
                                                                      showLabels:
                                                                          true,
                                                                      labelInterval:
                                                                          200.0,
                                                                      labelFormatter:
                                                                          LabelFormatter(
                                                                        numberFormat:
                                                                            (val) =>
                                                                                val.toString(),
                                                                      ),
                                                                      reservedSize:
                                                                          40.0,
                                                                    ),
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
                                              ).animateOnPageLoad(animationsMap[
                                                  'containerOnPageLoadAnimation1']!),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 4.0, 8.0, 4.0),
                                              child: Container(
                                                height: 400.0,
                                                constraints: BoxConstraints(
                                                  maxWidth:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.38,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      blurRadius: 4.0,
                                                      color: Color(0x33000000),
                                                      offset: Offset(
                                                        0.0,
                                                        2.0,
                                                      ),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                alignment: const AlignmentDirectional(
                                                    0.0, -1.0),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(14.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Temperatur',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmallFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .headlineSmallFamily),
                                                                ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    4.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Den optimale temperatur bør vær mellem 21-24°',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily),
                                                              ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            14.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    FlutterFlowLineChart(
                                                                  data: [
                                                                    FFLineChartData(
                                                                      xData: SensorGroup
                                                                          .getSensorDataFromSpecificRoomNameCall
                                                                          .timestamps(
                                                                        graphPageGetSensorDataFromSpecificRoomNameResponse
                                                                            .jsonBody,
                                                                      )!,
                                                                      yData: SensorGroup
                                                                          .getSensorDataFromSpecificRoomNameCall
                                                                          .temperatures(
                                                                        graphPageGetSensorDataFromSpecificRoomNameResponse
                                                                            .jsonBody,
                                                                      )!,
                                                                      settings:
                                                                          LineChartBarData(
                                                                        color: const Color(
                                                                            0xFFE07A5F),
                                                                        barWidth:
                                                                            1.0,
                                                                        isCurved:
                                                                            true,
                                                                        preventCurveOverShooting:
                                                                            true,
                                                                        dotData:
                                                                            FlDotData(show: false),
                                                                        belowBarData:
                                                                            BarAreaData(
                                                                          show:
                                                                              true,
                                                                          color:
                                                                              const Color(0xB2F4A261),
                                                                        ),
                                                                      ),
                                                                    )
                                                                  ],
                                                                  chartStylingInfo:
                                                                      ChartStylingInfo(
                                                                    enableTooltip:
                                                                        true,
                                                                    tooltipBackgroundColor:
                                                                        Colors
                                                                            .white,
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                    borderColor:
                                                                        const Color(
                                                                            0xFFC3C3C3),
                                                                    borderWidth:
                                                                        1.0,
                                                                  ),
                                                                  axisBounds:
                                                                      const AxisBounds(
                                                                    minY: 10.0,
                                                                    maxY: 35.0,
                                                                  ),
                                                                  xAxisLabelInfo:
                                                                      const AxisLabelInfo(
                                                                    title:
                                                                        '24-timer',
                                                                    titleTextStyle:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          14.0,
                                                                    ),
                                                                    reservedSize:
                                                                        32.0,
                                                                  ),
                                                                  yAxisLabelInfo:
                                                                      const AxisLabelInfo(
                                                                    title:
                                                                        'Temperatur',
                                                                    titleTextStyle:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          14.0,
                                                                    ),
                                                                    showLabels:
                                                                        true,
                                                                    labelInterval:
                                                                        5.0,
                                                                    reservedSize:
                                                                        40.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ).animateOnPageLoad(animationsMap[
                                                  'containerOnPageLoadAnimation2']!),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 4.0, 8.0, 4.0),
                                              child: Container(
                                                height: 400.0,
                                                constraints: BoxConstraints(
                                                  maxWidth:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.38,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      blurRadius: 4.0,
                                                      color: Color(0x33000000),
                                                      offset: Offset(
                                                        0.0,
                                                        2.0,
                                                      ),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                alignment: const AlignmentDirectional(
                                                    0.0, -1.0),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(14.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Luftfugtighed',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmallFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .headlineSmallFamily),
                                                                ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    4.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Den optimale relative luftfugtighed er under 60%',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily),
                                                              ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            14.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    FlutterFlowLineChart(
                                                                  data: [
                                                                    FFLineChartData(
                                                                      xData: SensorGroup
                                                                          .getSensorDataFromSpecificRoomNameCall
                                                                          .timestamps(
                                                                        graphPageGetSensorDataFromSpecificRoomNameResponse
                                                                            .jsonBody,
                                                                      )!,
                                                                      yData: SensorGroup
                                                                          .getSensorDataFromSpecificRoomNameCall
                                                                          .humidities(
                                                                        graphPageGetSensorDataFromSpecificRoomNameResponse
                                                                            .jsonBody,
                                                                      )!,
                                                                      settings:
                                                                          LineChartBarData(
                                                                        color: const Color(
                                                                            0xFF9B5DE5),
                                                                        barWidth:
                                                                            1.0,
                                                                        isCurved:
                                                                            true,
                                                                        preventCurveOverShooting:
                                                                            true,
                                                                        dotData:
                                                                            FlDotData(show: false),
                                                                        belowBarData:
                                                                            BarAreaData(
                                                                          show:
                                                                              true,
                                                                          color:
                                                                              const Color(0xB3DCD4F7),
                                                                        ),
                                                                      ),
                                                                    )
                                                                  ],
                                                                  chartStylingInfo:
                                                                      ChartStylingInfo(
                                                                    enableTooltip:
                                                                        true,
                                                                    tooltipBackgroundColor:
                                                                        Colors
                                                                            .white,
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                    borderColor:
                                                                        const Color(
                                                                            0xFFC3C3C3),
                                                                    borderWidth:
                                                                        1.0,
                                                                  ),
                                                                  axisBounds:
                                                                      const AxisBounds(
                                                                    minY: 0.0,
                                                                    maxY: 100.0,
                                                                  ),
                                                                  xAxisLabelInfo:
                                                                      const AxisLabelInfo(
                                                                    title:
                                                                        '24-timer',
                                                                    titleTextStyle:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          14.0,
                                                                    ),
                                                                    reservedSize:
                                                                        32.0,
                                                                  ),
                                                                  yAxisLabelInfo:
                                                                      AxisLabelInfo(
                                                                    title:
                                                                        '%-vis',
                                                                    titleTextStyle:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          14.0,
                                                                    ),
                                                                    showLabels:
                                                                        true,
                                                                    labelInterval:
                                                                        10.0,
                                                                    labelFormatter:
                                                                        LabelFormatter(
                                                                      numberFormat:
                                                                          (val) =>
                                                                              formatNumber(
                                                                        val,
                                                                        formatType:
                                                                            FormatType.custom,
                                                                        format:
                                                                            '###',
                                                                        locale:
                                                                            '',
                                                                      ),
                                                                    ),
                                                                    reservedSize:
                                                                        40.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ).animateOnPageLoad(animationsMap[
                                                  'containerOnPageLoadAnimation3']!),
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
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
