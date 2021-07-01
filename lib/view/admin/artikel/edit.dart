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

class EditArtikelScreen extends StatefulWidget {
  final Map data;
  EditArtikelScreen({this.data});
  @override
  _EditArtikelScreenState createState() => _EditArtikelScreenState();
}

class _EditArtikelScreenState extends State<EditArtikelScreen> {
  TextEditingController title;
  TextEditingController linkImg;
  TextEditingController value;

  void update() async {
    ArtikelViewModels.updateArtikel(
            title.text, linkImg.text, value.text, widget.data['id'])
        .then((value) {
      if (value == 'ok') {
        ShowAlert.show(msg: "Berhasil mengedit artikel", type: 1);
        print("Oke");
        Routes.changePage(context, HomeAdmin());
      } else {
        ShowAlert.show(msg: "Harap cek isi form kembali", type: 2);
      }
    });
  }

  void delete() async {
    ArtikelViewModels.deleteArtikel(widget.data['id']).then((value) {
      ShowAlert.show(msg: "Artikel dihapus", type: 2);
      Routes.changePage(context, HomeAdmin());
    });
  }

  @override
  void initState() {
    title = new TextEditingController(text: '${widget.data['title']}');
    linkImg = new TextEditingController(text: '${widget.data['link_img']}');
    value = new TextEditingController(text: '${widget.data['value']}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: buttonColor,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.black,
                ),
                onPressed: () {
                  delete();
                })
          ],
          title: Teks(isi: "Edit artikel", warna: textColor)),
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
                update();
              },
              child: Button(
                isiButton: "Edit Artikel",
              ),
            )
          ],
        ),
      ),
    );
  }
}
