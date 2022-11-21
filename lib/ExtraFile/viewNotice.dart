import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../PDF/FirstPdfPage.dart';
class ViewNoticePage extends StatefulWidget {
  const ViewNoticePage({Key? key}) : super(key: key);

  @override
  State<ViewNoticePage> createState() => _ViewNoticePageState();
}

class _ViewNoticePageState extends State<ViewNoticePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo,
        title: const Text('Notice'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Notice").snapshots(),
        builder:(context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasData){
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, i){
                  QueryDocumentSnapshot x = snapshot.data!.docs[i];
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewPage(url: x['fileUrl'])));
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                            margin: const EdgeInsets.symmetric(vertical: 20),
                            // child: Text(x["num"]),
                            padding: EdgeInsets.only(right: 10, top: 0),
                            child: Image.asset(
                              "assets/pdf.jpg",
                              width: 60,
                              height: 60,
                              fit: BoxFit.contain,
                            )
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  x["num"],
                                  style:const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 2),
                                  child: Text(
                                    x["fileUrl"],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                });
          }
          return const Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }
}
