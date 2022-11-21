import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController enrollmentController = TextEditingController();
  TextEditingController registrationController = TextEditingController();
  TextEditingController studentnumberController = TextEditingController();
  TextEditingController fathernameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController localaddressController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController distController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController admissionyearController = TextEditingController();
  TextEditingController dateofbirthController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController roleController = TextEditingController();

  final _focusName = FocusNode();
  final _focusEmail = FocusNode();
  final _focusEnrollment = FocusNode();
  final _focusFather = FocusNode();
  final _focusNnumber = FocusNode();
  final _focusPassword = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusName.unfocus();
        _focusEmail.unfocus();
        _focusEnrollment.unfocus();
        _focusFather.unfocus();
        _focusNnumber.unfocus();
        _focusPassword.unfocus();
      },
      child: SafeArea(
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
                          "UEM Jaipur",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white),
                        ),
                        SizedBox(height: 100),
                        Text(
                          "Student Register",
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
                    controller: nameController,
                    focusNode: _focusName,
                    obscureText: false,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintText: "Full Name",
                      icon: Icon(Icons.person_add),
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
                    controller: emailController,
                    focusNode: _focusEmail,
                    obscureText: false,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintText: "Email",
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
                    controller: enrollmentController,
                    focusNode: _focusEnrollment,
                    obscureText: false,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintText: "Enrollment No",
                      icon: Icon(Icons.numbers),
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
                    controller: registrationController,
                    //focusNode: _focusName,
                    obscureText: false,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintText: "Registration Number",
                      icon: Icon(Icons.app_registration),
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
                    controller: studentnumberController,
                    //ocusNode: _focusName,
                    obscureText: false,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintText: "Student Phone No.",
                      icon: Icon(Icons.phone),
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
                    controller: fathernameController,
                    focusNode: _focusFather,
                    obscureText: false,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintText: "Father Name",
                      icon: Icon(Icons.person),
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
                    controller: numberController,
                    focusNode: _focusNnumber,
                    obscureText: false,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintText: "Mobile Number",
                      icon: Icon(Icons.phone),
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
                    controller: localaddressController,
                    //focusNode: _focusName,
                    obscureText: false,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintText: "Local Address",
                      icon: Icon(Icons.place),
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
                    controller: pincodeController,
                    //focusNode: _focusName,
                    obscureText: false,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintText: "Pin Code",
                      icon: Icon(Icons.pin),
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
                    controller: distController,
                    //focusNode: _focusName,
                    obscureText: false,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintText: "District",
                      icon: Icon(Icons.location_on_outlined),
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
                    controller: stateController,
                    //focusNode: _focusName,
                    obscureText: false,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintText: "State",
                      icon: Icon(Icons.location_city),
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
                    controller: admissionyearController,
                    //focusNode: _focusName,
                    obscureText: false,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintText: "Admission Year",
                      icon: Icon(Icons.access_time),
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
                    controller: dateofbirthController,
                    //ocusNode: _focusName,
                    obscureText: false,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintText: "Date Of Birth(DD-MM-YY)",
                      icon: Icon(Icons.date_range_outlined),
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
                    controller: roleController,
                    //focusNode: _focusNnumber,
                    obscureText: false,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintText: "Role",
                      icon: Icon(Icons.person),
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
                    focusNode: _focusPassword,
                    obscureText: true,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintText: "Password",
                      icon: Icon(Icons.security),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      registerUser();
                    },
                    child: Text("Register")),
                SizedBox(height: 8),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                    },
                    child: Text("Already have an account?")),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future registerUser() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = await FirebaseAuth.instance.currentUser;
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((signedInUser) => {
                FirebaseFirestore.instance
                    .collection("Students")
                    .doc(signedInUser.user?.uid)
                    .set({
                  "Full Name": nameController.text,
                  "Email": emailController.text,
                  "Enrollment Number": enrollmentController.text,
                  "Registration Number": registrationController.text,
                  "Student Mobile Number": studentnumberController.text,
                  "Father Name": fathernameController.text,
                  "Mobile Number": numberController.text,
                  "Local Address": localaddressController.text,
                  "Pin Code": pincodeController.text,
                  "District": distController.text,
                  "State": stateController.text,
                  'Admission Year': admissionyearController.text,
                  "Date Of Birth": dateofbirthController.text,
                  "Role": roleController.text,
                }).then((signedInUser) => {
                          print("Success"),
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()))
                        })
              });
    } catch (e) {
      print(e);
    }
  }
}
