import 'package:bebeq/component/button.dart';
import 'package:bebeq/component/constant.dart';
import 'package:bebeq/component/form.dart';
import 'package:bebeq/component/responsive.dart';
import 'package:bebeq/component/teks.dart';
import 'package:bebeq/view/widget/toast.dart';
import 'package:bebeq/viewmodel/gejala.dart';
import 'package:flutter/material.dart';

class CreateGejala extends StatefulWidget {
  @override
  _CreateGejalaState createState() => _CreateGejalaState();
}

class _CreateGejalaState extends State<CreateGejala> {
  void inputData() async {
    if (name.text != null) {
      GejalaViewModels.createGejala(name.text).then((value) {
        if (value == 'ok') {
          ShowAlert.show(msg: "Berhasil menambah gejala", type: 1);
          Navigator.pop(context);
        } else {
          ShowAlert.show(msg: "Harap isi nama gejala", type: 2);
        }
      });
    }
  }

  TextEditingController name = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: textColor),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: buttonColor,
        title: Teks(
          isi: "Tambah Gejala",
          warna: textColor,
        ),
      ),
      body: Container(
        height: displayHeight(context),
        width: displayWidth(context),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        child: ListView(
          children: [
            Forms(
              controller: name,
              forms: "Input nama gejala",
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                inputData();
              },
              child: Button(
                isiButton: "Input gejala",
              ),
            )
          ],
        ),
      ),
    );
  }
}
