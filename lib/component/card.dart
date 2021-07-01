import 'package:bebeq/component/responsive.dart';
import 'package:bebeq/component/teks.dart';
import 'package:flutter/material.dart';

class Cardss extends StatelessWidget {
  final String image;
  final String title;
  final String content;

  Cardss({this.image, this.title, this.content});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: displayHeight(context) * 0.25,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 1, offset: Offset(0, 1))
          ]),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: displayWidth(context) * 0.03,
            vertical: displayHeight(context) * 0.02),
        child: Row(
          children: [
            Container(
              width: displayWidth(context) * 0.4,
              height: displayHeight(context) * 0.3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(
              width: displayWidth(context) * 0.03,
            ),
            Container(
              width: displayWidth(context) * 0.45,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Teks(
                    isi: "${title}",
                    size: 25,
                    weight: FontWeight.bold,
                    arah: TextAlign.left,
                  ),
                  Teks(
                    isi: "${content}",
                    size: 20,
                    arah: TextAlign.left,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
