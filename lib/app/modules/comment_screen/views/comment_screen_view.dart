import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scroller/app/modules/comment_screen/controllers/comment_screen_controller.dart';
import 'package:scroller/app/modules/comment_screen/widget/textfiled.dart';

import 'package:timeago/timeago.dart' as timeago;

import '../../global/views/global_view.dart';

commentbottomsheet(context, String id, String commentcount) async {
  final commentstatcontroller = Get.put(CommentScreenController());
  final commentTextcontroller = TextEditingController();
  commentstatcontroller.updatePostId(id);
  void commentTextfild() {
    Get.bottomSheet(
      backgroundColor: Color(0xff1f222a),
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      Container(
        height: MediaQuery.of(context).size.height * 0.220,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 260,
                child: CommentText(
                  controller: commentTextcontroller,
                  labelText: "Add comment",
                  icon: Icons.mark_as_unread,
                ),
              ),
              FloatingActionButton(
                  backgroundColor: buttonColor,
                  child: Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    commentstatcontroller
                        .postComment(commentTextcontroller.text.trim());
                    Get.back();
                  })
            ],
          )
        ]),
      ),
    );
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
                  commentcount,
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Comments",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
                ),
                Divider(
                  color: Colors.white,
                  thickness: 10,
                ),
                SizedBox(
                  width: 20,
                ),
                TextButton.icon(
                    onPressed: () {
                      commentTextfild();
                    },
                    icon: Icon(Icons.send),
                    label: Text("Add comment")),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 600,
              height: 350,
              child: Obx(() {
                return ListView.separated(
                  itemCount: commentstatcontroller.commentdata.length,
                  itemBuilder: ((context, index) {
                    final alldata = commentstatcontroller.commentdata[index];
                    return ListTile(
                      leading: ClipOval(
                        child: CachedNetworkImage(
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                          imageUrl: alldata.profilephto,
                          placeholder: (context, url) =>
                              CircularProgressIndicator(
                            strokeWidth: 1,
                            color: buttonColor,
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          alldata.username,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              width: 120.0,
                              child: Text(
                                maxLines: 4,
                                softWrap: false,
                                alldata.comment,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12),
                              ),
                            ),
                          )
                        ],
                      ),
                      trailing: Text(timeago.format(alldata.date.toDate())),
                    );
                  }),
                  separatorBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Divider(
                        height: 60,
                        thickness: 0.5,
                        color: Colors.white24,
                      ),
                    );
                  },
                );
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
