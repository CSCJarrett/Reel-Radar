import '/backend/backend.dart';
import '/components/create_review_widget.dart';
import '/components/delete_backlog_popup_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'backlog_item_model.dart';
export 'backlog_item_model.dart';

class BacklogItemWidget extends StatefulWidget {
  const BacklogItemWidget({
    super.key,
    required this.backlogItemDoc,
  });

  final SavedMoviesRecord? backlogItemDoc;

  @override
  State<BacklogItemWidget> createState() => _BacklogItemWidgetState();
}

class _BacklogItemWidgetState extends State<BacklogItemWidget> {
  late BacklogItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BacklogItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).manualRed,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: Colors.black,
          width: 3.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 24.0),
        child: Container(
          decoration: BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Text(
                        widget.backlogItemDoc!.title,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Radio Canada Big',
                              color: FlutterFlowTheme.of(context).manualWhite,
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FlutterFlowIconButton(
                          borderRadius: 8.0,
                          buttonSize: 40.0,
                          fillColor:
                              FlutterFlowTheme.of(context).manualBlackGrey,
                          icon: Icon(
                            Icons.star,
                            color: FlutterFlowTheme.of(context).info,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'BACKLOG_ITEM_COMP_star_ICN_ON_TAP');
                            logFirebaseEvent('IconButton_bottom_sheet');
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: CreateReviewWidget(
                                    backlogEntry: widget.backlogItemDoc!,
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                        ),
                        FlutterFlowIconButton(
                          borderRadius: 8.0,
                          buttonSize: 40.0,
                          fillColor:
                              FlutterFlowTheme.of(context).manualBlackGrey,
                          icon: Icon(
                            Icons.delete,
                            color: FlutterFlowTheme.of(context).info,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'BACKLOG_ITEM_COMP_delete_ICN_ON_TAP');
                            logFirebaseEvent('IconButton_bottom_sheet');
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: DeleteBacklogPopupWidget(
                                    backlogDoc:
                                        widget.backlogItemDoc!.reference,
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                        ),
                      ].divide(SizedBox(width: 12.0)),
                    ),
                  ),
                ].divide(SizedBox(width: 12.0)),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  widget.backlogItemDoc!.moviePoster,
                  width: 243.0,
                  height: 360.0,
                  fit: BoxFit.cover,
                ),
              ),
            ].divide(SizedBox(height: 24.0)),
          ),
        ),
      ),
    );
  }
}
