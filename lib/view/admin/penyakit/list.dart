import 'package:bebeq/component/button.dart';
import 'package:bebeq/component/constant.dart';
import 'package:bebeq/component/form.dart';
import 'package:bebeq/component/responsive.dart';
import 'package:bebeq/component/routes.dart';
import 'package:bebeq/component/teks.dart';
import 'package:bebeq/view/admin/penyakit/add.dart';
import 'package:bebeq/view/admin/penyakit/edit.dart';
import 'package:bebeq/viewmodel/penyakit.dart';
import 'package:flutter/material.dart';

class ListPenyakit extends StatefulWidget {
  @override
  _ListPenyakitState createState() => _ListPenyakitState();
}

class _ListPenyakitState extends State<ListPenyakit> {
  TextEditingController cari = new TextEditingController();

  List constData = new List();
  List data = new List();
  List cariData = new List();

  void clear() async {
    setState(() {
      data = constData;
    });
  }

  void cariSkrg() async {
    List newData = new List();
    for (var x = 0; x < data.length; x++) {
      if (constData[x]['name'].toString().contains(cari.text)) {
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
    PenyakitViewModels.getPenyakit().then((value) {
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
          Routes.changePage(context, CreatePenyakit());
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
        title: Teks(
          isi: "List Penyakit",
          warna: textColor,
        ),
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
                        forms: "Cari penyakit",
                      ),
                    ),
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
                  warnaTeks: textColor,
                  warna: buttonColor,
                )),
            SizedBox(height: 30),
            Container(
              height: displayHeight(context) * 0.6,
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, i) {
                    return InkWell(
                      onTap: () {
                        Routes.changePage(
                            context,
                            EditDataPenyakit(
                              data: data[i],
                            ));
                      },
                      child: Card(
                        child: ListTile(
                          leading: Teks(isi: "${data[i]["name"]}"),
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
