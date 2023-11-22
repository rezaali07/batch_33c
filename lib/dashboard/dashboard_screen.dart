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
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 100,
                    child: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/download.jpeg")),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    height: 100,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Text(
                      "Softwarica college of IT & Ecommerce",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Icon(
                      Icons.check_circle,
                      color: Colors.blue,
                    )
                  ],
                ),
                Text("Private"),
                Text("Educational Institution"),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...List.generate(
                  50,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: const [
                        CircleAvatar(
                            radius: 40,
                            backgroundImage:
                                AssetImage("assets/images/download.jpeg")),
                        Text("story")
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GridView.count(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 3,
              children: [
                ...List.generate(



                  50,
                  (index) =>
                      Image.asset("assets/images/tree.jpeg", fit: BoxFit.cover),
                )
              ]),
        ],
      ),
    );
  }
}
