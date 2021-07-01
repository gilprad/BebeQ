import 'package:bebeq/component/button.dart';
import 'package:bebeq/component/constant.dart';
import 'package:bebeq/component/responsive.dart';
import 'package:bebeq/component/routes.dart';
import 'package:bebeq/component/teks.dart';
import 'package:bebeq/view/admin/home.dart';
import 'package:bebeq/view/peternak/home.dart';
import 'package:bebeq/view/signup.dart';
import 'package:bebeq/view/widget/toast.dart';
import 'package:bebeq/viewmodel/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bebeq/component/form.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  void readData() async {
    AuthenticateViewModels.login(email.text, password.text).then((x) {
      if (x != 'error') {
        if (x == 'peternak') {
          Routes.changePage(context, HomePage());
        } else if (x == 'admin') {
          Routes.changePage(context, HomeAdmin());
        }
      } else {
        ShowAlert.show(
          msg: 'Periksa kembali email dan password anda',
          type: 2,
        );
      }
    });
    // print("OK");
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {},
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        body: Container(
          height: displayHeight(context),
          padding:
              EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.07),
          width: displayWidth(context),
          color: backgroundColor,
          child: Column(
            children: [
              SizedBox(height: displayHeight(context) * 0.1),
              Teks(
                isi: "BebeQ Login",
                size: 30,
              ),
              SizedBox(height: displayHeight(context) * 0.13),
              SvgPicture.asset("assets/icons/bebeq.svg"),
              SizedBox(
                height: displayHeight(context) * 0.1,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: displayHeight(context) * 0.05),
                child: Column(
                  children: [
                    Forms(controller: email, forms: "Email"),
                    Forms(
                      controller: password,
                      forms: "Password",
                      hide: true,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: displayHeight(context) * 0.07,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Teks(
                    isi: "Belum punya akun? Klik ",
                    size: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Routes.changePage(context, signUp());
                    },
                    child: Teks(
                      isi: "disini",
                      warna: Colors.blueAccent,
                      size: 20,
                    ),
                  )
                ],
              ),
              SizedBox(height: displayHeight(context) * 0.05),
              InkWell(
                onTap: () {
                  readData();
                },
                child: Button(
                  isiButton: "Masuk",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
