import 'dart:async';
import 'package:bebeq/component/responsive.dart';
import 'package:bebeq/component/routes.dart';
import 'package:bebeq/view/admin/home.dart';
import 'package:bebeq/view/firstscreen.dart';
import 'package:bebeq/view/peternak/home.dart';
import 'package:bebeq/viewmodel/auth.dart';

import 'package:flutter/material.dart';

class splashScreen extends StatefulWidget {
  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  var duration = Duration(seconds: 2);
  var decission;
  var tokens;
  var roles;
  checkToken() async {
    var token = await AuthenticateViewModels.getToken();
    var role = await AuthenticateViewModels.getRole();
    setState(() {
      roles = role;
      tokens = token;
    });
    if (tokens == null) {
      setState(() {
        decission = 'login';
      });
    } else {
      AuthenticateViewModels.checkAuths(token).then((y) {
        setState(() {
          decission = y;
        });
      });
      print(decission.toString());
    }
    return Timer(duration, () {
      if (decission == 'login') {
        Routes.changePage(context, FirstScreens());
      } else if (decission == 'home') {
        if (roles == 'peternak') {
          Routes.changePage(context, HomePage());
        } else if (roles == 'admin') {
          Routes.changePage(context, HomeAdmin());
        }
      }
    });
  }

  start() async {}

  @override
  void initState() {
    checkToken();
    // start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icons/bebeq.png",
              height: displayHeight(context) * 0.5,
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
