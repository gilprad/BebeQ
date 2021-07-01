import 'package:bebeq/component/constant.dart';
import 'package:bebeq/component/responsive.dart';
import 'package:bebeq/component/teks.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String isiButton;
  final Color warna;
  final Color warnaTeks;

  Button(
      {this.isiButton, this.warna = buttonColor, this.warnaTeks = textColor});
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: displayHeight(context) * 0.05,
        padding: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
            color: warna,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Colors.grey, blurRadius: 1, offset: Offset(0, 1))
            ]),
        child: Teks(
          isi: "${isiButton}",
          size: 20,
          weight: FontWeight.w400,
          arah: TextAlign.center,
          warna: warnaTeks,
        ));
  }
}
