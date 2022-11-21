//import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_manag/Library/libraryAllBooks.dart';
import 'package:path/path.dart' as path;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class LibraryPage extends StatefulWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  TextEditingController bookName = TextEditingController();
  TextEditingController authorName = TextEditingController();
  TextEditingController noBooks = TextEditingController();
  TextEditingController placeBooks = TextEditingController();

  ImagePicker image = ImagePicker();
  File? file;
  String url = "";

  getFile(String inputSource) async {
    var img = await image.pickImage(
      source:
          inputSource == 'Camera' ? ImageSource.camera : ImageSource.gallery,
    );
    setState(() {
      file = File(img!.path);
    });
  }

  uploadFile() async {
    String name = DateTime.now().millisecondsSinceEpoch.toString();
    var imageFile = FirebaseStorage.instance.ref().child("Path").child(name).child("/.jpg");
    UploadTask task = imageFile.putFile(file!);
    TaskSnapshot snapshot = await task;
    url = await snapshot.ref.getDownloadURL();

    await FirebaseFirestore.instance.collection("Library").doc().set({
      "ImageUrl": url,
      "Book Name": bookName.text,
      "Author": authorName.text,
      "Book No": noBooks.text,
      "Book Location": placeBooks.text
    });
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Book",
          style: TextStyle(fontSize: 20),
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>BookList()));},
                child: Icon(
                    Icons.grid_view_rounded
                ),
              )
          ),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Column(
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.grey,
                    backgroundImage: file == null
                        ? AssetImage("")
                        : FileImage(File(file!.path)) as ImageProvider,
                    // backgroundImage: NetworkImage(url) as ImageProvider,
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () => getFile("Camera"),
                      child: Text("Camera",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold,color: Colors.blue))),
                  SizedBox(width: 30),
                  InkWell(
                      onTap: () => getFile("Gallery"),
                      child: Text("Gallery",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold,color: Colors.blue)))
                ],
              ),
              const SizedBox(height: 10),
              Container(
                padding:
                    EdgeInsets.only(top: 10, bottom: 14, left: 15, right: 20),
                margin:
                    EdgeInsets.only(left: 20, bottom: 20, right: 15, top: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
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
                  controller: bookName,
                  //focusNode: _focusEmail,
                  obscureText: false,
                  textAlign: TextAlign.start,
                  decoration: const InputDecoration(
                    hintText: "Book Name",
                    icon: Icon(Icons.book),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Container(
                padding:
                    EdgeInsets.only(top: 10, bottom: 14, left: 15, right: 20),
                margin:
                    EdgeInsets.only(left: 20, bottom: 20, right: 15, top: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
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
                  controller: authorName,
                  //focusNode: _focusEmail,
                  obscureText: false,
                  textAlign: TextAlign.start,
                  decoration: const InputDecoration(
                    hintText: "Author",
                    icon: Icon(Icons.person),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Container(
                padding:
                    EdgeInsets.only(top: 10, bottom: 14, left: 15, right: 20),
                margin:
                    EdgeInsets.only(left: 20, bottom: 20, right: 15, top: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
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
                  controller: noBooks,
                  //focusNode: _focusEmail,
                  obscureText: false,
                  textAlign: TextAlign.start,
                  decoration: const InputDecoration(
                    hintText: "Number of Books",
                    icon: Icon(Icons.numbers),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Container(
                padding:
                    EdgeInsets.only(top: 10, bottom: 14, left: 15, right: 20),
                margin:
                    EdgeInsets.only(left: 20, bottom: 20, right: 15, top: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
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
                  controller: placeBooks,
                  //focusNode: _focusEmail,
                  obscureText: false,
                  textAlign: TextAlign.start,
                  decoration: const InputDecoration(
                    hintText: "Book Location",
                    icon: Icon(Icons.place),
                  ),
                ),
              ),
              SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      uploadFile();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>BookList()));
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(fontSize: 20),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
