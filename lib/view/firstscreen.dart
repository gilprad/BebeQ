import 'package:bebeq/component/button.dart';
import 'package:bebeq/component/constant.dart';
import 'package:bebeq/component/responsive.dart';
import 'package:bebeq/component/routes.dart';
import 'package:bebeq/component/teks.dart';
import 'package:bebeq/view/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FirstScreens extends StatefulWidget {
  @override
  _FirstScreensState createState() => _FirstScreensState();
}

class _FirstScreensState extends State<FirstScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: displayWidth(context),
        color: backgroundColor,
        child: Container(
            padding:
                EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.07),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                  margin: EdgeInsets.only(top: 50, bottom: 50),
                  child: SvgPicture.asset("assets/icons/bebeq.svg")),
              Teks(
                isi: "Selamat datang di aplikasi BebeQ",
                size: 30,
                weight: FontWeight.w500,
                arah: TextAlign.center,
              ),
              SizedBox(height: displayHeight(context) * 0.07),
              InkWell(
                  onTap: () {
                    Routes.changePage(context, login());
                  },
                  child: Button(isiButton: "Lanjut"))
            ])),
      ),
    );
  }
}
