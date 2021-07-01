import 'package:bebeq/component/button.dart';
import 'package:bebeq/component/constant.dart';
import 'package:bebeq/component/responsive.dart';
import 'package:bebeq/component/routes.dart';
import 'package:bebeq/component/teks.dart';
import 'package:bebeq/view/peternak/home.dart';
import 'package:flutter/material.dart';

class HasilDiagnosaPage extends StatefulWidget {
  final Map res;
  final bool exists;
  HasilDiagnosaPage({this.res, this.exists});
  @override
  _HasilDiagnosaPageState createState() => _HasilDiagnosaPageState();
}

class _HasilDiagnosaPageState extends State<HasilDiagnosaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: Navbar(1),
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: textColor),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: buttonColor,
        title: Teks(
          isi: "Hasil Diagnosa",
          size: 20,
          warna: Colors.black,
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.03),
        width: displayWidth(context),
        height: displayHeight(context),
        child: ListView(
          children: [
            SizedBox(height: 15),
            Teks(
              isi: widget.exists 
              ? "Berdasarkan diagnosa, bebek anda kemungkinan terkena: " 
              : "Gejala penyakit yg dimasukkan belum terdefinisi",
              size: 20,
              arah: TextAlign.center,
            ),
            if(widget.exists)...[
              SizedBox(height: 10),
              Teks(
                isi: "${widget.res['name']}",
                size: 24,
                weight: FontWeight.w600,
                arah: TextAlign.center,
              ),
            ],
            SizedBox(
              height: 15,
            ),
            Teks(
              isi: "Gejala yang dialami:",
              size: 18,
              weight: FontWeight.w400,
              arah: TextAlign.center,
            ),
            SizedBox(height: 10),
            // if(widget.exists)...[
              for (var f = 0; f < widget.res['gejala'].length; f++) ...[
                Card(
                  child: ListTile(
                    title: Teks(isi: '${widget.res['gejala'][f]['name']}'),
                    leading: Icon(Icons.circle),
                  ),
                ),
              ],
            // ],
            SizedBox(
              height: 15,
            ),
            Teks(
              isi: "Pencegahan atau solusinya adalah:",
              warna: textColor,
              size: 20,
              arah: TextAlign.center,
            ),
            SizedBox(
              height: 8,
            ),
            Center(
              child: Teks(
                isi: widget.exists ? widget.res['solusi'] : '-',
                size: 18,
                line: 99,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: () {
                Routes.changePage(context, HomePage());
              },
              child: Button(
                isiButton: "Selesai",
              ),
            )
          ],
        ),
      ),
    );
  }
}