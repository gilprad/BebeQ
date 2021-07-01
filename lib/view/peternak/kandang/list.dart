import 'package:bebeq/component/constant.dart';
import 'package:bebeq/component/responsive.dart';
import 'package:bebeq/component/routes.dart';
import 'package:bebeq/component/teks.dart';
import 'package:bebeq/models/kandang.dart';
import 'package:bebeq/view/peternak/kandang/add.dart';
import 'package:bebeq/view/peternak/kandang/detail.dart';
import 'package:bebeq/viewmodel/kandang.dart';
import 'package:flutter/material.dart';

class KandangPage extends StatefulWidget {
  @override
  _KandangPageState createState() => _KandangPageState();
}

class _KandangPageState extends State<KandangPage> {
  List<KandangModel> kandang = new List();
  @override
  void initState() {
    KandangViewModels.getKandang().then((value) {
      setState(() {
        kandang = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: buttonColor,
          onPressed: () {
            Routes.changePage(context, AddKandang());
          },
          child: Icon(
            Icons.add,
            color: textColor,
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
              Container(
                height: displayHeight(context),
                width: displayWidth(context),
                child: ListView.builder(
                    itemCount: kandang == null ? 0 : kandang.length,
                    itemBuilder: (BuildContext context, int i) {
                      return InkWell(
                        onTap: () {
                          if (kandang != null) {
                            Routes.changePage(
                                context,
                                DetailKandang(
                                  modele: kandang[i],
                                ));
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1, color: Colors.black54)),
                          height: 85,
                          width: displayWidth(context),
                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: displayWidth(context) * 0.25,
                                    child: Teks(
                                      isi: kandang[i].user.name,
                                      weight: FontWeight.w600,
                                      size: 16,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: displayHeight(context),
                                width: 0.4,
                                color: Colors.black87,
                              ),
                              SizedBox(width: 10),
                              Container(
                                width: displayWidth(context) * 0.5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Teks(
                                      isi: kandang[i].name,
                                      weight: FontWeight.w600,
                                      size: 16,
                                    ),
                                    Teks(
                                      isi:
                                          '${kandang[i].currentCapacity} / ${kandang[i].capacity}',
                                      weight: FontWeight.w500,
                                      size: 14,
                                    ),
                                    Teks(
                                      isi: '${kandang[i].category.name}',
                                      weight: FontWeight.w500,
                                      size: 14,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ));
  }
}
