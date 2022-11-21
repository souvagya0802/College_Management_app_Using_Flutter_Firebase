import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_manag/AdminModule/startingPage.dart';
import 'package:data_manag/FireAuth/profileScreen.dart';
import 'package:data_manag/FireAuth/register_screen.dart';
import 'package:data_manag/pages/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final dbRef = FirebaseFirestore.instance.collection("Students");
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
                        "SIGN IN",
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
                  controller: emailController,
                  obscureText: false,
                  textAlign: TextAlign.start,
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Please enter a valid email address.';
                    }
                    return null;
                  },
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
                  controller: passwordController,
                  validator: (value) {
                    if (value!.isEmpty || value.length < 7) {
                      return 'Password must be at least 7 characters long.';
                    }
                    return null;
                  },
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
                    loginUser();
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Text("Sign In")),
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

  Future loginUser() async {
    try {
      final oldUser = await _auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      if (oldUser != null) {
        final User user = await _auth.currentUser!;
        final olduserId = user.uid;
        CollectionReference users1 =
            FirebaseFirestore.instance.collection('Students');
        final snapshot = await users1.doc(olduserId).get();
        final data1 = snapshot.data() as Map<String, dynamic>;
        setState(() {
          if (data1['Role'] == 'Student') {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          }
        });
      }
    } catch (e) {
      //print(e);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text(
                "Something Wrong",
                style: TextStyle(color: Colors.red),
              ),
              //content:  Text((e as String).toString()),
              content: Text(e.toString()),
              actions: [
                TextButton(
                  child: const Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    }
  }
}
