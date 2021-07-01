import 'package:bebeq/component/bottom.dart';
import 'package:bebeq/component/constant.dart';
import 'package:bebeq/component/routes.dart';
import 'package:bebeq/component/teks.dart';
import 'package:bebeq/view/admin/bottom.dart';
import 'package:bebeq/view/login.dart';
import 'package:bebeq/component/profile/change-info.dart';
import 'package:bebeq/component/profile/change-pass.dart';
import 'package:bebeq/viewmodel/auth.dart';
import 'package:flutter/material.dart';

class ProfilIndex extends StatefulWidget {
  @override
  _ProfilIndexState createState() => _ProfilIndexState();
}

class _ProfilIndexState extends State<ProfilIndex> {
  Map data = new Map();
  String roles;
  void getInfo() async {
    var role = await AuthenticateViewModels.getRole();
    AuthenticateViewModels.getInfo().then((value) {
      setState(() {
        roles = role;
        data = value;
      });
    });
  }

  @override
  void initState() {
    getInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {},
      child: Scaffold(
        bottomNavigationBar: roles == 'admin' ? BotnavAdmin(3) : BottomNav(2),
        appBar: AppBar(
          backgroundColor: buttonColor,
          leading: Container(),
          centerTitle: true,
          title: Teks(
            isi: "Profile",
            warna: textColor,
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          child: ListView(
            children: [
              Teks(
                isi: data == null ? 'Memuat' : data['name'],
                size: 26,
                arah: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  if (data != null) {
                    Routes.changePage(context, ChangeInfo(data));
                  }
                },
                child: buildCard("Edit Data Diri"),
              ),
              InkWell(
                onTap: () {
                  Routes.changePage(context, ChangePass());
                },
                child: buildCard("Edit Password"),
              ),
              SizedBox(
                height: 320,
              ),
              InkWell(
                onTap: () {
                  AuthenticateViewModels.logout().then((value) {
                    Routes.changePage(context, login());
                  });
                },
                child: Card(
                  color: Colors.red,
                  child: ListTile(
                    title: Teks(
                      isi: "Logout Disini",
                      warna: Colors.white,
                      arah: TextAlign.center,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  buildCard(String teks) {
    return Card(
      child: ListTile(
        title: Text(teks),
      ),
    );
  }
}
