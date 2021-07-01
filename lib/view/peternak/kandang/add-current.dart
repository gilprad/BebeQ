import 'package:bebeq/component/button.dart';
import 'package:bebeq/component/constant.dart';
import 'package:bebeq/component/form.dart';
import 'package:bebeq/component/responsive.dart';
import 'package:bebeq/component/routes.dart';
import 'package:bebeq/component/teks.dart';
import 'package:bebeq/models/kandang.dart';
import 'package:bebeq/view/peternak/kandang/detail.dart';
import 'package:bebeq/view/widget/toast.dart';
import 'package:bebeq/viewmodel/kandang.dart';
import 'package:flutter/material.dart';

class AddCurrentStock extends StatefulWidget {
  final KandangModel modele;
  AddCurrentStock({this.modele});
  @override
  _AddCurrentStockState createState() => _AddCurrentStockState();
}

class _AddCurrentStockState extends State<AddCurrentStock> {
  TextEditingController jmlh = new TextEditingController();
  TextEditingController ket = new TextEditingController();
  String decission = 'penambahan';
  void addStock(id) {
    KandangViewModels.addCapacity(
            id, "${int.parse(jmlh.text)}", ket.text, decission)
        .then((value) {
      if (value == 'bisa') {
        ShowAlert.show(msg: "Berhasil mengelola kandang", type: 1);
        setState(() {
          Navigator.pop(context);
          Navigator.pop(context);
        });
      }else{
        ShowAlert.show(msg: value, type: 2);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: buttonColor,
        leading: IconButton(
          onPressed: () {
            Routes.changePage(
                context,
                DetailKandang(
                  modele: widget.modele,
                ));
          },
          icon: Icon(Icons.arrow_back_sharp),
          color: textColor,
        ),
        title: Teks(
          isi: 'Kelola Isi Kandang',
          warna: textColor,
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: displayWidth(context) * 0.07, vertical: 25),
        child: Column(
          children: [
            Container(
              width: displayWidth(context),
              child: Teks(
                arah: TextAlign.center,
                isi: 'Kelola Isi Kandang Untuk ${widget.modele.name}',
                size: 18,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      decission = 'penambahan';
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1,
                            color: decission == 'penambahan'
                                ? Colors.white
                                : Colors.blue),
                        color: decission == 'penambahan'
                            ? Colors.blue
                            : Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    height: 40,
                    width: displayWidth(context) * 0.35,
                    alignment: Alignment.center,
                    child: Text("Penambahan",
                        style: TextStyle(
                            color: decission == 'penambahan'
                                ? Colors.white
                                : Colors.blue,
                            fontSize: 18)),
                  ),
                ),
                SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    setState(() {
                      decission = 'pengurangan';
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1,
                            color: decission == 'pengurangan'
                                ? Colors.white
                                : Colors.blue),
                        color: decission == 'pengurangan'
                            ? Colors.blue
                            : Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    height: 40,
                    width: displayWidth(context) * 0.35,
                    alignment: Alignment.center,
                    child: Text("Pengurangan",
                        style: TextStyle(
                            color: decission == 'pengurangan'
                                ? Colors.white
                                : Colors.blue,
                            fontSize: 18)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              width: displayWidth(context) * 0.7,
              child: Forms(
                controller: jmlh,
                forms: "Masukkan Jumlah",
                type: TextInputType.number,
              ),
            ),
            SizedBox(height: 10),
            Container(
              alignment: Alignment.center,
              width: displayWidth(context) * 0.7,
              child: Forms(controller: ket, forms: "Keterangan"),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                if(int.parse(jmlh.text) < 1){
                  ShowAlert.show(msg: "Jumlah tidak boleh kurang dari 1 !", type: 2);
                }else{
                  addStock(widget.modele.id);
                }
              },
              child: Button(
                isiButton: "Kelola",
              ),
            )
          ],
        ),
      ),
    );
  }
}
