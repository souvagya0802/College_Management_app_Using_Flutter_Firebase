import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_manag/AdminModule/adminLogin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminSignUp extends StatefulWidget {
  const AdminSignUp({Key? key}) : super(key: key);

  @override
  State<AdminSignUp> createState() => _AdminSignUpState();
}

class _AdminSignUpState extends State<AdminSignUp> {
  TextEditingController adminnameController = TextEditingController();
  TextEditingController adminemailController = TextEditingController();
  TextEditingController adminmobileController = TextEditingController();
  TextEditingController adminidController = TextEditingController();
  TextEditingController adminlocalController = TextEditingController();
  TextEditingController adminpincodeController = TextEditingController();
  TextEditingController admindistController = TextEditingController();
  TextEditingController adminstateController = TextEditingController();
  TextEditingController adminbirthdateController = TextEditingController();
  TextEditingController adminpasswordController = TextEditingController();
  TextEditingController adminroleController = TextEditingController();

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
                            fontSize: 25,
                            color: Colors.white),
                      ),
                      SizedBox(height: 100),
                      Text(
                        "Admin Register",
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
                  controller: adminnameController,
                  //focusNode: _focusName,
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
                  controller: adminemailController,
                  //focusNode: _focusEmail,
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
                  controller: adminmobileController,
                  //focusNode: _focusName,
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
                  controller: adminidController,
                  //focusNode: _focusName,
                  obscureText: false,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    hintText: "ID Number",
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
                  controller: adminlocalController,
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
                  controller: adminpincodeController,
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
                  controller: admindistController,
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
                  controller: adminstateController,
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
                  controller: adminbirthdateController,
                  //focusNode: _focusName,
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
                  controller: adminpasswordController,
                  //focusNode: _focusPassword,
                  obscureText: true,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    hintText: "Password",
                    icon: Icon(Icons.security),
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
                  controller: adminroleController,
                  //focusNode: _focusPassword,
                  obscureText: false,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    hintText: "Role",
                    icon: Icon(Icons.security),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    adminregisterUser();
                  },
                  child: Text("Register")),
              SizedBox(height: 8),
              InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AdminLogin()));
                  },
                  child: Text("Already have an account?")),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future adminregisterUser() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = await FirebaseAuth.instance.currentUser;
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: adminemailController.text,
              password: adminpasswordController.text)
          .then((adminSigned) => {
                FirebaseFirestore.instance
                    .collection("Teachers")
                    .doc(adminSigned.user?.uid)
                    .set({
                  "Full Name": adminnameController.text,
                  "Email": adminemailController.text,
                  "Contact Number": adminmobileController.text,
                  "ID Number": adminidController.text,
                  "Local Address": adminlocalController.text,
                  "Pin Code": adminpincodeController.text,
                  "District": admindistController.text,
                  "State": adminstateController.text,
                  "Date of Birth": adminbirthdateController.text,
                  "Role": adminroleController.text,
                }).then((adminSigned) => {
                          print("Success"),
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdminLogin()))
                        })
              });
    } catch (e) {
      print(e);
    }
  }
}
