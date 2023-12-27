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
  final TextEditingController emailEditController = TextEditingController();

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
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else if (snapshot.data!.snapshot.value == null) {
                    return const Text("No data available");
                  }
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
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    emailEditController.text =
                                        value[index]['email'].toString();
                                  });
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text("Edit data"),
                                      content: Container(
                                        height: 400,
                                        child: Column(
                                          children: [
                                            TextFormField(
                                                controller:
                                                    emailEditController),
                                            ElevatedButton(
                                                onPressed: () async {
                                                  var datas = {
                                                    "email":
                                                        emailEditController.text
                                                  };
                                                  await database
                                                      .ref()
                                                      .child('users')
                                                      .child(key[index])
                                                      .update(datas);
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text("Update")),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.green,
                                )),
                            IconButton(
                                onPressed: () async {
                                  await database
                                      .ref()
                                      .child('users')
                                      .child(key[index])
                                      .remove()
                                      .then((value) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text("Deleted")));
                                  }).onError((error, stackTrace) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(error.toString())));
                                  });
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),
                          ],
                        ),
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
                          .push()
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
