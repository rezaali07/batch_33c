import 'package:flutter/material.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});
static const String routeName = "/tab";
  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(

            tabs: [
              Tab(icon: Icon(Icons.add),text: "Active order",),
              Tab(icon: Icon(Icons.cancel),text: "Cancelled order",),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(child: Center(child: Text("Active order")),),
            Container(child: Center(child: Text("Cancelled order")),),
          ],
        )
      ),
    );
  }
}
