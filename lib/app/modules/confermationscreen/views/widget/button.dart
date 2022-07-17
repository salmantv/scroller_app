import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  NextButton(
      {Key? key,
      required this.hintText,
      required this.circular,
      required this.Ontap,
      required this.colorbutton})
      : super(key: key);

  final String hintText;
  final double circular;
  final void Function()? Ontap;
  final Color? colorbutton;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: Ontap,
      child: Container(
        width: MediaQuery.of(context).size.width - 250,
        height: 50,
        decoration: BoxDecoration(
            color: colorbutton, borderRadius: BorderRadius.circular(circular)),
        child: Center(
            child: Text(hintText,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                ))),
      ),
    );
  }
}
