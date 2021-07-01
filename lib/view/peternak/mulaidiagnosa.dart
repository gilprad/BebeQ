import 'dart:ffi';

import 'package:bebeq/component/bottom.dart';
import 'package:bebeq/component/button.dart';
import 'package:bebeq/component/constant.dart';
import 'package:bebeq/component/responsive.dart';
import 'package:bebeq/component/routes.dart';
import 'package:bebeq/component/teks.dart';
import 'package:bebeq/models/gejala.dart';
import 'package:bebeq/view/peternak/hasildiagnosa.dart';
import 'package:bebeq/viewmodel/gejala.dart';
import 'package:flutter/material.dart';

enum option { iya, tidak }

class MulaiDiagnosa extends StatefulWidget {
  @override
  _MulaiDiagnosaState createState() => _MulaiDiagnosaState();
}

class _MulaiDiagnosaState extends State<MulaiDiagnosa> {
  var ans;
  String fixAnswer = '';
  List jawaban = new List();
  option _option = option.tidak;
  option _optionRef = option.tidak;
  List<GejalaModel> gejala = new List();

  int numGejala = 0;
  int maxNumGejala = 0;

  @override
  void initState() {
    GejalaViewModels.getKandang().then((value) {
      setState(() {
        gejala = value;
        maxNumGejala = value.length;
      });
    });
    super.initState();
  }

  Widget Kuis(index) {
    return Container(
      height: displayHeight(context) * 0.45,
      child: ListView(
        children: [
          Teks(
            isi: "Apakah bebek anda mengalami Gejala ${gejala[index].name} ?",
            size: 20,
          ),
          SizedBox(height: displayHeight(context) * 0.05),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio(
                value: option.iya,
                groupValue: _option,
                onChanged: (option value) {
                  setState(() {
                    _option = value;
                    ans = gejala[index].id;
                    if (!jawaban.contains(gejala[index].id)) {
                      jawaban.add(gejala[index].id);
                    }
                  });
                  print(ans);
                },
              ),
              Teks(
                isi: "Iya",
                size: 20,
              ),
              SizedBox(
                width: displayWidth(context) * 0.12,
              ),
              Radio(
                value: option.tidak,
                groupValue: _option,
                onChanged: (value) {
                  setState(() {
                    jawaban.remove(gejala[index].id);
                    _option = value;
                    ans = '';
                  });
                  print('tidak');
                },
              ),
              Teks(
                isi: "Tidak",
                size: 20,
              ),
            ],
          ),
          Column(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    if ((maxNumGejala - 1) != numGejala) {
                      numGejala = numGejala + 1;
                      _option = option.tidak;
                    } else {
                      for (var f = 0; f < jawaban.length; f++) {
                        setState(() {
                          fixAnswer += f == (jawaban.length - 1)
                              ? "${jawaban[f]}"
                              : "${jawaban[f]},";
                        });
                      }
                      print(jawaban.toString());
                      print(fixAnswer);
                      GejalaViewModels.getJawaban(fixAnswer.toString())
                          .then((value) {
                        if (value['status'] == 'ada') {
                          Routes.changePage(
                              context,
                              HasilDiagnosaPage(
                                res: value['penyakit'],
                                exists: true,
                              ));
                        } else {
                          Routes.changePage(
                              context,
                              HasilDiagnosaPage(
                                res: value,
                                exists: false,
                              ));
                        }
                      });
                    }
                  });
                },
                child: Button(
                  isiButton:
                      (maxNumGejala - 1) != numGejala ? "Selanjutnya" : "Selesai",
                ),
              ),
              if(numGejala!=0) ... [
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  setState(() {
                    if ((maxNumGejala - 1) != numGejala) {
                      numGejala = numGejala - 1;
                      _option = option.tidak;
                    }
                  });
                },
                child: Button(isiButton: "Kembali"),
              ),
              ]
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        backgroundColor: buttonColor,
        title: Teks(
          isi: "Diagnosa Penyakit",
          warna: textColor,
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: displayWidth(context) * 0.03,
            vertical: displayHeight(context) * 0.03),
        width: displayWidth(context),
        height: displayHeight(context),
        child: Column(
          children: [
            SizedBox(height: displayHeight(context) * 0.05),
            Teks(
              isi: "Jawab pertanyaan dibawah ini",
              size: 25,
              arah: TextAlign.start,
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Teks(
                  isi: "${numGejala + 1}/",
                  size: 20,
                ),
                Teks(isi: "${maxNumGejala}", size: 20)
              ],
            ),
            SizedBox(
              height: displayHeight(context) * 0.13,
            ),
            if (gejala != null || gejala.length != 0) ...[
              if (maxNumGejala != 0) ...[
                Kuis(numGejala),
              ],
            ],
          ],
        ),
      ),
    );
  }
}
