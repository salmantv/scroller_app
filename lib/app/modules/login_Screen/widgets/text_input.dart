import 'package:flutter/material.dart';

class Textinputfild extends StatelessWidget {
  Textinputfild(
      {Key? key,
      required this.controller,
      required this.labelText,
      required this.icon,
      this.isObscure = false,
      this.iconEnd,
      this.type})
      : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final IconData icon;
  final IconData? iconEnd;
  final bool isObscure;
  final TextInputType? type;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: type,
      controller: controller,
      decoration: InputDecoration(
          suffixIcon: IconButton(onPressed: () {}, icon: Icon(iconEnd)),
          hintText: labelText,
          hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
          filled: true,
          fillColor: Color(0xff1f222a),
          prefixIcon: Icon(
            icon,
            color: Colors.grey,
          ),
          labelStyle: TextStyle(fontSize: 20),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Color(0xff091227),
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Color(0xff091227),
              ))),
      obscureText: isObscure,
    );
  }
}
