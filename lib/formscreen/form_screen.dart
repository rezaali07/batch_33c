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

  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            children: [
              //futurebuilder
              //streambuilder
              StreamBuilder(
                stream: database.ref('users').onValue,
                builder: (context, snapshot) {
                  print(snapshot.data!.snapshot.value);
                  Map<dynamic, dynamic> _datas =
                      snapshot.data!.snapshot.value as dynamic;
                  List<dynamic> value = _datas.values.toList();
                  List<dynamic> key = _datas.keys.toList();
                  return ListView.builder(
                    itemCount: value.length,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(value[index]['email'].toString()),
                      );
                    },
                  );
                },
              ),
              TextFormField(
                  validator: (value) {
                    if (value == "") {
                      return "Enter fname";
                    }
                    return null;
                  },
                  controller: fname,
                  decoration: InputDecoration(label: Text("First name"))),
              TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == "") {
                      return "Enter lname";
                    }
                    return null;
                  },
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
              ElevatedButton(
                  onPressed: () async {
                    if (_key.currentState!.validate()) {
                      var datas = {
                        "firstName": fname.text,
                        "lastName": lname.text,
                        "contact": contact.text,
                        "address": address.text,
                        "email": email.text,
                      };
                      await database
                          .ref()
                          .child("users")
                          .child("1")
                          .set(datas)
                          .then((value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Success")));
                      }).onError((error, stackTrace) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(error.toString())));
                      });
                    }
                  },
                  child: Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }
}
