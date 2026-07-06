import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cancel_order_buyer_p_o_v_model.dart';
export 'cancel_order_buyer_p_o_v_model.dart';

class CancelOrderBuyerPOVWidget extends StatefulWidget {
  const CancelOrderBuyerPOVWidget({
    super.key,
    required this.commsRef,
  });

  final DocumentReference? commsRef;

  static String routeName = 'cancelOrder_BuyerPOV';
  static String routePath = '/cancelOrderBuyerPOV';

  @override
  State<CancelOrderBuyerPOVWidget> createState() =>
      _CancelOrderBuyerPOVWidgetState();
}

class _CancelOrderBuyerPOVWidgetState extends State<CancelOrderBuyerPOVWidget> {
  late CancelOrderBuyerPOVModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CancelOrderBuyerPOVModel());
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).tertiary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Text(
              'Cancellation',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    font: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
                    fontSize: 20.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: Padding(
          padding: EdgeInsets.all(14.0),
          child: StreamBuilder<OrdersCommsRecord>(
            stream: OrdersCommsRecord.getDocument(widget.commsRef!),
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

              final columnOrdersCommsRecord = snapshot.data!;

              return Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Cancellation Request',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          font: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .fontStyle,
                          ),
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontStyle,
                        ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      'This cancellation request will be reviewed thorougly, false cancellation request will automatically be declined.\n\nIf you think there has been a mistake, please do not hesitate to contact customer service center within the app.',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.roboto(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                  if (columnOrdersCommsRecord.commsCommissioner ==
                      currentUserReference)
                    FlutterFlowCheckboxGroup(
                      options: [
                        'Artist asked to cancel',
                        'Artist violated their TOS'
                      ],
                      onChanged: (val) =>
                          safeSetState(() => _model.checkboxGroupValues1 = val),
                      controller: _model.checkboxGroupValueController1 ??=
                          FormFieldController<List<String>>(
                        [],
                      ),
                      activeColor: FlutterFlowTheme.of(context).primary,
                      checkColor: FlutterFlowTheme.of(context).info,
                      checkboxBorderColor:
                          FlutterFlowTheme.of(context).secondaryText,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.roboto(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                      checkboxBorderRadius: BorderRadius.circular(4.0),
                      initialized: _model.checkboxGroupValues1 != null,
                    ),
                  if (columnOrdersCommsRecord.commsCreator ==
                      currentUserReference)
                    FlutterFlowCheckboxGroup(
                      options: [
                        'Commissioner asked for cancel',
                        'Commissioner is out of contact',
                        'Commissioner is not paying'
                      ],
                      onChanged: (val) =>
                          safeSetState(() => _model.checkboxGroupValues2 = val),
                      controller: _model.checkboxGroupValueController2 ??=
                          FormFieldController<List<String>>(
                        [],
                      ),
                      activeColor: FlutterFlowTheme.of(context).primary,
                      checkColor: FlutterFlowTheme.of(context).info,
                      checkboxBorderColor:
                          FlutterFlowTheme.of(context).secondaryText,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.roboto(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                      checkboxBorderRadius: BorderRadius.circular(4.0),
                      initialized: _model.checkboxGroupValues2 != null,
                    ),
                  FFButtonWidget(
                    onPressed: !(!(_model.checkboxGroupValues1 != null &&
                                (_model.checkboxGroupValues1)!.isNotEmpty) ||
                            !(_model.checkboxGroupValues2 != null &&
                                (_model.checkboxGroupValues2)!.isNotEmpty))
                        ? null
                        : () async {
                            await columnOrdersCommsRecord.reference
                                .update(createOrdersCommsRecordData(
                              isCanceled: true,
                              forApproval: true,
                              isWIP: false,
                              isCompleted: false,
                              isPaid: false,
                            ));

                            context.pushNamed(OrdersCommsWidget.routeName);
                          },
                    text: 'Cancel Order',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
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
                ].divide(SizedBox(height: 10.0)),
              );
            },
          ),
        ),
      ),
    );
  }
}
