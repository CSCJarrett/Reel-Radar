import '/backend/backend.dart';
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
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
      child: Container(
        width: double.infinity,
        height: 475.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).manualRed,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: Colors.black,
            width: 3.0,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Text(
                        widget.backlogItemDoc!.title,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Radio Canada Big',
                              color: FlutterFlowTheme.of(context).manualWhite,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 40.0,
                      fillColor: FlutterFlowTheme.of(context).manualBlackGrey,
                      icon: Icon(
                        Icons.delete,
                        color: FlutterFlowTheme.of(context).info,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent('BACKLOG_ITEM_COMP_delete_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_backend_call');
                        await widget.backlogItemDoc!.reference.delete();
                      },
                    ),
                  ],
                ),
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
