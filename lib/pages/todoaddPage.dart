import 'package:data_manag/pages/todoListPage.dart';
import 'package:flutter/material.dart';

import '../services/FirebaseImage.dart';
import '../services/todo_firebase_crud.dart';
import 'listPage.dart';

class AddDescription extends StatefulWidget {
  const AddDescription({Key? key}) : super(key: key);

  @override
  State<AddDescription> createState() => _AddDescriptionState();
}

class _AddDescriptionState extends State<AddDescription> {
  final _employee_title = TextEditingController();
  final _employee_description = TextEditingController();

  final GlobalKey<FormState> _formkey =  GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final titleField = TextFormField(
        controller: _employee_title,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This Field is required';
          }
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15.0),
            hintText: "Title",
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));

    final descriptionField = TextFormField(
        controller: _employee_description,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This Field is required';
          }
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 40,horizontal: 10.0),
            hintText: "Description",
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));

    final viewListbutton1 = TextButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => TodoList()));
        },
        child: const Text("View List Of Todo",style: TextStyle(color: Colors.indigo),));

    final Savebutton1 = Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Theme.of(context).primaryColor,
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () async {
            if (_formkey.currentState!.validate()) {
              var response = await Firebasetodo.addDetails(
                  title: _employee_title.text,
                  description: _employee_description.text);
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
              _employee_title.clear();
              _employee_description.clear();
            }

            Navigator.of(context).push(MaterialPageRoute(builder: (context) => TodoList()));
          },
          child: Text(
            "Save",
            style: TextStyle(color: Theme.of(context).primaryColorLight),
            textAlign: TextAlign.center,
          ),
        ));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("ToDo",style: TextStyle(letterSpacing: 1,fontWeight: FontWeight.bold,fontSize: 22),),
        backgroundColor: Colors.grey[800],
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  titleField,
                  const SizedBox(height: 25.0),
                  descriptionField,
                  const SizedBox(height: 50.0),
                  viewListbutton1,
                  const SizedBox(height: 20.0),

                  Savebutton1,

                ],
              ),
            ),
          )
        ],
      ),

      floatingActionButton: FloatingActionButton(

        onPressed: () {
          // Add your onPressed code here!
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ImageZone()));
        },
        backgroundColor: Colors.indigo,
        child: const Icon(Icons.image,size: 30),
      ),
    );
  }
}
