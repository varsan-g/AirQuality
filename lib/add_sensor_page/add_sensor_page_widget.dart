import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'add_sensor_page_model.dart';
export 'add_sensor_page_model.dart';

class AddSensorPageWidget extends StatefulWidget {
  const AddSensorPageWidget({super.key});

  @override
  State<AddSensorPageWidget> createState() => _AddSensorPageWidgetState();
}

class _AddSensorPageWidgetState extends State<AddSensorPageWidget> {
  late AddSensorPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddSensorPageModel());

    _model.serialTxtBoxTextController ??= TextEditingController();
    _model.serialTxtBoxFocusNode ??= FocusNode();

    _model.roomNameTxtBoxTextController ??= TextEditingController();
    _model.roomNameTxtBoxFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: responsiveVisibility(
          context: context,
          tabletLandscape: false,
          desktop: false,
        )
            ? AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primary,
                automaticallyImplyLeading: true,
                title: Text(
                  'Tilføj en ny sensor',
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).titleLargeFamily,
                        color: Colors.white,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).titleLargeFamily),
                      ),
                ),
                actions: const [],
                centerTitle: true,
                elevation: 4.0,
              )
            : null,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 32.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  '1. Skan QR koden fra ordrebekræftelsen. Serienummeret på sensoren vil blive udfyldt automatisk.\n\n2. Indtast navnet på det sted, hvor CO2 sensoren bliver placeret.\n\n3. Tryk \"Tilføj sensor\", når alle felterne er udfyldte.',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                ),
                if (valueOrDefault<bool>(
                  isAndroid,
                  false,
                ))
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 34.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        var shouldSetState = false;
                        if (isAndroid) {
                          _model.scannedSN =
                              await FlutterBarcodeScanner.scanBarcode(
                            '#C62828', // scanning line color
                            'Annullér', // cancel button text
                            true, // whether to show the flash icon
                            ScanMode.QR,
                          );

                          shouldSetState = true;
                          setState(() {
                            _model.serialTxtBoxTextController?.text =
                                _model.scannedSN;
                          });
                        } else {
                          if (shouldSetState) setState(() {});
                          return;
                        }

                        if (shouldSetState) setState(() {});
                      },
                      text: 'Skan QR kode',
                      icon: const Icon(
                        Icons.qr_code,
                        size: 15.0,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 55.0,
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleMediumFamily),
                                ),
                        elevation: 2.0,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                        child: TextFormField(
                          controller: _model.serialTxtBoxTextController,
                          focusNode: _model.serialTxtBoxFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.serialTxtBoxTextController',
                            const Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          autofocus: false,
                          textInputAction: TextInputAction.next,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Serienummer',
                            hintText: 'Indtast serienummeret...',
                            hintStyle: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyLargeFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyLargeFamily),
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            suffixIcon: _model
                                    .serialTxtBoxTextController!.text.isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.serialTxtBoxTextController
                                          ?.clear();
                                      setState(() {});
                                    },
                                    child: Icon(
                                      Icons.clear,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 22.0,
                                    ),
                                  )
                                : null,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                          validator: _model.serialTxtBoxTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: TextFormField(
                          controller: _model.roomNameTxtBoxTextController,
                          focusNode: _model.roomNameTxtBoxFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.roomNameTxtBoxTextController',
                            const Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Placering',
                            alignLabelWithHint: false,
                            hintText: 'Indtast navnet på værelset...',
                            hintStyle: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyLargeFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyLargeFamily),
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            suffixIcon: _model.roomNameTxtBoxTextController!
                                    .text.isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.roomNameTxtBoxTextController
                                          ?.clear();
                                      setState(() {});
                                    },
                                    child: Icon(
                                      Icons.clear,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 22.0,
                                    ),
                                  )
                                : null,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                          validator: _model
                              .roomNameTxtBoxTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 84.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      var shouldSetState = false;
                      if (_model.formKey.currentState == null ||
                          !_model.formKey.currentState!.validate()) {
                        return;
                      }
                      var confirmDialogResponse = await showDialog<bool>(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: const Text('Er serienummeret korrekt?'),
                                content: Text(
                                    _model.serialTxtBoxTextController.text),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(
                                        alertDialogContext, false),
                                    child: const Text('Nej'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext, true),
                                    child: const Text('Ja, det er rigtigt'),
                                  ),
                                ],
                              );
                            },
                          ) ??
                          false;
                      _model.createSensorResult = await CreateSensorCall.call(
                        serialNum: _model.serialTxtBoxTextController.text,
                        roomName: valueOrDefault<String>(
                          functions.capitalizeLetter(
                              _model.roomNameTxtBoxTextController.text),
                          'Intet navn',
                        ),
                        institutionName: currentUserData?.institutionName,
                        authToken: currentAuthenticationToken,
                      );
                      shouldSetState = true;
                      if ((_model.createSensorResult?.succeeded ?? true)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Sensor tilføjet.',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: const Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                          ),
                        );

                        context.pushNamed(
                          'homePage',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: const TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.rightToLeft,
                            ),
                          },
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              (_model.createSensorResult?.bodyText ?? ''),
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: const Duration(milliseconds: 7400),
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                          ),
                        );
                        if (shouldSetState) setState(() {});
                        return;
                      }

                      if (shouldSetState) setState(() {});
                    },
                    text: 'Tilføj sensor',
                    icon: const Icon(
                      Icons.add,
                      size: 15.0,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 55.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleMedium
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleMediumFamily,
                            color: Colors.white,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleMediumFamily),
                          ),
                      elevation: 2.0,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
