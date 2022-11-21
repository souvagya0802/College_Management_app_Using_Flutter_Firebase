import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_manag/pages/homePage.dart';
import 'package:flutter/material.dart';
import '../Models/employee.dart';
import '../services/firebase_crud.dart';
import 'addPage.dart';
import 'editPage.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final Stream<QuerySnapshot> collectionReference = FirebaseCrud.readEmployee();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "List of Teachers",
            style: TextStyle(
                letterSpacing: 1, fontWeight: FontWeight.bold, fontSize: 22),
          ),
          backgroundColor: Colors.indigo,
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.app_registration,
                color: Colors.white,
                size: 28,
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil<dynamic>(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) => AddPage(),
                  ),
                  (route) =>
                      true, //if you want to disable back feature set to false
                );
              },
            )
          ],
        ),
        body: StreamBuilder(
          stream: collectionReference,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return Padding(
                //padding: const EdgeInsets.only(top: 8.0),
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: snapshot.data!.docs.map((e) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(children: [
                        ListTile(
                          title: Text(e["employee_name"],
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: 5),
                              Text("Enrollment No: " + e['enrollmentno'],
                                  style: const TextStyle(fontSize: 17)),
                              Text("Depertment: " + e['employee_position'],
                                  style: const TextStyle(fontSize: 17)),
                              Text("Contact Number: " + e['employee_contactno'],
                                  style: const TextStyle(fontSize: 17)),
                              Text("Year: " + e['year'],
                                  style: const TextStyle(fontSize: 17)),
                            ],
                          ),
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            TextButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(5.0),
                                primary:
                                    const Color.fromARGB(255, 143, 133, 226),
                                textStyle: const TextStyle(fontSize: 18),
                              ),
                              child: const Text('Edit'),
                              onPressed: () {
                                Navigator.pushAndRemoveUntil<dynamic>(
                                  context,
                                  MaterialPageRoute<dynamic>(
                                    builder: (BuildContext context) => EditPage(
                                      employee: Employee(
                                          uid: e.id,
                                          employeename: e["employee_name"],
                                          position: e["employee_position"],
                                          contactno: e["employee_contactno"],
                                          enrollmentno: e["enrollmentno"],
                                          year: e["year"]),
                                    ),
                                  ),
                                  (route) =>
                                      false, //if you want to disable back feature set to false
                                );
                              },
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(5.0),
                                primary:
                                    const Color.fromARGB(255, 143, 133, 226),
                                textStyle: const TextStyle(fontSize: 18),
                              ),
                              child: const Text('Delete'),
                              onPressed: () async {
                                var response =
                                    await FirebaseCrud.deleteEmployee(
                                        docId: e.id);
                                if (response.code != 200) {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          content:
                                              Text(response.message.toString()),
                                        );
                                      });
                                }
                              },
                            ),
                          ],
                        )
                      ]),
                    );
                  }).toList(),
                ),
              );
            }
            return Container();
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage(title: 'Student', user: user,)));
          },
          backgroundColor: Colors.indigo,
          child: const Icon(Icons.home),
        ));
  }
}
