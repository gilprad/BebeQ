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

class EditDataPenyakit extends StatefulWidget {
  final Map data;
  EditDataPenyakit({this.data});
  @override
  _EditDataPenyakitState createState() => _EditDataPenyakitState();
}

class _EditDataPenyakitState extends State<EditDataPenyakit> {
  TextEditingController name;
  TextEditingController solusi;

  List x = new List();
  List fixX = new List();
  List temporary = new List();
  List gejalaList = new List();

  void getData() {
    setState(() {
      x = widget.data['gejala'];
      fixX = widget.data['gejala'];
    });
    for (var r = 0; r < x.length; r++) {
      temporary.add(x[r]['id']);
    }
    print(x.toString());
  }

  void getDataGejalaAll() async {
    GejalaViewModels.getAllGejala().then((value) {
      setState(() {
        gejalaList = value;
      });
    });
  }

  @override
  void initState() {
    name = new TextEditingController(text: widget.data['name']);
    solusi = new TextEditingController(text: widget.data['solusi']);
    getData();
    getDataGejalaAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: buttonColor,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: textColor),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Teks(
          isi: "Detail Penyakit",
          warna: textColor,
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        height: displayHeight(context),
        width: displayWidth(context),
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            TextFormField(
              controller: name,
              decoration: InputDecoration(),
            ),
            TextFormField(
              controller: solusi,
              decoration: InputDecoration(),
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () {
                pressed();
              },
              child: Button(
                isiButton: "Tambah gejala lain",
              ),
            ),
            SizedBox(height: 10),
            for (var c = 0; c < x.length; c++) ...[
              // Visibility(
              //   visible: temporary.contains(x[c]['id']) ? true : false,
              //   child:
              // )
              if (temporary.contains(x[c]['id'])) ...[
                Card(
                  child: ListTile(
                      leading: Teks(isi: "${x[c]['name']}"),
                      trailing: IconButton(
                          icon: Icon(
                            Icons.remove,
                            color: Colors.blueAccent,
                          ),
                          onPressed: () {
                            setState(() {
                              temporary.remove(x[c]['id']);
                              temporary.sort();
                            });
                          })),
                ),
              ],
            ]
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: buttonColor,
        onPressed: () {
          print(temporary.toString());
          PenyakitViewModels.updatePenyakit(
            solusi.text,
            temporary.join(','),
            name.text,
            widget.data['id'],
          ).then((value) {
            if (value.contains('ok')) {
              print("SUKSES");
              ShowAlert.show(msg: "Berhasil update gejala", type: 1);
              Navigator.pop(context);
              Navigator.pop(context);
            } else {
              ShowAlert.show(msg: value, type: 2);
            }
          });
        },
        child: Icon(
          Icons.done,
          color: textColor,
        ),
      ),
    );
  }

  void pressed() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 300,
            child: ListView(
              children: [
                for (var g = 0; g < gejalaList.length; g++) ...[
                  if (!temporary.contains(gejalaList[g]['id'])) ...[
                    Card(
                      child: ListTile(
                        title: Teks(isi: "${gejalaList[g]['name']}"),
                        trailing: IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              if (!temporary.contains(gejalaList[g]['id'])) {
                                setState(() {
                                  temporary.add(gejalaList[g]['id']);
                                  // x.add(gejalaList[g]);
                                  temporary.sort();
                                });
                              }
                            }),
                      ),
                    ),
                  ]
                ],
              ],
            ),
          );
        });
  }
}
