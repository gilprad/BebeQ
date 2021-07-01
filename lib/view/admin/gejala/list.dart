import 'package:bebeq/component/button.dart';
import 'package:bebeq/component/constant.dart';
import 'package:bebeq/component/form.dart';
import 'package:bebeq/component/responsive.dart';
import 'package:bebeq/component/routes.dart';
import 'package:bebeq/component/teks.dart';
import 'package:bebeq/models/gejala.dart';
import 'package:bebeq/view/admin/gejala/add.dart';
import 'package:bebeq/view/admin/gejala/edit.dart';
import 'package:bebeq/viewmodel/gejala.dart';
import 'package:flutter/material.dart';

class ListGejala extends StatefulWidget {
  @override
  _ListGejalaState createState() => _ListGejalaState();
}

class _ListGejalaState extends State<ListGejala> {
  TextEditingController cari = new TextEditingController();

  List<GejalaModel> constData = new List();
  List<GejalaModel> data = new List();
  List<GejalaModel> cariData = new List();

  void clear() async {
    setState(() {
      data = constData;
    });
  }

  void cariSkrg() async {
    List<GejalaModel> newData = new List();
    for (var x = 0; x < data.length; x++) {
      if (constData[x].name.contains(cari.text)) {
        setState(() {
          newData.add(data[x]);
        });
      }
    }
    setState(() {
      data = newData;
    });
    print(data.toString());
  }

  void getData() async {
    GejalaViewModels.getKandang().then((value) {
      setState(() {
        constData = value;
        data = value;
      });
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: textColor,
        ),
        backgroundColor: buttonColor,
        onPressed: () {
          Routes.changePage(context, CreateGejala());
        },
      ),
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: textColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: buttonColor,
        // leading: Container(),
        title: Teks(isi: "List gejala", warna: textColor),
      ),
      body: Container(
        height: displayHeight(context),
        width: displayWidth(context),
        padding: EdgeInsets.all(10),
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
                          forms: "Cari Gejala",
                        )),
                    IconButton(
                        icon: Icon(Icons.cancel),
                        onPressed: () {
                          // cariSkrg();
                          clear();
                        })
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            InkWell(
              onTap: () {
                cariSkrg();
              },
              child: Button(
                isiButton: "Cari data",
              ),
            ),
            SizedBox(height: 30),
            Container(
              height: displayHeight(context) * 0.6,
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, i) {
                    return InkWell(
                      onTap: () {
                        Routes.changePage(context, EditGejala(data: data[i]));
                      },
                      child: Card(
                        child: ListTile(
                          leading: Teks(isi: "${data[i].name}"),
                          trailing: Icon(Icons.edit),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
