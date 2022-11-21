import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ImageZone extends StatefulWidget {
  const ImageZone({Key? key}) : super(key: key);

  @override
  State<ImageZone> createState() => ImageZoneState();
}

class ImageZoneState extends State<ImageZone> {
  FirebaseStorage storage = FirebaseStorage.instance;

  Future<void> uploadImage(String inputSource) async {
    final picker = ImagePicker();
    XFile? pickedImage;
    try {
      pickedImage = await picker.pickImage(
          source: inputSource == 'camera'
              ? ImageSource.camera
              : ImageSource.gallery,
          maxWidth: 1920);

      final String fileName = path.basename(pickedImage!.path);
      File imageFile = File(pickedImage.path);

      try {
        // Uploading the selected image with some custom meta data
        await storage.ref(fileName).putFile(
            imageFile,
            SettableMetadata(customMetadata: {
              'uploaded_by': 'A bad guy',
              'description': 'Some description...'
            }));

        // Refresh the UI
        setState(() {});
      } on FirebaseException catch (error) {
        if (kDebugMode) {
          print(error);
        }
      }
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
  }

  Future<List<Map<String, dynamic>>> loadImages() async {
    List<Map<String, dynamic>> files = [];

    final ListResult result = await storage.ref().list();
    final List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      final String fileUrl = await file.getDownloadURL();
      final FullMetadata fileMeta = await file.getMetadata();
      files.add({
        "url": fileUrl,
        "path": file.fullPath,
        "uploaded_by": fileMeta.customMetadata?['uploaded_by'] ?? 'Nobody',
        "description":
            fileMeta.customMetadata?['description'] ?? 'No description'
      });
    });

    return files;
  }

  Future<void> delete(String ref) async {
    await storage.ref(ref).delete();
    // Rebuild the UI
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Save Images'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                    onPressed: () => uploadImage('camera'),
                    icon: const Icon(
                      Icons.camera,
                    ),
                    label: const Text('camera')),
                ElevatedButton.icon(
                    onPressed: () => uploadImage('gallery'),
                    icon: const Icon(Icons.library_add),
                    label: const Text('Gallery')),
              ],
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: FutureBuilder(
                future: loadImages(),
                builder: (context,
                    AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        final Map<String, dynamic> image =
                            snapshot.data![index];

                        return InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              //color: Colors.grey[700],
                              border:
                                  Border.all(width: 2, color: Colors.black45),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                            ),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 100,
                                  //child: new Image.network(image['url'],),
                                  //dense: false,
                                  backgroundImage: NetworkImage(image['url']),
                                  // title: Text(image['uploaded_by']),
                                  // subtitle: Text(image['description']),
                                  // trailing: IconButton(
                                  //   onPressed: () => delete(image['path']),
                                  //   icon: const Icon(
                                  //     Icons.delete,
                                  //     color: Colors.red,
                                  //   ),
                                  // ),
                                ),
                                TextButton(
                                    onPressed: () => delete(image['path']),
                                    child: const Icon(
                                      Icons.delete,
                                      size: 40,
                                      color: Colors.red,
                                    ))
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
