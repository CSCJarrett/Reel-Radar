import '/flutter_flow/flutter_flow_util.dart';
import '/pages/nav_bar_with_middle_button/nav_bar_with_middle_button_widget.dart';
import 'backlog_widget.dart' show BacklogWidget;
import 'package:flutter/material.dart';

class BacklogModel extends FlutterFlowModel<BacklogWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavBarWithMiddleButton component.
  late NavBarWithMiddleButtonModel navBarWithMiddleButtonModel;

  @override
  void initState(BuildContext context) {
    navBarWithMiddleButtonModel =
        createModel(context, () => NavBarWithMiddleButtonModel());
  }

  @override
  void dispose() {
    navBarWithMiddleButtonModel.dispose();
  }
}
