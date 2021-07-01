import 'package:bebeq/component/constant.dart';
import 'package:bebeq/component/responsive.dart';
import 'package:bebeq/component/teks.dart';
import 'package:flutter/material.dart';

class DetailInfo extends StatefulWidget {
  final Map data;
  DetailInfo(this.data);
  @override
  _DetailInfoState createState() => _DetailInfoState();
}

class _DetailInfoState extends State<DetailInfo> {
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
          isi: "Kabar bebek",
          warna: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        width: displayWidth(context),
        height: displayHeight(context),
        padding: EdgeInsets.symmetric(
            horizontal: displayWidth(context) * 0.03,
            vertical: displayHeight(context) * 0.03),
        child: ListView(children: [
          Container(
            height: 250,
            width: displayWidth(context),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.data['link_img']))),
          ),
          Container(
            alignment: Alignment.center,
            child: Teks(
              isi: widget.data['title'],
              weight: FontWeight.w600,
              size: 22,
            ),
          ),
          Container(
              alignment: Alignment.center,
              child: Teks(
                isi: widget.data['value'],
                weight: FontWeight.w400,
                size: 18,
                line: 999,
                arah: TextAlign.justify,
              ))
        ]),
      ),
    );
  }
}
