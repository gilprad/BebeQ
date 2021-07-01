import 'package:flutter/material.dart';

class Routes {
  static changePage(BuildContext context, StatefulWidget pages) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return pages;
    }));
  }
}
