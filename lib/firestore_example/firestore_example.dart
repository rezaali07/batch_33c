import 'package:batch33c/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
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
                              child: Column(
                            children: [
                              Image.asset(
                                "assets/images/camera.jpg",
                                height: 100,
                                width: 100,
                              ),
                              Text("Camera"),
                            ],
                          )),
                          //gallery ko image
                          Expanded(
                              child: Column(
                            children: [
                              Image.asset(
                                "assets/images/gallery.jpg",
                                height: 100,
                                width: 100,
                              ),
                              Text("Gallery"),
                            ],
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
                    firstname: fnameController.text);
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
