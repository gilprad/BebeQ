import 'package:bebeq/component/constant.dart';
import 'package:bebeq/component/responsive.dart';
import 'package:bebeq/component/routes.dart';
import 'package:bebeq/component/teks.dart';
import 'package:bebeq/view/admin/bottom.dart';
import 'package:bebeq/view/admin/peternak/detail.dart';
import 'package:bebeq/viewmodel/auth.dart';
import 'package:flutter/material.dart';

class UserPeternak extends StatefulWidget {
  @override
  UserPeternakState createState() => UserPeternakState();
}

class UserPeternakState extends State<UserPeternak> {
  List peternak = new List();
  void getData() async {
    AuthenticateViewModels.getPeternak().then((value) {
      setState(() {
        peternak = value;
      });
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: buttonColor,
        title: Teks(
          isi: "Data Peternak",
          warna: textColor,
        ),
        leading: SizedBox(),
        centerTitle: true,
      ),
      bottomNavigationBar: BotnavAdmin(1),
      body: Container(
        width: displayWidth(context),
        height: displayHeight(context),
        padding: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.03),
        child: Container(
            child: ListView(
          children: [
            Container(
              height: displayHeight(context) * 0.6,
              child: ListView.builder(
                  itemCount: peternak.length,
                  itemBuilder: (context, i) {
                    return InkWell(
                      onTap: () {
                        Routes.changePage(
                            context,
                            DetailPeternak(
                              data: peternak[i],
                            ));
                      },
                      child: Card(
                        child: ListTile(
                          leading: Teks(isi: "${peternak[i]['name']}"),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    );
                  }),
            )
          ],
        )),
      ),
    );
  }
}
