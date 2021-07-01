import 'package:bebeq/component/button.dart';
import 'package:bebeq/component/constant.dart';
import 'package:bebeq/component/form.dart';
import 'package:bebeq/component/responsive.dart';
import 'package:bebeq/component/routes.dart';
import 'package:bebeq/component/teks.dart';
import 'package:bebeq/view/admin/artikel/create.dart';
import 'package:bebeq/view/admin/artikel/detail.dart';
import 'package:bebeq/view/admin/bottom.dart';
import 'package:bebeq/view/widget/toast.dart';
import 'package:bebeq/viewmodel/artikel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeAdmin extends StatefulWidget {
  @override
  _HomeAdminState createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  List constData = new List();
  List data = new List();
  void getData() async {
    ArtikelViewModels.getArtikel().then((value) {
      setState(() {
        constData = value;
        data = value;
      });
    });
  }

  void clearData() {
    setState(() {
      data = constData;
    });
  }

  void cariData() {
    List pencarian = new List();
    for (var a = 0; a < data.length; a++) {
      if (constData[a]['title'].contains(cari.text)) {
        setState(() {
          pencarian.add(data[a]);
        });
      }
    }
    setState(() {
      data = pencarian;
    });
  }

  TextEditingController cari = new TextEditingController();

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BotnavAdmin(0),
      appBar: AppBar(
        backgroundColor: buttonColor,
        leading: Container(),
        title: Teks(
          isi: "Home",
          size: 20,
          warna: textColor,
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        height: displayHeight(context),
        width: displayWidth(context),
        child: ListView(
          children: [
            Card(
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: displayWidth(context) * 0.5,
                        child: Forms(
                          controller: cari,
                          forms: "Cari artikel",
                        )),
                    IconButton(
                        icon: Icon(Icons.cancel),
                        onPressed: () {
                          clearData();
                        })
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            InkWell(
              onTap: () {
                cariData();
              },
              child: Button(
                isiButton: "Cari data",
              ),
            ),
            SizedBox(height: 30),
            Container(
              height: displayHeight(context),
              width: displayWidth(context),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, i) {
                    return InkWell(
                      onTap: () {
                        Routes.changePage(
                            context,
                            DetailArtikelScreen(
                              data: data[i],
                            ));
                      },
                      child: Card(
                        child: ListTile(
                          title: Teks(isi: "${data[i]['title']}"),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: buttonColor,
        child: Icon(Icons.add, color: Colors.black),
        onPressed: () {
          Routes.changePage(context, CreateArtikelScreen());
          // ShowAlert.show(msg: 'Anjay', type: 1);
        },
      ),
    );
  }
}
