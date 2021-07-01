import 'package:bebeq/component/bottom.dart';
import 'package:bebeq/component/constant.dart';
import 'package:bebeq/component/responsive.dart';
import 'package:bebeq/component/routes.dart';
import 'package:bebeq/component/teks.dart';
import 'package:bebeq/view/login.dart';
import 'package:bebeq/viewmodel/auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        centerTitle: true,
        title: Teks(
          isi: "Profile",
          warna: textColor,
        ),
        backgroundColor: buttonColor,
      ),
      bottomNavigationBar: BottomNav(2),
      body: Container(
        height: displayHeight(context),
        width: displayWidth(context),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                AuthenticateViewModels.logout().then((value) {
                  Routes.changePage(context, login());
                });
              },
              child: Card(
                child: ListTile(
                  title: Teks(isi: "Logout Disini"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
