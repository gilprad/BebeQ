import 'package:bebeq/component/button.dart';
import 'package:bebeq/component/constant.dart';
import 'package:bebeq/component/responsive.dart';
import 'package:bebeq/component/routes.dart';
import 'package:bebeq/component/teks.dart';
import 'package:bebeq/models/kandang.dart';
import 'package:bebeq/view/peternak/kandang/add-current.dart';
import 'package:bebeq/view/peternak/kandang/edit.dart';
import 'package:bebeq/view/peternak/perawatan.dart';
import 'package:flutter/material.dart';

class DetailKandang extends StatefulWidget {
  final KandangModel modele;
  DetailKandang({this.modele});
  @override
  _DetailKandangState createState() => _DetailKandangState();
}

class _DetailKandangState extends State<DetailKandang> {
  @override
  Widget build(BuildContext context) {
    var x = (widget.modele.category.berat * widget.modele.currentCapacity);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: buttonColor,
        child: Icon(
          Icons.edit,
          color: textColor,
        ),
        onPressed: () {
          Routes.changePage(context, EditKandang(modele: widget.modele));
        },
      ),
      appBar: AppBar(
        backgroundColor: buttonColor,
        leading: IconButton(
          onPressed: () {
            Routes.changePage(context, PerawatanPage());
          },
          icon: Icon(
            Icons.arrow_back_sharp,
            color: textColor,
          ),
        ),
        title: Teks(
          isi: "Detail Kandang",
          warna: textColor,
          size: 20,
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: displayWidth(context) * 0.07,
          vertical: 25,
        ),
        height: displayHeight(context),
        width: displayWidth(context),
        child: ListView(
          children: [
            Teks(
              isi: 'Info Kandang',
              size: 18,
              weight: FontWeight.w600,
            ),
            Container(
              width: displayWidth(context),
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  conf('Nama Kandang', widget.modele.name),
                  conf('Isi Kandang', widget.modele.currentCapacity.toString()),
                  conf('Kapasitas ', widget.modele.capacity.toString()),
                  conf('Kategori ', widget.modele.category.name),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            // widget.modele.category.berat
            Teks(
              isi: 'Info Pemilik',
              size: 18,
              weight: FontWeight.w600,
            ),
            Container(
              width: displayWidth(context),
              child: Column(
                children: [
                  SizedBox(height: 25),
                  conf('Pemilik', widget.modele.user.name),
                  conf('Sebagai', widget.modele.user.role),
                  conf('Email ', widget.modele.user.email),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Teks(
              isi: 'Info Pakan',
              size: 18,
              weight: FontWeight.w600,
            ),
            Container(
              width: displayWidth(context),
              child: Column(
                children: [
                  SizedBox(height: 25),
                  conf('Berat (gram)', '${x}gr untuk 2x makan dalam 1 hari'),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Teks(
              isi: 'Riwayat Aktivitas Kandang',
              size: 18,
              weight: FontWeight.w600,
            ),
            SizedBox(
              height: 25,
            ),
            for (var f = 0; f < widget.modele.history.length; f++) ...[
              conf(widget.modele.history[f].status,
                  "${widget.modele.history[f].num} Ekor Bebek ${widget.modele.history[f].value}"),
            ],
            SizedBox(
              height: 25,
            ),
            InkWell(
                onTap: () {
                  Routes.changePage(
                      context,
                      AddCurrentStock(
                        modele: widget.modele,
                      ));
                },
                child: Button(
                  isiButton: "Kelola isi kandang",
                  warna: Colors.blue,
                  warnaTeks: Colors.white,
                )),
          ],
        ),
      ),
    );
  }

  Widget conf(String left, String right) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            width: displayWidth(context) * 0.35,
            child: Teks(
              isi: '${left}',
              size: 14,
              weight: FontWeight.w400,
            ),
          ),
          Container(
            width: displayWidth(context) * 0.4,
            child: Teks(
              isi: "${right}",
              size: 14,
              weight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
