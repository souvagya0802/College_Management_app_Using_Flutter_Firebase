import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StudentTeacherList extends StatefulWidget {
  const StudentTeacherList({Key? key}) : super(key: key);

  @override
  State<StudentTeacherList> createState() => _StudentTeacherListState();
}

class _StudentTeacherListState extends State<StudentTeacherList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Teacher List',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22),
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

                  ]));
            },
          );
        },
      ),
    );
  }

}
