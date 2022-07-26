import 'package:flutter/material.dart';
import 'package:scroller/app/modules/homescreen/views/homescreen_view.dart';

class AddButton extends StatelessWidget {
  const AddButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        HomescreenView().openBottomSheet();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            "Upload vidoes",
            style: TextStyle(
                fontSize: 15,
                color: Colors.white70,
                fontWeight: FontWeight.normal),
          ),
        ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/image/postupload.png",
                      height: size.height * 0.280,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: Text(
                        "Tap and upload you are favorite videos",
                        style: TextStyle(color: Colors.white38, fontSize: 15),
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
