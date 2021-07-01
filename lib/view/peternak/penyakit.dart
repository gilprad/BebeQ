import 'package:bebeq/component/button.dart';
import 'package:bebeq/component/card.dart';
import 'package:bebeq/component/responsive.dart';
import 'package:bebeq/component/routes.dart';
import 'package:bebeq/component/teks.dart';
import 'package:bebeq/view/peternak/detailpenyakit.dart';
import 'package:bebeq/view/peternak/mulaidiagnosa.dart';
import 'package:bebeq/viewmodel/penyakit.dart';
import 'package:flutter/material.dart';

class DeteksiPenyakit extends StatefulWidget {
  @override
  DeteksiPenyakitState createState() => DeteksiPenyakitState();
}

class DeteksiPenyakitState extends State<DeteksiPenyakit> {
  List penyakit = [];

  void getData() async {
    PenyakitViewModels.getPenyakit().then((value) {
      setState(() {
        penyakit = value;
      });
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: displayWidth(context) * 0.03,
            vertical: displayHeight(context) * 0.03),
        width: displayWidth(context),
        child: ListView(
          children: [
            Teks(
              isi: "List Penyakit",
              size: 25,
              weight: FontWeight.w500,
              arah: TextAlign.left,
            ),
            SizedBox(
              height: displayHeight(context) * 0.04,
            ),
            Container(
              height: displayHeight(context) * 0.4,
              width: displayWidth(context),
              child: ListView.builder(
                  itemCount: penyakit.length,
                  itemBuilder: (context, i) {
                    var penyakits = penyakit[i];
                    return InkWell(
                      onTap: () {
                        Routes.changePage(context, DetailPenyakit(penyakits));
                      },
                      child: Card(
                        child: ListTile(
                          leading: Teks(
                            isi: penyakits['name'],
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: displayHeight(context) * 0.06,
            ),
            InkWell(
              onTap: () {
                Routes.changePage(context, MulaiDiagnosa());
              },
              child: Button(
                isiButton: "Mulai diagnosa",
              ),
            )
          ],
        ));
  }
}
