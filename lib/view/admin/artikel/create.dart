import 'package:bebeq/component/button.dart';
import 'package:bebeq/component/constant.dart';
import 'package:bebeq/component/form.dart';
import 'package:bebeq/component/responsive.dart';
import 'package:bebeq/component/routes.dart';
import 'package:bebeq/component/teks.dart';
import 'package:bebeq/view/admin/home.dart';
import 'package:bebeq/view/widget/toast.dart';
import 'package:bebeq/viewmodel/artikel.dart';
import 'package:flutter/material.dart';

class CreateArtikelScreen extends StatefulWidget {
  @override
  _CreateArtikelScreenState createState() => _CreateArtikelScreenState();
}

class _CreateArtikelScreenState extends State<CreateArtikelScreen> {
  TextEditingController title = new TextEditingController();
  TextEditingController linkImg = new TextEditingController();
  TextEditingController value = new TextEditingController();

  void store() async {
    ArtikelViewModels.storeArtikel(title.text, linkImg.text, value.text)
        .then((value) {
      if (value == 'ok') {
        ShowAlert.show(msg: "Berhasil membuat artikel", type: 1);
        print("ISO");
        Routes.changePage(context, HomeAdmin());
      } else {
        ShowAlert.show(msg: "Cek kembali isian form", type: 2);
      }
    });
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
          isi: "Tambah artikel",
          warna: textColor,
        ),
      ),
      body: Container(
        height: displayHeight(context),
        width: displayWidth(context),
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            Forms(
              controller: title,
              forms: "Input judul artikel",
            ),
            Forms(
              controller: linkImg,
              forms: "Input link image artikel",
            ),
            Forms(
              controller: value,
              forms: "Input isi artikel",
              line: 5,
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                store();
              },
              child: Button(
                isiButton: "Buat Artikel",
              ),
            )
          ],
        ),
      ),
    );
  }
}
