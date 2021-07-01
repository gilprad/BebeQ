import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  //create controller untuk tabBar
  TabController controller;

  @override
  void initState() {
    controller = TabController(vsync: this, length: 2);
    //tambahkan SingleTickerProviderStateMikin pada class _HomeState
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: Navbar(1),
      //create appBar
      appBar: AppBar(
        //warna background
        backgroundColor: Colors.lightGreen,
        //judul
        title: Text("Tampilan Home "),
        //bottom
        bottom: TabBar(
          controller: controller,
          //source code lanjutan
          tabs: <Widget>[
            Tab(
              text: "Email",
            ),
            Tab(
              text: "Music",
            ),
          ],
        ),
      ),
    );
  }
}
