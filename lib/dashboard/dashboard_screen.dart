import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          "Softwarica college",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.menu,
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  height: 150,
                  child: CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/images/download.jpeg")),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  height: 150,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [Text("31"), Text("Posts")],
                          ),
                          Column(
                            children: [Text("31"), Text("Posts")],
                          ),
                          Column(
                            children: [Text("31"), Text("Posts")],
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Expanded(
                              flex: 4,
                              child: OutlinedButton(
                                  onPressed: null, child: Text("Message"))),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              flex: 2,
                              child: OutlinedButton(
                                  onPressed: null,
                                  child: Icon(Icons.person_add_alt))),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              flex: 2,
                              child: OutlinedButton(
                                  onPressed: null,
                                  child: Icon(Icons.arrow_drop_down))),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
