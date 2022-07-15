import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:scroller/app/modules/imageSelect/controllers/image_select_controller.dart';
import 'package:scroller/app/modules/login_Screen/controllers/login_screen_controller.dart';
import 'package:scroller/app/modules/register_screen/controllers/register_screen_controller.dart';

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
