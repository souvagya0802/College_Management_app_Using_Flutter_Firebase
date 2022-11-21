import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = "";
  String enrollment = "";
  String registration = "";
  String studentNo = "";
  String email = "";
  String father = "";
  String mobile = "";
  String localadd = "";
  String pincode = "";
  String dist = "";
  String state = "";
  String admission = "";
  String birthdate = "";

  void getData() async {
    User? user = await FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance
        .collection("Students")
        .doc(user?.uid)
        .get();
    setState(() {
      name = vari.data()!["Full Name"];
      enrollment = vari.data()!["Enrollment Number"];
      registration = vari.data()!["Registration Number"];
      email = vari.data()!["Email"];
      studentNo = vari.data()!["Student Mobile Number"];
      father = vari.data()!["Father Name"];
      mobile = vari.data()!["Mobile Number"];
      localadd = vari.data()!["Local Address"];
      pincode = vari.data()!["Pin Code"];
      dist = vari.data()!["District"];
      state = vari.data()!["State"];
      admission = vari.data()!["Admission Year"];
      birthdate = vari.data()!["Date Of Birth"];
    });
  }

  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Your Profile",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
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
              Text("Name: " + name,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black)),
              SizedBox(
                height: 15,
              ),
              Text("Enrollment No: " + enrollment,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black)),
              SizedBox(
                height: 15,
              ),
              Text("Registration No: " + registration,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black)),
              SizedBox(
                height: 15,
              ),
              Text("Email: " + email,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black)),
              SizedBox(
                height: 15,
              ),
              Text("Student Number: " + studentNo,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black)),
              SizedBox(
                height: 15,
              ),
              Text("Father Name: " + father,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black)),
              SizedBox(
                height: 15,
              ),
              Text("Mobile No: " + mobile,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black)),
              SizedBox(
                height: 15,
              ),
              Text("Local Address: " + localadd,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black)),
              SizedBox(
                height: 15,
              ),
              Text("Pin Code: " + pincode,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black)),
              SizedBox(
                height: 15,
              ),
              Text("District: " + dist,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black)),
              SizedBox(
                height: 15,
              ),
              Text("State: " + state,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black)),
              SizedBox(
                height: 15,
              ),
              Text("Admission Year: " + admission,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black)),
              SizedBox(
                height: 15,
              ),
              Text("Date Of Birth(DD-MM-YY): " + birthdate,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black)),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
