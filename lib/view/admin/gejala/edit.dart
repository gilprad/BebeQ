import 'package:bebeq/component/button.dart';
import 'package:bebeq/component/constant.dart';
import 'package:bebeq/component/form.dart';
import 'package:bebeq/component/responsive.dart';
import 'package:bebeq/component/teks.dart';
import 'package:bebeq/models/gejala.dart';
import 'package:bebeq/view/widget/toast.dart';
import 'package:bebeq/viewmodel/gejala.dart';
import 'package:flutter/material.dart';

class EditGejala extends StatefulWidget {
  final GejalaModel data;
  EditGejala({this.data});
  @override
  _EditGejalaState createState() => _EditGejalaState();
}

class _EditGejalaState extends State<EditGejala> {
  void updateData() async {
    if (name.text != null) {
      GejalaViewModels.updateDataGejala(widget.data.id, name.text)
          .then((value) {
        if (value == 'ok') {
          ShowAlert.show(msg: "Berhasil update gejala", type: 1);
          Navigator.pop(context);
          Navigator.pop(context);
        }
      });
    }
  }

  TextEditingController name;
  @override
  void initState() {
    name = new TextEditingController(text: widget.data.name);
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
          isi: "Edit Gejala",
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
                updateData();
              },
              child: Button(
                isiButton: "Update Gejala",
              ),
            )
          ],
        ),
      ),
    );
  }
}
