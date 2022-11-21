import 'package:cloud_firestore/cloud_firestore.dart';
import '../Models/response.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection('Emplyee');

class FirebaseCrud {
  static Future<Response> addEmployee({
    required String name,
    required String position,
    required String contactno,
    required String enrollmentno,
    required String year,
  }) async {
    Response response = Response();
    DocumentReference documentReference = _Collection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "employee_name": name,
      "employee_position": position,
      "employee_contactno": contactno,
      "enrollmentno": enrollmentno,
      "year": year
    };

    var result = await documentReference.set(data).whenComplete(() {
      response.code = 200;
      response.message = "Added";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

  static Future<Response> updateEmployee({
    required String name,
    required String position,
    required String contactno,
    required String docId,
    required String enrollmentno,
    required String year,
  }) async {
    Response response = Response();
    DocumentReference documentReference = _Collection.doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "employee_name": name,
      "employee_position": position,
      "employee_contactno": contactno,
      "enrollmentno": enrollmentno,
      "year": year
    };

    await documentReference.update(data).whenComplete(() {
      response.code = 200;
      response.message = "Successfully updated Employee";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

  static Stream<QuerySnapshot> readEmployee() {
    CollectionReference notesItemCollection = _Collection;

    return notesItemCollection.snapshots();
  }

  static Future<Response> deleteEmployee({
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReference = _Collection.doc(docId);
    await documentReference.delete().whenComplete(() {
      response.code = 200;
      response.message = "Employee Details Deleted";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }
}
