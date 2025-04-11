import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/five_star_survey/five_star_survey_widget.dart';
import '/pages/movie_display/movie_display_widget.dart';
import '/pages/nav_bar_with_middle_button/nav_bar_with_middle_button_widget.dart';
import 'package:flutter/material.dart';
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
                width: 393.0,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF2D2D2D),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/reel-radar-high-resolution-logo_(1).png',
                          width: 240.0,
                          height: 100.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    if (currentUserDisplayName != '')
                      AuthUserStreamWidget(
                        builder: (context) => Text(
                          key: ValueKey('Text_edit'),
                          currentUserDisplayName,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Radio Canada Big',
                                color: FlutterFlowTheme.of(context).manualWhite,
                                letterSpacing: 0.0,
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 80.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).manualRed,
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: Colors.black,
                            width: 3.0,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 0.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  child: TextFormField(
                                    key: ValueKey('TextField_zfe2'),
                                    controller: _model.textController,
                                    focusNode: _model.textFieldFocusNode,
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      alignLabelWithHint: false,
                                      hintText: 'What do you want to watch?',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Radio Canada Big',
                                            color: FlutterFlowTheme.of(context)
                                                .manualWhite,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      filled: true,
                                      fillColor: Color(0xFFD72D3A),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Radio Canada Big',
                                          color: FlutterFlowTheme.of(context)
                                              .manualWhite,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                    textAlign: TextAlign.start,
                                    maxLines: 3,
                                    cursorColor: FlutterFlowTheme.of(context)
                                        .manualWhite,
                                    validator: _model.textControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.75, 1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 12.0, 12.0),
                                child: FFButtonWidget(
                                  key: ValueKey('Button_zcl7'),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'HOMESCREEN_PAGE__BTN_ON_TAP');
                                    logFirebaseEvent(
                                        'Button_update_page_state');
                                    _model.title = '';
                                    _model.description = ' ';
                                    _model.poster = ' ';
                                    safeSetState(() {});
                                    logFirebaseEvent('Button_backend_call');
                                    _model.apiResult0iw =
                                        await GemeniAPICall.call(
                                      message:
                                          'Format the response as the title of a single movie or TV show that exists in the omdb movie api${_model.textController.text}',
                                    );

                                    if ((_model.apiResult0iw?.succeeded ??
                                        true)) {
                                      logFirebaseEvent('Button_backend_call');
                                      _model.apiResultjkg = await OMDbCall.call(
                                        name: GemeniAPICall.response(
                                          (_model.apiResult0iw?.jsonBody ?? ''),
                                        ),
                                      );

                                      if ((_model.apiResultjkg?.succeeded ??
                                          true)) {
                                        logFirebaseEvent(
                                            'Button_update_page_state');
                                        _model.title = OMDbCall.movieTitle(
                                          (_model.apiResultjkg?.jsonBody ?? ''),
                                        )!;
                                        _model.description =
                                            OMDbCall.plotSummary(
                                          (_model.apiResultjkg?.jsonBody ?? ''),
                                        )!;
                                        _model.poster = OMDbCall.moviePoster(
                                          (_model.apiResultjkg?.jsonBody ?? ''),
                                        )!;
                                        safeSetState(() {});
                                        if (valueOrDefault(
                                                currentUserDocument
                                                    ?.presurveySearches,
                                                0) <=
                                            4) {
                                          logFirebaseEvent(
                                              'Button_backend_call');

                                          await currentUserReference!.update({
                                            ...mapToFirestore(
                                              {
                                                'presurvey_searches':
                                                    FieldValue.increment(1),
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
                                            backgroundColor: Colors.transparent,
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: Container(
                                                    height: 500.0,
                                                    child:
                                                        FiveStarSurveyWidget(),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        }
                                      } else {
                                        logFirebaseEvent(
                                            'Button_show_snack_bar');
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              (_model.apiResultjkg?.bodyText ??
                                                  ''),
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                      }
                                    } else {
                                      logFirebaseEvent('Button_show_snack_bar');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            (_model.apiResult0iw?.bodyText ??
                                                ''),
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                      );
                                    }

                                    safeSetState(() {});
                                  },
                                  text: '',
                                  icon: Icon(
                                    Icons.search_sharp,
                                    size: 35.0,
                                  ),
                                  options: FFButtonOptions(
                                    width: 70.0,
                                    height: 61.3,
                                    padding: EdgeInsets.all(16.0),
                                    iconAlignment: IconAlignment.start,
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    color: Color(0xFFD72D3A),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Inter Tight',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FlutterFlowDropDown<String>(
                            controller: _model.dropDownValueController1 ??=
                                FormFieldController<String>(null),
                            options: ['1', '2', '3'],
                            onChanged: (val) =>
                                safeSetState(() => _model.dropDownValue1 = val),
                            width: 160.0,
                            height: 50.0,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Radio Canada Big',
                                  color:
                                      FlutterFlowTheme.of(context).manualWhite,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                            hintText: 'Select number of suggestions',
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            fillColor: FlutterFlowTheme.of(context).manualRed,
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
                          FlutterFlowDropDown<String>(
                            controller: _model.dropDownValueController2 ??=
                                FormFieldController<String>(null),
                            options: ['Option 1', 'Option 2', 'Option 3'],
                            onChanged: (val) =>
                                safeSetState(() => _model.dropDownValue2 = val),
                            width: 160.0,
                            height: 50.0,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Radio Canada Big',
                                  color:
                                      FlutterFlowTheme.of(context).manualWhite,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                            hintText: 'Filter by Genre',
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            fillColor: FlutterFlowTheme.of(context).manualRed,
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
                        ].divide(SizedBox(width: 24.0)),
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          if ((_model.title != '') &&
                              (_model.description != '') &&
                              (_model.poster != ''))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              child: wrapWithModel(
                                model: _model.movieDisplayModel,
                                updateCallback: () => safeSetState(() {}),
                                child: MovieDisplayWidget(
                                  key: ValueKey('movieDisplay_s39s'),
                                  title: _model.title,
                                  description: _model.description,
                                  poster: _model.poster,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    wrapWithModel(
                      model: _model.navBarWithMiddleButtonModel,
                      updateCallback: () => safeSetState(() {}),
                      child: NavBarWithMiddleButtonWidget(
                        key: ValueKey('NavBarWithMiddleButton_qcyi'),
                      ),
                    ),
                  ].divide(SizedBox(height: 12.0)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
