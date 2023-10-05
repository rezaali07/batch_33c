import 'package:flutter/material.dart';

void main() {
  runApp(RootScreen());
}

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.red)),
      debugShowCheckedModeBanner: false,
      home: DemoScreen(),
    );
  }
}

class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key});

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            actions: const [
              Icon(Icons.share),
              Padding(
                padding: EdgeInsets.only(right: 20, left: 20),
                child: Icon(Icons.favorite_border),
              )
            ],
            leading: const Icon(Icons.menu),
            title: const Text("My Flutter App"),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [

                Image.asset("assets/images/download.jpeg"),
                Container(
                  height: 100,
                  width: 100,
                  child: Center(
                    child: Text("Flutter",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(25),
                      )),
                ),
                Image.network("https://seeklogo.com/images/F/flutter-logo-5086DD11C5-seeklogo.com.png"),
                Image.network("https://seeklogo.com/images/F/flutter-logo-5086DD11C5-seeklogo.com.png"),
                Image.network("https://seeklogo.com/images/F/flutter-logo-5086DD11C5-seeklogo.com.png"),
                Image.network("https://seeklogo.com/images/F/flutter-logo-5086DD11C5-seeklogo.com.png"),
                Image.network("https://seeklogo.com/images/F/flutter-logo-5086DD11C5-seeklogo.com.png"),
                Image.network("https://seeklogo.com/images/F/flutter-logo-5086DD11C5-seeklogo.com.png"),
                Image.network("https://seeklogo.com/images/F/flutter-logo-5086DD11C5-seeklogo.com.png"),
                Image.network("https://seeklogo.com/images/F/flutter-logo-5086DD11C5-seeklogo.com.png"),
                Image.network("https://seeklogo.com/images/F/flutter-logo-5086DD11C5-seeklogo.com.png"),
                Image.network("https://seeklogo.com/images/F/flutter-logo-5086DD11C5-seeklogo.com.png"),
                Image.network("https://seeklogo.com/images/F/flutter-logo-5086DD11C5-seeklogo.com.png"),
                Image.network("https://seeklogo.com/images/F/flutter-logo-5086DD11C5-seeklogo.com.png"),
                Image.network("https://seeklogo.com/images/F/flutter-logo-5086DD11C5-seeklogo.com.png"),
                Image.network("https://seeklogo.com/images/F/flutter-logo-5086DD11C5-seeklogo.com.png"),
                Image.network("https://seeklogo.com/images/F/flutter-logo-5086DD11C5-seeklogo.com.png"),
                Image.network("https://seeklogo.com/images/F/flutter-logo-5086DD11C5-seeklogo.com.png"),
                Image.network("https://seeklogo.com/images/F/flutter-logo-5086DD11C5-seeklogo.com.png"),
                Image.network("https://seeklogo.com/images/F/flutter-logo-5086DD11C5-seeklogo.com.png"),
                Image.network("https://seeklogo.com/images/F/flutter-logo-5086DD11C5-seeklogo.com.png"),
                Image.network("https://seeklogo.com/images/F/flutter-logo-5086DD11C5-seeklogo.com.png"),
                Image.network("https://seeklogo.com/images/F/flutter-logo-5086DD11C5-seeklogo.com.png"),
                Image.network("https://seeklogo.com/images/F/flutter-logo-5086DD11C5-seeklogo.com.png"),
                Image.network("https://seeklogo.com/images/F/flutter-logo-5086DD11C5-seeklogo.com.png"),
                Image.network("https://seeklogo.com/images/F/flutter-logo-5086DD11C5-seeklogo.com.png"),
                Image.network("https://seeklogo.com/images/F/flutter-logo-5086DD11C5-seeklogo.com.png"),
                Image.network("https://seeklogo.com/images/F/flutter-logo-5086DD11C5-seeklogo.com.png"),
              ],
            ),
          )),
    );
  }
}
