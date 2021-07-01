import 'package:bebeq/component/routes.dart';
import 'package:bebeq/component/tabbar.dart';
import 'package:bebeq/view/peternak/home.dart';
import 'package:bebeq/view/peternak/perawatan.dart';
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  final int index;
  Navbar(this.index);
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                Routes.changePage(context, HomePage());
              },
              child: Icon(
                Icons.home,
                color: index == 0 ? Colors.blue : Colors.black,
              ),
            ),
            title: InkWell(
              onTap: () {
                Routes.changePage(context, HomePage());
              },
              child: Text(
                "Home",
                style: TextStyle(
                  color: index == 0 ? Colors.blue : Colors.black,
                ),
              ),
            )),
        BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                Routes.changePage(context, PerawatanPage());
              },
              child: Icon(
                Icons.medical_services,
                color: index == 1 ? Colors.blue : Colors.black,
              ),
            ),
            // onPressed: () {}),
            title: InkWell(
              onTap: () {
                Routes.changePage(context, PerawatanPage());
              },
              child: Text(
                "Perawatan",
                style: TextStyle(
                  color: index == 1 ? Colors.blue : Colors.black,
                ),
              ),
            )),
        BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {},
              child: Icon(
                Icons.monetization_on,
                color: index == 2 ? Colors.blue : Colors.black,
              ),
            ),
            // onPressed: () {}),
            title: InkWell(
              onTap: () {},
              child: Text(
                "Penjualan",
                style: TextStyle(
                  color: index == 2 ? Colors.blue : Colors.black,
                ),
              ),
            )),
        BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {},
              child: Icon(
                Icons.person,
                color: index == 3 ? Colors.blue : Colors.black,
              ),
            ),
            // onPressed: () {}),
            title: InkWell(
              onTap: () {},
              child: Text(
                "Profile",
                style: TextStyle(
                  color: index == 3 ? Colors.blue : Colors.black,
                ),
              ),
            )),
      ],
    );
  }
}
