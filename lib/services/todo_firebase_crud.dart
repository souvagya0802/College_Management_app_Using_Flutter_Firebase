import 'package:cloud_firestore/cloud_firestore.dart';

import '../Models/response.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _collection = _firestore.collection('TODO');

class Firebasetodo{
  static Future<Response> addDetails({
    required String title,
    required String description,
  }) async{
    Response response1 = Response();
    DocumentReference documentReference = _collection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "add_title": title,
      "add_description": description
    };
    var result1 = await documentReference.set(data).whenComplete(() {
      response1.code = 200;
      response1.message = " Successfully added";
    }) .catchError((e){
      response1.code = 500;
      response1.message = e;
    });

    return response1;
  }

  static Future<Response> updateDetails({
    required String title,
    required String description,
    required String id,
  }) async {
    Response response1 = Response();
    DocumentReference documentReference = _collection.doc(id);

    Map<String, dynamic> data = <String, dynamic>{
      "add_title": title,
      "add_description": description
    };

    await documentReference.update(data).whenComplete(() {
      response1.code = 200;
      response1.message = "Successfully updated";
    }).catchError((e) {
      response1.code = 500;
      response1.message = e;
    });

    return response1;
  }

  static Stream<QuerySnapshot> readDetails() {
    CollectionReference notesItemCollection = _collection;

    return notesItemCollection.snapshots();
  }

  static Future<Response> deleteDetails({
    required String id,
  }) async {
    Response response1 = Response();
    DocumentReference documentReference = _collection.doc(id);
    await documentReference.delete().whenComplete(() {
      response1.code = 200;
      response1.message = "Details Deleted";
    }).catchError((e) {
      response1.code = 500;
      response1.message = e;
    });

    return response1;
  }

}