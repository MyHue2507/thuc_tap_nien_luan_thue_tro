import 'package:cloud_firestore/cloud_firestore.dart';

class SearchService {
  searchByName(String searchField) {
    return Firestore.instance
        // .document("users/${firebaseUser.uid}/listPhongChoThue/$phongId")
        .collection('listPhongChoThue')
        .where('searchKey',
            isEqualTo: searchField.substring(0,1))
        .getDocuments();
  }
}