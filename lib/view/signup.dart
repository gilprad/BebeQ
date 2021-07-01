import 'package:bebeq/component/constant.dart';
import 'package:bebeq/component/form.dart';
import 'package:bebeq/component/responsive.dart';
import 'package:bebeq/component/routes.dart';
import 'package:bebeq/component/teks.dart';
import 'package:bebeq/view/admin/home.dart';
import 'package:bebeq/view/peternak/home.dart';
import 'package:bebeq/view/login.dart';
import 'package:bebeq/view/widget/toast.dart';
import 'package:bebeq/viewmodel/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class signUp extends StatefulWidget {
  @override
  _signUpState createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  TextEditingController name = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController c_password = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: displayWidth(context),
          height: displayHeight(context) * 1,
          color: backgroundColor,
          child: Column(
            children: [
              SizedBox(height: 80),
              Teks(
                isi: "BebeQ SignUp",
                size: 25,
              ),
              SizedBox(height: displayHeight(context) * 0.04),
              SvgPicture.asset("assets/icons/bebeq.svg"),
              SizedBox(height: displayHeight(context) * 0.04),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: displayHeight(context) * 0.08),
                child: Column(
                  children: [
                    Forms(
                      controller: name,
                      forms: "Nama",
                    ),
                    Forms(
                      controller: email,
                      forms: "Email",
                    ),
                    Forms(
                      controller: password,
                      forms: "Password",
                      hide: true,
                    ),
                    Forms(
                      controller: c_password,
                      forms: "Verifikasi Password",
                      hide: true,
                    ),
                  ],
                ),
              ),
              SizedBox(height: displayHeight(context) * 0.04),
              RaisedButton(
                  onPressed: () {
                    AuthenticateViewModels.register(name.text, email.text,
                            password.text, c_password.text)
                        .then((x) {
                      if (x == 'peternak') {
                        Routes.changePage(context, HomePage());
                      } else if (x == 'admin') {
                        Routes.changePage(context, HomeAdmin());
                      } else {
                        ShowAlert.show(
                          msg: x,
                          type: 2,
                        );
                      }
                    });
                  },
                  color: buttonColor,
                  padding: EdgeInsets.only(left: 30, right: 30),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(9.0)),
                  child: Teks(
                    isi: "Daftar",
                    size: 20,
                  )),
              SizedBox(
                height: displayHeight(context) * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Teks(
                    isi: "Sudah punya akun? Klik ",
                    size: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Routes.changePage(context, login());
                    },
                    child: Teks(
                      isi: "disini",
                      size: 20,
                      warna: Colors.blueAccent,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
