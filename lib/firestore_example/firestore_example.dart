import 'dart:io';

import 'package:batch33c/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:overlay_kit/overlay_kit.dart';

class FirestoreExample extends StatefulWidget {
  const FirestoreExample({super.key});
  static const String routeName = "/firestore";

  @override
  State<FirestoreExample> createState() => _FirestoreExampleState();
}

class _FirestoreExampleState extends State<FirestoreExample> {
  TextEditingController emailController = TextEditingController();
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool loading = false;

  ImagePicker picker = ImagePicker();
  FirebaseStorage storage = FirebaseStorage.instance;
  File? image;
  String? url;

  void pickImage(ImageSource source) async {
    var selected = await picker.pickImage(source: source, imageQuality: 100);
    if (selected == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("No image selected")));
    } else {
      setState(() {
        image = File(selected.path);
        saveToStorage();
      });
    }
  }

  void saveToStorage() async {
    String name = image!.path.split('/').last;

    final photo = await storage
        .ref()
        .child('users')
        .child(name)
        .putFile(File(image!.path));
    String tempUrl = await photo.ref.getDownloadURL();
    setState(() {
      url = tempUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Email"),
          TextFormField(controller: emailController),
          Text("Firstname"),
          TextFormField(controller: fnameController),
          Text("Lastname"),
          TextFormField(controller: lnameController),
          image == null
              ? SizedBox()
              : Image.file(
                  image!,
                  height: 200,
                  width: 200,
                ),
          ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Choose image"),
                    content: Container(
                      height: 200,
                      child: Row(
                        children: [
                          //camera ko image
                          Expanded(
                              child: InkWell(
                            onTap: () {
                              pickImage(ImageSource.camera);
                              Navigator.pop(context);
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/images/camera.jpg",
                                  height: 100,
                                  width: 100,
                                ),
                                Text("Camera"),
                              ],
                            ),
                          )),
                          //gallery ko image
                          Expanded(
                              child: InkWell(
                            onTap: () {
                              pickImage(ImageSource.gallery);
                              Navigator.pop(context);
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/images/gallery.jpg",
                                  height: 100,
                                  width: 100,
                                ),
                                Text("Gallery"),
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                );
              },
              child: Text("Browse image")),
          ElevatedButton(
              onPressed: () async {
                OverlayLoadingProgress.start();

                UserModel model = UserModel(
                    email: emailController.text,
                    lastname: lnameController.text,
                    firstname: fnameController.text,
                    image: url);
                await firestore
                    .collection('users')
                    .doc()
                    .set(model.toJson())
                    .then((value) {
                  clearData();
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("Data Submitted")));

                  OverlayLoadingProgress.stop();
                }).onError((error, stackTrace) {
                  OverlayLoadingProgress.stop();
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(error.toString())));
                });
              },
              child: Text("Submit"))
        ],
      ),
    );
  }

  void clearData() {
    emailController.clear();
    fnameController.clear();
    lnameController.clear();
  }
}
