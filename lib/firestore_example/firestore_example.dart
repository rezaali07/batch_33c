import 'package:cloud_firestore/cloud_firestore.dart';
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
              onPressed: () async {
                OverlayLoadingProgress.start();
                var data = {
                  "email": emailController.text,
                  "firstname": fnameController.text,
                  "lastname": lnameController.text,
                };
                await firestore
                    .collection('users')
                    .doc()
                    .set(data)
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
