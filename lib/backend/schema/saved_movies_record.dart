import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SavedMoviesRecord extends FirestoreRecord {
  SavedMoviesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "moviePoster" field.
  String? _moviePoster;
  String get moviePoster => _moviePoster ?? '';
  bool hasMoviePoster() => _moviePoster != null;

  // "userID" field.
  DocumentReference? _userID;
  DocumentReference? get userID => _userID;
  bool hasUserID() => _userID != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _moviePoster = snapshotData['moviePoster'] as String?;
    _userID = snapshotData['userID'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('savedMovies');

  static Stream<SavedMoviesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SavedMoviesRecord.fromSnapshot(s));

  static Future<SavedMoviesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SavedMoviesRecord.fromSnapshot(s));

  static SavedMoviesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SavedMoviesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SavedMoviesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SavedMoviesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SavedMoviesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SavedMoviesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSavedMoviesRecordData({
  String? title,
  String? moviePoster,
  DocumentReference? userID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'moviePoster': moviePoster,
      'userID': userID,
    }.withoutNulls,
  );

  return firestoreData;
}

class SavedMoviesRecordDocumentEquality implements Equality<SavedMoviesRecord> {
  const SavedMoviesRecordDocumentEquality();

  @override
  bool equals(SavedMoviesRecord? e1, SavedMoviesRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.moviePoster == e2?.moviePoster &&
        e1?.userID == e2?.userID;
  }

  @override
  int hash(SavedMoviesRecord? e) =>
      const ListEquality().hash([e?.title, e?.moviePoster, e?.userID]);

  @override
  bool isValidKey(Object? o) => o is SavedMoviesRecord;
}
