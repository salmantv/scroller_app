import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroller/app/modules/global/views/global_view.dart';

class Passwordfild extends StatelessWidget {
  Passwordfild(
      {Key? key,
      required this.controller,
      required this.labelText,
      required this.icon,
      this.iconEnd,
      this.type})
      : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final IconData icon;
  final IconData? iconEnd;
  final TextInputType? type;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextField(
        keyboardType: type,
        controller: controller,
        decoration: InputDecoration(
            suffixIcon: IconButton(
                onPressed: () {
                  logincontroll.ispasswordvisibile.value =
                      !logincontroll.ispasswordvisibile.value;
                },
                icon: logincontroll.ispasswordvisibile.value == false
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility)),
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
        obscureText: logincontroll.ispasswordvisibile.value,
      );
    });
  }
}
