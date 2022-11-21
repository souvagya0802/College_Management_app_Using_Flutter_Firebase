import 'package:data_manag/FireAuth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:internet_popup/internet_popup.dart';

import 'adminLogin.dart';

class StartingPage extends StatefulWidget {
  const StartingPage({Key? key}) : super(key: key);

  @override
  State<StartingPage> createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  void initState(){
    super.initState();
    InternetPopup().initialize(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "UEM",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,letterSpacing: 2),
        ),
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: new AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
            colorBlendMode: BlendMode.darken,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return AdminLogin();
                  }));
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  width: 120,
                  height: 120,
                  child: Column(
                    children: [
                      Center(
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text(
                        "Admin",
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
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.indigo),
                ),
              ),
              const SizedBox(height: 40),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return LoginScreen();
                    }));
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    width: 120,
                    height: 120,
                    child: Column(
                      children: [
                        Center(
                          child: FaIcon(
                            FontAwesomeIcons.peopleGroup,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text(
                          "Students",
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
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.indigo),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
