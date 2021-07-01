import 'package:bebeq/component/bottom.dart';
import 'package:bebeq/component/card.dart';
import 'package:bebeq/component/constant.dart';
import 'package:bebeq/component/responsive.dart';
import 'package:bebeq/component/routes.dart';
import 'package:bebeq/component/teks.dart';
import 'package:bebeq/view/peternak/detailinfo.dart';
import 'package:bebeq/viewmodel/artikel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List artikel = [];

  void getData() async {
    ArtikelViewModels.getArtikel().then((value) {
      setState(() {
        artikel = value;
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: buttonColor,
        leading: SizedBox(),
        title: Teks(
          isi: "Home",
          warna: textColor,
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNav(0),
      body: WillPopScope(
        onWillPop: () {},
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: displayWidth(context) * 0.03,
              vertical: displayHeight(context) * 0.03),
          width: displayWidth(context),
          child: ListView(
            children: [
              Teks(
                isi: "Kabar bebek",
                size: 25,
                weight: FontWeight.w500,
                arah: TextAlign.center,
              ),
              SizedBox(
                height: displayHeight(context) * 0.04,
              ),
              Container(
                height: displayHeight(context) * 0.75,
                width: displayWidth(context),
                child: ListView.builder(
                    itemCount: artikel.length,
                    itemBuilder: (context, i) {
                      var artikels = artikel[i];
                      return InkWell(
                        onTap: () {
                          Routes.changePage(context, DetailInfo(artikels));
                        },
                        child: Column(
                          children: [
                            Cardss(
                              image: artikels['link_img'],
                              title: artikels['title'],
                              content: artikels['value'],
                            ),
                            SizedBox(
                              height: 8,
                            )
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
