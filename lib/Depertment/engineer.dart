import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Engineer extends StatefulWidget {
  const Engineer({Key? key}) : super(key: key);

  @override
  State<Engineer> createState() => _EngineerState();
}

class _EngineerState extends State<Engineer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Engineering"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Colors.indigo[100],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      launch("https://uem.edu.in/uem-jaipur/department-of-cse/syllabus/");
                    },
                    child: Card(
                      color: Colors.indigo,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: const SizedBox(
                        width: double.infinity,
                        height: 70,
                        child: Center(
                            child: Text(
                              "Computer Science & Engineering",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      launch("https://uem.edu.in/uem-jaipur/department-of-mechanical-engineering/syllabus/");
                    },
                    child: Card(
                      color: Colors.indigo,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: const SizedBox(
                        width: double.infinity,
                        height: 70,
                        child: Center(
                            child: Text(
                              "Mechanical Engineering",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                        launch("https://uem.edu.in/uem-jaipur/department-of-ee/syllabus/");
                    },
                    child: Card(
                      color: Colors.indigo,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: const SizedBox(
                        width: double.infinity,
                        height: 70,
                        child: Center(
                            child: Text(
                              "Electrical Engineering",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      launch("https://uem.edu.in/uem-jaipur/department-of-ece/syllabus/");
                    },
                    child: Card(
                      color: Colors.indigo,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: const SizedBox(
                        width: double.infinity,
                        height: 70,
                        child: Center(
                            child: Text(
                              "Electronics Engineering",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      launch("https://uem.edu.in/uem-jaipur/department-of-civil-engineering/syllabus/");
                    },
                    child: Card(
                      color: Colors.indigo,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: const SizedBox(
                        width: double.infinity,
                        height: 70,
                        child: Center(
                            child: Text(
                              "Civil Engineering",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      launch("https://uem.edu.in/uem-jaipur/department-of-computer-applications/");
                    },
                    child: Card(
                      color: Colors.indigo,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: const SizedBox(
                        width: double.infinity,
                        height: 70,
                        child: Center(
                            child: Text(
                              "BCA",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      launch("https://uem.edu.in/uem-jaipur/department-of-basic-sciences/");
                    },
                    child: Card(
                      color: Colors.indigo,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: const SizedBox(
                        width: double.infinity,
                        height: 70,
                        child: Center(
                            child: Text(
                              "Applied Sciences & Humanities",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
