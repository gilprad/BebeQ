import 'package:bebeq/component/button.dart';
import 'package:bebeq/component/constant.dart';
import 'package:bebeq/component/form.dart';
import 'package:bebeq/component/routes.dart';
import 'package:bebeq/component/teks.dart';
import 'package:bebeq/component/profile/index.dart';
import 'package:bebeq/view/widget/toast.dart';
import 'package:bebeq/viewmodel/auth.dart';
import 'package:flutter/material.dart';

class ChangePass extends StatefulWidget {
  @override
  _ChangePassState createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  TextEditingController password = new TextEditingController();
  TextEditingController confpassword = new TextEditingController();

  void submit() async {
    AuthenticateViewModels.updatePassword(password.text, confpassword.text)
        .then((value) {
      // print(value);
      if (value == 'ok') {
        ShowAlert.show(
          msg: "Berhasil mengubah password",
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: buttonColor,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Teks(isi: "Ubah password", warna: textColor),
      ),
      body: Container(
        padding: EdgeInsets.all(35),
        child: ListView(
          children: [
            Forms(
              controller: password,
              forms: 'Password',
              hide: true,
            ),
            Forms(
              controller: confpassword,
              forms: 'Ulangi Password',
              hide: true,
            ),
            SizedBox(height: 30),
            InkWell(
              onTap: () {
                submit();
              },
              child: Button(
                isiButton: 'Ubah Password',
              ),
            )
          ],
        ),
      ),
    );
  }
}
