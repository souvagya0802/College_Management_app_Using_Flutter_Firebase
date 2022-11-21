import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_manag/Depertment/depertment.dart';
import 'package:data_manag/FireAuth/profileScreen.dart';
import 'package:data_manag/Images/viewImage.dart';
import 'package:data_manag/pages/todoListPage.dart';
import 'package:data_manag/services/FirebaseImage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vibration/vibration.dart';
import '../AdminModule/teacherList.dart';
import '../ExtraFile/About.dart';
import '../ExtraFile/viewNotice.dart';
import '../FireAuth/login_screen.dart';
import '../FireAuth/studentTeacher.dart';
import '../FrontPage/loginPage.dart';
import '../Library/libraryAllBooks.dart';
import '../Library/orderDetails.dart';
import '../Models/slider.dart';
import '../PDF/FirstPdfPage.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/firebase_auth.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //int _counter = 0;
  bool isOpened = false;
  bool _isSigningOut = false;

  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  final GlobalKey<SideMenuState> _endSideMenuKey = GlobalKey<SideMenuState>();

  String name = "";
  String Enrollment = "";
  String Email = "";
  String Father = "";
  String Mobile = "";

  void getData() async {
    User? user = await FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance
        .collection("Students")
        .doc(user?.uid)
        .get();
    setState(() {
      name = vari.data()!["Full Name"];
      Enrollment = vari.data()!["Enrollment Number"];
      Email = vari.data()!["Email"];
      Father = vari.data()!["Father Name"];
      Mobile = vari.data()!["Mobile Number"];
    });
  }

  void initState() {
    getData();
    super.initState();
  }

  toggleMenu([bool end = false]) {
    if (end) {
      final _state = _endSideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    } else {
      final _state = _sideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SideMenu(
        key: _endSideMenuKey,
        inverse: true,
        // end side menu
        background: Colors.purple[600],
        type: SideMenuType.slideNRotate,
        menu: Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: buildMenu(),
        ),
        onChange: (isOpened) {
          setState(() => isOpened = isOpened);
        },
        child: SideMenu(
            key: _sideMenuKey,
            menu: buildMenu(),
            type: SideMenuType.slideNRotate,
            onChange: (_isOpened) {
              setState(() => isOpened = _isOpened);
            },
            child: IgnorePointer(
                ignoring: isOpened,
                child: Scaffold(
                  appBar: AppBar(
                    centerTitle: true,
                    leading: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () => toggleMenu(),
                    ),
                    actions: [
                      IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () => toggleMenu(true),
                      )
                    ],
                    title: Text(name),
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15.0, bottom: 16),
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 24),
                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                color: Colors.indigo,
                                child: SizedBox(
                                    height: 230,
                                    width: double.infinity,
                                    child: SliderImage()),
                              ),
                              Card(
                                color: Colors.indigo[100],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          InkWell(
                                            onTap: () {
                                              HapticFeedback.heavyImpact();
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          AboutPage()));
                                            },
                                            child: Container(
                                              margin: EdgeInsets.all(10),
                                              padding: EdgeInsets.all(10),
                                              width: 110,
                                              height: 110,
                                              child: Column(
                                                children: [
                                                  const Center(
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
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Colors.indigo),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          InkWell(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ViewNoticePage()));
                                              },
                                              child: Container(
                                                margin: EdgeInsets.all(10),
                                                padding: EdgeInsets.all(10),
                                                width: 110,
                                                height: 110,
                                                child: Column(
                                                  children: [
                                                    Center(
                                                      child: Icon(
                                                        Icons
                                                            .notifications_active,
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
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ],
                                                ),
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.rectangle,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.indigo),
                                              )),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          InkWell(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          BookList()));
                                            },
                                            child: Container(
                                              margin: EdgeInsets.all(10),
                                              padding: EdgeInsets.all(10),
                                              width: 110,
                                              height: 110,
                                              child: Column(
                                                children: [
                                                  const Center(
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
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Colors.indigo),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          InkWell(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            DepertmentPage()));
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
                                                        FontAwesomeIcons.list,
                                                        size: 40,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    SizedBox(height: 20),
                                                    Text(
                                                      "Dept",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ],
                                                ),
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.rectangle,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.indigo),
                                              )),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          InkWell(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          OrderDetails()));
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
                                                      Icons.shopping_cart,
                                                      size: 40,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  SizedBox(height: 20),
                                                  Text(
                                                    "Order",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Colors.indigo),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          InkWell(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            StudentTeacherList()));
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
                                                        FontAwesomeIcons
                                                            .peopleGroup,
                                                        size: 40,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    SizedBox(height: 20),
                                                    Text(
                                                      "Teachers",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ],
                                                ),
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.rectangle,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.indigo),
                                              )),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ViewImage()));
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
                                                  FontAwesomeIcons
                                                      .images,
                                                  size: 40,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(height: 20),
                                              Text(
                                                "UImages",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              )
                                            ],
                                          ),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              borderRadius:
                                              BorderRadius.circular(
                                                  20),
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
                                          launch(
                                              'https://www.facebook.com/uemjpr');
                                        },
                                      ),
                                      ListTile(
                                        leading: FaIcon(
                                          FontAwesomeIcons.twitter,
                                          color: Colors.blue,
                                        ),
                                        title: Text("Twitter"),
                                        onTap: () {
                                          launch(
                                              'https://mobile.twitter.com/Jaipur_Uem');
                                        },
                                      ),
                                      ListTile(
                                        leading: FaIcon(
                                          FontAwesomeIcons.youtube,
                                          color: Colors.red,
                                        ),
                                        title: Text("Youtube"),
                                        onTap: () {
                                          launch(
                                              'https://youtube.com/@UEMJaipurOffical');
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
                        )
                      ],
                    ),
                  ),
                ))));
  }

  Widget buildMenu() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 25.0,
                ),
                const SizedBox(height: 16.0),
                Text(name,
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
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
            leading: const Icon(Icons.person, size: 22.0, color: Colors.white),
            title: const Text(
              "Profile",
              style: TextStyle(fontSize: 15.0),
            ),
            textColor: Colors.white,
            dense: true,
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
                          builder: (context) => LoginScreen(),
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
