import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  String OBEmail = "";
  String OBName = "";

  void _getData() async {
    User? user = await FirebaseAuth.instance.currentUser;
    var vvarii = await FirebaseFirestore.instance
        .collection("Students")
        .doc(user?.uid)
        .get();
    setState(() {
      OBEmail = vvarii.data()!["Email"];
      OBName = vvarii.data()!["Full Name"];
    });
  }

  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Details",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection(OBEmail).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(2),
              child: ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.blue[50],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: ListTile(
                        //trailing: Icon(Icons.,color: Colors.red,),
                        leading: CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                              snapshot.data?.docs[index]["OImage"]),
                          //backgroundColor: Colors.indigo,
                        ),
                        title: Text(snapshot.data?.docs[index]["OBook Name"],
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        //subtitle: Text(snapshot.data?.docs[index]["OAuthor"]),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(height: 5),
                            Text(snapshot.data?.docs[index]["OAuthor"],
                                style: const TextStyle(fontSize: 17)),
                            Text(
                                "Order By " +
                                    snapshot.data?.docs[index]["OName"],
                                style: const TextStyle(fontSize: 17)),
                            Text(
                                "Order Date " +
                                    (snapshot.data?.docs[index]["Ordertime"]
                                            as Timestamp)
                                        .toDate()
                                        .toString(),
                                style: const TextStyle(fontSize: 17)),
                          ],
                        ),
                      ),
                    );
                  }),
            );
          }
          return Container();
        },
      ),
    );
  }
}
