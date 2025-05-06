// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class RecommendationsStruct extends FFFirebaseStruct {
  RecommendationsStruct({
    String? title,
    String? description,
    String? poster,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _description = description,
        _poster = poster,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "poster" field.
  String? _poster;
  String get poster => _poster ?? '';
  set poster(String? val) => _poster = val;

  bool hasPoster() => _poster != null;

  static RecommendationsStruct fromMap(Map<String, dynamic> data) =>
      RecommendationsStruct(
        title: data['title'] as String?,
        description: data['description'] as String?,
        poster: data['poster'] as String?,
      );

  static RecommendationsStruct? maybeFromMap(dynamic data) => data is Map
      ? RecommendationsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'description': _description,
        'poster': _poster,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'poster': serializeParam(
          _poster,
          ParamType.String,
        ),
      }.withoutNulls;

  static RecommendationsStruct fromSerializableMap(Map<String, dynamic> data) =>
      RecommendationsStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        poster: deserializeParam(
          data['poster'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'RecommendationsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RecommendationsStruct &&
        title == other.title &&
        description == other.description &&
        poster == other.poster;
  }

  @override
  int get hashCode => const ListEquality().hash([title, description, poster]);
}

RecommendationsStruct createRecommendationsStruct({
  String? title,
  String? description,
  String? poster,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RecommendationsStruct(
      title: title,
      description: description,
      poster: poster,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RecommendationsStruct? updateRecommendationsStruct(
  RecommendationsStruct? recommendations, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    recommendations
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRecommendationsStructData(
  Map<String, dynamic> firestoreData,
  RecommendationsStruct? recommendations,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (recommendations == null) {
    return;
  }
  if (recommendations.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && recommendations.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final recommendationsData =
      getRecommendationsFirestoreData(recommendations, forFieldValue);
  final nestedData =
      recommendationsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = recommendations.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRecommendationsFirestoreData(
  RecommendationsStruct? recommendations, [
  bool forFieldValue = false,
]) {
  if (recommendations == null) {
    return {};
  }
  final firestoreData = mapToFirestore(recommendations.toMap());

  // Add any Firestore field values
  recommendations.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRecommendationsListFirestoreData(
  List<RecommendationsStruct>? recommendationss,
) =>
    recommendationss
        ?.map((e) => getRecommendationsFirestoreData(e, true))
        .toList() ??
    [];
