import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/nav_bar_with_middle_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'homescreen_widget.dart' show HomescreenWidget;
import 'package:flutter/material.dart';

class HomescreenModel extends FlutterFlowModel<HomescreenWidget> {
  ///  Local state fields for this page.

  List<RecommendationsStruct> recommendationList = [];
  void addToRecommendationList(RecommendationsStruct item) =>
      recommendationList.add(item);
  void removeFromRecommendationList(RecommendationsStruct item) =>
      recommendationList.remove(item);
  void removeAtIndexFromRecommendationList(int index) =>
      recommendationList.removeAt(index);
  void insertAtIndexInRecommendationList(
          int index, RecommendationsStruct item) =>
      recommendationList.insert(index, item);
  void updateRecommendationListAtIndex(
          int index, Function(RecommendationsStruct) updateFn) =>
      recommendationList[index] = updateFn(recommendationList[index]);

  int? loopStart = 1;

  int? loopEnd = 1;

  List<String> tempRec = [];
  void addToTempRec(String item) => tempRec.add(item);
  void removeFromTempRec(String item) => tempRec.remove(item);
  void removeAtIndexFromTempRec(int index) => tempRec.removeAt(index);
  void insertAtIndexInTempRec(int index, String item) =>
      tempRec.insert(index, item);
  void updateTempRecAtIndex(int index, Function(String) updateFn) =>
      tempRec[index] = updateFn(tempRec[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (gemeniAPI)] action in Button widget.
  ApiCallResponse? apiResultskl;
  // Stores action output result for [Backend Call - API (OMDb)] action in Button widget.
  ApiCallResponse? apiResultfwl;
  // State field(s) for genre widget.
  String? genreValue;
  FormFieldController<String>? genreValueController;
  // State field(s) for numRecommendations widget.
  String? numRecommendationsValue;
  FormFieldController<String>? numRecommendationsValueController;
  // Model for NavBarWithMiddleButton component.
  late NavBarWithMiddleButtonModel navBarWithMiddleButtonModel;

  @override
  void initState(BuildContext context) {
    navBarWithMiddleButtonModel =
        createModel(context, () => NavBarWithMiddleButtonModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    navBarWithMiddleButtonModel.dispose();
  }
}
