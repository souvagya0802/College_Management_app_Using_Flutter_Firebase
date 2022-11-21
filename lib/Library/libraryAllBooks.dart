import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'bookDetails.dart';


class BookList extends StatefulWidget {
  const BookList({Key? key}) : super(key: key);

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  navigateToDetails(DocumentSnapshot post) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => BookDetails(post: post)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Books",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Library").snapshots(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                    child: Flex(
                  direction: Axis.vertical,
                  children: [
                    GridView.builder(
                        physics: const ScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data.docs.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 10),
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () =>
                                navigateToDetails(snapshot.data.docs[index]),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Stack(
                                children: [
                                  Container(
                                    height: 140,
                                    width: 200,
                                    child: Image.network(
                                      snapshot.data.docs[index]["ImageUrl"],
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    bottom: 0,
                                    child: Container(
                                      height: 45,
                                      width: 200,
                                      decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                        colors: [
                                          Colors.black,
                                          Colors.black,
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                      )),
                                    ),
                                  ),
                                  Positioned(
                                    left: 15,
                                    bottom: 5,
                                    child: Column(
                                      children: [
                                        Text(
                                          snapshot.data.docs[index]
                                              .get('Book Name'),
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "Book Available: " +
                                              snapshot.data.docs[index]
                                                  .get("Book No"),
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        })
                  ],
                )),
              );
            }
            return Container();
          }),
    );
  }
}
