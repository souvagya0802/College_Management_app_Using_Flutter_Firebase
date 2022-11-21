import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BookDetails extends StatefulWidget {
  BookDetails({required this.post});

  final DocumentSnapshot post;

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  String BEmail = "";
  String BName = "";

  void _getData() async {
    User? user = await FirebaseAuth.instance.currentUser;
    var varii = await FirebaseFirestore.instance
        .collection("Students")
        .doc(user?.uid)
        .get();
    setState(() {
      BEmail = varii.data()!["Email"];
      BName = varii.data()!["Full Name"];
    });
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

  orderBook() async {
    await FirebaseFirestore.instance.collection(BEmail).doc().set({
      "OImage":widget.post["ImageUrl"],
      "OName": BName,
      "Ordertime":DateTime.now(),
      "OBook Name": widget.post["Book Name"],
      "OAuthor": widget.post["Author"],
      "OBook Location": widget.post["Book Location"]
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.post["Book Name"]),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Card(
          margin: EdgeInsets.all(7),
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(widget.post["ImageUrl"]),
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                color: Colors.black,
                height: 5,
                thickness: 3,
                indent: 25,
                endIndent: 25,
              ),
              const Padding(padding: EdgeInsets.all(8)),
              Text("Book Name: " + widget.post["Book Name"],
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black)),
              const SizedBox(
                height: 15,
              ),
              Text("Author Name: " + widget.post["Author"],
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black)),
              const SizedBox(
                height: 15,
              ),
              Text("Book Available: " + widget.post["Book No"],
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black)),
              const SizedBox(
                height: 15,
              ),
              Text("Book Location: " + widget.post["Book Location"],
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black)),
              const SizedBox(
                height: 50,
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
                       if (double.tryParse(widget.post["Book No"])!> 0) {
                       //FirebaseFirestore.instance.collection("Library").doc(widget.post.id).update({"Book No": FieldValue.increment(-1)});
                        orderBook();
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Successful",style: TextStyle(color: Colors.green),),
                                content: const Text("You have successfully order this book"),
                                actions: [
                                  TextButton(
                                    child: const Text("Ok"),
                                    onPressed: (){
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              );
                            });
                      }else{

                         showDialog(
                             context: context,
                             builder: (BuildContext context) {
                               return AlertDialog(
                                 title: const Text("Failed",style: TextStyle(color: Colors.red),),
                                 content: const Text("Book is not available"),
                                 actions: [
                                   TextButton(
                                     child: const Text("Ok"),
                                     onPressed: (){
                                       Navigator.of(context).pop();
                                     },
                                   )
                                 ],
                               );
                             });

                       }
                    },
                    child: const Text(
                      "Order",
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
