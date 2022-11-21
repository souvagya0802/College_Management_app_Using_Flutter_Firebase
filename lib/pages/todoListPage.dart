import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_manag/Models/todo.dart';
import 'package:data_manag/pages/todoEditPage.dart';
import 'package:data_manag/pages/todoaddPage.dart';
import 'package:data_manag/services/todo_firebase_crud.dart';
import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final Stream<QuerySnapshot> collectionReference = Firebasetodo.readDetails();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("ToDo List",style: TextStyle(letterSpacing: 1,fontWeight: FontWeight.bold,fontSize: 22),),
        backgroundColor: Theme.of(context).primaryColor,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.app_registration,
              color: Colors.white,
              size: 28,
            ),
            onPressed: () {
              Navigator.pushAndRemoveUntil<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => AddDescription(),
                ),
                    (route) =>
                false, //if you want to disable back feature set to false
              );
            },
          )
        ],
      ),
      body: StreamBuilder(
        stream: collectionReference,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return Padding(
              //padding: const EdgeInsets.only(top: 8.0),
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: snapshot.data!.docs.map((e) {
                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Column(children: [
                      ListTile(
                        title: Text(e["add_title"],style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(e['add_description'],
                                style: const TextStyle(fontSize: 20)),
                          ],
                        ),
                      ),

                      ButtonBar(
                        alignment: MainAxisAlignment.spaceBetween,
                        children:<Widget> [
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(5.0),
                              primary: const Color.fromARGB(255, 143, 133, 226),
                              textStyle: const TextStyle(fontSize: 20),
                            ),
                            child: const Text('Edit'),
                            onPressed: () {
                              Navigator.pushAndRemoveUntil<dynamic>(
                                context,
                                MaterialPageRoute<dynamic>(
                                  builder: (BuildContext context) => TodoEdit(
                                    todo: Todo(
                                        uid: e.id,
                                        title: e["add_title"],
                                        description: e["add_description"],
                                        ),

                                  ),
                                ),
                                    (route) =>
                                false, //if you want to disable back feature set to false
                              );
                            },
                          ),

                          TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(5.0),
                              primary: const Color.fromARGB(255, 143, 133, 226),
                              textStyle: const TextStyle(fontSize: 20),
                            ),
                            child: const Text('Delete'),
                            onPressed: () async {
                              var response =
                              await Firebasetodo.deleteDetails(id: e.id);
                              if (response.code != 200) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content:
                                        Text(response.message.toString()),
                                      );
                                    });
                              }
                            },
                          ),
                        ],
                      )
                    ]),
                  );
                }).toList(),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
