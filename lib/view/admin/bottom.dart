import 'package:bebeq/component/constant.dart';
import 'package:bebeq/component/routes.dart';
import 'package:bebeq/component/teks.dart';
import 'package:bebeq/view/admin/home.dart';
import 'package:bebeq/view/admin/penyakit/menu.dart';
import 'package:bebeq/view/admin/peternak/peternak.dart';
import 'package:bebeq/component/profile/index.dart';
import 'package:flutter/material.dart';

class BotnavAdmin extends StatefulWidget {
  final int i;
  BotnavAdmin(this.i);
  @override
  _BotnavAdminState createState() => _BotnavAdminState();
}

class _BotnavAdminState extends State<BotnavAdmin> {
  final _listPage = <StatefulWidget>[
    HomeAdmin(),
    UserPeternak(),
    MenuPenyakit(),
    ProfilIndex(),
  ];
  // int selectedIndex = widget.i;
  void _navbarTapped(int index) {
    Routes.changePage(context, _listPage[index]);
    print(index);
  }

  @override
  Widget build(BuildContext context) {
    final _bottomNavbarItem = <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home), title: Teks(isi: "Home")),
      BottomNavigationBarItem(
          icon: Icon(Icons.supervisor_account), title: Teks(isi: "Peternak")),
      BottomNavigationBarItem(
          icon: Icon(Icons.medical_services), title: Teks(isi: "Penyakit")),
      BottomNavigationBarItem(
          icon: Icon(Icons.person), title: Teks(isi: "Info")),
    ];
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: _bottomNavbarItem,
      backgroundColor: buttonColor,
      currentIndex: widget.i,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      onTap: _navbarTapped,
    );
  }
}
