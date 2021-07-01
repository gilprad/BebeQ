import 'package:bebeq/component/button.dart';
import 'package:bebeq/component/constant.dart';
import 'package:bebeq/component/form.dart';
import 'package:bebeq/component/responsive.dart';
import 'package:bebeq/component/teks.dart';
import 'package:bebeq/models/gejala.dart';
import 'package:bebeq/view/widget/toast.dart';
import 'package:bebeq/viewmodel/gejala.dart';
import 'package:bebeq/viewmodel/penyakit.dart';
import 'package:flutter/material.dart';

class CreatePenyakit extends StatefulWidget {
  @override
  _CreatePenyakitState createState() => _CreatePenyakitState();
}

class _CreatePenyakitState extends State<CreatePenyakit> {
  TextEditingController name = new TextEditingController();
  TextEditingController solusi = new TextEditingController();
  List<int> pilih = new List();
  var fixAnswer;
  List<GejalaModel> x = new List();
  void getData() {
    GejalaViewModels.getKandang().then((value) {
      setState(() {
        x = value;
      });
    });
  }

  @override
  void initState() {
    pilih.sort();
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          isi: "Tambah Data Penyakit",
          warna: textColor,
        ),
        centerTitle: true,
      ),
      body: Container(
        height: displayHeight(context),
        width: displayWidth(context),
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        child: ListView(
          children: [
            Forms(
              controller: name,
              forms: "Nama penyakit",
            ),
            Forms(
              controller: solusi,
              forms: "Solusi",
              line: 3,
            ),
            SizedBox(height: 30),
            InkWell(
                onTap: () {
                  String aux = pilih.join(',');
                  print(aux);
                },
                child: Teks(
                  isi: "Pilih Gejala (Scroll)",
                  weight: FontWeight.w600,
                )),
            SizedBox(height: 20),
            Container(
              // padding: EdgeInsets.only(bottom: 50),
              height: displayHeight(context) * 0.5,
              child: ListView.builder(
                  itemCount: x.length,
                  itemBuilder: (context, i) {
                    return Card(
                      child: ListTile(
                          title: Text("${x[i].name}"),
                          trailing: InkWell(
                            onTap: () {
                              if (!pilih.contains(x[i].id)) {
                                setState(() {
                                  pilih.add(x[i].id);
                                  pilih.sort();
                                });
                              } else if (pilih.contains(x[i].id)) {
                                setState(() {
                                  pilih.remove(x[i].id);
                                  pilih.sort();
                                });
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(pilih.contains(x[i].id) ? "-" : "+",
                                  style: TextStyle(
                                      color: pilih.contains(x[i].id)
                                          ? Colors.red
                                          : Colors.black,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 20)),
                            ),
                          )),
                    );
                  }),
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () {
                PenyakitViewModels.store(
                        pilih.join(','), name.text, solusi.text)
                    .then((value) {
                  if (value == 'ok') {
                    ShowAlert.show(msg: "Berhasil membuat penyakit", type: 1);
                    Navigator.pop(context);
                  } else {
                    ShowAlert.show(msg: value, type: 2);
                  }
                });
              },
              child: Button(isiButton: "Buat data"),
            )
          ],
        ),
      ),
    );
  }
}
