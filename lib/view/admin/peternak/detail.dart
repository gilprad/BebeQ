import 'package:bebeq/component/button.dart';
import 'package:bebeq/component/constant.dart';
import 'package:bebeq/component/form.dart';
import 'package:bebeq/component/responsive.dart';
import 'package:bebeq/component/teks.dart';
import 'package:bebeq/models/gejala.dart';
import 'package:bebeq/viewmodel/gejala.dart';
import 'package:flutter/material.dart';

class DetailPeternak extends StatefulWidget {
  final Map data;
  DetailPeternak({this.data});
  @override
  _DetailPeternakState createState() => _DetailPeternakState();
}

class _DetailPeternakState extends State<DetailPeternak> {
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
          isi: "Detail info peternak",
          warna: textColor,
        ),
      ),
      body: Container(
        height: displayHeight(context),
        width: displayWidth(context),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        child: ListView(
          children: [
            Teks(isi: "Nama Pemilik : ${widget.data['name']}"),
            Teks(isi: "Email Pemilik : ${widget.data['email']}"),
            SizedBox(
              height: 10,
            ),
            for (var f = 0; f < widget.data['cage'].length; f++) ...[
              Card(
                child: ListTile(
                  title: Teks(isi: "${widget.data['cage'][f]['name']}"),
                ),
              )
            ],
          ],
        ),
      ),
    );
  }
}
