import 'package:bebeq/component/constant.dart';
import 'package:flutter/material.dart';

class Forms extends StatelessWidget {
  final String forms;
  final TextEditingController controller;
  final bool hide;
  final TextInputType type;
  final int line;

  Forms(
      {this.forms,
      this.hide = false,
      this.controller,
      this.type = TextInputType.text,
      this.line = 1});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      keyboardType: type,
      controller: controller,
      decoration: InputDecoration(
        hintText: "$forms",
      ),
      style: TextStyle(fontSize: 20),
      obscureText: hide,
      maxLines: line,
    );
  }
}
