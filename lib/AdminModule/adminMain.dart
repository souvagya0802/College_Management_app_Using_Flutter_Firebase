import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_manag/AdminModule/teacherList.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../ExtraFile/About.dart';
import '../ExtraFile/viewNotice.dart';
import '../FireAuth/register_screen.dart';
import '../Images/addImages.dart';
import '../Images/viewImage.dart';
import '../Library/libraryAllBooks.dart';
import '../Library/libraryPage.dart';
import '../PDF/FirstPdfPage.dart';
import 'adminHome.dart';
import 'adminLogin.dart';
import 'adminSignUp.dart';

class AdminMainPage extends StatefulWidget {
  const AdminMainPage({Key? key}) : super(key: key);

  @override
  State<AdminMainPage> createState() => _AdminMainPageState();
}

class _AdminMainPageState extends State<AdminMainPage> {
  String adminname = "";
  String adminRole = "";

  void admingetData() async {
    User? user = await FirebaseAuth.instance.currentUser;
    var vari2 = await FirebaseFirestore.instance
        .collection("Teachers")
        .doc(user?.uid)
        .get();
    setState(() {
      adminname = vari2.data()!["Full Name"];
      adminRole = vari2.data()!["Role"];
    });
  }

  @override
  void initState() {
    admingetData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(adminname),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 16),
              child: Column(
                children: [
                  Card(
                    color: Colors.indigo[100],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "You are an " + adminRole,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 5,
                          height: 10,
                          indent: 20,
                          endIndent: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RegisterScreen()));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(10),
                                    padding: EdgeInsets.all(10),
                                    width: 110,
                                    height: 110,
                                    child: Column(
                                      children: [
                                        const Center(
                                          child: Icon(
                                            Icons.developer_board,
                                            size: 40,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        Text(
                                          "Student",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.indigo),
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AdminSignUp()));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(10),
                                    padding: EdgeInsets.all(10),
                                    width: 110,
                                    height: 110,
                                    child: Column(
                                      children: const [
                                        Center(
                                          child: Icon(
                                            Icons.receipt_long,
                                            size: 40,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        Text(
                                          "Teacher",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.indigo),
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => BookList()));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(10),
                                    padding: EdgeInsets.all(10),
                                    width: 110,
                                    height: 110,
                                    child: Column(
                                      children: [
                                        Center(
                                          child: FaIcon(
                                            FontAwesomeIcons.bookOpen,
                                            size: 40,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        Text(
                                          "Library",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.indigo),
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => AboutPage()));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(10),
                                    padding: EdgeInsets.all(10),
                                    width: 110,
                                    height: 110,
                                    child: Column(
                                      children: [
                                        Center(
                                          child: FaIcon(
                                            FontAwesomeIcons.home,
                                            size: 40,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        Text(
                                          "About",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.indigo),
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LibraryPage()));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(10),
                                    padding: EdgeInsets.all(10),
                                    width: 110,
                                    height: 110,
                                    child: Column(
                                      children: [
                                        Center(
                                          child: FaIcon(
                                            FontAwesomeIcons.book,
                                            size: 40,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        Text(
                                          "Add Book",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.indigo),
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => PdfPage()));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(10),
                                    padding: EdgeInsets.all(10),
                                    width: 110,
                                    height: 110,
                                    child: Column(
                                      children: [
                                        Center(
                                          child: FaIcon(
                                            FontAwesomeIcons.upload,
                                            size: 40,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        Text(
                                          "Notice",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.indigo),
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                            onTap: () {Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => AddImage()));},
                            child: Container(
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(10),
                              width: 110,
                              height: 110,
                              child: Column(
                                children: [
                                  Center(
                                    child: FaIcon(
                                      FontAwesomeIcons.camera,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "Image",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.indigo),
                            )),
                      ],
                    ),
                  ),
                  Card(
                      color: Colors.indigo[100],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          ListTile(
                            leading: FaIcon(
                              FontAwesomeIcons.linkedin,
                              color: Colors.blue,
                            ),
                            title: Text("Linkedin"),
                            onTap: () {
                              launch(
                                  'https://www.linkedin.com/in/biswajoy-chatterjee-uem-6a460914b');
                            },
                          ),
                          ListTile(
                            leading: FaIcon(
                              FontAwesomeIcons.instagram,
                              color: Colors.purple,
                            ),
                            title: Text("Instagram"),
                            onTap: () {
                              launch(
                                  'https://instagram.com/jaipur_uem?igshid=YmMyMTA2M2Y=');
                            },
                          ),
                          ListTile(
                            leading: FaIcon(
                              FontAwesomeIcons.facebook,
                              color: Colors.blue,
                            ),
                            title: Text("Facebook"),
                            onTap: () {
                              launch('https://www.facebook.com/uemjpr');
                            },
                          ),
                          ListTile(
                            leading: FaIcon(
                              FontAwesomeIcons.twitter,
                              color: Colors.blue,
                            ),
                            title: Text("Twitter"),
                            onTap: () {
                              launch('https://mobile.twitter.com/Jaipur_Uem');
                            },
                          ),
                          ListTile(
                            leading: FaIcon(
                              FontAwesomeIcons.youtube,
                              color: Colors.red,
                            ),
                            title: Text("Youtube"),
                            onTap: () {
                              launch('https://youtube.com/@UEMJaipurOffical');
                            },
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.phone,
                              color: Colors.black,
                            ),
                            title: Text("Contuct Us"),
                            onTap: () {
                              launch(
                                  'https://uem.edu.in/uem-jaipur/contact-us/');
                            },
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.public,
                              color: Colors.black,
                            ),
                            title: Text("Website"),
                            onTap: () {
                              launch('http://www.uem.edu.in/');
                            },
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavDrawer extends StatefulWidget {
  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  bool isOpened = false;
  bool _isSigningOut = false;
  String adminname = "";
  String adminRole = "";

  void admingetData() async {
    User? user = await FirebaseAuth.instance.currentUser;
    var vari2 = await FirebaseFirestore.instance
        .collection("Teachers")
        .doc(user?.uid)
        .get();
    setState(() {
      adminname = vari2.data()!["Full Name"];
      adminRole = vari2.data()!["Role"];
    });
  }

  @override
  void initState() {
    admingetData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.indigo,
      child: ListView(
        padding: EdgeInsets.only(top: 60),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                ),
                const SizedBox(height: 16.0),
                Text(adminname,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white)),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AdminHome()));
            },
            leading: const Icon(Icons.person, size: 22.0, color: Colors.white),
            title: const Text(
              "Profile",
              style: TextStyle(fontSize: 15.0),
            ),
            textColor: Colors.white,
            dense: true,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => TeacherList()));
            },
            leading: const Icon(Icons.list, size: 22.0, color: Colors.white),
            title: const Text(
              "Teacher List",
              style: TextStyle(fontSize: 15.0),
            ),
            textColor: Colors.white,
            dense: true,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.people, size: 22.0, color: Colors.white),
            title: const Text(
              "Student List",
              style: TextStyle(fontSize: 15.0),
            ),
            textColor: Colors.white,
            dense: true,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ViewNoticePage()));
            },
            leading: const Icon(Icons.notifications_active,
                size: 22.0, color: Colors.white),
            title: const Text(
              "View Notice",
              style: TextStyle(fontSize: 15.0),
            ),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ViewImage()));
            },
            leading: const Icon(Icons.image,
                size: 22.0, color: Colors.white),
            title: const Text(
              "Images",
              style: TextStyle(fontSize: 15.0),
            ),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          _isSigningOut
              ? const CircularProgressIndicator()
              : Container(
                  margin: const EdgeInsets.only(left: 23, top: 80),
                  child: ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        _isSigningOut = true;
                      });
                      await FirebaseAuth.instance.signOut();
                      setState(() {
                        _isSigningOut = false;
                      });
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => AdminLogin(),
                        ),
                      );
                    },
                    child: Text('Sign out'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
