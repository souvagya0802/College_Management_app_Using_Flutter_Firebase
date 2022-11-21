import 'package:flutter/material.dart';

import '../Models/aboutSlider.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About",
          style: TextStyle(fontSize: 20, letterSpacing: 1),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 16),
                child: Column(
                  children: const <Widget>[
                    SizedBox(height: 24),
                    SizedBox(
                        height: 230,
                        width: double.infinity,
                        child: AboutSliderImage()),
                    //SizedBox(height: 2),
                    Text("About UEM Jaipur",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigoAccent)),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "UEM Jaipur ranked 1st in Times B-School ranking for Rajasthan and this is also the topmost university in IIC ranking by Ministry of Education, Govt of India. University is also a mentor institute under mentor-mentee scheme of AICTE. We have received several funding from AICTE. University has been selected as one of the top 50 institutions of the country under AICTE LITE program.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 17,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Quality Policy",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.indigoAccent,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "The Centre of Education, UEM Jaipur was established in the year 2012 by Ordinance 11 of 2011 and Act No 5 of 2012 of Govt of Rajasthan. Now UEM Jaipur is the leading state private university for Engineering, Management and Physiotherapy courses . University is NAAC accredited, AICTE approved, ISO certified and member of Association of Indian Universities, Association of commonwealth Universities UK and International Association of Universities France",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 17,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    SizedBox(height: 5),

                    Text(
                      "Core Values",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.indigoAccent,
                        fontSize: 20,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "• Competency\n• Commitment\n• Equity\n• Team work\n• Trust",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "66000+",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 20,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Printed journals, online publications in partnership with Pearson",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "15000+",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 20,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Graduated alumni since 1983",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "1500+",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 20,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Students residing on campus.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "2",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 20,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Printed journals, online publications in partnership with Pearson",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "10+",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 20,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Memorandums signed with various organizations.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Following UG Programs are Accredited by NBA Under Tier-1",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 20,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Mechanical Engineering \nElectrical & Electronics Engineering \nChemical Engineering \nComputer Science and Engineering\nElectronics and Communication Engineering \nCivil Engineering \nInformation Science and Engineering",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
