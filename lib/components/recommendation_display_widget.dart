import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'recommendation_display_model.dart';
export 'recommendation_display_model.dart';

class RecommendationDisplayWidget extends StatefulWidget {
  const RecommendationDisplayWidget({
    super.key,
    String? title,
    String? description,
    String? poster,
  })  : this.title = title ?? ' ',
        this.description = description ?? ' ',
        this.poster = poster ?? ' ';

  final String title;
  final String description;
  final String poster;

  @override
  State<RecommendationDisplayWidget> createState() =>
      _RecommendationDisplayWidgetState();
}

class _RecommendationDisplayWidgetState
    extends State<RecommendationDisplayWidget> {
  late RecommendationDisplayModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecommendationDisplayModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
      child: Container(
        width: double.infinity,
        height: 400.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).manualRed,
          borderRadius: BorderRadius.circular(24.0),
          shape: BoxShape.rectangle,
          border: Border.all(
            color: Colors.black,
            width: 3.0,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Radio Canada Big',
                    color: FlutterFlowTheme.of(context).manualWhite,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    widget.poster,
                    width: 162.0,
                    height: 240.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: 148.68,
                  decoration: BoxDecoration(),
                  child: Text(
                    widget.description,
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Radio Canada Big',
                          color: FlutterFlowTheme.of(context).manualWhite,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ].divide(SizedBox(width: 12.0)),
            ),
            FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('RECOMMENDATION_DISPLAY_SAVE_TO_BACKLOG_B');
                logFirebaseEvent('Button_backend_call');

                await SavedMoviesRecord.collection
                    .doc()
                    .set(createSavedMoviesRecordData(
                      title: widget.title,
                      moviePoster: widget.poster,
                      userID: currentUserReference,
                    ));
              },
              text: 'Save to Backlog',
              options: FFButtonOptions(
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).manualBlackGrey,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      font: GoogleFonts.interTight(
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                      color: Colors.white,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).titleSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleSmall.fontStyle,
                    ),
                elevation: 0.0,
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ].divide(SizedBox(height: 12.0)),
        ),
      ),
    );
  }
}
