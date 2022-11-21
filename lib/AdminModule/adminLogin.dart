import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_manag/AdminModule/adminSignUp.dart';
import 'package:data_manag/AdminModule/startingPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'adminHome.dart';
import 'adminMain.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  TextEditingController adminemailController = TextEditingController();
  TextEditingController adminpasswordController = TextEditingController();

  final dbRef = FirebaseFirestore.instance.collection("Teachers");
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 220,
                width: 900,
                decoration: const BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0))),
                child: Container(
                  child: Column(
                    children: const [
                      Padding(padding: EdgeInsets.all(10)),
                      Text(
                        "UEM JAIPUR",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white),
                      ),
                      SizedBox(height: 100),
                      Text(
                        "ADMIN SIGN IN",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(top: 20, bottom: 14, left: 20, right: 20),
                margin:
                    EdgeInsets.only(left: 20, bottom: 20, right: 20, top: 20),
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
                  controller: adminemailController,
                  obscureText: false,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    hintText: "Enter Email",
                    icon: Icon(Icons.email),
                  ),
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(top: 10, bottom: 14, left: 20, right: 20),
                margin:
                    EdgeInsets.only(left: 20, bottom: 20, right: 20, top: 20),
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
                  controller: adminpasswordController,
                  obscureText: true,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    icon: Icon(Icons.privacy_tip),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    adminloginUser();
                  },
                  child: Text("Sign In")),
              SizedBox(height: 8),
              InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AdminSignUp()));
                  },
                  child: Text("Create New Account")),
              SizedBox(height: 30),
              InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => StartingPage()));
                  },
                  child: Text(
                    "Back",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Future adminloginUser() async {
    try {
      final newUser = await _auth.signInWithEmailAndPassword(
          email: adminemailController.text,
          password: adminpasswordController.text);

      if (newUser != null) {
        final User user = await _auth.currentUser!;
        final userId = user.uid;
        CollectionReference users =
            FirebaseFirestore.instance.collection('Teachers');
        final snapshot = await users.doc(userId).get();
        final data = snapshot.data() as Map<String, dynamic>;
        setState(() {
          if (data['Role'] == 'Admin') {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AdminMainPage()));
          }
        });
      }
    } catch (e) {
      print(e);
    }
  }
}
