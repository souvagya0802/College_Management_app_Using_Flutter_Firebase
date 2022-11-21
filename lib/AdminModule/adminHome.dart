import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Library/libraryPage.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  String adminname = "";
  String adminEmail = "";
  String admincontact = "";
  String adminid = "";
  String adminlocaladd = "";
  String adminpin = "";
  String admindist = "";
  String adminstate = "";
  String adminbirth = "";
  String adminRole = "";

  void admingetData() async {
    User? user = await FirebaseAuth.instance.currentUser;
    var vari2 = await FirebaseFirestore.instance
        .collection("Teachers")
        .doc(user?.uid)
        .get();
    setState(() {
      adminname = vari2.data()!["Full Name"];
      adminEmail = vari2.data()!["Email"];
      admincontact = vari2.data()!["Contact Number"];
      adminid = vari2.data()!["ID Number"];
      adminlocaladd = vari2.data()!["Local Address"];
      adminpin = vari2.data()!["Pin Code"];
      admindist = vari2.data()!["District"];
      adminstate = vari2.data()!["State"];
      adminbirth = vari2.data()!["Date of Birth"];
      adminRole = vari2.data()!["Role"];
    });
  }

  void initState() {
    admingetData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Admin",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Card(
          margin: EdgeInsets.all(7),
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(padding: EdgeInsets.all(8)),
              Text("Name: " + adminname,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black)),
              SizedBox(
                height: 15,
              ),
              Text("Email: " + adminEmail,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black)),
              SizedBox(
                height: 15,
              ),
              Text("Contact No.: " + admincontact,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black)),
              SizedBox(
                height: 15,
              ),
              Text("ID Number: " + adminid,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black)),
              SizedBox(
                height: 15,
              ),
              Text("Local Address: " + adminlocaladd,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black)),
              SizedBox(
                height: 15,
              ),
              Text("Pin Code: " + adminpin,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black)),
              SizedBox(
                height: 15,
              ),
              Text("District: " + admindist,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black)),
              SizedBox(
                height: 15,
              ),
              Text("State: " + adminstate,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black)),
              SizedBox(
                height: 15,
              ),
              Text("Date of Birth(DD-MM-YY): " + adminbirth,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black)),
              SizedBox(
                height: 15,
              ),
              Text("Role: " + adminRole,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black)),
              // SizedBox(
              //   width: 250,
              //   height: 50,
              //   child: ElevatedButton(
              //       style: ElevatedButton.styleFrom(
              //         shape: RoundedRectangleBorder(
              //           //to set border radius to button
              //             borderRadius: BorderRadius.circular(10)),
              //       ),
              //       onPressed: () {
              //         Navigator.push(context, MaterialPageRoute(builder: (context)=>LibraryPage()));
              //       },
              //       child: const Text(
              //         "Upload Book",
              //         style: TextStyle(fontSize: 20),
              //       )),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
