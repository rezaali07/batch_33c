import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});
  static const String routeName = "/form";
  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final TextEditingController fname = TextEditingController();
  final TextEditingController lname = TextEditingController();
  final TextEditingController contact = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController email = TextEditingController();

  final database = FirebaseDatabase.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextFormField(
              controller: fname,
              decoration: InputDecoration(label: Text("First name"))),
          TextFormField(
              controller: lname,
              decoration: InputDecoration(label: Text("Last name"))),
          TextFormField(
              controller: contact,
              decoration: InputDecoration(label: Text("Contact"))),
          TextFormField(
              controller: address,
              decoration: InputDecoration(label: Text("Address"))),
          TextFormField(
              controller: email,
              decoration: InputDecoration(label: Text("Email"))),

        ElevatedButton(onPressed: (){

        }, child: Text("Submit"))
        ],
      ),
    );
  }
}
