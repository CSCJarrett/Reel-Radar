import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/five_star_survey_widget.dart';
import '/components/nav_bar_with_middle_button_widget.dart';
import '/components/recommendation_display_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'homescreen_model.dart';
export 'homescreen_model.dart';

class HomescreenWidget extends StatefulWidget {
  const HomescreenWidget({super.key});

  static String routeName = 'homescreen';
  static String routePath = '/homescreen';

  @override
  State<HomescreenWidget> createState() => _HomescreenWidgetState();
}

class _HomescreenWidgetState extends State<HomescreenWidget> {
  late HomescreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomescreenModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'homescreen'});
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
        backgroundColor: Color(0xFF2D2D2D),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width >= 500.0
                    ? 500.0
                    : MediaQuery.sizeOf(context).width,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF2D2D2D),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (currentUserDisplayName != '')
                                AuthUserStreamWidget(
                                  builder: (context) => Text(
                                    key: ValueKey('Text_edit'),
                                    'Hi ${currentUserDisplayName}!',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Radio Canada Big',
                                          color: FlutterFlowTheme.of(context)
                                              .manualWhite,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                child: Container(
                                  width: 800.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).manualRed,
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 3.0,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 0.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            child: TextFormField(
                                              key: ValueKey('TextField_zfe2'),
                                              controller: _model.textController,
                                              focusNode:
                                                  _model.textFieldFocusNode,
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                alignLabelWithHint: false,
                                                hintText:
                                                    'What do you want to watch?',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Radio Canada Big',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .manualWhite,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.black,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                ),
                                                filled: true,
                                                fillColor: Color(0xFFD72D3A),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Radio Canada Big',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .manualWhite,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              textAlign: TextAlign.start,
                                              maxLines: 3,
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .manualWhite,
                                              validator: _model
                                                  .textControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.75, 1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 12.0, 12.0),
                                          child: FFButtonWidget(
                                            key: ValueKey('Button_zcl7'),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'HOMESCREEN_PAGE__BTN_ON_TAP');
                                              logFirebaseEvent(
                                                  'Button_update_page_state');
                                              _model.recommendationList = [];
                                              _model.loopStart = 1;
                                              _model.tempRec = [];
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                  'Button_backend_call');
                                              _model.apiResultskl =
                                                  await GemeniAPICall.call(
                                                prompt:
                                                    'Generate reccomendations for a real TV show or movie that came out before the present day.The response should be formatted as the titles of these reccomendations seperated by commas if more than one is specified.${'Number of Recommendations: ${_model.numRecommendationsValue}'}${'Prompt: ${_model.textController.text}'}${'Genre: ${_model.genreValue}'}',
                                                temperature: 0.8,
                                              );

                                              if ((_model.apiResultskl
                                                      ?.succeeded ??
                                                  true)) {
                                                logFirebaseEvent(
                                                    'Button_update_page_state');
                                                _model.tempRec = functions
                                                    .createList(
                                                        GemeniAPICall.response(
                                                      (_model.apiResultskl
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!)
                                                    .toList()
                                                    .cast<String>();
                                                safeSetState(() {});
                                                for (int loop1Index = 0;
                                                    loop1Index <
                                                        _model.tempRec.length;
                                                    loop1Index += 1) {
                                                  final currentLoop1Item =
                                                      _model
                                                          .tempRec[loop1Index];
                                                  logFirebaseEvent(
                                                      'Button_backend_call');
                                                  _model.apiResultfwl =
                                                      await OMDbCall.call(
                                                    name: currentLoop1Item,
                                                  );

                                                  if ((_model.apiResultfwl
                                                          ?.succeeded ??
                                                      true)) {
                                                    if (OMDbCall.response(
                                                          (_model.apiResultfwl
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) ==
                                                        'True') {
                                                      logFirebaseEvent(
                                                          'Button_update_page_state');
                                                      _model.addToRecommendationList(
                                                          RecommendationsStruct(
                                                        title:
                                                            OMDbCall.movieTitle(
                                                          (_model.apiResultfwl
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ),
                                                        description: OMDbCall
                                                            .plotSummary(
                                                          (_model.apiResultfwl
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ),
                                                        poster: OMDbCall
                                                            .moviePoster(
                                                          (_model.apiResultfwl
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ),
                                                      ));
                                                      safeSetState(() {});
                                                    } else {
                                                      logFirebaseEvent(
                                                          'Button_show_snack_bar');
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'One of your recommendations did not load. Try to be more specific with your prompt.',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .manualWhite,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .error,
                                                        ),
                                                      );
                                                    }
                                                  }
                                                }
                                              }
                                              if (valueOrDefault(
                                                      currentUserDocument
                                                          ?.presurveySearches,
                                                      0) <=
                                                  4) {
                                                logFirebaseEvent(
                                                    'Button_backend_call');

                                                await currentUserReference!
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'presurvey_searches':
                                                          FieldValue.increment(
                                                              1),
                                                    },
                                                  ),
                                                });
                                              }
                                              if (valueOrDefault(
                                                      currentUserDocument
                                                          ?.presurveySearches,
                                                      0) ==
                                                  4) {
                                                logFirebaseEvent(
                                                    'Button_bottom_sheet');
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(context)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child: Container(
                                                          height: 500.0,
                                                          child:
                                                              FiveStarSurveyWidget(),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              }

                                              safeSetState(() {});
                                            },
                                            text: '',
                                            icon: Icon(
                                              Icons.search_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .manualWhite,
                                              size: 30.0,
                                            ),
                                            options: FFButtonOptions(
                                              width: 70.0,
                                              height: 50.0,
                                              padding: EdgeInsets.all(16.0),
                                              iconAlignment:
                                                  IconAlignment.start,
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0xFFD72D3A),
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    font:
                                                        GoogleFonts.interTight(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                              elevation: 0.0,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                bottomRight:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(0.0),
                                                topRight: Radius.circular(0.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: FlutterFlowDropDown<String>(
                                        controller: _model
                                                .genreValueController ??=
                                            FormFieldController<String>(null),
                                        options: [
                                          'Action',
                                          'Comedy',
                                          'Drama',
                                          'Sci-Fi',
                                          'Horror',
                                          'Romance',
                                          'Thriller',
                                          'Animation',
                                          'Documentary',
                                          'Fantasy',
                                          'Mystery',
                                          'Crime',
                                          'Family'
                                        ],
                                        onChanged: (val) => safeSetState(
                                            () => _model.genreValue = val),
                                        height: 50.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Radio Canada Big',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .manualWhite,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: 'What Genre?',
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .manualWhite,
                                          size: 24.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .manualRed,
                                        elevation: 2.0,
                                        borderColor: Colors.black,
                                        borderWidth: 3.0,
                                        borderRadius: 0.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                        hidesUnderline: true,
                                        isOverButton: false,
                                        isSearchable: false,
                                        isMultiSelect: false,
                                      ),
                                    ),
                                    Flexible(
                                      child: FlutterFlowDropDown<String>(
                                        controller: _model
                                                .numRecommendationsValueController ??=
                                            FormFieldController<String>(
                                          _model.numRecommendationsValue ??=
                                              '1',
                                        ),
                                        options: ['1', '2', '3', '4', '5'],
                                        onChanged: (val) async {
                                          safeSetState(() => _model
                                              .numRecommendationsValue = val);
                                          logFirebaseEvent(
                                              'HOMESCREEN_numRecommendations_ON_FORM_WI');
                                          logFirebaseEvent(
                                              'numRecommendations_update_page_state');
                                          _model.loopEnd = functions.strToInt(
                                              _model.numRecommendationsValue!);
                                          safeSetState(() {});
                                        },
                                        height: 50.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Radio Canada Big',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .manualWhite,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: 'How Many?',
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .manualWhite,
                                          size: 24.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .manualRed,
                                        elevation: 2.0,
                                        borderColor: Colors.black,
                                        borderWidth: 3.0,
                                        borderRadius: 0.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                        hidesUnderline: true,
                                        isOverButton: false,
                                        isSearchable: false,
                                        isMultiSelect: false,
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 24.0)),
                                ),
                              ),
                              Flexible(
                                child: Builder(
                                  builder: (context) {
                                    final recommendations =
                                        _model.recommendationList.toList();

                                    return ListView.separated(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: recommendations.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 12.0),
                                      itemBuilder:
                                          (context, recommendationsIndex) {
                                        final recommendationsItem =
                                            recommendations[
                                                recommendationsIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          child: Container(
                                            key: ValueKey(
                                                'recommendationDisplay_s39s'),
                                            child: RecommendationDisplayWidget(
                                              key: Key(
                                                  'Keyvbu_${recommendationsIndex}_of_${recommendations.length}'),
                                              recommendation:
                                                  recommendationsItem,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ].divide(SizedBox(height: 12.0)),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: wrapWithModel(
                          model: _model.navBarWithMiddleButtonModel,
                          updateCallback: () => safeSetState(() {}),
                          child: NavBarWithMiddleButtonWidget(
                            key: ValueKey('NavBarWithMiddleButton_qcyi'),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(height: 12.0)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
