import 'package:bebeq/component/constant.dart';
import 'package:bebeq/component/responsive.dart';
import 'package:bebeq/component/routes.dart';
import 'package:bebeq/component/teks.dart';
import 'package:bebeq/view/admin/bottom.dart';
import 'package:bebeq/view/admin/gejala/add.dart';
import 'package:bebeq/view/admin/gejala/list.dart';
import 'package:bebeq/view/admin/penyakit/add.dart';
import 'package:bebeq/view/admin/penyakit/list.dart';
import 'package:flutter/material.dart';

class MenuPenyakit extends StatefulWidget {
  @override
  _MenuPenyakitState createState() => _MenuPenyakitState();
}

class _MenuPenyakitState extends State<MenuPenyakit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BotnavAdmin(2),
      appBar: AppBar(
        backgroundColor: buttonColor,
        centerTitle: true,
        leading: Container(),
        title: Teks(
          isi: "Menu Penyakit",
          warna: textColor,
        ),
      ),
      body: Container(
        height: displayHeight(context),
        width: displayWidth(context),
        child: ListView(
          children: [
            InkWell(
              onTap: () {
                Routes.changePage(context, CreatePenyakit());
              },
              child: Card(
                child: ListTile(
                  title: Teks(isi: "Tambahkan Data Penyakit"),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Routes.changePage(context, ListPenyakit());
              },
              child: Card(
                child: ListTile(
                  title: Teks(isi: "List Data Penyakit"),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Routes.changePage(context, CreateGejala());
              },
              child: Card(
                child: ListTile(
                  title: Teks(isi: "Tambahkan Data Gejala"),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Routes.changePage(context, ListGejala());
              },
              child: Card(
                child: ListTile(
                  title: Teks(isi: "List Data Gejala"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
