import 'package:bebeq/component/button.dart';
import 'package:bebeq/component/constant.dart';
import 'package:bebeq/component/form.dart';
import 'package:bebeq/component/responsive.dart';
import 'package:bebeq/component/routes.dart';
import 'package:bebeq/component/teks.dart';
import 'package:bebeq/view/peternak/perawatan.dart';
import 'package:bebeq/view/widget/toast.dart';
import 'package:bebeq/viewmodel/kandang.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddKandang extends StatefulWidget {
  @override
  _AddKandangState createState() => _AddKandangState();
}

class _AddKandangState extends State<AddKandang> {
  TextEditingController name = new TextEditingController();
  TextEditingController current = new TextEditingController();
  TextEditingController capacity = new TextEditingController();
  var _valCategory;
  List _listCategory = new List();

  @override
  void initState() {
    KandangViewModels.getCategory().then((f) {
      setState(() {
        _listCategory = f;
      });
    });
    super.initState();
  }

  void addData() {
    if(_valCategory==null){
      ShowAlert.show(msg: "Pilih kategori terlebih dahulu !", type: 2);
    }else if(name.text.isEmpty){
      ShowAlert.show(msg: "Isi nama kandang terlebih dahulu !", type: 2);
    }else if(current.text.isEmpty){
      ShowAlert.show(msg: "Masukkan isi kandang saat ini terlebih dahulu !", type: 2);
    }else if(capacity.text.isEmpty){
      ShowAlert.show(msg: "Masukkan kapasitas kandang terlebih dahulu !", type: 2);
    }else if(int.parse(capacity.text) < 1){
      ShowAlert.show(msg: "Kapasitas kandang tidak boleh kurang dari 1 !", type: 2);
    }else if(int.parse(current.text) < 0){
      ShowAlert.show(msg: "Isi kandang saat ini tidak boleh kurang dari 0 !", type: 2);
    }else if(int.parse(current.text) > int.parse(capacity.text)){
      ShowAlert.show(msg: "Isi kandang saat ini tidak boleh lebih dari kapasitas kandang !", type: 2);
    }
    else{

    KandangViewModels.storeKandang(_valCategory, name.text,
            current.text.toString(), capacity.text.toString())
        .then((x) {
      if (x == 'bisa') {
        ShowAlert.show(msg: "Berhasil membuat kandang", type: 1);
        Routes.changePage(context, PerawatanPage());
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
            Routes.changePage(context, PerawatanPage());
          },
          icon: Icon(
            Icons.arrow_back_sharp,
            color: textColor,
          ),
        ),
        title: Teks(
          isi: "Tambah Kandang",
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
                    type: TextInputType.number),
                Container(
                  width: displayWidth(context),
                  child: DropdownButton(
                    hint: Teks(isi: "Pilih kategori usia"),
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
