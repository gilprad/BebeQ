import 'package:bebeq/component/bottom.dart';
import 'package:bebeq/component/constant.dart';
import 'package:bebeq/component/teks.dart';
import 'package:bebeq/view/peternak/kandang/list.dart';
import 'package:bebeq/view/peternak/penyakit.dart';
import 'package:flutter/material.dart';

class PerawatanPage extends StatefulWidget {
  @override
  _PerawatanPageState createState() => _PerawatanPageState();
}

class _PerawatanPageState extends State<PerawatanPage>
    with SingleTickerProviderStateMixin {
  //create controller untuk tabBar
  TabController controller;

  @override
  void initState() {
    controller = TabController(vsync: this, length: 2);
    //tambahkan SingleTickerProviderStateMikin pada class _HomeState
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: SizedBox(),
          backgroundColor: buttonColor,
          bottom: TabBar(
            controller: controller,
            indicatorColor: textColor,
            //source code lanjutan
            tabs: <Widget>[
              Tab(
                child: Teks(
                  isi: "Diagnosa Penyakit",
                  warna: textColor,
                ),
              ),
              Tab(
                child: Teks(
                  isi: "Petunjuk Pakan",
                  warna: textColor,
                ),
              ),
            ],
          ),
          title: Teks(
            isi: "Perawatan",
            warna: textColor,
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNav(1),
        body: TabBarView(
          controller: controller,
          children: [DeteksiPenyakit(), KandangPage()],
        ));
  }
}
