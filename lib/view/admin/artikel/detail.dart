import 'package:bebeq/component/constant.dart';
import 'package:bebeq/component/responsive.dart';
import 'package:bebeq/component/routes.dart';
import 'package:bebeq/component/teks.dart';
import 'package:bebeq/view/admin/artikel/edit.dart';
import 'package:flutter/material.dart';

class DetailArtikelScreen extends StatefulWidget {
  final Map data;
  DetailArtikelScreen({this.data});
  @override
  _DetailArtikelScreenState createState() => _DetailArtikelScreenState();
}

class _DetailArtikelScreenState extends State<DetailArtikelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: buttonColor,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: textColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Teks(
          isi: "Detail Artikel",
          warna: textColor,
        ),
      ),
      body: Container(
        height: displayHeight(context),
        width: displayWidth(context),
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            Container(
              height: 250,
              width: displayWidth(context),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage('${widget.data['link_img']}'))),
            ),
            Container(
              alignment: Alignment.center,
              child: Teks(
                isi: '${widget.data['title']}',
                weight: FontWeight.w600,
                size: 22,
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Teks(
                isi: '${widget.data['value']}',
                weight: FontWeight.w400,
                size: 18,
                line: 999,
                arah: TextAlign.justify,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Routes.changePage(
              context,
              EditArtikelScreen(
                data: widget.data,
              ));
        },
        backgroundColor: buttonColor,
        child: Icon(Icons.edit, color: textColor),
      ),
    );
  }
}
