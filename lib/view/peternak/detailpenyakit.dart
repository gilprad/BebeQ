import 'package:bebeq/component/constant.dart';
import 'package:bebeq/component/responsive.dart';
import 'package:bebeq/component/teks.dart';
import 'package:flutter/material.dart';

class DetailPenyakit extends StatefulWidget {
  final Map data;
  DetailPenyakit(this.data);
  @override
  _DetailPenyakitState createState() => _DetailPenyakitState();
}

class _DetailPenyakitState extends State<DetailPenyakit> {
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
            isi: "List Penyakit",
            warna: textColor,
          )),
      body: Container(
        width: displayWidth(context),
        height: displayHeight(context),
        padding: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.03),
        child: ListView(
          children: [
            SizedBox(height: 10),
            Container(
              alignment: Alignment.center,
              child: Teks(
                isi: widget.data['name'],
                weight: FontWeight.w600,
                size: 22,
              ),
            ),
            SizedBox(height: 10),
            Teks(
              isi: "Pencegahan atau solusinya:",
              size: 20,
              arah: TextAlign.center,
              weight: FontWeight.w500,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                alignment: Alignment.center,
                child: Teks(
                  isi: widget.data['solusi'],
                  weight: FontWeight.w400,
                  size: 18,
                  line: 999,
                  arah: TextAlign.justify,
                ))
          ],
        ),
      ),
    );
  }
}
