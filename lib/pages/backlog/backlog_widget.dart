import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/backlog_item_widget.dart';
import '/components/nav_bar_with_middle_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'backlog_model.dart';
export 'backlog_model.dart';

class BacklogWidget extends StatefulWidget {
  const BacklogWidget({super.key});

  static String routeName = 'backlog';
  static String routePath = '/backlog';

  @override
  State<BacklogWidget> createState() => _BacklogWidgetState();
}

class _BacklogWidgetState extends State<BacklogWidget> {
  late BacklogModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BacklogModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'backlog'});
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
            child: Container(
              width: MediaQuery.sizeOf(context).width >= 500.0
                  ? 500.0
                  : MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                      child: Text(
                        'Your Backlog',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: 'Gabarito',
                              color: FlutterFlowTheme.of(context).manualWhite,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        child: StreamBuilder<List<SavedMoviesRecord>>(
                          stream: querySavedMoviesRecord(
                            queryBuilder: (savedMoviesRecord) =>
                                savedMoviesRecord.where(
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
                            List<SavedMoviesRecord>
                                listViewSavedMoviesRecordList = snapshot.data!;

                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewSavedMoviesRecordList.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 12.0),
                              itemBuilder: (context, listViewIndex) {
                                final listViewSavedMoviesRecord =
                                    listViewSavedMoviesRecordList[
                                        listViewIndex];
                                return Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: BacklogItemWidget(
                                    key: Key(
                                        'Keyuoj_${listViewIndex}_of_${listViewSavedMoviesRecordList.length}'),
                                    backlogItemDoc: listViewSavedMoviesRecord,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  wrapWithModel(
                    model: _model.navBarWithMiddleButtonModel,
                    updateCallback: () => safeSetState(() {}),
                    child: NavBarWithMiddleButtonWidget(),
                  ),
                ].divide(SizedBox(height: 12.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
