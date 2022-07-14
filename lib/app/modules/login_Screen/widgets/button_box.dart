import 'package:flutter/material.dart';

import '../../global/views/global_view.dart';

class ButtonLogin extends StatelessWidget {
  ButtonLogin(
      {Key? key,
      required this.hintText,
      required this.circular,
      required this.Ontap,
      required this.isImage,
      required this.colorbutton})
      : super(key: key);

  final String hintText;
  final double circular;
  final void Function()? Ontap;
  final bool isImage;
  final Color? colorbutton;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: Ontap,
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        height: 50,
        decoration: BoxDecoration(
            color: colorbutton, borderRadius: BorderRadius.circular(circular)),
        child: Center(
          child: isImage == false
              ? Text(hintText,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ))
              : Center(
                  child: Image.asset(
                    "assets/image/google-removebg-preview.png",
                    fit: BoxFit.cover,
                  ),
                ),
        ),
      ),
    );
  }
}
