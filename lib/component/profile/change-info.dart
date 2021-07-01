import 'package:bebeq/component/button.dart';
import 'package:bebeq/component/constant.dart';
import 'package:bebeq/component/form.dart';
import 'package:bebeq/component/routes.dart';
import 'package:bebeq/component/teks.dart';
import 'package:bebeq/component/profile/index.dart';
import 'package:bebeq/view/widget/toast.dart';
import 'package:bebeq/viewmodel/auth.dart';
import 'package:flutter/material.dart';

class ChangeInfo extends StatefulWidget {
  final Map data;
  ChangeInfo(this.data);
  @override
  _ChangeInfoState createState() => _ChangeInfoState();
}

class _ChangeInfoState extends State<ChangeInfo> {
  TextEditingController name;
  TextEditingController email;

  void submit() async {
    AuthenticateViewModels.updateInfo(name.text, email.text).then((value) {
      // print(value);
      if (value == 'ok') {
        ShowAlert.show(
          msg: "Berhasil mengubah data",
          type: 1,
        );
        Routes.changePage(context, ProfilIndex());
      } else {
        ShowAlert.show(
          msg: value,
          type: 2,
        );
      }
    });
  }

  @override
  void initState() {
    name = new TextEditingController(text: widget.data['name']);
    email = new TextEditingController(text: widget.data['email']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: buttonColor,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Teks(isi: "Ubah data diri", warna: textColor),
      ),
      body: Container(
        padding: EdgeInsets.all(35),
        child: ListView(
          children: [
            Forms(
              controller: name,
              forms: 'Name',
            ),
            Forms(
              controller: email,
              forms: 'Email',
              type: TextInputType.emailAddress,
            ),
            SizedBox(height: 30),
            InkWell(
              onTap: () {
                submit();
              },
              child: Button(
                isiButton: 'Ubah Data',
              ),
            )
          ],
        ),
      ),
    );
  }
}
