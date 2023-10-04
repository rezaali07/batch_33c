import 'package:flutter/material.dart';

void main() {
  runApp(RootScreen());
}

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.red)
      ),
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
          actions: [
            Icon(Icons.share),
            Padding(
              padding: const EdgeInsets.only(right: 20,left: 20),
              child: Icon(Icons.favorite_border),
            )
          ],
          leading: Icon(Icons.menu),
          title: Text("My Flutter App"),
        ),
      ),
    );
  }
}
