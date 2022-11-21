import 'package:data_manag/pages/todoaddPage.dart';
import 'package:data_manag/services/FirebaseImage.dart';
import 'package:data_manag/services/firebase_crud.dart';
import 'package:flutter/material.dart';
import 'listPage.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _employee_name = TextEditingController();
  final _employee_position = TextEditingController();
  final _employee_contact = TextEditingController();
  final _enrollmentno = TextEditingController();
  final _year = TextEditingController();


  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    
    final nameField = TextFormField(
        controller: _employee_name,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This Field is required';
          }
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Name",
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));
    final positionField = TextFormField(
        controller: _employee_position,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This Field is required';
          }
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Depertment",
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));
    final contactField = TextFormField(
        controller: _employee_contact,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This Field is required';
          }
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Contact Number",
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));
    final enrollField = TextFormField(
      controller: _enrollmentno,
      autofocus: false,
      validator: (value){
        if(value == null || value.trim().isEmpty){
          return 'This Field is required';
        }
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Enrollment Number",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
      ),
    );

    final yearField = TextFormField(
      controller: _year,
      autofocus: false,
      validator: (value){
        if(value == null || value.trim().isEmpty){
          return 'This Field is required';
        }
      },
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Year",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
      ),
    );



    final viewListbutton = TextButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ListPage()));
        },
        child: const Text("View List Of Students",style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.bold,
          fontSize: 15,
        )));

    final Savebutton = Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Theme.of(context).primaryColor,
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () async {
            if (_formkey.currentState!.validate()) {
              var response = await FirebaseCrud.addEmployee(
                  name: _employee_name.text,
                  position: _employee_position.text,
                  contactno: _employee_contact.text,
                  enrollmentno: _enrollmentno.text,
                  year: _year.text);
              if (response.code != 200) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text(response.message.toString()),
                      );
                    });
              } else {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text(response.message.toString()),
                      );
                    });
              }
              _employee_contact.clear();
              _employee_name.clear();
              _employee_position.clear();
              _enrollmentno.clear();
              _year.clear();
            }
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ListPage()));
          },
          child: Text(
            "Save",
            style: TextStyle(color: Theme.of(context).primaryColorLight,fontSize: 17),
            textAlign: TextAlign.center,
          ),
        ));

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Insert Details",style: TextStyle(letterSpacing: 1,fontWeight: FontWeight.bold,fontSize: 22),),
        backgroundColor: Colors.grey[800],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(

              key: _formkey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    //UploadType,
                    nameField,
                    const SizedBox(height: 25.0),
                    enrollField,
                    const SizedBox(height: 25.0),
                    positionField,
                    const SizedBox(height: 25.0),
                    contactField,
                    const SizedBox(height: 25.0),
                    yearField,
                    const SizedBox(height: 20.0),
                    viewListbutton,
                    const SizedBox(height: 35.0),
                    Savebutton,
                    const SizedBox(height: 15.0),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddDescription()));
        },
        backgroundColor: Colors.indigo,
        child: const Text("TODO",style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }

}
