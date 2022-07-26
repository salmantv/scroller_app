import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:scroller/app/modules/homescreen/views/homescreen_view.dart';
import 'package:scroller/app/modules/login_Screen/controllers/login_screen_controller.dart';
import 'package:scroller/app/modules/massgescreen/views/massgescreen_view.dart';
import 'package:scroller/app/modules/postUplodingscreen/views/video_UploadePage.dart';
import 'package:scroller/app/modules/profilescreen/views/profilescreen_view.dart';
import 'package:scroller/app/modules/register_screen/controllers/register_screen_controller.dart';
import 'package:scroller/app/modules/searchscreen/views/searchscreen_view.dart';

//COLORS

const backgroundcolor = Color(0xff181b21);
var buttonColor = Colors.red[600];
var borderColor = Colors.black87;

//FIREBASE

var firebaseAuth = FirebaseAuth.instance;
var firebaseStorge = FirebaseStorage.instance;
var firbasestore = FirebaseFirestore.instance;

// Controllers

var authController = RegisterScreenController.instance;
var logincontroll = LoginScreenController.instance;

// Pages

var pages = <Widget>[
  HomescreenView(),
  SearchscreenView(),
  AddButton(),
  ProfilescreenView(
    isCurrentuser: true,
    uid: firebaseAuth.currentUser!.uid,
  ),
];

// looding widget
class Looding extends StatelessWidget {
  const Looding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: LoadingAnimationWidget.prograssiveDots(
            size: 70,
            color: buttonColor!,
          ),
        ));
  }
}

// isplaying

