import 'package:bebeq/component/constant.dart';
import 'package:bebeq/component/routes.dart';
import 'package:bebeq/component/teks.dart';
import 'package:bebeq/view/peternak/home.dart';
import 'package:bebeq/view/peternak/perawatan.dart';
import 'package:bebeq/component/profile/index.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  final int i;
  BottomNav(this.i);
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final _listPage = <StatefulWidget>[
    HomePage(),
    PerawatanPage(),
    ProfilIndex(),
  ];
  // int selectedIndex = widget.i;
  void _navbarTapped(int index) {
    Routes.changePage(context, _listPage[index]);
  }

  @override
  Widget build(BuildContext context) {
    final _bottomNavbarItem = <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home), title: Teks(isi: "Home")),
      BottomNavigationBarItem(
          icon: Icon(Icons.medical_services), title: Teks(isi: "Perawatan")),
      BottomNavigationBarItem(
          icon: Icon(Icons.person), title: Teks(isi: "Info")),
    ];
    return BottomNavigationBar(
      backgroundColor: buttonColor,
      items: _bottomNavbarItem,
      currentIndex: widget.i,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      onTap: _navbarTapped,
    );
  }
}
