import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scroller/app/modules/comment_screen/controllers/comment_screen_controller.dart';
import 'package:timeago/timeago.dart' as timeago;

commentbottomsheet(context, String id) async {
  final commentstatcontroller = Get.put(CommentScreenController());
  final commentTextcontroller = TextEditingController();
  commentstatcontroller.updatePostId(id);
  void commentTextfild() {
    Get.defaultDialog(
        content: Column(children: [
          TextField(
            controller: commentTextcontroller,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () => commentstatcontroller
                        .postComment(commentTextcontroller.text),
                    icon: Icon(Icons.send)),
                hintText: "Add oomment",
                hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                filled: true,
                fillColor: Color(0xff1f222a),
                labelStyle: TextStyle(fontSize: 20),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Color(0xff091227),
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.black))),
          )
        ]),
        title: "Add comment",
        titleStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
        middleText: "",
        middleTextStyle: TextStyle(color: Colors.white),
        radius: 8);
  }

  Get.bottomSheet(
    Container(
      width: 400,
      height: 600,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "27K",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Comments",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.normal),
                ),
                Divider(
                  color: Colors.white,
                  thickness: 10,
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 600,
              height: 300,
              child: Obx(() {
                return ListView.builder(
                    itemCount: commentstatcontroller.commentdata.length,
                    itemBuilder: ((context, index) {
                      final commentdata =
                          commentstatcontroller.commentdata[index];
                      return Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Colors.black,
                                        child: Image.network(
                                          commentdata.profilephto,
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  commentdata.username,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal),
                                ),
                              ]),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 40,
                            width: 350,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Text(
                                commentdata.comment,
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Icon(Icons.favorite_border),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "so what towday",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      );
                    }));
              }),
            ),
            IconButton(
                onPressed: () {
                  commentTextfild();
                },
                icon: Icon(Icons.comment))
          ],
        ),
      ),
    ),
    backgroundColor: Color(0xff1f222a),
    elevation: 10,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  );
}
