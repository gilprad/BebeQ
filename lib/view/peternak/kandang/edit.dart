import 'package:bebeq/component/button.dart';
import 'package:bebeq/component/constant.dart';
import 'package:bebeq/component/form.dart';
import 'package:bebeq/component/responsive.dart';
import 'package:bebeq/component/routes.dart';
import 'package:bebeq/component/teks.dart';
import 'package:bebeq/models/kandang.dart';
import 'package:bebeq/view/peternak/perawatan.dart';
import 'package:bebeq/view/widget/toast.dart';
import 'package:bebeq/viewmodel/kandang.dart';
import 'package:flutter/material.dart';

class EditKandang extends StatefulWidget {
  final KandangModel modele;
  EditKandang({this.modele});
  @override
  _EditKandangState createState() => _EditKandangState();
}

class _EditKandangState extends State<EditKandang> {
  TextEditingController name;
  TextEditingController current;
  TextEditingController capacity;
  var _valCategory;
  var fixValCat;
  List _listCategory = new List();

  @override
  void initState() {
    fixValCat = "${widget.modele.category.id}";
    name = new TextEditingController(text: "${widget.modele.name}");
    current =
        new TextEditingController(text: "${widget.modele.currentCapacity}");
    capacity = new TextEditingController(text: "${widget.modele.capacity}");
    KandangViewModels.getCategory().then((f) {
      setState(() {
        _listCategory = f;
      });
    });
    super.initState();
  }

  void addData() {
    if(int.parse(current.text) < 1 || int.parse(capacity.text) < 1){
      ShowAlert.show(msg: "Perhatikan inputan angka, anda tidak dapat menginputkan value kurang dari 1", type: 2);
    }else{
      KandangViewModels.updateKandang(
        fixValCat,
        name.text,
        current.text.toString(),
        capacity.text.toString(),
        widget.modele.id.toString(),
      ).then((x) {
        if (x == 'bisa') {
          ShowAlert.show(msg: "Berhasil mengedit kandang", type: 1);
          Routes.changePage(context, PerawatanPage());
        } else {
          ShowAlert.show(msg: "Harap cek kembali form isian", type: 2);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: buttonColor,
        leading: IconButton(
          onPressed: () {
            // Routes.changePage(context, PerawatanPage());
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_sharp,
            color: textColor,
          ),
        ),
        title: Teks(
          isi: "Edit Kandang",
          warna: textColor,
        ),
      ),
      body: WillPopScope(
        onWillPop: () {},
        child: SingleChildScrollView(
          child: Container(
            padding:
                EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.07),
            child: Column(
              children: [
                SizedBox(height: 25),
                Forms(controller: name, forms: "Nama Kandang"),
                Forms(
                  controller: current,
                  forms: "Isi Kandang Saat Ini",
                  type: TextInputType.number,
                ),
                Forms(
                  controller: capacity,
                  forms: "Kapasitas Kandang",
                  type: TextInputType.number,
                ),
                Container(
                  width: displayWidth(context),
                  child: DropdownButton(
                    hint: Teks(isi: "${widget.modele.category.name}"),
                    value: _valCategory,
                    items: _listCategory.map((value) {
                      return DropdownMenuItem(
                        child: Teks(isi: value['name']),
                        value: value['id'],
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _valCategory = value;
                        fixValCat = _valCategory;
                      });
                      print(value.toString());
                    },
                  ),
                ),
                SizedBox(height: 25),
                InkWell(
                  onTap: () {
                    addData();
                  },
                  child: Button(
                    isiButton: "Tambah Data",
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
