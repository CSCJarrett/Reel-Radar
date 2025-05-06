import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/nav_bar_with_middle_button_widget.dart';
import '/components/review_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'reviews_model.dart';
export 'reviews_model.dart';

class ReviewsWidget extends StatefulWidget {
  const ReviewsWidget({super.key});

  static String routeName = 'reviews';
  static String routePath = '/reviews';

  @override
  State<ReviewsWidget> createState() => _ReviewsWidgetState();
}

class _ReviewsWidgetState extends State<ReviewsWidget> {
  late ReviewsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReviewsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'reviews'});
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
        backgroundColor: FlutterFlowTheme.of(context).manualBlackGrey,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width >= 500.0
                  ? 500.0
                  : MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                      child: Text(
                        'Reviews',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Radio Canada Big',
                              color: FlutterFlowTheme.of(context).manualWhite,
                              fontSize: 32.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        child: StreamBuilder<List<ReviewsRecord>>(
                          stream: queryReviewsRecord(
                            queryBuilder: (reviewsRecord) =>
                                reviewsRecord.where(
                              'userID',
                              isEqualTo: currentUserReference,
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
                            List<ReviewsRecord> listViewReviewsRecordList =
                                snapshot.data!;

                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewReviewsRecordList.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 12.0),
                              itemBuilder: (context, listViewIndex) {
                                final listViewReviewsRecord =
                                    listViewReviewsRecordList[listViewIndex];
                                return ReviewItemWidget(
                                  key: Key(
                                      'Keyqmu_${listViewIndex}_of_${listViewReviewsRecordList.length}'),
                                  reviewDoc: listViewReviewsRecord,
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    wrapWithModel(
                      model: _model.navBarWithMiddleButtonModel,
                      updateCallback: () => safeSetState(() {}),
                      child: NavBarWithMiddleButtonWidget(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
