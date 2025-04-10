import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'movie_display_model.dart';
export 'movie_display_model.dart';

class MovieDisplayWidget extends StatefulWidget {
  const MovieDisplayWidget({
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
  State<MovieDisplayWidget> createState() => _MovieDisplayWidgetState();
}

class _MovieDisplayWidgetState extends State<MovieDisplayWidget> {
  late MovieDisplayModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MovieDisplayModel());

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
        height: 325.0,
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
                    useGoogleFonts: false,
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
                          useGoogleFonts: false,
                        ),
                  ),
                ),
              ].divide(SizedBox(width: 12.0)),
            ),
          ].divide(SizedBox(height: 12.0)),
        ),
      ),
    );
  }
}
