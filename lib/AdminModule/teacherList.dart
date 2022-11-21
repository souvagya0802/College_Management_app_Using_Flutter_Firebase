import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TeacherList extends StatefulWidget {
  const TeacherList({Key? key}) : super(key: key);

  @override
  State<TeacherList> createState() => _TeacherListState();
}

class _TeacherListState extends State<TeacherList> {
  TextEditingController unamecontroller = TextEditingController();
  TextEditingController uemailcontroller = TextEditingController();
  TextEditingController ucontactcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Teacher List',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("Teachers").snapshots(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot data = snapshot.data!.docs[index];
                    return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(children: [
                          ListTile(
                            title: Text(data["Full Name"],
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const SizedBox(height: 5),
                                Text("Email: " + data['Email'],
                                    style: const TextStyle(fontSize: 17)),
                                Text(
                                    "Contact Number: " + data["Contact Number"],
                                    style: const TextStyle(fontSize: 17)),
                                Text("ID Number " + data['ID Number'],
                                    style: const TextStyle(fontSize: 17)),
                                Text("District " + data['District'],
                                    style: const TextStyle(fontSize: 17)),
                                Text("Role " + data['Role'],
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
                                  _update(snapshot.data?.docs[index].id);
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
                                  _delete(snapshot.data?.docs[index].id);
                                },
                              ),
                            ],
                          )
                        ]));
                  },
                );
        },
      ),
    );
  }

  void _delete(id) {
    FirebaseFirestore.instance.collection("Teachers").doc(id).delete();
    Fluttertoast.showToast(msg: "Successfully Deleted");
  }

  Future _update(id) {
    return showDialog(
        context: (context),
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Update"),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        top: 20, bottom: 14, left: 20, right: 20),
                    margin: const EdgeInsets.only(
                        left: 20, bottom: 20, right: 20, top: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.1),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        )
                      ],
                      border: Border.all(color: Colors.green.withOpacity(0.05)),
                    ),
                    child: TextFormField(
                      controller: unamecontroller,
                      obscureText: false,
                      textAlign: TextAlign.start,
                      decoration: const InputDecoration(
                        hintText: "Full Name",
                        icon: Icon(Icons.person_add),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 20, bottom: 14, left: 20, right: 20),
                    margin: const EdgeInsets.only(
                        left: 20, bottom: 20, right: 20, top: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.1),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        )
                      ],
                      border: Border.all(color: Colors.green.withOpacity(0.05)),
                    ),
                    child: TextFormField(
                      controller: uemailcontroller,
                      obscureText: false,
                      textAlign: TextAlign.start,
                      decoration: const InputDecoration(
                        hintText: "Email",
                        icon: Icon(Icons.person_add),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 20, bottom: 14, left: 20, right: 20),
                    margin: const EdgeInsets.only(
                        left: 20, bottom: 20, right: 20, top: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.1),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        )
                      ],
                      border: Border.all(color: Colors.green.withOpacity(0.05)),
                    ),
                    child: TextFormField(
                      controller: ucontactcontroller,
                      obscureText: false,
                      textAlign: TextAlign.start,
                      decoration: const InputDecoration(

                        hintText: "Contact Number",
                        icon: Icon(Icons.person_add),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      FirebaseFirestore.instance
                          .collection("Teachers")
                          .doc(id)
                          .update({
                        "Full Name": unamecontroller.text,
                        "Email": uemailcontroller.text,
                        "Contact Number": ucontactcontroller.text
                      });
                      Fluttertoast.showToast(msg: "Successfully Deleted");
                      Navigator.of(context).pop();
                    },
                    child: const Text("Update"),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
