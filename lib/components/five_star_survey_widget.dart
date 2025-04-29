import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'five_star_survey_model.dart';
export 'five_star_survey_model.dart';

class FiveStarSurveyWidget extends StatefulWidget {
  const FiveStarSurveyWidget({super.key});

  @override
  State<FiveStarSurveyWidget> createState() => _FiveStarSurveyWidgetState();
}

class _FiveStarSurveyWidgetState extends State<FiveStarSurveyWidget> {
  late FiveStarSurveyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FiveStarSurveyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 400.0,
        ),
        decoration: BoxDecoration(),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).manualWhite,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Help us improve our\napp by giving a rating!',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Radio Canada Big',
                      color: FlutterFlowTheme.of(context).manualBlackGrey,
                      letterSpacing: 0.0,
                    ),
              ),
              RatingBar.builder(
                onRatingUpdate: (newValue) =>
                    safeSetState(() => _model.ratingBarValue = newValue),
                itemBuilder: (context, index) => Icon(
                  Icons.star_rounded,
                  color: FlutterFlowTheme.of(context).manualRed,
                ),
                direction: Axis.horizontal,
                initialRating: _model.ratingBarValue ??= 3.0,
                unratedColor: FlutterFlowTheme.of(context).alternate,
                itemCount: 5,
                itemSize: 35.0,
                glowColor: FlutterFlowTheme.of(context).manualRed,
              ),
              FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('FIVE_STAR_SURVEY_surveySubmitButton_ON_T');
                  logFirebaseEvent('surveySubmitButton_google_analytics_even');
                  logFirebaseEvent('totalRatings');
                  logFirebaseEvent('surveySubmitButton_google_analytics_even');
                  logFirebaseEvent(
                    'specificRating',
                    parameters: {
                      'starValue': _model.ratingBarValue.toString(),
                    },
                  );
                  if (_model.ratingBarValue == 5.0) {
                    logFirebaseEvent(
                        'surveySubmitButton_google_analytics_even');
                    logFirebaseEvent('fiveStarRating');
                  } else {
                    if (_model.ratingBarValue == 4.0) {
                      logFirebaseEvent(
                          'surveySubmitButton_google_analytics_even');
                      logFirebaseEvent('fourStarRating');
                    } else {
                      if (_model.ratingBarValue == 3.0) {
                        logFirebaseEvent(
                            'surveySubmitButton_google_analytics_even');
                        logFirebaseEvent('threeStarRating');
                      } else {
                        if (_model.ratingBarValue == 2.0) {
                          logFirebaseEvent(
                              'surveySubmitButton_google_analytics_even');
                          logFirebaseEvent('twoStarRating');
                        } else {
                          if (_model.ratingBarValue == 1.0) {
                            logFirebaseEvent(
                                'surveySubmitButton_google_analytics_even');
                            logFirebaseEvent('oneStarRating');
                          } else {
                            if (_model.ratingBarValue == 0.0) {
                              logFirebaseEvent(
                                  'surveySubmitButton_google_analytics_even');
                              logFirebaseEvent('zeroStarRating');
                            }
                          }
                        }
                      }
                    }
                  }

                  logFirebaseEvent('surveySubmitButton_bottom_sheet');
                  Navigator.pop(context);
                  logFirebaseEvent('surveySubmitButton_show_snack_bar');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Thank you for your feedback! ',
                        style: TextStyle(
                          color: FlutterFlowTheme.of(context).manualWhite,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      duration: Duration(milliseconds: 4000),
                      backgroundColor:
                          FlutterFlowTheme.of(context).manualBlackGrey,
                    ),
                  );
                },
                text: 'Submit',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).manualRed,
                  textStyle:
                      FlutterFlowTheme.of(context).headlineMedium.override(
                            fontFamily: 'Gabarito',
                            color: FlutterFlowTheme.of(context).manualWhite,
                            letterSpacing: 0.0,
                          ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
